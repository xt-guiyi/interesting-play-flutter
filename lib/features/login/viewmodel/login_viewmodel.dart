import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/auth/auth_session.dart';
import '../../../core/network/exceptions/api_exception.dart';
import '../model/login_repository.dart';
import '../strategies/vo/login_command.dart';
import 'vo/login_state.dart';
import '../strategies/login_strategy_factory.dart';

part 'login_viewmodel.g.dart';

/// 登录入口页负责 Google、GitHub 登录流程，不持有短信表单或倒计时。
@riverpod
class LoginViewModel extends _$LoginViewModel {
  CancelToken? _cancelToken;

  /// 初始化入口页状态，并在 Provider 销毁时取消未完成的登录。
  @override
  LoginState build() {
    ref.watch(loginRepositoryProvider);
    ref.watch(loginStrategyFactoryProvider);
    ref.watch(authSessionProvider.notifier);
    ref.onDispose(cancelLogin);
    return const LoginState();
  }

  /// 发起 Google 登录，成功后返回 true，供页面决定是否跳转。
  Future<bool> loginWithGoogle() => _login(const LoginCommand.google());

  /// 发起 GitHub 登录，复用入口页的结果保存和会话更新流程。
  Future<bool> loginWithGithub() => _login(const LoginCommand.github());

  /// 取消网络请求并使迟到的授权结果失效，不负责关闭系统授权页。
  void cancelLogin() => _cancelToken?.cancel('Login cancelled');

  /// 执行第三方登录：授权并请求后端、保存结果、更新全局登录态。
  Future<bool> _login(LoginCommand command) async {
    // 拦截重复提交，请求期间保留 ViewModel，并记录本次取消标记。
    if (state.isBusy) return false;
    final cancelToken = CancelToken();
    _cancelToken = cancelToken;
    final requestLink = ref.keepAlive();
    final repository = ref.read(loginRepositoryProvider);
    /// 判断本次结果是否仍可用于保存数据或更新页面状态。
    bool canCommit() => ref.mounted && !cancelToken.isCancelled;
    state = LoginState(activeMethod: command.method);
    try {
      // 等缓存读取结束，避免旧会话读取覆盖登录结果。
      final alreadyLoggedIn = await ref
          .read(authSessionProvider.future)
          .catchError((Object _) => false);
      if (!canCommit()) return false;
      if (alreadyLoggedIn) return true;

      // 按渠道执行策略，得到的是后端应用登录结果，不是平台 token。
      final strategy = ref
          .read(loginStrategyFactoryProvider)
          .getStrategy(command.method);
      final result = await strategy.authenticate(command, cancelToken);
      if (result == null || !canCommit()) return false;
      // 先保存本地 token 和用户资料；取消或保存失败时不发布已登录状态。
      final saved = await repository.saveLoginResult(
        result,
        canCommit: canCommit,
      );
      if (!saved) return false;
      // 保存完成后若操作已失效，清理刚写入的登录数据。
      if (!canCommit()) {
        await repository.logout();
        return false;
      }
      // 本地保存成功后更新全局会话，页面根据返回值执行导航。
      ref.read(authSessionProvider.notifier).loggedIn();
      return true;
    } catch (error) {
      // 仅向仍有效的页面发布错误，Toast 由页面监听后展示。
      if (canCommit()) {
        state = state.copyWith(errorMessage: _errorMessage(error));
      }
      return false;
    } finally {
      // 只收尾本次操作，恢复按钮状态并解除请求期间的保留。
      if (identical(_cancelToken, cancelToken)) {
        _cancelToken = null;
        if (ref.mounted) state = state.copyWith(activeMethod: null);
      }
      requestLink.close();
    }
  }

  /// 将业务或网络异常转换成页面可展示的提示文案。
  String _errorMessage(Object error) {
    const fallback = '登录失败，请稍后重试';
    // 优先使用业务异常及后端返回的具体原因。
    if (error is ApiException) {
      return error.message.trim().isEmpty ? fallback : error.message;
    }
    if (error is DioException) {
      final data = error.response?.data;
      if (data is Map && data['message'] is String) {
        final message = (data['message'] as String).trim();
        if (message.isNotEmpty) return message;
      }
      // 后端没有提供文案时，按网络异常类型给出通用提示。
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
}
