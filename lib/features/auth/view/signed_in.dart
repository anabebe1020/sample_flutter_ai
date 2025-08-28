import 'package:flutter/material.dart';
import 'package:flutter_ai/core/utils/error_handler.dart';
import 'package:flutter_ai/features/auth/provider/authentication_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignedInRoot extends HookConsumerWidget {
  const SignedInRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorHandler = useErrorHandler();
    final authNotifier = ref.read(authenticationProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Signed In')),
      body: Center(child: Text('Welcome back!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          try {
            authNotifier.signOut();
          } catch (e) {
            errorHandler.call(e);
          }
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
