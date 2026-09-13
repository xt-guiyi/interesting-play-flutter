import 'package:flutter_feature_collection/core/auth/auth_session.dart';
import 'package:flutter_feature_collection/features/login/data/login_repository.dart';
import 'package:flutter_feature_collection/features/login/model/login_state.dart';
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
      _emitError('手机号格式错误');
      return;
    }

    if (password.isEmpty) {
      _emitError('请输入密码');
      return;
    }

    state = const LoginState.loading();
    final session = ref.read(authSessionProvider.notifier);
    try {
      await ref
          .read(loginRepositoryProvider)
          .login(phone, password, showGlobalErrorToast: false);
      if (ref.mounted) state = const LoginState.success();
      session.loggedIn();
    } catch (error) {
      if (!ref.mounted) return;
      _emitError(error.toString());
    }
  }

  void _emitError(String message) {
    if (state case LoginError(
      message: final currentMessage,
    ) when currentMessage == message) {
      state = const LoginState.idle();
    }

    state = LoginState.error(message);
  }
}
