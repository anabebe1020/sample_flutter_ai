import 'package:flutter/material.dart';
import 'package:flutter_ai/core/utils/transition.dart';
import 'package:flutter_ai/features/auth/view/sign_in_page.dart';
import 'package:flutter_ai/features/welcome/model/content.dart';
import 'package:flutter_ai/features/welcome/provider/current_page_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentPage = ref.watch(currentPageProvider);

    useEffect(() {
      void listener() {
        final page = pageController.page?.round();
        if (page != null && page != ref.read(currentPageProvider)) {
          ref.read(currentPageProvider.notifier).state = page;
        }
      }

      pageController.addListener(listener);
      return () => pageController.removeListener(listener);
    }, [pageController]);

    final content = _content;

    return Scaffold(
      body: Stack(
        children: [
          // 背景色をページごとにアニメーション
          TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: content[currentPage].backgroundColor,
              end: content[currentPage].backgroundColor,
            ),
            duration: 400.ms,
            builder: (context, color, _) => Container(color: color),
          ),
          PageView.builder(
            controller: pageController,
            itemCount: content.length,
            itemBuilder: (context, index) {
              return _WelcomeCard(content: content[index], index: index)
                  // 1枚ごとにふわっと入る
                  .animate(key: ValueKey(index))
                  .fadeIn(duration: 450.ms)
                  .slideY(begin: 0.05, end: 0, duration: 450.ms);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                spacing: 12,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // スキップボタン
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: content[currentPage].textColor,
                    ),
                    onPressed: () {
                      push(context, SignInPage(), SignInPage);
                    },
                    child: const Text('スキップ'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      content.length,
                      (index) => _Dot(index: index),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 表示データ（元のリストをそのまま移植）
final List<WelcomeContent> _content = [
  WelcomeContent(
    title: 'プロフィールを設定しよう',
    description: 'キャンプアシスタントもん太があなたにぴったりのキャンププランを提案します！',
    imagePath: 'assets/images/camp_preparation_01.png',
    backgroundColor: Colors.amberAccent,
    textColor: Colors.brown,
  ),
  WelcomeContent(
    title: 'どんなキャンプがしたいか答えてみよう',
    description: 'キャンプ場の雰囲気やアクティビティなど、設問に応えるともん太があなたにぴったりのキャンプ場を提案します！',
    imagePath: 'assets/images/camp_fire_01.png',
    backgroundColor: Colors.green.shade200,
    textColor: Colors.brown,
  ),
  WelcomeContent(
    title: 'もん太と会話してみよう',
    description: 'もん太と会話して、あなたの理想のキャンプを教えてもらいましょう！',
    imagePath: 'assets/images/camp_cook_01.png',
    backgroundColor: Colors.blueGrey.shade200,
    textColor: Colors.brown,
  ),
  WelcomeContent(
    title: 'アプリを使い続けてキャンプをもっと楽しもう',
    description: 'アプリを使い続けると、アプリがあなたのキャンプを学習します。最高のキャンプライフを一緒に楽しみましょう！',
    imagePath: 'assets/images/camp_sleep_01.png',
    backgroundColor: Colors.lightBlueAccent,
    textColor: Colors.brown,
  ),
];

class _WelcomeCard extends HookConsumerWidget {
  const _WelcomeCard({required this.content, required this.index});

  final WelcomeContent content;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final isActive = index == currentPage;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 60.0, 24.0, 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child:
                  Image.asset(
                        content.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade300,
                            child: Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          );
                        },
                      )
                      // アクティブカードはわずかにスケールアップ
                      .animate(target: isActive ? 1 : 0)
                      .scale(
                        begin: const Offset(0.98, 0.98),
                        end: const Offset(1, 1),
                        duration: 300.ms,
                      ),
            ),
          ),
          const SizedBox(height: 24.0),
          // タイトルと説明は段階的に表示
          Column(
            children: [
              Text(
                    content.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.yomogi(
                      textStyle: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: content.textColor,
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 350.ms)
                  .slideY(begin: 0.1, end: 0, duration: 350.ms),
              const SizedBox(height: 12.0),
              Text(
                    content.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: content.textColor.withValues(alpha: 0.8),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 450.ms)
                  .slideY(begin: 0.12, end: 0, duration: 450.ms),
            ],
          ),
          const SizedBox(height: 24.0),
          const Spacer(),
        ],
      ),
    );
  }
}

class _Dot extends HookConsumerWidget {
  const _Dot({required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(currentPageProvider);
    final isActive = current == index;
    final content = _content[current];

    // 幅アニメーション + 色のフェード
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child:
          Container(
                height: 10,
                width: isActive ? 25 : 10,
                decoration: BoxDecoration(
                  color: isActive
                      ? content.textColor.withValues(alpha: 0.8)
                      : Colors.black.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
              )
              .animate(target: isActive ? 1 : 0)
              .tint(
                color: isActive
                    ? content.textColor.withValues(alpha: 0.8)
                    : Colors.black.withValues(alpha: 0.2),
                duration: 250.ms,
              )
              .then()
              .scaleX(begin: 0.9, end: 1, duration: 250.ms),
    );
  }
}
