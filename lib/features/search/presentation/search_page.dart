import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/search/presentation/search_results_page.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

final searchHistoryProvider = StreamProvider<List<String>>((ref) {
  return ref.watch(libraryDatabaseProvider).watchSearchHistory();
});

class SearchPage extends HookConsumerWidget {
  const SearchPage({required this.fieldFocused, super.key});

  final bool fieldFocused;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: fieldFocused
            ? SearchHistory(titleController: titleController)
            : SearchCategoryGrid(titleController: titleController),
      ),
    );
  }
}

class SearchCategoryGrid extends StatelessWidget {
  const SearchCategoryGrid({required this.titleController});

  final GlassLargeTitleController titleController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: titleController.scrollController,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        GlassLargeTitle(
          text: '搜索',
          controller: titleController,
          padding: EdgeInsets.fromLTRB(
            16,
            MediaQuery.paddingOf(context).top + 16,
            16,
            8,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.65,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ComicCategoryCard(
                name: comicCategories[index].name,
                slug: comicCategories[index].slug,
                color: comicCategoryColor(
                  context: context,
                  seed: comicCategories[index].slug,
                ),
              ),
              childCount: comicCategories.length,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchHistory extends ConsumerWidget {
  const SearchHistory({required this.titleController});

  final GlassLargeTitleController titleController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(searchHistoryProvider).value ?? const [];
    final keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    return CustomScrollView(
      controller: titleController.scrollController,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        GlassLargeTitle(
          text: '搜索',
          controller: titleController,
          padding: EdgeInsets.fromLTRB(
            24,
            MediaQuery.paddingOf(context).top + 16,
            24,
            8,
          ),
        ),
        if (history.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(bottom: keyboardHeight + 50),
              child: const SearchHistoryEmptyState(),
            ),
          )
        else
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                18,
                16,
                18,
                MediaQuery.paddingOf(context).bottom + keyboardHeight + 72,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GlassGroupedSection(
                  margin: EdgeInsets.zero,
                  shape: const LiquidRoundedSuperellipse(borderRadius: 28),
                  children: [
                    for (final query in history.reversed)
                      GlassListTile(
                        title: Text(
                          query,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        contentPadding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                          left: 26,
                          right: 6,
                        ),
                        titleStyle: TextStyle(
                          color: CupertinoColors.label.resolveFrom(context),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          ref
                              .read(libraryDatabaseProvider)
                              .recordSearch(query: query);
                          Navigator.of(context).push(
                            CupertinoPageRoute<void>(
                              builder: (routeContext) =>
                                  SearchResultsPage(query: query),
                            ),
                          );
                        },
                        trailing: Semantics(
                          button: true,
                          label: '删除搜索记录：$query',
                          child: GlassIconButton(
                            icon: const Icon(
                              CupertinoIcons.trash,
                              color: CupertinoColors.systemRed,
                            ),
                            onPressed: () => ref
                                .read(libraryDatabaseProvider)
                                .removeSearch(query: query),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class SearchHistoryEmptyState extends StatelessWidget {
  const SearchHistoryEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.search,
            size: 64,
            color: CupertinoColors.tertiaryLabel.resolveFrom(context),
          ),
          const SizedBox(height: 16),
          Text(
            '暂无最近搜索',
            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '你的最近搜索记录会显示在这里。',
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class ComicCategoryData {
  const ComicCategoryData({required this.name, required this.slug});

  final String name;
  final String slug;
}

const comicCategories = [
  ComicCategoryData(name: '爱情', slug: 'aiqing'),
  ComicCategoryData(name: '热血', slug: 'rexue'),
  ComicCategoryData(name: '搞笑', slug: 'gaoxiao'),
  ComicCategoryData(name: '冒险', slug: 'maoxian'),
  ComicCategoryData(name: '奇幻', slug: 'qihuan'),
  ComicCategoryData(name: '校园', slug: 'xiaoyuan'),
  ComicCategoryData(name: '都市', slug: 'dushi'),
  ComicCategoryData(name: '异世界', slug: 'yishijie'),
  ComicCategoryData(name: '穿越', slug: 'chuanyue'),
  ComicCategoryData(name: '重生', slug: 'chongsheng'),
  ComicCategoryData(name: '后宫', slug: 'hougong'),
  ComicCategoryData(name: '悬疑', slug: 'xuanyi'),
  ComicCategoryData(name: '恐怖', slug: 'kongbu'),
  ComicCategoryData(name: '惊悚', slug: 'jingsong'),
  ComicCategoryData(name: '科幻', slug: 'kehuan'),
  ComicCategoryData(name: '格斗', slug: 'gedou'),
  ComicCategoryData(name: '竞技', slug: 'jingji'),
  ComicCategoryData(name: '武侠', slug: 'wuxia'),
  ComicCategoryData(name: '仙侠', slug: 'xianxia'),
  ComicCategoryData(name: '魔幻', slug: 'mohuan'),
  ComicCategoryData(name: '神鬼', slug: 'shengui'),
  ComicCategoryData(name: '转生', slug: 'zhuansheng'),
  ComicCategoryData(name: '生活', slug: 'shenghuo'),
  ComicCategoryData(name: '欢乐向', slug: 'huanlexiang'),
  ComicCategoryData(name: '治愈', slug: 'zhiyu'),
  ComicCategoryData(name: '美食', slug: 'meishi'),
  ComicCategoryData(name: '职场', slug: 'zhichang'),
  ComicCategoryData(name: '历史', slug: 'lishi'),
  ComicCategoryData(name: '战争', slug: 'zhanzheng'),
  ComicCategoryData(name: '机战', slug: 'jizhan'),
  ComicCategoryData(name: '侦探', slug: 'zhentan'),
  ComicCategoryData(name: '励志', slug: 'lizhi'),
  ComicCategoryData(name: '音乐舞蹈', slug: 'yinyuewudao'),
  ComicCategoryData(name: '百合', slug: 'baihe'),
  ComicCategoryData(name: '耽美', slug: 'danmei'),
  ComicCategoryData(name: '萌系', slug: 'mengxi'),
  ComicCategoryData(name: '轻小说', slug: 'qingxiaoshuo'),
  ComicCategoryData(name: '东方', slug: 'dongfang'),
  ComicCategoryData(name: '彩色', slug: 'COLOR'),
  ComicCategoryData(name: '长条', slug: 'changtiao'),
  ComicCategoryData(name: '四格', slug: 'sige'),
  ComicCategoryData(name: '舰娘', slug: 'jianniang'),
  ComicCategoryData(name: '伪娘', slug: 'weiniang'),
  ComicCategoryData(name: '性转换', slug: 'xingzhuanhuan'),
  ComicCategoryData(name: '生存', slug: 'shengcun'),
  ComicCategoryData(name: '宅系', slug: 'zhaixi'),
  ComicCategoryData(name: '节操', slug: 'jiecao'),
  ComicCategoryData(name: 'FATE', slug: 'fate'),
  ComicCategoryData(name: 'LoveLive', slug: 'loveLive'),
  ComicCategoryData(name: 'TL', slug: 'teenslove'),
  ComicCategoryData(name: 'AA', slug: 'aa'),
  ComicCategoryData(name: '无修正', slug: 'Uncensored'),
  ComicCategoryData(name: 'C101', slug: 'comiket101'),
  ComicCategoryData(name: 'C100', slug: 'comiket100'),
  ComicCategoryData(name: 'C99', slug: 'comiket99'),
  ComicCategoryData(name: 'C98', slug: 'C98'),
  ComicCategoryData(name: 'C97', slug: 'comiket97'),
  ComicCategoryData(name: 'C96', slug: 'comiket96'),
  ComicCategoryData(name: 'C95', slug: 'comiket95'),
  ComicCategoryData(name: '其他', slug: 'qita'),
];

Color comicCategoryColor({
  required BuildContext context,
  required String seed,
}) {
  var hash = 0x811C9DC5;
  for (final codeUnit in seed.codeUnits) {
    hash ^= codeUnit;
    hash = (hash * 0x01000193) & 0xFFFFFFFF;
  }

  final hue = (hash * 0.618033988749895 * 360) % 360;
  return CupertinoDynamicColor.withBrightness(
    color: HSLColor.fromAHSL(1, hue, .58, .74).toColor(),
    darkColor: HSLColor.fromAHSL(1, hue, .58, .74).toColor(),
    // darkColor: HSLColor.fromAHSL(1, hue, .52, .3).toColor(),
  ).resolveFrom(context);
}

class ComicCategoryCard extends StatelessWidget {
  const ComicCategoryCard({
    required this.name,
    required this.slug,
    required this.color,
  });

  final String name;
  final String slug;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (_) => ComicCatalogPage(title: name, theme: slug),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: color,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 8),
          child: GlassContainer(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            child: Text(
              name,
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
