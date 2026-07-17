import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';

import 'comic_history_page.dart';
import 'comic_library_grid.dart';

final favoriteComicsProvider = StreamProvider<List<ComicLibraryItem>>((ref) {
  return ref.watch(libraryDatabaseProvider).watchFavoriteComics();
});

class ComicLibraryPage extends HookConsumerWidget {
  const ComicLibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useGlassLargeTitleController();
    final favorites = ref.watch(favoriteComicsProvider);

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
      header: GlassAppBar(
        actions: [
          Semantics(
            button: true,
            label: '阅读历史',
            child: GlassIconButton(
              icon: const Icon(CupertinoIcons.clock),
              useOwnLayer: true,
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (_) => const ComicHistoryPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: titleController.scrollController,
        key: const PageStorageKey<String>('library-scroll'),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: '书架',
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.paddingOf(context).top + 16,
              16,
              8,
            ),
          ),
          ComicLibraryGrid(
            items: favorites,
            emptyIcon: CupertinoIcons.book,
            emptyTitle: '你的书架是空的',
            emptyMessage: '收藏的漫画会显示在这里',
            onRetry: () => ref.invalidate(favoriteComicsProvider),
          ),
        ],
      ),
    );
  }
}
