import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/AmbientGlowBackground.dart';
import 'package:comics/features/home/presentation/comic_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../../copy_manga/copy_manga.dart';
import '../application/home_provider.dart';
import 'home_sections.dart';
import 'large_title_helpers.dart';

class ThemeComicsPage extends HookConsumerWidget {
  const ThemeComicsPage({
    required this.title,
    required this.themeSlug,
    super.key,
  });

  final String title;
  final String themeSlug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useGlassLargeTitleController();
    final comics = ref.watch(themeComicsProvider(themeSlug));

    return GlassScaffold(
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      appBar: GlassAppBar(
        title: Text(
          title,
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
      body: CustomScrollView(
        controller: titleController.scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: title,
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              24,
              MediaQuery.paddingOf(context).top + 44,
              24,
              8,
            ),
          ),
          _ThemeComicsBody(comics: comics),
        ],
      ),
    );
  }
}

class _ThemeComicsBody extends StatelessWidget {
  const _ThemeComicsBody({required this.comics});

  final AsyncValue<ComicPageResultDto> comics;

  @override
  Widget build(BuildContext context) {
    return comics.when(
      loading: () => const HomeStateView.loading(),
      error: (error, _) => HomeStateView.error(error),
      data: (page) {
        if (page.list.isEmpty) {
          return const HomeStateView.empty(
            icon: CupertinoIcons.square_grid_2x2,
            title: '暂无漫画',
            message: '这个分类暂时没有可显示的作品',
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 20,
              childAspectRatio: .61,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final comic = page.list[index];
              return ComicCoverCard(
                cover: comic.cover,
                name: comic.name,
                author: comic.authors.map((author) => author.name).join(','),
                badge: null,
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (_) => ComicDetailPage(
                        comicId: comic.pathWord,
                        name: comic.name,
                        cover: comic.cover,
                      ),
                    ),
                  );
                },
              );
            }, childCount: page.list.length),
          ),
        );
      },
    );
  }
}

