import 'dart:async';

import 'package:interesting_play_flutter/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  FutureOr<bool> build() async {
    final authRepository = ref.watch(authRepositoryProvider);
    final currentUser = await authRepository.getCurrentUser();
    return currentUser != null;
  }

  Future<void> login(
    String username,
    String password, {
    bool showGlobalErrorToast = true,
  }) async {
    state = const AsyncLoading();
    try {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.login(
        username,
        password,
        showGlobalErrorToast: showGlobalErrorToast,
      );
      state = const AsyncData(true);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }

  Future<void> logout() async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.logout();
    state = const AsyncData(false);
  }
}
