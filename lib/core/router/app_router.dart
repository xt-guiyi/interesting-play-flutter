import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interesting_play_flutter/features/auth/view/login_page.dart';
import 'package:interesting_play_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:interesting_play_flutter/features/chat/view/chat_page.dart';
import 'package:interesting_play_flutter/features/detail/view/detail_page.dart';
import 'package:interesting_play_flutter/features/discover/view/discover_page.dart';
import 'package:interesting_play_flutter/features/home/view/home_page.dart';
import 'package:interesting_play_flutter/features/profile/view/profile_page.dart';
import 'package:interesting_play_flutter/features/shell/view/tab_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authViewModelProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return TabPage(navigationShell: navigationShell);
            },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (BuildContext context, GoRouterState state) {
                  return const HomePage();
                },
              ),
              GoRoute(
                path: '/home',
                builder: (BuildContext context, GoRouterState state) {
                  return const HomePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/discover',
                builder: (BuildContext context, GoRouterState state) {
                  return const DiscoverPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfilePage();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (BuildContext context, GoRouterState state) {
          return DetailPage(id: state.pathParameters['id'] ?? '');
        },
      ),
      GoRoute(
        path: '/chat',
        builder: (BuildContext context, GoRouterState state) {
          return const ChatPage();
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (authState.isLoading) return null;
      final isLoggedIn = authState.maybeWhen(
        data: (value) => value,
        orElse: () => false,
      );
      final isLoginRoute = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoginRoute) return '/login';
      if (isLoggedIn && isLoginRoute) return '/';
      return null;
    },
  );
}
