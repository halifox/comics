import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/ranking/domain/comic_ranking_period.dart';
import 'package:comics/shared/presentation/widgets/cupertino_paging_sliver_view.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';

enum ComicRankingAudience {
  male(value: 'male', label: '男频'),
  female(value: 'female', label: '女频');

  const ComicRankingAudience({required this.value, required this.label});

  final String value;
  final String label;
}

typedef ComicRankingFilter = ({
  ComicRankingAudience audience,
  ComicRankingPeriod period,
});

final rankingProvider =
    AsyncNotifierProvider.family<
      ComicRankingNotifier,
      PagePagingData<RankedComicDto>,
      ComicRankingFilter
    >(ComicRankingNotifier.new);

class ComicRankingNotifier extends AsyncNotifier<PagePagingData<RankedComicDto>>
    with PagePagingNotifierMixin<RankedComicDto> {
  ComicRankingNotifier(this.filter);

  static const pageSize = 18;

  final ComicRankingFilter filter;

  @override
  Future<PagePagingData<RankedComicDto>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<RankedComicDto>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;
    final result = await ref
        .read(comicsApiProvider)
        .ranks(
          limit: pageSize,
          offset: offset,
          type: 1,
          audienceType: filter.audience.value,
          dateType: filter.period.value,
        );

    return PagePagingData(
      items: result.list,
      hasMore: offset + result.list.length < result.total,
      page: page,
    );
  }
}

class ComicRankingPage extends HookConsumerWidget {
  const ComicRankingPage({
    required this.onPeriodChanged,
    this.initialPeriod = ComicRankingPeriod.day,
    this.scrollResetToken = 0,
    super.key,
  });

  final ComicRankingPeriod initialPeriod;
  final int scrollResetToken;
  final ValueChanged<ComicRankingPeriod> onPeriodChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audience = useState(ComicRankingAudience.male);
    final period = useState(initialPeriod);
    final filter = (audience: audience.value, period: period.value);
    final provider = rankingProvider(filter);
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
      header: GlassAppBar(
        actions: [
          Semantics(
            button: true,
            label: '排行周期，当前${period.value.label}',
            child: GlassPullDownButton(
              icon: const Icon(CupertinoIcons.calendar),
              menuWidth: 220,
              menuAlignment: GlassMenuAlignment.topRight,
              quality: GlassQuality.minimal,
              items: [
                for (final option in ComicRankingPeriod.values)
                  GlassMenuItem(
                    title: option.label,
                    isSelected: period.value == option,
                    trailing: period.value == option
                        ? const Icon(CupertinoIcons.checkmark, size: 18)
                        : null,
                    onTap: () {
                      period.value = option;
                      onPeriodChanged(option);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),

      body: CustomScrollView(
        controller: titleController.scrollController,
        key: PageStorageKey<String>('ranking-scroll-$scrollResetToken'),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: '排行',
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.paddingOf(context).top + 16,
              16,
              8,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
              child: GlassSegmentedControl(
                segments: [
                  for (final option in ComicRankingAudience.values)
                    GlassSegment(label: option.label),
                ],
                selectedIndex: audience.value.index,
                onSegmentSelected: (index) {
                  audience.value = ComicRankingAudience.values[index];
                },
                useOwnLayer: true,
                quality: .premium,
              ),
            ),
          ),
          CupertinoPagingSliverView(
            state: ref.watch(provider),
            onLoadNext: () => ref.read(provider.notifier).loadNext(),
            onRetry: () => ref.read(provider.notifier).forceRefresh(),
            contentBuilder: (data, widgetCount, endItemView) {
              if (data.items.isEmpty) {
                return const ContentStateSliver.empty(
                  icon: CupertinoIcons.chart_bar,
                  title: '暂无排行',
                  message: '这个榜单暂时没有可显示的作品',
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 120),
                sliver: SliverGrid.builder(
                  itemCount: widgetCount,
                  itemBuilder: (context, index) {
                    if (index == widgetCount - 1) {
                      return endItemView;
                    }

                    final item = data.items[index];
                    final comic = item.comic;
                    return ComicCoverCard(
                      cover: comic.cover,
                      name: comic.name,
                      author: comic.authors.map((e) => e.name).join(','),
                      badge: '#${item.sort}',
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (routeContext) => ComicDetailPage(
                              comicId: comic.pathWord,
                              name: comic.name,
                              cover: comic.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 328 / 422.0,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
