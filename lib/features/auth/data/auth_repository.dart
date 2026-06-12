import 'package:interesting_play_flutter/core/network/api_exception.dart';
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
  AuthRepository({required this.authService, required this.localStorage});

  final AuthService authService;
  final LocalStorageService localStorage;

  Future<UserInfo?> getCurrentUser() {
    return localStorage.getUserInfo();
  }

  Future<UserInfo> login(String username, String password) async {
    final loginResult = await authService.login(
      LoginDto(username: username, password: password),
    );
    if (loginResult.code != 200 || loginResult.data == null) {
      throw ApiException(
        message: loginResult.message ?? '登录失败',
        statusCode: loginResult.code,
      );
    }

    await localStorage.setAuthorization(loginResult.data!);
    final userResult = await authService.getUserInfo();
    if (userResult.code != 200 || userResult.data == null) {
      throw ApiException(
        message: userResult.message ?? '获取用户信息失败',
        statusCode: userResult.code,
      );
    }

    await localStorage.setUserInfo(userResult.data);
    return userResult.data!;
  }

  Future<void> logout() {
    return localStorage.clearAuthState();
  }
}
