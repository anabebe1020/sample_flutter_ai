import 'package:flutter/material.dart';
import 'package:flutter_ai/core/utils/error_handler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
    final errorHandler = useErrorHandler();
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
      } catch (e) {
        errorHandler.call(e);
      } finally {
        loading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('キャンプ場の提案')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Markdown(
          padding: EdgeInsets.symmetric(vertical: 20),
          data: result.value,
          selectable: true,
        ),
      ),
      bottomSheet: Container(
        color: Colors.white.withValues(alpha: 0.4),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: _ChatInput(
          controller: controller,
          isLoading: loading.value,
          onTap: onRun,
        ),
      ),
    );
  }
}

/// チャット入力フィールド
class _ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final void Function() onTap;

  const _ChatInput({
    required this.controller,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 入力フィールド
        TextField(
          controller: controller,
          minLines: 1,
          maxLines: 12,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(16, 12, 44, 12),
            hintText: '要望を入力',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey.withValues(alpha: 0.1),
          ),
        ),
        // 送信ボタン
        Positioned(
          right: 4,
          bottom: 0,
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                )
              : IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 18,
                  icon: const Icon(Icons.send),
                  onPressed: isLoading ? null : onTap,
                ),
        ),
      ],
    );
  }
}
