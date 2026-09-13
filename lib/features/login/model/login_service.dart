import 'package:dio/dio.dart';
import 'package:flutter_feature_collection/core/network/providers/api_client_provider.dart';
import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/features/login/model/vo/login_dto.dart';
import 'package:flutter_feature_collection/features/login/model/vo/login_response.dart';
import 'package:flutter_feature_collection/features/login/strategies/vo/github_login_credential.dart';
import 'package:flutter_feature_collection/core/utils/api_json_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_service.g.dart';

/// 为登录接口注入应用 HTTP 客户端。
@riverpod
LoginService loginService(Ref ref) {
  return LoginService(ref.watch(apiClientProvider));
}

/// 发送登录相关 HTTP 请求并解析响应，不保存缓存或更新会话。
class LoginService {
  /// 使用统一配置的 HTTP 客户端访问登录接口。
  LoginService(this._client);

  final Dio _client;

  /// 请求手机号验证码登录接口，错误提示由登录页面处理。
  Future<ApiResponse<LoginResponse>> login(
    LoginDto loginDto, {
    CancelToken? cancelToken,
  }) async {
    final response = await _client.post(
      '/api/user/auth/login',
      data: loginDto.toJson(),
      cancelToken: cancelToken,
      options: ApiRequestOptions.noGlobalErrorToast(),
    );
    return parseApiObjectResponse(response.data, LoginResponse.fromJson);
  }

  /// 将 Google idToken 发给后端，换取应用登录结果。
  Future<ApiResponse<LoginResponse>> loginWithGoogle(
    String idToken, {
    CancelToken? cancelToken,
  }) => _thirdPartyLogin('/api/user/auth/google', {
    'idToken': idToken,
  }, cancelToken);

  /// 提交 GitHub 授权码、回调地址和 PKCE 校验参数，由后端完成换码。
  Future<ApiResponse<LoginResponse>> loginWithGithub(
    GithubLoginCredential credential, {
    CancelToken? cancelToken,
  }) => _thirdPartyLogin('/api/user/auth/github', {
    'code': credential.code,
    'redirectUri': credential.redirectUri,
    'codeVerifier': credential.codeVerifier,
  }, cancelToken);

  /// 共用第三方登录请求配置，返回解析后的应用登录响应。
  Future<ApiResponse<LoginResponse>> _thirdPartyLogin(
    String path,
    Map<String, String> data,
    CancelToken? cancelToken,
  ) async {
    // 第三方换码可能更慢，仅此类请求延长超时，并避免重复 Toast。
    final options = ApiRequestOptions.noGlobalErrorToast()
      ..receiveTimeout = const Duration(seconds: 30);
    final response = await _client.post(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
    // 解析响应结构，业务状态码由 Repository 判断。
    return parseApiObjectResponse(response.data, LoginResponse.fromJson);
  }

  /// 发送 LOGIN 场景短信验证码；成功响应不要求包含 data。
  Future<ApiResponse<void>> sendSmsCode(String phone) async {
    final response = await _client.post(
      '/api/user/auth/sms-code',
      data: {'phone': phone, 'scene': 'LOGIN'},
      options: ApiRequestOptions.noGlobalErrorToast(),
    );
    return parseApiResponse<void>(response.data, (_) {});
  }
}
