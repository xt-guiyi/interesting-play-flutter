import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/core/auth/auth_storage.dart';
import 'package:flutter_feature_collection/features/login/data/login_service.dart';
import 'package:flutter_feature_collection/features/login/model/login_dto.dart';
import 'package:flutter_feature_collection/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepository(
    loginService: ref.watch(loginServiceProvider),
    localStorage: ref.watch(authStorageServiceProvider),
  );
}

class LoginRepository {
  LoginRepository({
    required LoginService loginService,
    required AuthStorageService localStorage,
  }) : _loginService = loginService,
       _localStorage = localStorage;

  final LoginService _loginService;
  final AuthStorageService _localStorage;

  Future<UserInfo?> getCurrentUser() {
    return _localStorage.getUserInfo();
  }

  Future<UserInfo> login(
    String username,
    String password, {
    bool showGlobalErrorToast = true,
  }) async {
    final loginResult = await _loginService.login(
      LoginDto(username: username, password: password),
      showGlobalErrorToast: showGlobalErrorToast,
    );
    final token = unwrapApiResponse(loginResult, '登录失败');
    await _localStorage.setAuthorization(token);
    final userResult = await _loginService.getUserInfo(
      showGlobalErrorToast: showGlobalErrorToast,
    );
    final userInfo = unwrapApiResponse(userResult, '获取用户信息失败');
    await _localStorage.setUserInfo(userInfo);
    return userInfo;
  }

  Future<void> logout() {
    return _localStorage.clearAuthState();
  }
}
