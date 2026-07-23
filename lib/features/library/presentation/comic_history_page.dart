import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

final comicHistoryProvider = StreamProvider((ref) {
  return ref.watch(libraryDatabaseProvider).watchReadingHistory();
});

class ComicHistoryPage extends HookConsumerWidget {
  const ComicHistoryPage({super.key});

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
      appBar: GlassAppBar(
        title: const Text('历史'),
        centerTitle: false,
        largeTitleController: titleController,
        leading: GlassIconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          GlassIconButton(
            icon: const Icon(
              CupertinoIcons.trash,
              color: CupertinoColors.systemRed,
            ),
            onPressed: () {
              ref.read(libraryDatabaseProvider).clearReadingHistory();
            },
          ),
        ],
      ),
      body: CustomScrollView(
        controller: titleController.scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: '历史',
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.paddingOf(context).top + 56,
              16,
              8,
            ),
          ),
          ref
              .watch(comicHistoryProvider)
              .when(
                loading: () => const ContentStateSliver.loading(),
                error: (error, stackTrace) => ContentStateSliver.error(
                  error: error,
                  onRetry: () {
                    ref.invalidate(comicHistoryProvider);
                  },
                ),
                data: (comics) {
                  if (comics.isEmpty) {
                    return ContentStateSliver.empty(
                      icon: CupertinoIcons.clock,
                      title: '暂无阅读历史',
                      message: '阅读过的漫画会显示在这里',
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 120),
                    sliver: SliverGrid.builder(
                      itemCount: comics.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 328 / 422.0,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        final item = comics[index];
                        return ComicCoverCard(
                          cover: item.comic.cover,
                          name: item.comic.name,
                          author: item.comic.author,
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (_) => ComicDetailPage(
                                  comicId: item.comic.pathWord,
                                  name: item.comic.name,
                                  cover: item.comic.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
        ],
      ),
    );
  }
}
