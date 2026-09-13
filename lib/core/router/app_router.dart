import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_feature_collection/features/login/view/login_page.dart';
import 'package:flutter_feature_collection/features/login/view/sms_login_page.dart';
import 'package:flutter_feature_collection/features/detail/view/detail_page.dart';
import 'package:flutter_feature_collection/features/discover/view/discover_page.dart';
import 'package:flutter_feature_collection/features/home/view/home_page.dart';
import 'package:flutter_feature_collection/features/practice/chat/view/chat_page.dart';
import 'package:flutter_feature_collection/features/practice/view/bottom_sheet_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/clipboard_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/date_picker_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/dialog_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/download_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/image_picker_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/location_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/notification_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/permission_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/qr_code_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/region_picker_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/scan_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/share_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/webview_practice_page.dart';
import 'package:flutter_feature_collection/features/practice/view/year_month_day_picker_practice_page.dart';
import 'package:flutter_feature_collection/features/profile/view/profile_page.dart';
import 'package:flutter_feature_collection/features/shell/view/tab_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const LoginPage());
        },
      ),
      GoRoute(
        path: '/login/sms',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(
            state,
            SmsLoginPage(initialAgreement: state.extra == true),
          );
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
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(
            state,
            DetailPage(id: state.pathParameters['id'] ?? ''),
          );
        },
      ),
      GoRoute(
        path: '/practice',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const PracticePage());
        },
      ),
      GoRoute(
        path: '/practice/dialog',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const DialogPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/bottom-sheet',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const BottomSheetPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/date-picker',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const DatePickerPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/year-month-day-picker',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const YearMonthDayPickerPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/scan',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const ScanPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/image-picker',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const ImagePickerPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/permission',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const PermissionPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/location',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const LocationPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/share',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const SharePracticePage());
        },
      ),
      GoRoute(
        path: '/practice/clipboard',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const ClipboardPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/download',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const DownloadPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/notification',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const NotificationPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/webview',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const WebViewPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/qr-code',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const QrCodePracticePage());
        },
      ),
      GoRoute(
        path: '/practice/region-picker',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const RegionPickerPracticePage());
        },
      ),
      GoRoute(
        path: '/practice/chat',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return _buildSlidePage(state, const ChatPage());
        },
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}

CustomTransitionPage<void> _buildSlidePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 280),
    reverseTransitionDuration: const Duration(milliseconds: 240),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      final curvedSecondaryAnimation = CurvedAnimation(
        parent: secondaryAnimation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      final pageInOffset = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(curvedAnimation);
      final pageBehindOffset = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-0.24, 0),
      ).animate(curvedSecondaryAnimation);

      return SlideTransition(
        position: pageBehindOffset,
        child: SlideTransition(position: pageInOffset, child: child),
      );
    },
  );
}
