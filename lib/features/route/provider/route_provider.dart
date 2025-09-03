// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai/features/auth/provider/auth_state_provider.dart';
import 'package:flutter_ai/features/auth/view/sign_in_page.dart';
import 'package:flutter_ai/features/auth/view/sign_up.dart';
import 'package:flutter_ai/features/auth/view/signed_in.dart';
import 'package:flutter_ai/features/route/constants/routes.dart';
import 'package:flutter_ai/features/welcome/view/page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerRefreshListenableProvider = Provider<Listenable>((ref) {
  final notifier = ChangeNotifier();

  // authStateProvider の変化を監視して、変わったら notifyListeners()
  ref.listen<AsyncValue<User?>>(authStateProvider, (prev, next) {
    // 値の変化（ログイン/ログアウト/初期化完了など）で通知
    if (prev?.value != next.value) {
      // ignore: invalid_use_of_protected_member
      notifier.notifyListeners();
    }
  }, fireImmediately: true);

  ref.onDispose(notifier.dispose);
  return notifier;
});

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // Riverpodと連携してauth変化でルータをリフレッシュ
    refreshListenable: ref.watch(routerRefreshListenableProvider),
    routes: [
      GoRoute(path: '/welcome', builder: (c, s) => const WelcomePage()),
      GoRoute(path: '/signin', builder: (c, s) => const SignInPage()),
      GoRoute(path: '/signup', builder: (c, s) => const SignUpPage()),
      GoRoute(path: '/root', builder: (c, s) => const SignedInRoot()),
      // rootのボトムナビゲーション
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: routesForRootNav.indexWhere(
                (route) => route.path == state.uri.path,
              ),
              onTap: (i) {
                final target = routesForRootNav[i].path;
                context.go(target);
              },
              items: [
                for (final route in routesForRootNav)
                  BottomNavigationBarItem(
                    icon: route.nav?.icon ?? Icon(Icons.error),
                    label: route.nav?.label ?? 'Unknown',
                  ),
              ],
            ),
          );
        },
        routes: [
          for (final route in routesForRootNav)
            GoRoute(path: route.path, builder: (context, state) => route.page),
        ],
      ),
    ],
    redirect: (context, state) {
      final user = ref.read(authStateProvider).valueOrNull;
      final isAuthed = user != null;
      final path = state.uri.path;

      // ログイン前画面
      const preAuthPaths = {'/welcome', '/signin', '/signup'};

      // 未認証
      if (!isAuthed) {
        // ログイン前画面以外の画面から未認証になった場合
        if (!preAuthPaths.contains(path)) {
          return '/welcome';
        }
        return null;
      }
      // 認証済み
      // ログイン前画面から認証済みになった場合
      if (preAuthPaths.contains(path)) {
        return routesForRootNav.first.path;
      }
      return null;
    },
    initialLocation: routesForRootNav.first.path,
  );
});
