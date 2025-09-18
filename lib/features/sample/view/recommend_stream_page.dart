import 'package:flutter/material.dart';
import 'package:flutter_ai/core/utils/error_handler.dart';
import 'package:flutter_ai/features/sample/model/recommend_history.dart';
import 'package:flutter_ai/features/sample/provider/extract_query_usecase.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/recommend_use_case_stream.dart';

class StreamScreen extends HookConsumerWidget {
  const StreamScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(
      text: '夏に関東で川遊びができて温泉もある家族向け。車で2時間以内、電源サイト必須',
    );
    final errorHandler = useErrorHandler();
    final loading = useState(false);
    final history = useState<List<RecommendHistoryModel>>([]);
    final result = useState<String>('');

    Future<void> onRun() async {
      loading.value = true;
      try {
        final sendMessage = controller.text;
        // 自分の送信内容を履歴に保存
        history.value.add(
          RecommendHistoryModel(isMe: true, message: sendMessage),
        );
        controller.clear();
        final extract = ref.read(extractQueryUseCaseProvider);
        final q = await extract(sendMessage);
        final recommend = ref.read(recommendUseCaseStreamProvider);
        final stream = recommend.recommend(q, history.value);
        // 相手の返信内容を履歴に保存
        await for (final response in stream) {
          result.value += response;
        }
        history.value.add(
          RecommendHistoryModel(isMe: false, message: result.value),
        );
      } catch (e) {
        errorHandler.call(e);
      } finally {
        loading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('キャンプ場の提案')),
      body: Container(
        padding: const EdgeInsets.only(bottom: 72),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            // 履歴
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: history.value.length > 1
                  ? history.value.length - 1
                  : history.value.length,
              itemBuilder: (ctx, i) {
                if (i == 0) {
                  return _MyTextDisplay(message: history.value[i].message);
                }
                if (i == history.value.length - 1) {
                  return null;
                }
                if (history.value[i].isMe) {
                  return _MyTextDisplay(message: history.value[i].message);
                } else {
                  return _YourTextDisplay(message: history.value[i].message);
                }
              },
            ),
            // 最後の返信
            _YourTextDisplay(message: result.value),
          ],
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

/// 相手テキスト

class _YourTextDisplay extends StatelessWidget {
  final String message;

  const _YourTextDisplay({required this.message});

  @override
  Widget build(BuildContext context) {
    return Markdown(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20),
      data: message,
      selectable: true,
      onTapLink: (text, href, title) async {
        if (href != null && await canLaunchUrl(Uri.parse(href))) {
          await launchUrl(
            Uri.parse(href),
            mode: LaunchMode.externalApplication,
          );
        }
      },
    );
  }
}

/// 自分テキスト
class _MyTextDisplay extends StatelessWidget {
  final String message;

  const _MyTextDisplay({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Markdown(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        data: message,
        selectable: true,
        onTapLink: (text, href, title) async {
          if (href != null && await canLaunchUrl(Uri.parse(href))) {
            await launchUrl(
              Uri.parse(href),
              mode: LaunchMode.externalApplication,
            );
          }
        },
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
              ? Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(),
                  ),
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
