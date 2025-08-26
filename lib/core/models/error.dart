class AppError {
  final ErrorCode code;
  final String message;

  AppError({required this.code, required this.message});
}

enum ErrorCode { badRequest, notSetupApiClient, notSignIn }
