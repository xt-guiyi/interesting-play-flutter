import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/auth/auth_session.dart';
import '../../../core/network/exceptions/api_exception.dart';
import '../model/login_repository.dart';
import '../strategies/vo/login_command.dart';
import 'vo/sms_login_state.dart';
import '../strategies/login_strategy_factory.dart';

part 'sms_login_viewmodel.g.dart';

/// 管理短信登录的校验、验证码发送、倒计时和登录结果提交。
@riverpod
class SmsLoginViewModel extends _$SmsLoginViewModel {
  
  static final _phoneRegex = RegExp(r'^1[3-9][0-9]{9}$');
  static final _codeRegex = RegExp(r'^[0-9]{6}$');
  Timer? _resendTimer;
  CancelToken? _cancelToken;

  /// 初始化短信页状态，销毁时停止倒计时并取消登录。
  @override
  SmsLoginState build() {
    ref.watch(loginRepositoryProvider);
    ref.watch(loginStrategyFactoryProvider);
    ref.watch(authSessionProvider.notifier);
    ref.onDispose(() {
      _resendTimer?.cancel();
      cancelLogin();
    });
    return const SmsLoginState();
  }

  /// 发送登录验证码，成功后启动 60 秒重发倒计时。
  Future<bool> sendSmsCode(String phone) async {
    // 发送前检查忙碌状态、重发间隔和手机号格式。
    if (state.isBusy || state.resendSeconds > 0) return false;
    if (!_validatePhone(phone)) return false;

    // 等待发送结果期间保留状态，避免离开页面后立即重发。
    final requestLink = ref.keepAlive();
    state = state.copyWith(isSendingCode: true, errorMessage: null);
    try {
      // 后端确认发送成功后才开始倒计时。
      await ref.read(loginRepositoryProvider).sendSmsCode(phone);
      if (!ref.mounted) return false;
      _startCooldown();
      return true;
    } catch (error) {
      // 发送失败交给页面提示，不启动重发倒计时。
      if (ref.mounted) _emitError(_errorMessage(error, '验证码发送失败，请稍后重试'));
      return false;
    } finally {
      // 恢复发送按钮；成功时倒计时会继续独立保留状态。
      if (ref.mounted) state = state.copyWith(isSendingCode: false);
      requestLink.close();
    }
  }

  /// 使用手机号和验证码登录，保存成功并更新会话后返回 true。
  Future<bool> loginWithSms(String phone, String code) async {
    // 先完成本地输入校验，避免提交无效手机号或验证码。
    if (state.isBusy) return false;
    if (!_validatePhone(phone)) return false;
    if (!_codeRegex.hasMatch(code)) {
      _emitError('请输入6位短信验证码');
      return false;
    }

    // 为本次登录建立取消标记，并在异步执行期间保留 ViewModel。
    final cancelToken = CancelToken();
    _cancelToken = cancelToken;
    final requestLink = ref.keepAlive();
    final repository = ref.read(loginRepositoryProvider);
    /// 判断本次登录是否仍允许保存结果及更新状态。
    bool canCommit() => ref.mounted && !cancelToken.isCancelled;
    state = state.copyWith(isLoggingIn: true, errorMessage: null);
    try {
      // 等初始会话读取完成，避免旧缓存读取覆盖新的登录状态。
      final alreadyLoggedIn = await ref
          .read(authSessionProvider.future)
          .catchError((Object _) => false);
      if (!canCommit()) return false;
      if (alreadyLoggedIn) return true;

      // 把表单参数交给短信策略，由策略调用后端登录接口。
      final command = LoginCommand.sms(phone: phone, code: code);
      final strategy = ref
          .read(loginStrategyFactoryProvider)
          .getStrategy(command.method);
      final result = await strategy.authenticate(command, cancelToken);
      if (result == null || !canCommit()) return false;
      // 先写入本地 token 和用户资料，保存失败或取消都不算登录成功。
      final saved = await repository.saveLoginResult(
        result,
        canCommit: canCommit,
      );
      if (!saved) return false;
      // 保存后再次确认操作有效，失效时清理刚写入的数据。
      if (!canCommit()) {
        await repository.logout();
        return false;
      }
      // 更新全局会话，再通知页面执行登录成功后的导航。
      ref.read(authSessionProvider.notifier).loggedIn();
      return true;
    } catch (error) {
      // 已取消的请求不再向页面发送错误提示。
      if (canCommit()) {
        _emitError(_errorMessage(error, '登录失败，请稍后重试'));
      }
      return false;
    } finally {
      // 只重置本次请求的忙碌状态，避免影响后续操作。
      if (identical(_cancelToken, cancelToken)) {
        _cancelToken = null;
        if (ref.mounted) state = state.copyWith(isLoggingIn: false);
      }
      requestLink.close();
    }
  }

  /// 取消当前登录请求，并阻止其后续结果写入本地或页面。
  void cancelLogin() => _cancelToken?.cancel('Login cancelled');

  /// 优先提取具体失败原因，没有可用文案时返回通用提示。
  String _errorMessage(Object error, String fallback) {
    // 优先使用业务异常或后端响应里的错误文案。
    if (error is ApiException) {
      return error.message.trim().isEmpty ? fallback : error.message;
    }
    if (error is DioException) {
      final data = error.response?.data;
      if (data is Map && data['message'] is String) {
        final message = (data['message'] as String).trim();
        if (message.isNotEmpty) return message;
      }
      // 没有后端文案时，按超时、断网或 HTTP 状态映射提示。
      return switch (error.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => '请求超时，请稍后重试',
        DioExceptionType.connectionError => '网络连接失败，请检查网络',
        DioExceptionType.badResponse =>
          error.response?.statusCode == 429
              ? '请求过于频繁，请稍后再试'
              : handleHttpErrorCode(error.response?.statusCode ?? 500),
        _ => fallback,
      };
    }
    return fallback;
  }

  /// 校验国内手机号格式，无效时向页面发布提示。
  bool _validatePhone(String phone) {
    if (_phoneRegex.hasMatch(phone)) return true;
    _emitError('请输入正确的11位手机号');
    return false;
  }

  /// 按截止时间计算验证码重发间隔，返回页面后仍继续倒计时。
  void _startCooldown() {
    final deadline = DateTime.now().add(const Duration(seconds: 60));
    // 返回上一页再进入仍保留重发间隔，结束后恢复自动释放。
    final cooldownLink = ref.keepAlive();
    state = state.copyWith(resendSeconds: 60);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!ref.mounted) {
        timer.cancel();
        return;
      }
      // 使用实际剩余时间，避免应用切后台后逐秒累减产生偏差。
      final remaining =
          (deadline.difference(DateTime.now()).inMilliseconds / 1000)
              .ceil()
              .clamp(0, 60);
      if (state.resendSeconds != remaining) {
        state = state.copyWith(resendSeconds: remaining);
      }
      // 倒计时结束后停止计时，并允许无人监听的 Provider 释放。
      if (remaining == 0) {
        timer.cancel();
        cooldownLink.close();
      }
    });
  }

  /// 发布错误；相同文案先清空，确保页面再次收到提示。
  void _emitError(String message) {
    if (state.errorMessage == message) {
      state = state.copyWith(errorMessage: null);
    }
    state = state.copyWith(errorMessage: message);
  }
}
