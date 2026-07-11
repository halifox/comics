import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';

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
            ? EmptySearchHistory(titleController: titleController)
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
                color: comicCategoryColor(context, comicCategories[index].slug),
              ),
              childCount: comicCategories.length,
            ),
          ),
        ),
      ],
    );
  }
}

class EmptySearchHistory extends StatelessWidget {
  const EmptySearchHistory({required this.titleController});

  final GlassLargeTitleController titleController;

  @override
  Widget build(BuildContext context) {
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
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(bottom: keyboardHeight + 50),
            child: Center(
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
                      color: CupertinoColors.secondaryLabel.resolveFrom(
                        context,
                      ),
                      fontSize: 15,
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

class ComicCategoryData {
  const ComicCategoryData(this.name, this.slug);

  final String name;
  final String slug;
}

const comicCategories = [
  ComicCategoryData('爱情', 'aiqing'),
  ComicCategoryData('热血', 'rexue'),
  ComicCategoryData('搞笑', 'gaoxiao'),
  ComicCategoryData('冒险', 'maoxian'),
  ComicCategoryData('奇幻', 'qihuan'),
  ComicCategoryData('校园', 'xiaoyuan'),
  ComicCategoryData('都市', 'dushi'),
  ComicCategoryData('异世界', 'yishijie'),
  ComicCategoryData('穿越', 'chuanyue'),
  ComicCategoryData('重生', 'chongsheng'),
  ComicCategoryData('后宫', 'hougong'),
  ComicCategoryData('悬疑', 'xuanyi'),
  ComicCategoryData('恐怖', 'kongbu'),
  ComicCategoryData('惊悚', 'jingsong'),
  ComicCategoryData('科幻', 'kehuan'),
  ComicCategoryData('格斗', 'gedou'),
  ComicCategoryData('竞技', 'jingji'),
  ComicCategoryData('武侠', 'wuxia'),
  ComicCategoryData('仙侠', 'xianxia'),
  ComicCategoryData('魔幻', 'mohuan'),
  ComicCategoryData('神鬼', 'shengui'),
  ComicCategoryData('转生', 'zhuansheng'),
  ComicCategoryData('生活', 'shenghuo'),
  ComicCategoryData('欢乐向', 'huanlexiang'),
  ComicCategoryData('治愈', 'zhiyu'),
  ComicCategoryData('美食', 'meishi'),
  ComicCategoryData('职场', 'zhichang'),
  ComicCategoryData('历史', 'lishi'),
  ComicCategoryData('战争', 'zhanzheng'),
  ComicCategoryData('机战', 'jizhan'),
  ComicCategoryData('侦探', 'zhentan'),
  ComicCategoryData('励志', 'lizhi'),
  ComicCategoryData('音乐舞蹈', 'yinyuewudao'),
  ComicCategoryData('百合', 'baihe'),
  ComicCategoryData('耽美', 'danmei'),
  ComicCategoryData('萌系', 'mengxi'),
  ComicCategoryData('轻小说', 'qingxiaoshuo'),
  ComicCategoryData('东方', 'dongfang'),
  ComicCategoryData('彩色', 'COLOR'),
  ComicCategoryData('长条', 'changtiao'),
  ComicCategoryData('四格', 'sige'),
  ComicCategoryData('舰娘', 'jianniang'),
  ComicCategoryData('伪娘', 'weiniang'),
  ComicCategoryData('性转换', 'xingzhuanhuan'),
  ComicCategoryData('生存', 'shengcun'),
  ComicCategoryData('宅系', 'zhaixi'),
  ComicCategoryData('节操', 'jiecao'),
  ComicCategoryData('FATE', 'fate'),
  ComicCategoryData('LoveLive', 'loveLive'),
  ComicCategoryData('TL', 'teenslove'),
  ComicCategoryData('AA', 'aa'),
  ComicCategoryData('无修正', 'Uncensored'),
  ComicCategoryData('C101', 'comiket101'),
  ComicCategoryData('C100', 'comiket100'),
  ComicCategoryData('C99', 'comiket99'),
  ComicCategoryData('C98', 'C98'),
  ComicCategoryData('C97', 'comiket97'),
  ComicCategoryData('C96', 'comiket96'),
  ComicCategoryData('C95', 'comiket95'),
  ComicCategoryData('其他', 'qita'),
];

Color comicCategoryColor(BuildContext context, String seed) {
  var hash = 0x811C9DC5;
  for (final codeUnit in seed.codeUnits) {
    hash ^= codeUnit;
    hash = (hash * 0x01000193) & 0xFFFFFFFF;
  }

  final hue = (hash * 0.618033988749895 * 360) % 360;
  return CupertinoDynamicColor.withBrightness(
    color: HSLColor.fromAHSL(1, hue, .58, .74).toColor(),
    darkColor: HSLColor.fromAHSL(1, hue, .52, .3).toColor(),
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
            quality: GlassQuality.minimal,
            useOwnLayer: true,
            child: Text(
              name,
              style: TextStyle(
                color: CupertinoColors.white,
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
