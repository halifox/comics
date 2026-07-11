import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';

import 'home_feed_widgets.dart';

final homeProvider = FutureProvider<HomeResultDto>((ref) async {
  return ref.watch(comicsApiProvider).homeIndex2();
});

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider);
    final titleController = useGlassLargeTitleController();

    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      topEdgeFade: true,
      bottomEdgeFade: true,
      topEdgeFadeExtent: 64,
      bottomEdgeFadeExtent: 64,
      headerScrollController: titleController.scrollController,
      body: CustomScrollView(
        controller: titleController.scrollController,
        key: const PageStorageKey<String>('home-scroll'),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: '首页',
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.paddingOf(context).top + 16,
              16,
              8,
            ),
          ),
          home.when(
            data: (data) => HomeFeedContent(data: data),
            loading: () => const ContentStateSliver.loading(),
            error: (error, _) => ContentStateSliver.error(error),
          ),
        ],
      ),
    );
  }
}
