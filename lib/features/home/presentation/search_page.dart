import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme_comics_page.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({required this.fieldFocused, super.key});

  final bool fieldFocused;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: fieldFocused
            ? const _NoRecentSearches(key: ValueKey('no-recent'))
            : const _SearchBrowseView(key: ValueKey('search-browse')),
      ),
    );
  }
}

class _SearchBrowseView extends StatelessWidget {
  const _SearchBrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            child: Text(
              '搜索',
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontSize: 34,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.6,
              ),
            ),
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
              (context, index) => _BrowseCategory(
                name: _browseCategories[index].name,
                slug: _browseCategories[index].slug,
                color: _categoryColor(context, _browseCategories[index].slug),
              ),
              childCount: _browseCategories.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _NoRecentSearches extends StatelessWidget {
  const _NoRecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    return Container(
      color: CupertinoDynamicColor.withBrightness(
        color: const Color(0xFFF2F2F7),
        darkColor: const Color(0xFF000000),
      ).resolveFrom(context),
      child: SafeArea(
        bottom: false,
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
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Category {
  const _Category(this.name, this.slug);

  final String name;
  final String slug;
}

const _browseCategories = [
  _Category('爱情', 'aiqing'),
  _Category('热血', 'rexue'),
  _Category('搞笑', 'gaoxiao'),
  _Category('冒险', 'maoxian'),
  _Category('奇幻', 'qihuan'),
  _Category('校园', 'xiaoyuan'),
  _Category('都市', 'dushi'),
  _Category('异世界', 'yishijie'),
  _Category('穿越', 'chuanyue'),
  _Category('重生', 'chongsheng'),
  _Category('后宫', 'hougong'),
  _Category('悬疑', 'xuanyi'),
  _Category('恐怖', 'kongbu'),
  _Category('惊悚', 'jingsong'),
  _Category('科幻', 'kehuan'),
  _Category('格斗', 'gedou'),
  _Category('竞技', 'jingji'),
  _Category('武侠', 'wuxia'),
  _Category('仙侠', 'xianxia'),
  _Category('魔幻', 'mohuan'),
  _Category('神鬼', 'shengui'),
  _Category('转生', 'zhuansheng'),
  _Category('生活', 'shenghuo'),
  _Category('欢乐向', 'huanlexiang'),
  _Category('治愈', 'zhiyu'),
  _Category('美食', 'meishi'),
  _Category('职场', 'zhichang'),
  _Category('历史', 'lishi'),
  _Category('战争', 'zhanzheng'),
  _Category('机战', 'jizhan'),
  _Category('侦探', 'zhentan'),
  _Category('励志', 'lizhi'),
  _Category('音乐舞蹈', 'yinyuewudao'),
  _Category('百合', 'baihe'),
  _Category('耽美', 'danmei'),
  _Category('萌系', 'mengxi'),
  _Category('轻小说', 'qingxiaoshuo'),
  _Category('东方', 'dongfang'),
  _Category('彩色', 'COLOR'),
  _Category('长条', 'changtiao'),
  _Category('四格', 'sige'),
  _Category('舰娘', 'jianniang'),
  _Category('伪娘', 'weiniang'),
  _Category('性转换', 'xingzhuanhuan'),
  _Category('生存', 'shengcun'),
  _Category('宅系', 'zhaixi'),
  _Category('节操', 'jiecao'),
  _Category('FATE', 'fate'),
  _Category('LoveLive', 'loveLive'),
  _Category('TL', 'teenslove'),
  _Category('AA', 'aa'),
  _Category('无修正', 'Uncensored'),
  _Category('C101', 'comiket101'),
  _Category('C100', 'comiket100'),
  _Category('C99', 'comiket99'),
  _Category('C98', 'C98'),
  _Category('C97', 'comiket97'),
  _Category('C96', 'comiket96'),
  _Category('C95', 'comiket95'),
  _Category('其他', 'qita'),
];

Color _categoryColor(BuildContext context, String seed) {
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

class _BrowseCategory extends StatelessWidget {
  const _BrowseCategory({
    required this.name,
    required this.slug,
    required this.color,
  });

  final String name;
  final String slug;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '$name分类',
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          CupertinoPageRoute<void>(
            builder: (_) => ThemeComicsPage(title: name, themeSlug: slug),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: color,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(12),
            child: Text(
              name,
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
