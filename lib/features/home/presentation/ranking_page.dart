import 'package:comics/AmbientGlowBackground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../application/home_provider.dart';
import 'comic_detail_page.dart';
import 'home_sections.dart';
import 'large_title_helpers.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audienceIndex = useState(0);
    final dateIndex = useState(0);
    const audienceValues = ['male', 'female'];
    const dateValues = ['day', 'week', 'month', 'total'];
    final filter = (
      audienceType: audienceValues[audienceIndex.value],
      dateType: dateValues[dateIndex.value],
    );
    final ranking = ref.watch(rankingProvider(filter));
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
          GlassPullDownButton(
            icon: const Icon(CupertinoIcons.calendar),
            menuWidth: 220,
            menuAlignment: GlassMenuAlignment.topRight,
            quality: GlassQuality.minimal,
            items: [
              GlassMenuItem(
                title: '日榜',
                isSelected: dateIndex.value == 0,
                trailing: dateIndex.value == 0
                    ? const Icon(CupertinoIcons.checkmark, size: 18)
                    : null,
                onTap: () => dateIndex.value = 0,
              ),
              GlassMenuItem(
                title: '周榜',
                isSelected: dateIndex.value == 1,
                trailing: dateIndex.value == 1
                    ? const Icon(CupertinoIcons.checkmark, size: 18)
                    : null,
                onTap: () => dateIndex.value = 1,
              ),
              GlassMenuItem(
                title: '月榜',
                isSelected: dateIndex.value == 2,
                trailing: dateIndex.value == 2
                    ? const Icon(CupertinoIcons.checkmark, size: 18)
                    : null,
                onTap: () => dateIndex.value = 2,
              ),
              GlassMenuItem(
                title: '总榜',
                isSelected: dateIndex.value == 3,
                trailing: dateIndex.value == 3
                    ? const Icon(CupertinoIcons.checkmark, size: 18)
                    : null,
                onTap: () => dateIndex.value = 3,
              ),
            ],
          ),
        ],
      ),

      body: CustomScrollView(
        controller: titleController.scrollController,
        key: const PageStorageKey<String>('ranking-scroll'),
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
                segments: const [
                  GlassSegment(label: '男频'),
                  GlassSegment(label: '女频'),
                ],
                selectedIndex: audienceIndex.value,
                onSegmentSelected: (index) => audienceIndex.value = index,
                useOwnLayer: true,
                quality: .premium,
              ),
            ),
          ),
          ranking.when(
            loading: () => const HomeStateView.loading(),
            error: (error, _) => HomeStateView.error(error),
            data: (data) => SliverPadding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 120),
              sliver: SliverGrid.builder(
                itemCount: data.list.length,
                itemBuilder: (context, index) {
                  final item = data.list[index];
                  final comic = item.comic;
                  return ComicCoverCard(
                    cover: comic.cover,
                    name: comic.name,
                    author: comic.authors.map((e) => e.name).join(','),
                    badge: '#${item.sort}',
                    onTap: () {
                      final comicId = comic.pathWord;
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => ComicDetailPage(
                            comicId: comicId,
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
            ),
          ),
        ],
      ),
    );
  }
}
