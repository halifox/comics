import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/application/comic_library_providers.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/reader/presentation/chapter_reader_page.dart';
import 'package:comics/features/reader/presentation/continue_reading_button.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/shared/presentation/widgets/cached_image_feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/copy_manga/copy_manga.dart';

import 'comic_chapter_list_page.dart';

final comicInfoProvider = FutureProvider.family<ComicInfoResultDto, String>((
  ref,
  comicId,
) async {
  return ref.watch(comicsApiProvider).comicInfo(comicId: comicId);
});

class ComicDetailPage extends HookConsumerWidget {
  const ComicDetailPage({
    required this.comicId,
    required this.name,
    required this.cover,
    super.key,
  });

  final String comicId;
  final String name;
  final String cover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(comicInfoProvider(comicId));
    final libraryItem = ref.watch(comicLibraryItemProvider(comicId));
    final isFavorite = libraryItem.when(
      data: (item) => item?.isFavorite ?? false,
      error: (error, stackTrace) => false,
      loading: () => false,
    );
    final detail = switch (info) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final progress = libraryItem.when(
      data: (item) => item?.progress,
      error: (error, stackTrace) => null,
      loading: () => null,
    );
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

    Future<void> toggleFavorite() async {
      final data = switch (info) {
        AsyncData(:final value) => value,
        _ => null,
      };
      if (data == null) {
        return;
      }

      await ref
          .read(libraryDatabaseProvider)
          .toggleFavorite(
            comic: ComicMetadata(
              pathWord: data.comic.pathWord,
              name: data.comic.name,
              cover: data.comic.cover,
              author: data.comic.authors
                  .map((author) => author.name)
                  .join(','),
            ),
          );
    }

    Future<void> handleFavoritePressed() async {
      if (isFavorite) {
        final shouldRemove = await GlassDialog.show<bool>(
          context: context,
          title: '移出书架？',
          message: '确定要将《$name》从书架中移除吗？',
          actions: [
            GlassDialogAction(
              label: '取消',
              onPressed: () => Navigator.of(context).pop(false),
            ),
            GlassDialogAction(
              label: '移除',
              isDestructive: true,
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
        if (shouldRemove != true || !context.mounted) {
          return;
        }
      }

      await toggleFavorite();
    }

    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      appBar: GlassAppBar(
        leading: Semantics(
          button: true,
          label: '返回',
          child: GlassIconButton(
            icon: const Icon(CupertinoIcons.chevron_back),
            useOwnLayer: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          Semantics(
            button: true,
            label: isFavorite ? '从书架移除' : '添加到书架',
            toggled: isFavorite,
            child: GlassIconButton(
              icon: Icon(
                isFavorite
                    ? CupertinoIcons.rectangle_stack_fill
                    : CupertinoIcons.rectangle_stack_badge_plus,
              ),
              useOwnLayer: true,
              onPressed: handleFavoritePressed,
            ),
          ),
        ],
      ),
      bottomBar: detail == null || progress == null
          ? null
          : ContinueReadingButton(
              title: '继续上次阅读',
              subtitle:
                  '${progress.groupName} · ${progress.chapterName} · '
                  '第 ${progress.pageIndex + 1} 页',
              onTap: () {
                final author = detail.comic.authors
                    .map((item) => item.name)
                    .join(',');
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (_) => ChapterReaderPage(
                      comicId: detail.comic.pathWord,
                      comicName: detail.comic.name,
                      comicCover: detail.comic.cover,
                      comicAuthor: author,
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
      bottomBarHeight: detail == null || progress == null ? null : 84,
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
              final author = data.comic.authors
                  .map((author) => author.name)
                  .join(',');
              final statusIcon = switch (data.comic.status.display) {
                String display when display.contains('完结') =>
                  CupertinoIcons.checkmark_seal,
                String display when display.contains('连载') =>
                  CupertinoIcons.clock,
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
                          progress == null ? 32 : 120,
                        ),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.comic.name,
                              style: TextStyle(
                                color: CupertinoColors.label.resolveFrom(
                                  context,
                                ),
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.comic.authors
                                  .map(
                                    (author) => GlassChip(
                                      icon: const Icon(CupertinoIcons.person),
                                      label: author.name,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute<void>(
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
                                  label: data.comic.status.display,
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.calendar),
                                  label: data.comic.datetimeUpdated,
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.globe),
                                  label: data.comic.region.display,
                                  onTap: () {},
                                ),
                              ],
                            ),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.comic.themes
                                  .map(
                                    (theme) => GlassChip(
                                      icon: const Icon(CupertinoIcons.tag),
                                      label: theme.name,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          CupertinoPageRoute<void>(
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

                            GlassGroupedSection(
                              margin: .zero,
                              children: data.groups.values.map((e) {
                                return GlassListTile(
                                  subtitle: Text("${e.count}话"),
                                  title: Text(e.name),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute<void>(
                                        builder: (_) => ComicChapterListPage(
                                          comicId: comicId,
                                          comicName: data.comic.name,
                                          comicCover: data.comic.cover,
                                          comicAuthor: author,
                                          groupName: e.name,
                                          groupPathWord: e.pathWord,
                                        ),
                                      ),
                                    );
                                  },
                                  leading: const Icon(CupertinoIcons.book),
                                  trailing: GlassListTile.chevron,
                                );
                              }).toList(),
                            ),
                            GlassCard(
                              padding: EdgeInsets.zero,
                              child: GlassListTile(
                                title: const Text(
                                  '关于',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(data.comic.brief),
                              ),
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
