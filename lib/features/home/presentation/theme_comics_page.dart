import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../../app/app_theme.dart';
import '../../../copy_manga/copy_manga.dart';
import 'home_sections.dart';

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
    const pageSize = 30;
    final scrollController = useScrollController();
    final comics = useState<List<ComicDto>>(<ComicDto>[]);
    final total = useState(0);
    final loading = useState(false);
    final error = useState<Object?>(null);

    Future<void> loadMore() async {
      final hasMore = comics.value.isEmpty || comics.value.length < total.value;
      if (loading.value || (!hasMore && comics.value.isNotEmpty)) return;
      loading.value = true;
      error.value = null;

      try {
        final page = await ref
            .read(copyMangaRepositoryProvider)
            .api
            .comics(
              limit: pageSize,
              offset: comics.value.length,
              ordering: '-popular',
              theme: themeSlug,
            );
        if (!context.mounted) return;
        comics.value = [...comics.value, ...page.list];
        total.value = page.total;
      } catch (caught) {
        if (context.mounted) error.value = caught;
      } finally {
        if (context.mounted) loading.value = false;
      }
    }

    useEffect(() {
      Future<void>.microtask(loadMore);
      return null;
    }, const []);

    return GlassScaffold(
      statusBarStyle: GlassStatusBarStyle.auto,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: GlassAppBar(
        leading: GlassIconButton(
          icon: const Icon(CupertinoIcons.chevron_back, size: 21),
          size: 40,
          useOwnLayer: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.extentAfter < 500) loadMore();
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  MediaQuery.paddingOf(context).top + 56,
                  16,
                  20,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: CupertinoColors.label.resolveFrom(context),
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
            ),
            _ThemeComicsBody(
              comics: comics.value,
              total: total.value,
              loading: loading.value,
              error: error.value,
              onLoadMore: loadMore,
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeComicsBody extends StatelessWidget {
  const _ThemeComicsBody({
    required this.comics,
    required this.total,
    required this.loading,
    required this.error,
    required this.onLoadMore,
  });

  final List<ComicDto> comics;
  final int total;
  final bool loading;
  final Object? error;
  final Future<void> Function() onLoadMore;

  @override
  Widget build(BuildContext context) {
    if (comics.isEmpty && loading) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: GlassProgressIndicator.circular(size: 30)),
      );
    }
    if (comics.isEmpty && error != null) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: HomeErrorView(message: error.toString(), onRetry: onLoadMore),
      );
    }
    if (comics.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: _EmptyState(
          icon: CupertinoIcons.square_grid_2x2,
          title: '暂无漫画',
          subtitle: '这个分类暂时没有可显示的作品',
        ),
      );
    }

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 20,
              childAspectRatio: .61,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _ThemeComicCard(comic: comics[index]),
              childCount: comics.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 70,
            child: Center(
              child: error != null
                  ? GlassButton.custom(
                      onTap: onLoadMore,
                      width: 190,
                      height: 44,
                      useOwnLayer: true,
                      child: const Text('加载失败，点击重试'),
                    )
                  : loading
                  ? const GlassProgressIndicator.circular()
                  : Text(
                      '共 $total 部',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ThemeComicCard extends StatelessWidget {
  const _ThemeComicCard({required this.comic});

  final ComicDto comic;

  @override
  Widget build(BuildContext context) {
    final author = comic.authors.map((item) => item.name).join(' · ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: comic.cover,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, _) => ColoredBox(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Center(child: GlassProgressIndicator.circular()),
              ),
              errorWidget: (context, _, _) => ColoredBox(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Center(child: Icon(CupertinoIcons.book, size: 30)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 9),
        Text(
          comic.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          author.isEmpty ? comic.datetimeUpdated : author,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 42, color: CopyColors.accent),
            const SizedBox(height: 15),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 7),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
