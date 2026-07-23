import 'package:comics/features/discovery/presentation/home_page.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/library/presentation/comic_library_page.dart';
import 'package:comics/features/ranking/domain/comic_ranking_period.dart';
import 'package:comics/features/ranking/presentation/comic_ranking_page.dart';
import 'package:comics/features/search/presentation/search_page.dart';
import 'package:comics/features/search/presentation/search_results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

enum MainNavigationTab {
  home(
    label: '首页',
    icon: CupertinoIcons.house,
    activeIcon: CupertinoIcons.house_fill,
  ),
  ranking(
    label: '排行',
    icon: CupertinoIcons.chart_bar,
    activeIcon: CupertinoIcons.chart_bar_fill,
    glowColor: const Color(0xFF8B5CF6),
  ),
  library(
    label: '书架',
    icon: CupertinoIcons.book,
    activeIcon: CupertinoIcons.book_fill,
    glowColor: const Color(0xFF5C9AF6),
  );

  const MainNavigationTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.glowColor,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final Color? glowColor;

  Widget buildPage({
    required ComicRankingPeriod rankingPeriod,
    required int rankingScrollResetToken,
    required ValueChanged<ComicRankingPeriod> onRankingPeriodSelected,
  }) => switch (this) {
    MainNavigationTab.home => HomePage(
      onRankingPeriodSelected: onRankingPeriodSelected,
    ),
    MainNavigationTab.ranking => ComicRankingPage(
      initialPeriod: rankingPeriod,
      scrollResetToken: rankingScrollResetToken,
      onPeriodChanged: onRankingPeriodSelected,
    ),
    MainNavigationTab.library => const ComicLibraryPage(),
  };
}

class MainNavigationPage extends HookConsumerWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(MainNavigationTab.home);
    final lastContentTab = useState(MainNavigationTab.home);
    final rankingPeriod = useState(ComicRankingPeriod.day);
    final rankingScrollResetToken = useState(0);
    final isSearching = useState(false);
    final searchFieldFocused = useState(false);
    final searchController = useTextEditingController();
    return Stack(
      children: [
        isSearching.value
            ? SearchPage(
                fieldFocused: searchFieldFocused.value,
                onDismiss: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  isSearching.value = false;
                },
              )
            : selectedTab.value.buildPage(
                rankingPeriod: rankingPeriod.value,
                rankingScrollResetToken: rankingScrollResetToken.value,
                onRankingPeriodSelected: (period) {
                  if (selectedTab.value != MainNavigationTab.ranking) {
                    rankingScrollResetToken.value++;
                  }
                  rankingPeriod.value = period;
                  selectedTab.value = MainNavigationTab.ranking;
                  lastContentTab.value = MainNavigationTab.ranking;
                  isSearching.value = false;
                  searchFieldFocused.value = false;
                },
              ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            top: false,
            child: GlassTabBar.searchable(
              selectedIndex: lastContentTab.value.index,
              isSearchActive: isSearching.value,
              onTabSelected: (value) {
                final tab = MainNavigationTab.values[value];
                selectedTab.value = tab;
                lastContentTab.value = tab;
                isSearching.value = false;
                searchFieldFocused.value = false;
              },
              searchConfig: GlassSearchBarConfig(
                controller: searchController,
                hintText: '搜索漫画',
                autoFocusOnExpand: false,
                showsCancelButton: false,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  final query = value.trim();
                  if (query.isEmpty) {
                    return;
                  }
                  ref.read(libraryDatabaseProvider).recordSearch(query: query);
                  searchController.clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (routeContext) =>
                          SearchResultsPage(query: query),
                    ),
                  );
                },
                onSearchToggle: (active) {
                  if (active) {
                    lastContentTab.value = selectedTab.value;
                    isSearching.value = true;
                  } else {
                    selectedTab.value = lastContentTab.value;
                    isSearching.value = false;
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
              indicatorColor: CupertinoTheme.of(
                context,
              ).primaryColor.withValues(alpha: .18),
              interactionGlowColor: CupertinoTheme.of(context).primaryColor,
              selectedIconColor: CupertinoColors.label.resolveFrom(context),
              unselectedIconColor: CupertinoColors.label.resolveFrom(context),
              tabs: [
                for (final tab in MainNavigationTab.values)
                  GlassTab(
                    icon: Icon(tab.icon),
                    activeIcon: Icon(tab.activeIcon),
                    label: tab.label,
                    glowColor:
                        tab.glowColor ??
                        CupertinoTheme.of(context).primaryColor,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
