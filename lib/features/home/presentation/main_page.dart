import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../../app/app_theme.dart';
import 'home_page.dart';
import 'library_page.dart';
import 'ranking_page.dart';
import 'search_page.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(0);
    final lastContentTab = useState(0);
    final searchFieldFocused = useState(false);

    return Stack(
      children: [
        switch (selectedTab.value) {
          -1 => SearchPage(fieldFocused: searchFieldFocused.value),
          0 => const HomePage(),
          1 => const RankingPage(),
          2 => const LibraryPage(),
          _ => const SizedBox.shrink(),
        },
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.viewInsetsOf(context).bottom,
          child: SafeArea(
            top: false,
            child: GlassTabBar.searchable(
              selectedIndex: lastContentTab.value,
              isSearchActive: selectedTab.value == -1,
              onTabSelected: (value) {
                selectedTab.value = value;
                lastContentTab.value = value;
                searchFieldFocused.value = false;
              },
              searchConfig: GlassSearchBarConfig(
                hintText: '搜索漫画',
                autoFocusOnExpand: false,
                showsCancelButton: true,
                textInputAction: TextInputAction.search,
                onSearchToggle: (active) {
                  if (active) {
                    if (selectedTab.value >= 0) {
                      lastContentTab.value = selectedTab.value;
                    }
                    selectedTab.value = -1;
                  } else {
                    selectedTab.value = lastContentTab.value;
                    searchFieldFocused.value = false;
                  }
                },
                onSearchFocusChanged: (focused) {
                  searchFieldFocused.value = focused;
                },
              ),
              barHeight: 62,
              searchBarHeight: 52,
              verticalPadding: 12,
              horizontalPadding: 18,
              indicatorColor: CopyColors.accent.withValues(alpha: .18),
              interactionGlowColor: CopyColors.accent,
              tabs: const [
                GlassTab(
                  icon: Icon(CupertinoIcons.house),
                  activeIcon: Icon(CupertinoIcons.house_fill),
                  label: '首页',
                  glowColor: CopyColors.accent,
                ),
                GlassTab(
                  icon: Icon(CupertinoIcons.chart_bar),
                  activeIcon: Icon(CupertinoIcons.chart_bar_fill),
                  label: '排行',
                  glowColor: CopyColors.violet,
                ),
                GlassTab(
                  icon: Icon(CupertinoIcons.book),
                  activeIcon: Icon(CupertinoIcons.book_fill),
                  label: '书架',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
