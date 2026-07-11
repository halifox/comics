import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/features/catalog/presentation/comic_catalog_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/application/comic_library_providers.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/reader/presentation/chapter_reader_page.dart';
import 'package:comics/features/reader/presentation/continue_reading_button.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/copy_manga/copy_manga.dart';

import 'comic_chapter_list_page.dart';

final comicInfoProvider = FutureProvider.family<ComicInfoResultDto, String>((
  ref,
  comicId,
) async {
  return ref.watch(comicsApiProvider).comicInfo(comicId);
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

    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      appBar: GlassAppBar(
        leading: GlassIconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          useOwnLayer: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          GlassIconButton(
            icon: Icon(
              isFavorite
                  ? CupertinoIcons.bookmark_fill
                  : CupertinoIcons.bookmark,
            ),
            useOwnLayer: true,
            onPressed: () async {
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
                    ComicMetadata(
                      pathWord: data.comic.pathWord,
                      name: data.comic.name,
                      cover: data.comic.cover,
                      author: data.comic.authors
                          .map((author) => author.name)
                          .join(','),
                    ),
                  );
            },
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
          SliverAppBar(
            expandedHeight: 500,
            pinned: false,
            backgroundColor: CupertinoColors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Transform.translate(
                offset: Offset(0, scrollOffset.value * .5),
                child: CachedNetworkImage(
                  imageUrl: cover,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          info.when(
            data: (data) {
              final author = data.comic.authors
                  .map((author) => author.name)
                  .join(',');
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
                              style: const TextStyle(
                                color: CupertinoColors.black,
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
                                  icon: const Icon(
                                    CupertinoIcons.checkmark_seal,
                                  ),
                                  label: data.comic.status?.display ?? '',
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.calendar),
                                  label: data.comic.datetimeUpdated,
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.globe),
                                  label: data.comic.region?.display ?? '',
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

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.comic.alias
                                  .split(',')
                                  .map((alias) => alias.trim())
                                  .where((alias) => alias.isNotEmpty)
                                  .map(
                                    (alias) => GlassChip(
                                      icon: const Icon(
                                        CupertinoIcons.text_badge_plus,
                                      ),
                                      label: alias,
                                      onTap: () {},
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
                                  'About',
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
            error: (error, _) => ContentStateSliver.error(error),
          ),
        ],
      ),
    );
  }
}
