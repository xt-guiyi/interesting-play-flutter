import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interesting_play_flutter/features/auth/view/login_page.dart';
import 'package:interesting_play_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:interesting_play_flutter/features/home/view/home_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);

    return authState.when(
      data: (isLoggedIn) => isLoggedIn ? const HomePage() : const LoginPage(),
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, _) => const LoginPage(),
    );
  }
}
