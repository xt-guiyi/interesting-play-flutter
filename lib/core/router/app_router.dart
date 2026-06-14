import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interesting_play_flutter/features/auth/view/login_page.dart';
import 'package:interesting_play_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:interesting_play_flutter/features/detail/view/detail_page.dart';
import 'package:interesting_play_flutter/features/discover/view/discover_page.dart';
import 'package:interesting_play_flutter/features/home/view/home_page.dart';
import 'package:interesting_play_flutter/features/practice/chat/view/chat_page.dart';
import 'package:interesting_play_flutter/features/practice/view/bottom_sheet_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/clipboard_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/date_picker_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/dialog_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/download_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/file_picker_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/image_picker_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/location_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/notification_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/permission_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/qr_code_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/region_picker_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/scan_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/share_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/webview_practice_page.dart';
import 'package:interesting_play_flutter/features/practice/view/year_month_day_picker_practice_page.dart';
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
        path: '/practice',
        builder: (BuildContext context, GoRouterState state) {
          return const PracticePage();
        },
      ),
      GoRoute(
        path: '/practice/dialog',
        builder: (BuildContext context, GoRouterState state) {
          return const DialogPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/bottom-sheet',
        builder: (BuildContext context, GoRouterState state) {
          return const BottomSheetPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/date-picker',
        builder: (BuildContext context, GoRouterState state) {
          return const DatePickerPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/year-month-day-picker',
        builder: (BuildContext context, GoRouterState state) {
          return const YearMonthDayPickerPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/scan',
        builder: (BuildContext context, GoRouterState state) {
          return const ScanPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/image-picker',
        builder: (BuildContext context, GoRouterState state) {
          return const ImagePickerPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/permission',
        builder: (BuildContext context, GoRouterState state) {
          return const PermissionPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/location',
        builder: (BuildContext context, GoRouterState state) {
          return const LocationPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/file-picker',
        builder: (BuildContext context, GoRouterState state) {
          return const FilePickerPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/share',
        builder: (BuildContext context, GoRouterState state) {
          return const SharePracticePage();
        },
      ),
      GoRoute(
        path: '/practice/clipboard',
        builder: (BuildContext context, GoRouterState state) {
          return const ClipboardPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/download',
        builder: (BuildContext context, GoRouterState state) {
          return const DownloadPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/notification',
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/webview',
        builder: (BuildContext context, GoRouterState state) {
          return const WebViewPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/qr-code',
        builder: (BuildContext context, GoRouterState state) {
          return const QrCodePracticePage();
        },
      ),
      GoRoute(
        path: '/practice/region-picker',
        builder: (BuildContext context, GoRouterState state) {
          return const RegionPickerPracticePage();
        },
      ),
      GoRoute(
        path: '/practice/chat',
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
