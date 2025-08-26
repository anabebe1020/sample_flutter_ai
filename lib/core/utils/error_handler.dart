import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ai/core/models/error.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ErrorHandler useErrorHandler() {
  final context = useContext();

  void call(Object error, {StackTrace? stackTrace}) {
    String errorMessage = 'エラーが発生しました';
    if (error is FirebaseException) {
      final thisError = error;
      if (thisError.code == 'invalid-credential') {
        errorMessage = 'アカウントが存在しません。';
      } else if (thisError.code == 'network-request-failed') {
        errorMessage = 'ネットワークに接続できません。';
      } else if (thisError.message != null) {
        errorMessage = thisError.message!;
      }
      debugPrint(
        '[FirebaseException] [${thisError.code}] $errorMessage ${thisError.message}',
      );
    } else if (error is FirebaseAuthException) {
      final thisError = error;
      if (thisError.message != null) {
        errorMessage = thisError.message!;
      }
      debugPrint('[FirebaseAuthException] $errorMessage');
    } else if (error is TimeoutException) {
      errorMessage = 'リクエストがタイムアウトしました。';
      debugPrint('[TimeoutException] $errorMessage');
    } else if (error is AppError) {
      final thisError = error;
      errorMessage = thisError.message;
      debugPrint('[AppError] $errorMessage');
    } else {
      debugPrint('[OtherException] $errorMessage ${error.toString()}');
    }
    // スナックバーの表示
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(errorMessage)),
      );
    });
  }

  return ErrorHandler(call: call);
}

class ErrorHandler {
  final void Function(Object error, {StackTrace stackTrace}) call;

  ErrorHandler({required this.call});
}
