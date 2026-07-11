import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ComicLibraryGrid extends StatelessWidget {
  const ComicLibraryGrid({
    required this.items,
    required this.emptyIcon,
    required this.emptyTitle,
    required this.emptyMessage,
    super.key,
  });

  final AsyncValue<List<ComicLibraryItem>> items;
  final IconData emptyIcon;
  final String emptyTitle;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    return items.when(
      loading: () => const ContentStateSliver.loading(),
      error: (error, _) => ContentStateSliver.error(error),
      data: (comics) {
        if (comics.isEmpty) {
          return ContentStateSliver.empty(
            icon: emptyIcon,
            title: emptyTitle,
            message: emptyMessage,
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 120),
          sliver: SliverGrid.builder(
            itemCount: comics.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                badge: null,
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute<void>(
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
    );
  }
}
