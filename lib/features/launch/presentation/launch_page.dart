import 'dart:async';

import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/navigation/presentation/main_navigation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

final launchProvider = FutureProvider((ref) async {});

class LaunchPage extends HookConsumerWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final timer = Timer(const Duration(seconds: 1), () {
        if (!context.mounted) return;

        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (_) => const MainNavigationPage()),
        );
      });

      return timer.cancel;
    }, const []);

    final state = ref.watch(launchProvider);
    return GlassScaffold(
      body: CustomScrollView(
        slivers: [
          state.when(
            data: (_) => const ContentStateSliver.empty(
              icon: CupertinoIcons.book,
              title: '欢迎回来',
              message: '发现喜欢的漫画，收藏并继续你的阅读旅程',
            ),
            error: (error, stackTrace) => ContentStateSliver.error(
              error: error,
              onRetry: () => ref.invalidate(launchProvider),
            ),
            loading: () => const ContentStateSliver.loading(),
          ),
        ],
      ),
    );
  }
}
