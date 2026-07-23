import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/reader/presentation/chapter_reader_page.dart';
import 'package:comics/features/reader/presentation/continue_reading_button.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/shared/presentation/widgets/cupertino_paging_sliver_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

typedef ComicChapterListQuery = ({String comicId, String groupPathWord});
typedef ComicGroupProgressKey = ({String comicPathWord, String groupPathWord});

final comicGroupProgressProvider = StreamProvider.autoDispose
    .family<ComicReadingProgress?, ComicGroupProgressKey>((ref, key) {
      return ref
          .watch(libraryDatabaseProvider)
          .watchGroupProgress(
            comicPathWord: key.comicPathWord,
            groupPathWord: key.groupPathWord,
          );
    });

final comicChapterProgressesProvider = StreamProvider.autoDispose
    .family<Map<String, ComicReadingProgress>, ComicGroupProgressKey>((
      ref,
      key,
    ) {
      return ref
          .watch(libraryDatabaseProvider)
          .watchChapterProgresses(
            comicPathWord: key.comicPathWord,
            groupPathWord: key.groupPathWord,
          );
    });

final comicChapterListProvider = AsyncNotifierProvider.autoDispose
    .family<
      ComicChapterListNotifier,
      PagePagingData<ChapterSummaryModel>,
      ComicChapterListQuery
    >(ComicChapterListNotifier.new);

class ComicChapterListNotifier
    extends AsyncNotifier<PagePagingData<ChapterSummaryModel>>
    with PagePagingNotifierMixin<ChapterSummaryModel> {
  ComicChapterListNotifier(this.query);

  static const pageSize = 100;
  final ComicChapterListQuery query;

  @override
  Future<PagePagingData<ChapterSummaryModel>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<ChapterSummaryModel>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;
    final result = await ref
        .read(comicsRepositoryProvider)
        .getChapters(
          comicId: query.comicId,
          groupId: query.groupPathWord,
          limit: pageSize,
          offset: offset,
        );
    return PagePagingData(
      items: result.items,
      hasMore: offset + result.items.length < result.total,
      page: page,
    );
  }
}

class ComicChapterListPage extends HookConsumerWidget {
  const ComicChapterListPage({
    required this.comicId,
    required this.comicName,
    required this.comicCover,
    required this.comicAuthor,
    required this.groupName,
    required this.groupPathWord,
    super.key,
  });

  final String comicId;
  final String comicName;
  final String comicCover;
  final String comicAuthor;
  final String groupName;
  final String groupPathWord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useGlassLargeTitleController();
    final provider = comicChapterListProvider((
      comicId: comicId,
      groupPathWord: groupPathWord,
    ));
    final progressKey = (comicPathWord: comicId, groupPathWord: groupPathWord);
    final groupProgressState = ref.watch(
      comicGroupProgressProvider(progressKey),
    );
    final chapterProgressesState = ref.watch(
      comicChapterProgressesProvider(progressKey),
    );

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
        title: Text(
          groupName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label.resolveFrom(context),
          ),
        ),
        centerTitle: false,
        largeTitleController: titleController,
        leading: GlassIconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomBar: groupProgressState.whenOrNull(
        data: (data) {
          if (data == null) return null;
          return ContinueReadingButton(
            title: '继续本分组上次阅读',
            subtitle: '${data.chapterName} · 第 ${data.pageIndex + 1} 页',
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => ChapterReaderPage(
                    comicId: comicId,
                    comicName: comicName,
                    comicCover: comicCover,
                    comicAuthor: comicAuthor,
                    groupName: data.groupName,
                    groupPathWord: data.groupPathWord,
                    chapterId: data.chapterId,
                    chapterName: data.chapterName,
                    initialPageIndex: data.pageIndex,
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomBarHeight: groupProgressState.whenOrNull(
        data: (data) {
          if (data == null) return null;
          return 84;
        },
      ),
      body: CustomScrollView(
        controller: titleController.scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: groupName,
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              24,
              MediaQuery.paddingOf(context).top + 56,
              24,
              8,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Text(
                comicName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          groupProgressState.when(
            data: (groupProgress) => chapterProgressesState.when(
              data: (chapterProgresses) => CupertinoPagingSliverView(
                state: ref.watch(provider),
                onLoadNext: () => ref.read(provider.notifier).loadNext(),
                onRetry: () => ref.read(provider.notifier).forceRefresh(),
                contentBuilder: (data, widgetCount, endItemView) {
                  if (data.items.isEmpty) {
                    return const ContentStateSliver.empty(
                      icon: CupertinoIcons.book,
                      title: '暂无集数',
                      message: '这个分组暂时没有可选择的集数',
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
                    sliver: SliverList.builder(
                      itemCount: widgetCount,
                      itemBuilder: (context, index) {
                        if (index == widgetCount - 1) {
                          return endItemView;
                        }

                        final chapter = data.items[index];
                        final chapterProgress = chapterProgresses[chapter.id];
                        return ComicChapterTile(
                          chapter: chapter,
                          progress: chapterProgress,
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (_) => ChapterReaderPage(
                                  comicId: comicId,
                                  comicName: comicName,
                                  comicCover: comicCover,
                                  comicAuthor: comicAuthor,
                                  groupName: groupName,
                                  groupPathWord: groupPathWord,
                                  chapterId: chapter.id,
                                  chapterName: chapter.title,
                                  initialPageIndex:
                                      chapterProgress?.pageIndex ?? 0,
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
              loading: () => const ContentStateSliver.loading(),
              error: (error, stackTrace) => ContentStateSliver.error(
                error: error,
                onRetry: () {
                  ref.invalidate(comicChapterProgressesProvider(progressKey));
                },
              ),
            ),
            loading: () => const ContentStateSliver.loading(),
            error: (error, stackTrace) => ContentStateSliver.error(
              error: error,
              onRetry: () {
                ref.invalidate(comicGroupProgressProvider(progressKey));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ComicChapterTile extends StatelessWidget {
  const ComicChapterTile({
    required this.chapter, required this.onTap, super.key,
    this.progress,
  });

  final ChapterSummaryModel chapter;
  final ComicReadingProgress? progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        padding: EdgeInsets.zero,
        child: GlassListTile(
          leading: Icon(
            progress == null ? CupertinoIcons.book : CupertinoIcons.book_fill,
          ),
          title: Text(chapter.title),
          subtitle: progress == null
              ? null
              : Text('已读至第 ${progress!.pageIndex + 1} 页'),
          trailing: GlassListTile.chevron,
          onTap: onTap,
        ),
      ),
    );
  }
}
