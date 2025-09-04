import 'dart:async';
import 'dart:typed_data';

import 'package:google_generative_ai/google_generative_ai.dart';

/// Gemini API の薄いラッパ。抽象インターフェースを介してDIしやすく
/// Riverpod から使う前提。
abstract class AiClient {
  Future<String> generateText({required String system, required String user});
  Stream<String> streamText({required String system, required String user});
  Future<String> multimodalDescribe({
    required String system,
    required String user,
    required Uint8List imageBytes,
    String mimeType = 'image/jpeg',
  });
}

class GeminiClient implements AiClient {
  final GenerativeModel _model;

  GeminiClient({required String apiKey, String modelName = 'gemini-1.5-pro'})
    : _model = GenerativeModel(
        model: modelName,
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.4,
          topK: 32,
          topP: 0.95,
          maxOutputTokens: 1024,
        ),
      );

  @override
  Future<String> generateText({
    required String system,
    required String user,
  }) async {
    final content = [Content.system(system), Content.text(user)];
    final res = await _model.generateContent(content);
    return res.text ?? '';
  }

  @override
  Stream<String> streamText({
    required String system,
    required String user,
  }) async* {
    final content = [Content.system(system), Content.text(user)];
    final stream = _model.generateContentStream(content);
    await for (final event in stream) {
      final chunk = event.text;
      if (chunk != null && chunk.isNotEmpty) {
        yield chunk;
      }
    }
  }

  @override
  Future<String> multimodalDescribe({
    required String system,
    required String user,
    required Uint8List imageBytes,
    String mimeType = 'image/jpeg',
  }) async {
    final content = [
      Content.system(system),
      Content.multi([TextPart(user), DataPart(mimeType, imageBytes)]),
    ];
    final res = await _model.generateContent(content);
    return res.text ?? '';
  }
}
