import 'package:flutter_ai/features/ai/gemini_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final aiClientProvider = Provider<AiClient>((ref) {
  final key = dotenv.env['GEMINI_API_KEY'];
  if (key == null || key.isEmpty) {
    throw StateError('GEMINI_API_KEY is not set.');
  }
  return GeminiClient(apiKey: key);
});
