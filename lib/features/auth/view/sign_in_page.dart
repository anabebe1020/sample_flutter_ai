import 'package:flutter/material.dart';
import 'package:flutter_ai/features/auth/provider/authentication_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authenticationProvider);
    final notifier = ref.read(authenticationProvider.notifier);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('サインイン'),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'メールアドレス'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'パスワード'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                print(emailController.text);
                print(passwordController.text);
                await notifier.signIn(
                  emailController.text,
                  passwordController.text,
                );
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
      ),
    );
  }
}
