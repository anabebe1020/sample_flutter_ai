import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ai/core/models/error.dart';
import 'package:flutter_ai/features/auth/state/authentication_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticationProvider =
    StateNotifierProvider<_AuthenticationNotifier, AuthenticationState>(
      (ref) => _AuthenticationNotifier(),
    );

class _AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  _AuthenticationNotifier() : super(const AuthenticationState());

  /// external functions
  // ログイン
  Future<void> signIn(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true);
      // バリデーション
      if (email.isEmpty || password.isEmpty) {
        throw AppError(
          code: ErrorCode.badRequest,
          message: 'メールアドレスとパスワードを入力してください。',
        );
      }
      // サインイン
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // ログアウト
  Future<void> signOut() async {
    try {
      state = state.copyWith(isLoading: true);
      await FirebaseAuth.instance.signOut();
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
