import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../../copy_manga/copy_manga.dart';
import '../application/home_provider.dart';
import 'home_sections.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audienceIndex = useState(0);
    final dateIndex = useState(3);
    const audienceValues = <String?>[null, 'male', 'female'];
    const dateValues = ['day', 'week', 'month', 'total'];
    final filter = (
      audienceType: audienceValues[audienceIndex.value],
      dateType: dateValues[dateIndex.value],
    );
    final ranking = ref.watch(rankingProvider(filter));

    return CustomScrollView(
      key: const PageStorageKey<String>('ranking-scroll'),
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.paddingOf(context).top + 12,
              16,
              20,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '排行',
                    style: TextStyle(
                      color: CupertinoColors.label.resolveFrom(context),
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.6,
                    ),
                  ),
                ),
                GlassPullDownButton(
                  icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
                  menuWidth: 220,
                  menuAlignment: GlassMenuAlignment.topRight,
                  quality: GlassQuality.premium,
                  items: [
                    GlassMenuItem(
                      title: '全部',
                      icon: const Icon(CupertinoIcons.square_grid_2x2),
                      isSelected: audienceIndex.value == 0,
                      trailing: audienceIndex.value == 0
                          ? const Icon(CupertinoIcons.checkmark, size: 18)
                          : null,
                      onTap: () => audienceIndex.value = 0,
                    ),
                    GlassMenuItem(
                      title: '男频',
                      icon: const Icon(CupertinoIcons.person),
                      isSelected: audienceIndex.value == 1,
                      trailing: audienceIndex.value == 1
                          ? const Icon(CupertinoIcons.checkmark, size: 18)
                          : null,
                      onTap: () => audienceIndex.value = 1,
                    ),
                    GlassMenuItem(
                      title: '女频',
                      icon: const Icon(CupertinoIcons.person_2),
                      isSelected: audienceIndex.value == 2,
                      trailing: audienceIndex.value == 2
                          ? const Icon(CupertinoIcons.checkmark, size: 18)
                          : null,
                      onTap: () => audienceIndex.value = 2,
                    ),
                    const GlassMenuDivider(),
                    GlassMenuItem(
                      title: '日榜',
                      icon: const Icon(CupertinoIcons.arrow_up_right),
                      isSelected: dateIndex.value == 0,
                      trailing: dateIndex.value == 0
                          ? const Icon(CupertinoIcons.checkmark, size: 18)
                          : null,
                      onTap: () => dateIndex.value = 0,
                    ),
                    GlassMenuItem(
                      title: '周榜',
                      icon: const Icon(CupertinoIcons.calendar),
                      isSelected: dateIndex.value == 1,
                      trailing: dateIndex.value == 1
                          ? const Icon(CupertinoIcons.checkmark, size: 18)
                          : null,
                      onTap: () => dateIndex.value = 1,
                    ),
                    GlassMenuItem(
                      title: '月榜',
                      icon: const Icon(CupertinoIcons.calendar_circle),
                      isSelected: dateIndex.value == 2,
                      trailing: dateIndex.value == 2
                          ? const Icon(CupertinoIcons.checkmark, size: 18)
                          : null,
                      onTap: () => dateIndex.value = 2,
                    ),
                    GlassMenuItem(
                      title: '总榜',
                      icon: const Icon(CupertinoIcons.chart_bar),
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
          ),
        ),
        ranking.when(
          loading: () => const SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(bottom: 120),
              child: HomeLoadingView(),
            ),
          ),
          error: (error, _) => SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: HomeErrorView(
                message: error.toString(),
                onRetry: () => ref.invalidate(rankingProvider(filter)),
              ),
            ),
          ),
          data: (data) => SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 120),
            sliver: SliverList.separated(
              itemCount: data.list.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = data.list[index];
                return _ComicRow(comic: item.comic, leading: '${item.sort}');
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ComicRow extends StatelessWidget {
  const _ComicRow({required this.comic, required this.leading});

  final ComicDto comic;
  final String leading;

  @override
  Widget build(BuildContext context) {
    final author = comic.authors.map((e) => e.name).join(' · ');

    return SizedBox(
      height: 230,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: comic.cover,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorWidget: (_, _, _) => ColoredBox(
                color: CupertinoColors.systemFill.resolveFrom(context),
                child: const Icon(CupertinoIcons.book, size: 42),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, .55, 1],
                  colors: [
                    Color(0x00000000),
                    Color(0x12000000),
                    Color(0x5F000000),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: GlassContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 9,
                ),
                shape: const LiquidRoundedSuperellipse(borderRadius: 12),
                quality: GlassQuality.standard,
                useOwnLayer: true,
                child: Text(
                  '#$leading',
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 17,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -.25,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              right: 4,
              bottom: 4,
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: GlassContainer(
                      height: 44,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 0,
                        top: 0,
                      ),
                      shape: const LiquidRoundedSuperellipse(borderRadius: 26),
                      quality: GlassQuality.standard,
                      useOwnLayer: true,
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            comic.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                              shadows: [
                                Shadow(
                                  color: Color(0x66000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: CupertinoColors.white.withValues(
                                alpha: .9,
                              ),
                              fontSize: 13,
                              letterSpacing: 0,
                              shadows: const [
                                Shadow(
                                  color: Color(0x55000000),
                                  blurRadius: 6,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GlassIconButton(
                    icon: Icon(
                      CupertinoIcons.chevron_right,
                      color: CupertinoDynamicColor.resolve(
                        CupertinoColors.systemGrey6,
                        context,
                      ),
                    ),
                    quality: GlassQuality.premium,
                    useOwnLayer: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
