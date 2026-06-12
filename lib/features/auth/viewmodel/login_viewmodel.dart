import 'package:interesting_play_flutter/features/auth/data/auth_repository.dart';
import 'package:interesting_play_flutter/features/auth/model/login_state.dart';
import 'package:interesting_play_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return const LoginState.idle();
  }

  Future<void> login(String username, String password) async {
    state = const LoginState.loading();
    try {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.login(username, password);
      ref.invalidate(authViewModelProvider);
      state = const LoginState.success();
    } catch (error) {
      state = LoginState.error(error.toString());
    }
  }
}
