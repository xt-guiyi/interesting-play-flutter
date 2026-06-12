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

  Future<void> logout() async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.logout();
    state = const AsyncData(false);
  }
}
