import 'package:flutter/material.dart';
import 'package:flutter_ai/features/sample/extract_query_usecase.dart';
import 'package:flutter_ai/features/sample/recommend_usecase.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecommendScreen extends HookConsumerWidget {
  const RecommendScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(
      text: '夏に関東で川遊びができて温泉もある家族向け。車で2時間以内、電源サイト必須',
    );
    final loading = useState(false);
    final result = useState<String>('');

    Future<void> onRun() async {
      loading.value = true;
      try {
        final extract = ref.read(extractQueryUsecaseProvider);
        final q = await extract(controller.text);
        final recommend = ref.read(recommendUsecaseProvider);
        final md = await recommend.recommend(q);
        result.value = md;
      } finally {
        loading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('キャンプ提案（AI試作）')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: '要望を入力',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: loading.value ? null : onRun,
                  child: const Text('提案を生成'),
                ),
                const SizedBox(width: 12),
                if (loading.value) const CircularProgressIndicator(),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(child: SelectableText(result.value)),
            ),
          ],
        ),
      ),
    );
  }
}
