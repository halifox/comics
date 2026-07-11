import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/application/comic_library_providers.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/reader/presentation/chapter_reader_page.dart';
import 'package:comics/features/reader/presentation/continue_reading_button.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

typedef ComicChapterListQuery = ({String comicId, String groupPathWord});

final comicChapterListProvider =
    AsyncNotifierProvider.family<
      ComicChapterListNotifier,
      PagePagingData<ChapterDto>,
      ComicChapterListQuery
    >(ComicChapterListNotifier.new);

class ComicChapterListNotifier extends AsyncNotifier<PagePagingData<ChapterDto>>
    with PagePagingNotifierMixin<ChapterDto> {
  ComicChapterListNotifier(this.query);

  static const pageSize = 100;

  final ComicChapterListQuery query;

  @override
  Future<PagePagingData<ChapterDto>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<ChapterDto>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;

    final result = await ref
        .read(comicsApiProvider)
        .chapters(query.comicId, query.groupPathWord, pageSize, offset);

    return PagePagingData(
      items: result.list,
      hasMore: offset + result.list.length < result.total,
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
    final groupProgress = ref
        .watch(comicGroupProgressProvider(progressKey))
        .when(
          data: (progress) => progress,
          error: (error, stackTrace) => null,
          loading: () => null,
        );
    final chapterProgresses = ref
        .watch(comicChapterProgressesProvider(progressKey))
        .when(
          data: (progresses) => progresses,
          error: (error, stackTrace) => const <String, ComicReadingProgress>{},
          loading: () => const <String, ComicReadingProgress>{},
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
          useOwnLayer: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomBar: groupProgress == null
          ? null
          : ContinueReadingButton(
              title: '继续本分组上次阅读',
              subtitle:
                  '${groupProgress.chapterName} · 第 ${groupProgress.pageIndex + 1} 页',
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (_) => ChapterReaderPage(
                      comicId: comicId,
                      comicName: comicName,
                      comicCover: comicCover,
                      comicAuthor: comicAuthor,
                      groupName: groupProgress.groupName,
                      groupPathWord: groupProgress.groupPathWord,
                      chapterId: groupProgress.chapterId,
                      chapterName: groupProgress.chapterName,
                      initialPageIndex: groupProgress.pageIndex,
                    ),
                  ),
                );
              },
            ),
      bottomBarHeight: groupProgress == null ? null : 84,
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
          PagingHelperSliverView(
            provider: provider,
            futureRefreshable: provider.future,
            notifierRefreshable: provider.notifier,
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
                    final chapterProgress = chapterProgresses[chapter.uuid];
                    return ComicChapterTile(
                      chapter: chapter,
                      progress: chapterProgress,
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (_) => ChapterReaderPage(
                              comicId: comicId,
                              comicName: comicName,
                              comicCover: comicCover,
                              comicAuthor: comicAuthor,
                              groupName: groupName,
                              groupPathWord: groupPathWord,
                              chapterId: chapter.uuid,
                              chapterName: chapter.name,
                              initialPageIndex: chapterProgress?.pageIndex ?? 0,
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

class ComicChapterTile extends StatelessWidget {
  const ComicChapterTile({
    required this.chapter,
    required this.onTap,
    this.progress,
  });

  final ChapterDto chapter;
  final ComicReadingProgress? progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        padding: EdgeInsets.zero,
        quality: .minimal,
        child: GlassListTile(
          leading: const Icon(CupertinoIcons.book),
          title: Text(chapter.name),
          trailing: GlassListTile.chevron,
          onTap: onTap,
        ),
      ),
    );
  }
}
