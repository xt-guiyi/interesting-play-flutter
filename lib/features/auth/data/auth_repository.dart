import 'package:interesting_play_flutter/core/network/api_response.dart';
import 'package:interesting_play_flutter/core/storage/local_storage.dart';
import 'package:interesting_play_flutter/features/auth/data/auth_service.dart';
import 'package:interesting_play_flutter/features/auth/model/login_dto.dart';
import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    authService: ref.watch(authServiceProvider),
    localStorage: ref.watch(localStorageServiceProvider),
  );
}

class AuthRepository {
  AuthRepository({
    required AuthService authService,
    required LocalStorageService localStorage,
  }) : _authService = authService,
       _localStorage = localStorage;

  final AuthService _authService;
  final LocalStorageService _localStorage;

  Future<UserInfo?> getCurrentUser() {
    return _localStorage.getUserInfo();
  }

  Future<UserInfo> login(
    String username,
    String password, {
    bool showGlobalErrorToast = true,
  }) async {
    final loginResult = await _authService.login(
      LoginDto(username: username, password: password),
      showGlobalErrorToast: showGlobalErrorToast,
    );
    final token = unwrapApiResponse(loginResult, '登录失败');
    await _localStorage.setAuthorization(token);
    final userResult = await _authService.getUserInfo(
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
