import 'dart:async';

import 'package:interesting_play_flutter/core/auth/auth_session.dart';
import 'package:interesting_play_flutter/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  FutureOr<bool> build() async {
    final authRepository = ref.watch(authRepositoryProvider);
    final currentUser = await authRepository.getCurrentUser();
    if (currentUser == null) {
      ref.read(authSessionProvider.notifier).loggedOut();
    } else {
      ref.read(authSessionProvider.notifier).loggedIn();
    }
    return currentUser != null;
  }

  Future<void> login(
    String username,
    String password, {
    bool showGlobalErrorToast = true,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.login(
      username,
      password,
      showGlobalErrorToast: showGlobalErrorToast,
    );
    ref.read(authSessionProvider.notifier).loggedIn();
    state = const AsyncData(true);
  }

  Future<void> logout() async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.logout();
    ref.read(authSessionProvider.notifier).loggedOut();
    state = const AsyncData(false);
  }
}
