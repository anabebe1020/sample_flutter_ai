import 'package:flutter/material.dart';
import 'package:flutter_ai/features/route/provider/route_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 認証状態に応じて表示を切り替えるウィジェット
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    print(dotenv.get('GEMINI_API_KEY'));

    return MaterialApp.router(
      title: 'Camp Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.notoSansJp().fontFamily,
      ),
      routerConfig: router,
    );
  }
}
