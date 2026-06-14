import 'package:interesting_play_flutter/features/auth/model/login_state.dart';
import 'package:interesting_play_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_viewmodel.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  final RegExp _phoneRegex = RegExp(r'^(1[3-9]\d{9})$');

  @override
  LoginState build() {
    return const LoginState.idle();
  }

  Future<void> login(String phone, String password) async {
    if (!_phoneRegex.hasMatch(phone)) {
      state = LoginState.error('手机号格式错误');
      return;
    }

    if (password.isEmpty) {
      state = LoginState.error('请输入密码');
      return;
    }

    state = const LoginState.loading();
    try {
      await ref.read(authViewModelProvider.notifier).login(phone, password);
      state = const LoginState.success();
    } catch (error) {
      state = LoginState.error(error.toString());
    }
  }
}
