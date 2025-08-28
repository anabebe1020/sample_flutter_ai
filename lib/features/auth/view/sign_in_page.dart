import 'package:flutter/material.dart';
import 'package:flutter_ai/core/utils/error_handler.dart';
import 'package:flutter_ai/features/auth/provider/authentication_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorHandler = useErrorHandler();
    final state = ref.watch(authenticationProvider);
    final notifier = ref.read(authenticationProvider.notifier);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        // title: const Text('サインイン'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // メインコンテンツ
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.0,
              children: <Widget>[
                // アプリロゴ
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text('アプリロゴ'),
                ),
                const SizedBox(height: 24.0),
                // 入力フィールド
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'メールアドレス'),
                ),
                // 入力フィールド
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                // サインインボタン
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await notifier.signIn(
                        emailController.text,
                        passwordController.text,
                      );
                    } catch (e) {
                      errorHandler.call(e);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // サインイン中のアイコン
                      if (state.isLoading) ...[CircularProgressIndicator()],
                      Text('サインイン'),
                    ],
                  ),
                ),
              ],
            ),
            // サブコンテンツ
            Column(
              children: [
                // 会員登録
                TextButton(
                  onPressed: () {
                    // 会員登録画面に遷移
                  },
                  child: Text('会員登録'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
