import 'package:comics/features/discovery/presentation/home_page.dart';
import 'package:comics/features/library/data/library_database.dart' hide SearchHistory;
import 'package:comics/features/library/presentation/comic_library_page.dart';
import 'package:comics/features/ranking/domain/comic_ranking_period.dart';
import 'package:comics/features/ranking/presentation/comic_ranking_page.dart';
import 'package:comics/features/search/presentation/search_page.dart';
import 'package:comics/features/search/presentation/search_results_page.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class MainNavigationPage extends HookConsumerWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final lastContentIndex = useState(0);
    final rankingPeriod = useState(ComicRankingPeriod.day);
    final rankingScrollResetToken = useState(0);
    final searchController = useTextEditingController();
    final searchTitleController = useGlassLargeTitleController();
    return Stack(
      children: [
        switch (selectedIndex.value) {
          0 => HomePage(
            onRankingPeriodSelected: (period) {
              rankingScrollResetToken.value++;
              rankingPeriod.value = period;
              selectedIndex.value = 1;
              lastContentIndex.value = 1;
            },
          ),
          1 => ComicRankingPage(
            initialPeriod: rankingPeriod.value,
            scrollResetToken: rankingScrollResetToken.value,
            onPeriodChanged: (period) {
              rankingPeriod.value = period;
              selectedIndex.value = 1;
              lastContentIndex.value = 1;
            },
          ),
          2 => const ComicLibraryPage(),
          4 => SearchPage(
            titleController: searchTitleController,
            onDismiss: () {
              FocusManager.instance.primaryFocus?.unfocus();
              selectedIndex.value = lastContentIndex.value;
            },
            child: SearchCategoryGrid(titleController: searchTitleController),
          ),
          5 => SearchPage(
            titleController: searchTitleController,
            onDismiss: () {
              FocusManager.instance.primaryFocus?.unfocus();
              selectedIndex.value = lastContentIndex.value;
            },
            child: SearchHistory(titleController: searchTitleController),
          ),
          _ => const SizedBox.shrink(),
        },
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            top: false,
            child: GlassTabBar.searchable(
              selectedIndex: lastContentIndex.value,
              isSearchActive: selectedIndex.value == 4 || selectedIndex.value == 5,
              onTabSelected: (value) {
                selectedIndex.value = value;
                lastContentIndex.value = value;
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
                  Navigator.of(
                    context,
                  ).push(CupertinoPageRoute<void>(builder: (routeContext) => SearchResultsPage(query: query)));
                },
                onSearchToggle: (active) {
                  if (active) {
                    if (selectedIndex.value < 3) {
                      lastContentIndex.value = selectedIndex.value;
                    }
                    selectedIndex.value = 4;
                  } else {
                    selectedIndex.value = lastContentIndex.value;
                  }
                },
                onSearchFocusChanged: (focused) {
                  if (selectedIndex.value == 4 || selectedIndex.value == 5) {
                    selectedIndex.value = focused ? 5 : 4;
                  }
                },
              ),
              barHeight: 62,
              searchBarHeight: 52,
              verticalPadding: 12,
              horizontalPadding: 18,
              indicatorColor: CupertinoTheme.of(context).primaryColor.withValues(alpha: .18),
              interactionGlowColor: CupertinoTheme.of(context).primaryColor,
              selectedIconColor: CupertinoColors.label.resolveFrom(context),
              unselectedIconColor: CupertinoColors.label.resolveFrom(context),
              tabs: [
                const GlassTab(
                  icon: Icon(CupertinoIcons.house),
                  activeIcon: Icon(CupertinoIcons.house_fill),
                  label: '首页',
                  glowColor: Color(0xFFFF5A5F),
                ),
                const GlassTab(
                  icon: Icon(CupertinoIcons.chart_bar),
                  activeIcon: Icon(CupertinoIcons.chart_bar_fill),
                  label: '排行',
                  glowColor: Color(0xFF8B5CF6),
                ),
                const GlassTab(
                  icon: Icon(CupertinoIcons.book),
                  activeIcon: Icon(CupertinoIcons.book_fill),
                  label: '书架',
                  glowColor: Color(0xFF5C9AF6),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
