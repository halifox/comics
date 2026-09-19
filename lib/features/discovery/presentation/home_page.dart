import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/copy_manga/copy_manga_api.dart';
import 'package:comics/features/ranking/presentation/comic_ranking_period.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'home_feed_widgets.dart';
import 'new_release_page.dart';

final homeProvider = FutureProvider(
  (ref) => ref.watch(comicsApiProvider).homeIndex2(),
);

class HomePage extends HookConsumerWidget {
  const HomePage({required this.onRankingPeriodSelected, super.key});

  final ValueChanged<ComicRankingPeriod> onRankingPeriodSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      topEdgeFade: false,
      bottomEdgeFade: true,
      bottomEdgeFadeExtent: 64,
      body: CustomScrollView(
        key: const PageStorageKey('home-scroll'),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          ref
              .watch(homeProvider)
              .when(
                data: (data) => HomeFeedContent(
                  data: data,
                  onFinishedTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (routeContext) => const ComicCatalogPage(
                          title: '已完结',
                          initialScope: ComicCatalogScope.finished,
                          initialOrdering:
                              ComicCatalogOrdering.updatedDescending,
                          showActions: false,
                        ),
                      ),
                    );
                  },
                  onNewReleaseTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
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
