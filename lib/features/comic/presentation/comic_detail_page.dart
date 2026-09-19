import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/reader/presentation/chapter_reader_page.dart';
import 'package:comics/features/reader/presentation/continue_reading_button.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/shared/presentation/widgets/cached_image_feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:palette_generator/palette_generator.dart';

import 'comic_chapter_list_page.dart';
import 'comic_author_names.dart';

final comicInfoProvider = FutureProvider.autoDispose
    .family<ComicInfoResultDto, String>(
      (ref, comicId) => ref.watch(comicsApiProvider).comicInfo(comicId: comicId),
    );

final comicLibraryItemProvider = StreamProvider.autoDispose.family((
  ref,
  String pathWord,
) {
  return ref.watch(libraryDatabaseProvider).watchComic(pathWord: pathWord);
});

final comicLatestProgressProvider = StreamProvider.autoDispose.family((
  ref,
  String pathWord,
) {
  return ref
      .watch(libraryDatabaseProvider)
      .watchLatestComicProgress(comicPathWord: pathWord);
});

final comicDetailToolbarIconColorProvider = FutureProvider.autoDispose.family((
  ref,
  String cover,
) async {
  final palette = await PaletteGenerator.fromImageProvider(
    ResizeImage(CachedNetworkImageProvider(cover), width: 64, height: 96),
    size: const Size(64, 96),
    region: const Rect.fromLTWH(0, 0, 64, 24),
    maximumColorCount: 12,
  );
  return palette.dominantColor?.bodyTextColor.withAlpha(255);
});

class ComicDetailPage extends HookConsumerWidget {
  const ComicDetailPage({
    required this.comicId,
    required this.cover,
    super.key,
  });

  final String comicId;
  final String cover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(comicInfoProvider(comicId));
    final libraryItemState = ref.watch(comicLibraryItemProvider(comicId));
    final latestProgressState = ref.watch(comicLatestProgressProvider(comicId));
    final scrollController = useScrollController();
    final scrollOffset = useState(0.0);
    final toolbarIconColor = ref
        .watch(comicDetailToolbarIconColorProvider(cover))
        .when(
          data: (color) => color,
          loading: () => null,
          error: (error, stackTrace) => null,
        );

    useEffect(() {
      void onScroll() {
        scrollOffset.value = scrollController.offset;
      }

      scrollController.addListener(onScroll);
      return () {
        scrollController.removeListener(onScroll);
      };
    }, [scrollController]);

    Future<void> toggleFavorite({required ComicInfoDto comic}) async {
      await ref
          .read(libraryDatabaseProvider)
          .toggleFavorite(
            comic: ComicMetadata(
              pathWord: comic.pathWord,
              name: comic.name,
              cover: comic.cover,
              author: comicAuthorNames(authors: comic.authors),
            ),
          );
    }

    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      topEdgeFade: false,
      background: const AmbientGlowBackground(),
      appBar: GlassAppBar(
        leading: GlassIconButton(
          icon: Icon(CupertinoIcons.chevron_back, color: toolbarIconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          libraryItemState.when(
            data: (libraryItem) => info.when(
              data: (detail) => GlassIconButton(
                icon: Icon(
                  libraryItem?.isFavorite ?? false
                      ? CupertinoIcons.rectangle_stack_fill
                      : CupertinoIcons.rectangle_stack_badge_plus,
                  color: toolbarIconColor,
                ),
                onPressed: () => toggleFavorite(comic: detail.comic),
              ),
              loading: () => const SizedBox(
                width: 44,
                height: 44,
                child: Center(child: GlassProgressIndicator.circular(size: 20)),
              ),
              error: (error, stackTrace) => GlassIconButton(
                icon: Icon(CupertinoIcons.refresh, color: toolbarIconColor),
                onPressed: () {
                  ref.invalidate(comicInfoProvider(comicId));
                },
              ),
            ),
            loading: () => const SizedBox(
              width: 44,
              height: 44,
              child: Center(child: GlassProgressIndicator.circular(size: 20)),
            ),
            error: (error, stackTrace) => GlassIconButton(
              icon: Icon(CupertinoIcons.refresh, color: toolbarIconColor),
              onPressed: () {
                ref.invalidate(comicLibraryItemProvider(comicId));
              },
            ),
          ),
        ],
      ),
      bottomBar: info.when(
        data: (detail) {
          return latestProgressState.when(
            data: (progress) {
              if (progress == null) {
                return null;
              }
              return ContinueReadingButton(
                title: '继续上次阅读',
                subtitle:
                    '${progress.groupName} · ${progress.chapterName} · 第 ${progress.pageIndex + 1} 页',
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => ChapterReaderPage(
                        comicId: detail.comic.pathWord,
                        comicName: detail.comic.name,
                        comicCover: detail.comic.cover,
                        comicAuthor: comicAuthorNames(
                          authors: detail.comic.authors,
                        ),
                        groupName: progress.groupName,
                        groupPathWord: progress.groupPathWord,
                        chapterId: progress.chapterId,
                        chapterName: progress.chapterName,
                        initialPageIndex: progress.pageIndex,
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => null,
            error: (error, stackTrace) => null,
          );
        },
        loading: () => null,
        error: (error, stackTrace) => null,
      ),
      bottomBarHeight: info.when(
        data: (detail) {
          return latestProgressState.when(
            data: (progress) {
              if (progress == null) {
                return null;
              }
              return 84;
            },
            loading: () => null,
            error: (error, stackTrace) => null,
          );
        },
        loading: () => null,
        error: (error, stackTrace) => null,
      ),
      body: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverToBoxAdapter(
            child: ClipRect(
              child: SizedBox(
                height: 500,
                child: Transform.translate(
                  offset: Offset(0, scrollOffset.value * .5),
                  child: CachedNetworkImage(
                    imageUrl: cover,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    progressIndicatorBuilder: buildCachedImageLoading,
                    errorWidget: buildCachedImageError,
                  ),
                ),
              ),
            ),
          ),
          info.when(
            data: (data) {
              final comic = data.comic;
              final statusIcon = switch (comic.status.display) {
                '已完結' => CupertinoIcons.checkmark_seal,
                '連載中' => CupertinoIcons.clock,
                _ => CupertinoIcons.info_circle,
              };
              return SliverLayoutBuilder(
                builder: (context, constraints) {
                  return SliverToBoxAdapter(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.viewportMainAxisExtent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          24,
                          24,
                          24,
                          latestProgressState.when(
                            data: (progress) => progress == null ? 32 : 120,
                            loading: () => 32,
                            error: (error, stackTrace) => 32,
                          ),
                        ),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comic.name,
                              style: TextStyle(
                                color: CupertinoColors.label.resolveFrom(
                                  context,
                                ),
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                height: 1.16,
                                letterSpacing: -.7,
                              ),
                            ),
                            Text(
                              comic.brief,
                              style: TextStyle(
                                color: CupertinoColors.secondaryLabel
                                    .resolveFrom(context),
                                fontSize: 15,
                                height: 1.55,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: comic.authors
                                  .map(
                                    (author) => GlassChip(
                                      icon: const Icon(CupertinoIcons.person),
                                      label: author.name,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute(
                                            builder: (_) => ComicCatalogPage(
                                              title: author.name,
                                              author: author.pathWord,
                                              showActions: false,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                GlassChip(
                                  icon: Icon(statusIcon),
                                  label: comic.status.display,
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.calendar),
                                  label: comic.datetimeUpdated,
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.globe),
                                  label: comic.region.display,
                                  onTap: () {},
                                ),
                              ],
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: comic.themes
                                  .map(
                                    (theme) => GlassChip(
                                      icon: const Icon(CupertinoIcons.tag),
                                      label: theme.name,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute(
                                            builder: (_) => ComicCatalogPage(
                                              title: theme.name,
                                              theme: theme.pathWord,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                            Text(
                              '篇章',
                              style: TextStyle(
                                color: CupertinoColors.label.resolveFrom(
                                  context,
                                ),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GlassGroupedSection(
                              margin: .zero,
                              children: data.groups.values.map((group) {
                                return GlassListTile(
                                  subtitle: Text('${group.count}话'),
                                  title: Text(group.name),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(
                                        builder: (_) => ComicChapterListPage(
                                          comicId: comicId,
                                          comicName: comic.name,
                                          comicCover: comic.cover,
                                          comicAuthor: comicAuthorNames(
                                            authors: comic.authors,
                                          ),
                                          groupName: group.name,
                                          groupPathWord: group.pathWord,
                                        ),
                                      ),
                                    );
                                  },
                                  leading: const Icon(CupertinoIcons.book),
                                  trailing: GlassListTile.chevron,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const ContentStateSliver.loading(),
            error: (error, stackTrace) => ContentStateSliver.error(
              error: error,
              onRetry: () => ref.invalidate(comicInfoProvider(comicId)),
            ),
          ),
        ],
      ),
    );
  }
}
