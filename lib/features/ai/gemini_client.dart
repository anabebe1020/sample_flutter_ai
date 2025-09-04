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
    String mimeType,
  });
}

class GeminiClient implements AiClient {
  final String apiKey;
  final String modelName;
  final GenerationConfig _config;

  GeminiClient({required this.apiKey, this.modelName = 'gemini-1.5-pro'})
    : _config = GenerationConfig(
        temperature: 0.4,
        topK: 32,
        topP: 0.95,
        maxOutputTokens: 1024,
      );

  GenerativeModel _model({String? system}) => GenerativeModel(
    model: modelName,
    apiKey: apiKey,
    generationConfig: _config,
    // ← ここに systemInstruction を渡す
    systemInstruction: system == null ? null : Content.text(system),
  );

  @override
  Future<String> generateText({
    required String system,
    required String user,
  }) async {
    final res = await _model(
      system: system,
    ).generateContent([Content.text(user)]);
    return res.text ?? '';
  }

  @override
  Stream<String> streamText({
    required String system,
    required String user,
  }) async* {
    final stream = _model(
      system: system,
    ).generateContentStream([Content.text(user)]);
    await for (final event in stream) {
      final chunk = event.text;
      if (chunk != null && chunk.isNotEmpty) yield chunk;
    }
  }

  @override
  Future<String> multimodalDescribe({
    required String system,
    required String user,
    required Uint8List imageBytes,
    String mimeType = 'image/jpeg',
  }) async {
    final res = await _model(system: system).generateContent([
      Content.multi([TextPart(user), DataPart(mimeType, imageBytes)]),
    ]);
    return res.text ?? '';
  }
}
