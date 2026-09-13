import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/network/exceptions/api_exception.dart';
import '../../model/login_repository.dart';
import '../vo/login_command.dart';
import '../../model/vo/response/login_response.dart';
import '../login_strategy.dart';

/// 通过 Google SDK 取得身份凭证，再向后端换取应用登录结果。
class GoogleLoginStrategy implements LoginStrategy {
  /// 注入用于提交 Google 身份凭证的 Repository。
  GoogleLoginStrategy(this._repository);

  final LoginRepository _repository;

  static const _serverClientId = String.fromEnvironment(
    'GOOGLE_SERVER_CLIENT_ID',
    defaultValue:
        '516434775620-q890e10bap92ul7ikdoem0375dtpt5g7.apps.googleusercontent.com',
  );
  static const _iosClientId = String.fromEnvironment(
    'GOOGLE_IOS_CLIENT_ID',
    defaultValue:
        '516434775620-vivq1pimnsiqg9b261haja0o8s9p308k.apps.googleusercontent.com',
  );
  static final _signIn = GoogleSignIn.instance;
  // Google SDK 是全局单例，策略重新创建时也不能重复初始化。
  static Future<void>? _initialization;

  /// 执行 Google 授权及后端登录，用户取消授权时返回 null。
  @override
  Future<LoginResponse?> authenticate(
    LoginCommand command,
    CancelToken cancelToken,
  ) async {
    // 检查渠道、取消状态和平台配置，避免启动无效授权。
    if (command is! GoogleLoginCommand) {
      throw ArgumentError('Google command required');
    }
    if (cancelToken.isCancelled) return null;
    _validateConfig();

    final String idToken;
    try {
      // 复用全局 SDK 初始化，iOS 额外传入自己的客户端 ID。
      await (_initialization ??= _signIn.initialize(
        clientId: defaultTargetPlatform == TargetPlatform.iOS
            ? _iosClientId
            : null,
        serverClientId: _serverClientId,
      ));
      if (cancelToken.isCancelled) return null;
      // 打开账号授权界面，取得身份凭证；它不是本应用的登录 token。
      final account = await _signIn.authenticate();
      final token = account.authentication.idToken;
      if (token == null || token.isEmpty) {
        throw const ApiException(message: 'Google 未返回登录凭证，请重试');
      }
      idToken = token;
    } on GoogleSignInException catch (error) {
      // 用户主动取消不提示失败，其他 SDK 异常转换成页面文案。
      if (error.code == GoogleSignInExceptionCode.canceled) return null;
      if (error.code == GoogleSignInExceptionCode.clientConfigurationError) {
        throw const ApiException(message: 'Google 登录配置不完整，请检查客户端 ID 和签名配置');
      }
      throw const ApiException(message: 'Google 授权失败，请稍后重试');
    } on MissingPluginException {
      throw const ApiException(message: '登录组件尚未加载，请重新编译 App');
    } on PlatformException {
      throw const ApiException(message: 'Google 授权暂不可用，请检查平台配置');
    }
    // 授权完成且操作仍有效时请求后端；保存结果由 ViewModel 接着执行。
    if (cancelToken.isCancelled) return null;
    return _repository.loginWithGoogle(idToken, cancelToken: cancelToken);
  }

  /// 检查支持的平台和必填客户端 ID，具体配置有效性由 SDK 校验。
  void _validateConfig() {
    if (kIsWeb ||
        (defaultTargetPlatform != TargetPlatform.iOS &&
            defaultTargetPlatform != TargetPlatform.android)) {
      throw const ApiException(message: '当前仅支持 iOS 和 Android 第三方登录');
    }
    if (_serverClientId.trim().isEmpty) {
      throw const ApiException(message: '请先配置 Google Web Client ID');
    }
    if (defaultTargetPlatform == TargetPlatform.iOS &&
        _iosClientId.trim().isEmpty) {
      throw const ApiException(message: '请先配置 Google iOS Client ID');
    }
  }
}
