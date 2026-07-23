import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
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

import 'comic_chapter_list_page.dart';

final comicInfoProvider = FutureProvider.autoDispose.family<ComicDetailModel, String>((ref, comicId) {
  return ref.watch(comicsRepositoryProvider).getComicDetail(comicId: comicId);
});

final comicLibraryItemProvider = StreamProvider.autoDispose.family<ComicLibraryItem?, String>((ref, pathWord) {
  return ref.watch(libraryDatabaseProvider).watchComic(pathWord: pathWord);
});

final comicLatestProgressProvider = StreamProvider.autoDispose.family<ComicReadingProgress?, String>((ref, pathWord) {
  return ref.watch(libraryDatabaseProvider).watchLatestComicProgress(comicPathWord: pathWord);
});

class ComicDetailPage extends HookConsumerWidget {
  const ComicDetailPage({required this.comicId, required this.name, required this.cover, super.key});

  final String comicId;
  final String name;
  final String cover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(comicInfoProvider(comicId));
    final libraryItemState = ref.watch(comicLibraryItemProvider(comicId));
    final latestProgressState = ref.watch(comicLatestProgressProvider(comicId));
    final scrollController = useScrollController();
    final scrollOffset = useState(0.0);

    useEffect(() {
      void onScroll() {
        scrollOffset.value = scrollController.offset;
      }

      scrollController.addListener(onScroll);
      return () {
        scrollController.removeListener(onScroll);
      };
    }, [scrollController]);

    Future<void> toggleFavorite({required ComicDetailModel detail}) async {
      await ref
          .read(libraryDatabaseProvider)
          .toggleFavorite(
            comic: ComicMetadata(
              pathWord: detail.id,
              name: detail.title,
              cover: detail.coverUrl,
              author: detail.authorText,
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
          icon: const Icon(CupertinoIcons.chevron_back),
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
                ),
                onPressed: () => toggleFavorite(detail: detail),
              ),
              loading: () => const SizedBox(
                width: 44,
                height: 44,
                child: Center(child: GlassProgressIndicator.circular(size: 20)),
              ),
              error: (error, stackTrace) => GlassIconButton(
                icon: const Icon(CupertinoIcons.refresh),
                onPressed: () {
                  ref.invalidate(comicInfoProvider(comicId));
                },
              ),
            ),
            loading: () =>
                const SizedBox(width: 44, height: 44, child: Center(child: GlassProgressIndicator.circular(size: 20))),
            error: (error, stackTrace) => GlassIconButton(
              icon: const Icon(CupertinoIcons.refresh),
              onPressed: () {
                ref.invalidate(comicLibraryItemProvider(comicId));
              },
            ),
          ),
        ],
      ),
      bottomBar: latestProgressState.when<Widget?>(
        data: (progress) {
          if (progress == null) {
            return null;
          }

          return info.when<Widget?>(
            data: (detail) => ContinueReadingButton(
              title: '继续上次阅读',
              subtitle:
                  '${progress.groupName} · ${progress.chapterName} · '
                  '第 ${progress.pageIndex + 1} 页',
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (_) => ChapterReaderPage(
                      comicId: detail.id,
                      comicName: detail.title,
                      comicCover: detail.coverUrl,
                      comicAuthor: detail.authorText,
                      groupName: progress.groupName,
                      groupPathWord: progress.groupPathWord,
                      chapterId: progress.chapterId,
                      chapterName: progress.chapterName,
                      initialPageIndex: progress.pageIndex,
                    ),
                  ),
                );
              },
            ),
            loading: () => null,
            error: (error, stackTrace) => null,
          );
        },
        loading: () => null,
        error: (error, stackTrace) => null,
      ),
      bottomBarHeight: latestProgressState.when<double?>(
        data: (progress) {
          if (progress == null) {
            return null;
          }

          return info.when<double?>(data: (_) => 84, loading: () => null, error: (error, stackTrace) => null);
        },
        loading: () => null,
        error: (error, stackTrace) => null,
      ),
      body: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
              final statusIcon = switch (data.statusText) {
                String display when display == '已完結' => CupertinoIcons.checkmark_seal,
                String display when display == '連載中' => CupertinoIcons.clock,
                _ => CupertinoIcons.info_circle,
              };
              return SliverLayoutBuilder(
                builder: (context, constraints) {
                  return SliverToBoxAdapter(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.viewportMainAxisExtent),
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
                              data.title,
                              style: TextStyle(
                                color: CupertinoColors.label.resolveFrom(context),
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                height: 1.16,
                                letterSpacing: -.7,
                              ),
                            ),
                            Text(
                              data.brief,
                              style: TextStyle(
                                color: CupertinoColors.secondaryLabel.resolveFrom(context),
                                fontSize: 15,
                                height: 1.55,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.authors
                                  .map(
                                    (author) => GlassChip(
                                      icon: const Icon(CupertinoIcons.person),
                                      label: author.label,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute<void>(
                                            builder: (_) => ComicCatalogPage(
                                              title: author.label,
                                              author: author.id,
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
                                GlassChip(icon: Icon(statusIcon), label: data.statusText, onTap: () {}),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.calendar),
                                  label: data.updatedText,
                                  onTap: () {},
                                ),
                                GlassChip(icon: const Icon(CupertinoIcons.globe), label: data.regionText, onTap: () {}),
                              ],
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.themes
                                  .map(
                                    (theme) => GlassChip(
                                      icon: const Icon(CupertinoIcons.tag),
                                      label: theme.label,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute<void>(
                                            builder: (_) => ComicCatalogPage(title: theme.label, theme: theme.id),
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
                                color: CupertinoColors.label.resolveFrom(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GlassGroupedSection(
                              margin: .zero,
                              children: data.groups.map((e) {
                                return GlassListTile(
                                  subtitle: Text("${e.chapterCount}话"),
                                  title: Text(e.title),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute<void>(
                                        builder: (_) => ComicChapterListPage(
                                          comicId: comicId,
                                          comicName: data.title,
                                          comicCover: data.coverUrl,
                                          comicAuthor: data.authorText,
                                          groupName: e.title,
                                          groupPathWord: e.id,
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
            error: (error, stackTrace) =>
                ContentStateSliver.error(error: error, onRetry: () => ref.invalidate(comicInfoProvider(comicId))),
          ),
        ],
      ),
    );
  }
}
