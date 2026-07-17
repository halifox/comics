import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/ranking/domain/comic_ranking_period.dart';

import 'home_feed_widgets.dart';
import 'new_release_page.dart';

final homeProvider = FutureProvider<HomeFeedModel>((ref) {
  return ref.watch(comicsRepositoryProvider).getHomeFeed();
});

class HomePage extends HookConsumerWidget {
  const HomePage({required this.onRankingPeriodSelected, super.key});

  final ValueChanged<ComicRankingPeriod> onRankingPeriodSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider);

    void openCatalog({
      required String title,
      ComicCatalogScope initialScope = ComicCatalogScope.all,
      ComicCatalogOrdering initialOrdering =
          ComicCatalogOrdering.updatedDescending,
    }) {
      Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (routeContext) => ComicCatalogPage(
            title: title,
            initialScope: initialScope,
            initialOrdering: initialOrdering,
            showActions: false,
          ),
        ),
      );
    }

    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      topEdgeFade: false,
      bottomEdgeFade: true,
      bottomEdgeFadeExtent: 64,
      body: CustomScrollView(
        key: const PageStorageKey<String>('home-scroll'),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          home.when(
            data: (data) => HomeFeedContent(
              data: data,
              onFinishedTap: () => openCatalog(
                title: '已完结',
                initialScope: ComicCatalogScope.finished,
              ),
              onNewReleaseTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (routeContext) => const NewReleasePage(),
                  ),
                );
              },
              onRankingPeriodSelected: onRankingPeriodSelected,
            ),
            loading: () => const ContentStateSliver.loading(),
            error: (error, stackTrace) => ContentStateSliver.error(
              error: error,
              onRetry: () => ref.invalidate(homeProvider),
            ),
          ),
        ],
      ),
    );
  }
}
