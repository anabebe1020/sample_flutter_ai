import 'package:flutter_ai/features/ai/gemini_client.dart';
import 'package:flutter_ai/features/ai/provider/gemini_provider.dart';
import 'package:flutter_ai/features/sample/camp_query.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recommendUsecaseProvider = Provider<RecommendUsecase>((ref) {
  final ai = ref.watch(aiClientProvider);
  return RecommendUsecase(ai);
});

class RecommendUsecase {
  final AiClient _ai;
  RecommendUsecase(this._ai);

  static const _system = '''
あなたは日本のキャンプコンシェルジュです。ユーザーの条件に合うキャンプ場を3件提案し、各提案に「理由」を付けてください。出力はMarkdownで、以下の見出し構造に従ってください。


# 候補一覧
- 箇条書きでキャンプ場名（仮名可）と位置の概要


# 詳細
## 1. {キャンプ場名}
- 位置:
- アクセス:
- 特徴:
- 向いている理由:
- 注意点:


## 2. {キャンプ場名}
...同様


## 3. {キャンプ場名}
...同様
''';

  Future<String> recommend(CampQuery q) async {
    final user =
        '''
条件:
- 季節: ${q.season}
- 地域: ${q.region}
- 連泊数: ${q.nights}
- 人数: ${q.people}
- 交通: ${q.transport}
- 運転許容時間(時間): ${q.maxDriveHours}
- 必須: ${q.mustHave.join(', ')}
- あれば嬉しい: ${q.niceToHave.join(', ')}
- 予算メモ: ${q.budgetNote}
''';
    return _ai.generateText(system: _system, user: user);
  }
}
