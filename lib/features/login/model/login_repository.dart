import 'package:dio/dio.dart';
import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/core/network/exceptions/api_exception.dart';
import 'package:flutter_feature_collection/core/auth/auth_storage.dart';
import 'package:flutter_feature_collection/features/login/model/login_service.dart';
import 'package:flutter_feature_collection/features/login/model/vo/login_dto.dart';
import 'package:flutter_feature_collection/features/login/model/vo/login_response.dart';
import 'package:flutter_feature_collection/features/login/strategies/vo/github_login_credential.dart';
import 'package:flutter_feature_collection/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

/// 注入登录接口服务和本地鉴权存储，提供登录数据访问能力。
@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepository(
    loginService: ref.watch(loginServiceProvider),
    localStorage: ref.watch(authStorageServiceProvider),
  );
}

/// 校验登录接口的业务结果，并负责本地登录数据的读写。
class LoginRepository {
  /// 使用接口服务处理请求，使用鉴权存储保存应用登录信息。
  LoginRepository({
    required LoginService loginService,
    required AuthStorageService localStorage,
  }) : _loginService = loginService,
       _localStorage = localStorage;

  final LoginService _loginService;
  final AuthStorageService _localStorage;

  /// 读取本地缓存的用户资料，不请求后端。
  Future<UserInfo?> getCurrentUser() {
    return _localStorage.getUserInfo();
  }

  /// 请求发送登录验证码，业务失败时抛出接口返回的原因。
  Future<void> sendSmsCode(String phone) async {
    final response = await _loginService.sendSmsCode(phone);
    // 发送成功的 data 为 null，只校验业务状态码。
    if (response.code != 200) {
      throw ApiException(
        message: response.message?.trim().isNotEmpty == true
            ? response.message!
            : '验证码发送失败，请稍后重试',
        statusCode: response.code,
      );
    }
  }

  /// 提交短信登录参数并解包结果，此处不保存登录状态。
  Future<LoginResponse> loginWithSms(
    String phone,
    String code, {
    CancelToken? cancelToken,
  }) async {
    final loginResult = await _loginService.login(
      LoginDto(account: phone, code: code),
      cancelToken: cancelToken,
    );
    return unwrapApiResponse(loginResult, '登录失败');
  }

  /// 将 Google 身份凭证交给后端，返回应用自己的登录结果。
  Future<LoginResponse> loginWithGoogle(
    String idToken, {
    CancelToken? cancelToken,
  }) async {
    final result = await _loginService.loginWithGoogle(
      idToken,
      cancelToken: cancelToken,
    );
    return unwrapApiResponse(result, 'Google 登录失败');
  }

  /// 将 GitHub 授权凭证交给后端，校验并返回应用登录结果。
  Future<LoginResponse> loginWithGithub(
    GithubLoginCredential credential, {
    CancelToken? cancelToken,
  }) async {
    final result = await _loginService.loginWithGithub(
      credential,
      cancelToken: cancelToken,
    );
    return unwrapApiResponse(result, 'GitHub 登录失败');
  }

  /// 保存应用 token 和用户资料；操作失效时清理数据并返回 false。
  /// canCommit 由 ViewModel 提供，用于判断本次登录是否仍有效。
  Future<bool> saveLoginResult(
    LoginResponse result, {
    required bool Function() canCommit,
  }) async {
    // 写入前确认操作有效且后端返回了非空的应用 token。
    if (!canCommit()) return false;
    if (result.token.trim().isEmpty) {
      throw const ApiException(message: '登录凭证无效，请重新登录');
    }
    final userInfo = result.userInfo;
    try {
      // 顺序保存 token 和用户资料，每次异步写入后确认是否已取消。
      await _localStorage.setAuthorization(result.token);
      if (canCommit()) await _localStorage.setUserInfo(userInfo);
      if (canCommit()) return true;
    } catch (_) {
      // 写入失败时清理可能残留的半份登录信息，再报告失败。
      await _localStorage.clearAuthState();
      throw const ApiException(message: '保存登录信息失败，请重试');
    }
    // 写入期间被取消时也清理数据，避免留下未完成的登录状态。
    await _localStorage.clearAuthState();
    return false;
  }

  /// 清除本地 token 和用户资料；全局会话由调用方另行更新。
  Future<void> logout() {
    return _localStorage.clearAuthState();
  }
}
