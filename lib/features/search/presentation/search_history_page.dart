import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/search/presentation/search_results_page.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

final searchHistoryProvider = StreamProvider((ref) {
  return ref.watch(libraryDatabaseProvider).watchSearchHistory();
});

class SearchHistoryPage extends ConsumerWidget {
  const SearchHistoryPage({
    super.key,
    required this.titleController,
    required this.onDismiss,
  });

  final GlassLargeTitleController titleController;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onDismiss,
      child: GlassScaffold(
        edgeToEdge: true,
        contentAwareBrightness: true,
        statusBarStyle: GlassStatusBarStyle.auto,
        background: const AmbientGlowBackground(),
        topEdgeFade: true,
        bottomEdgeFade: true,
        topEdgeFadeExtent: 64,
        bottomEdgeFadeExtent: 64,
        headerScrollController: titleController.scrollController,
        body: CustomScrollView(
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

            ref
                .watch(searchHistoryProvider)
                .when(
                  data: (data) {
                    if (data.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.viewInsetsOf(context).bottom + 50,
                          ),
                          child: const ContentStateSliver.empty(
                            icon: CupertinoIcons.search,
                            title: '暂无最近搜索',
                            message: '你的最近搜索记录会显示在这里。',
                          ),
                        ),
                      );
                    }
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          18,
                          16,
                          18,
                          MediaQuery.paddingOf(context).bottom +
                              MediaQuery.viewInsetsOf(context).bottom +
                              72,
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GlassGroupedSection(
                            margin: EdgeInsets.zero,
                            shape: const LiquidRoundedSuperellipse(
                              borderRadius: 28,
                            ),
                            children: [
                              for (final query in data.reversed)
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
                                    color: CupertinoColors.label.resolveFrom(
                                      context,
                                    ),
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
                                  trailing: GlassIconButton(
                                    icon: const Icon(
                                      CupertinoIcons.trash,
                                      color: CupertinoColors.systemRed,
                                    ),
                                    onPressed: () => ref
                                        .read(libraryDatabaseProvider)
                                        .removeSearch(query: query),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  loading: () => const ContentStateSliver.loading(),
                  error: (error, stackTrace) => ContentStateSliver.error(
                    error: error,
                    onRetry: () {
                      ref.invalidate(searchHistoryProvider);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
