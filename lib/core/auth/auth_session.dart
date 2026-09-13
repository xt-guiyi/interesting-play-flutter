import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_storage.dart';

part 'auth_session.g.dart';

/// 应用级登录会话状态，供路由和网络层共享。
@riverpod
class AuthSession extends _$AuthSession {
  @override
  FutureOr<bool> build() async {
    final user = await ref.watch(authStorageServiceProvider).getUserInfo();
    return user != null;
  }

  void loggedIn() => state = const AsyncData(true);

  void loggedOut() => state = const AsyncData(false);
}
