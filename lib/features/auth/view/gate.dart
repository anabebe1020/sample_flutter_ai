import 'package:flutter/material.dart';
import 'package:flutter_ai/features/auth/provider/auth_state_provider.dart';
import 'package:flutter_ai/features/welcome/view/page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 認証状態に応じて表示を切り替えるウィジェット
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 認証状態を監視
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'Camp Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.notoSansJp().fontFamily,
      ),
      home: authState.when(
        data: (user) {
          if (user != null) {
            return Text('Logged in as ${user.email}');
          } else {
            return WelcomePage();
          }
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('Error: $error'),
      ),
    );
  }
}
