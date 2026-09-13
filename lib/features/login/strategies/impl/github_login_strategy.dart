import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import '../../../../core/network/exceptions/api_exception.dart';
import '../../model/login_repository.dart';
import '../vo/github_login_credential.dart';
import '../vo/login_command.dart';
import '../../model/vo/login_response.dart';
import '../login_strategy.dart';

/// 通过系统授权页取得 GitHub 授权码，再由后端完成应用登录。
class GithubLoginStrategy implements LoginStrategy {
  /// 注入用于向后端提交 GitHub 授权凭证的 Repository。
  GithubLoginStrategy(this._repository);

  final LoginRepository _repository;
  final FlutterAppAuth _appAuth = const FlutterAppAuth();

  static const _clientId = String.fromEnvironment('GITHUB_CLIENT_ID');
  static const _redirectUri = 'com.xtguiyi.featurecollection://oauth/github';

  /// 执行 GitHub 授权和后端登录，用户取消授权时返回 null。
  @override
  Future<LoginResponse?> authenticate(
    LoginCommand command,
    CancelToken cancelToken,
  ) async {
    // 确认调用渠道、取消状态和平台配置后再打开授权页。
    if (command is! GithubLoginCommand) {
      throw ArgumentError('GitHub command required');
    }
    if (cancelToken.isCancelled) return null;
    _validateConfig();

    final GithubLoginCredential credential;
    try {
      // AppAuth 管理 state 和 PKCE，只取授权码，平台 token 仍由后端换取。
      final response = await _appAuth.authorize(
        AuthorizationRequest(
          _clientId,
          _redirectUri,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: 'https://github.com/login/oauth/authorize',
            tokenEndpoint: 'https://github.com/login/oauth/access_token',
          ),
          scopes: const [],
        ),
      );
      // 收集后端换码所需的参数，缺少授权码或 PKCE 校验值不能继续。
      final code = response.authorizationCode;
      final verifier = response.codeVerifier;
      if (code == null ||
          code.isEmpty ||
          verifier == null ||
          verifier.isEmpty) {
        throw const ApiException(message: 'GitHub 未返回完整授权凭证，请重试');
      }
      credential = GithubLoginCredential(
        code: code,
        codeVerifier: verifier,
        redirectUri: _redirectUri,
      );
    } on FlutterAppAuthUserCancelledException {
      // 主动取消正常结束；插件或平台异常则转换为可展示的错误。
      return null;
    } on MissingPluginException {
      throw const ApiException(message: '登录组件尚未加载，请重新编译 App');
    } on PlatformException {
      throw const ApiException(message: 'GitHub 授权失败，请检查网络和回调配置');
    }
    // 调用后端登录接口，结果返回 ViewModel 后才保存并更新会话。
    if (cancelToken.isCancelled) return null;
    return _repository.loginWithGithub(credential, cancelToken: cancelToken);
  }

  /// 检查当前平台和 GitHub Client ID 是否满足启动授权的条件。
  void _validateConfig() {
    if (kIsWeb ||
        (defaultTargetPlatform != TargetPlatform.iOS &&
            defaultTargetPlatform != TargetPlatform.android)) {
      throw const ApiException(message: '当前仅支持 iOS 和 Android 第三方登录');
    }
    if (_clientId.trim().isEmpty) {
      throw const ApiException(message: '请先配置 GitHub Client ID');
    }
  }
}
