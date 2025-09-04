import 'dart:convert';
import 'package:flutter_ai/features/ai/gemini_client.dart';
import 'package:flutter_ai/features/ai/provider/gemini_provider.dart';
import 'package:flutter_ai/features/sample/camp_query.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final extractQueryUsecaseProvider = Provider<ExtractQueryUsecase>((ref) {
  final ai = ref.watch(aiClientProvider);
  return ExtractQueryUsecase(ai);
});

class ExtractQueryUsecase {
  final AiClient _ai;
  ExtractQueryUsecase(this._ai);

  static const _system = '''
あなたは日本のキャンプ計画アシスタントです。ユーザーの自然文の要望から、季節/地域/人数/連泊数/移動手段/運転許容時間/必須条件/あれば嬉しい条件/予算メモ を日本語でJSONに正規化します。余計な文章は出さず、application/json のみ返答してください。
スキーマ:
{
"season": "春|夏|秋|冬|通年",
"region": "関東|関西|中部|東北|九州|北海道|未指定",
"nights": number,
"people": number,
"transport": "車|公共交通|バイク|未指定",
"maxDriveHours": number,
"mustHave": string[],
"niceToHave": string[],
"budgetNote": string
}
''';

  Future<CampQuery> call(String userUtterance) async {
    final jsonText = await _ai.generateText(
      system: _system,
      user: '要望: $userUtterance\nJSONだけで返してください。',
    );
    // 念のためJSON部分を抽出
    final begin = jsonText.indexOf('{');
    final end = jsonText.lastIndexOf('}');
    final jsonStr = (begin >= 0 && end > begin)
        ? jsonText.substring(begin, end + 1)
        : '{}';
    final map = json.decode(jsonStr) as Map<String, dynamic>;
    return CampQuery.fromJson(map);
  }
}
