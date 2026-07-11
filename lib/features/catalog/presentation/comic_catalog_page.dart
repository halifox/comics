import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

import 'package:comics/copy_manga/copy_manga.dart';

enum ComicCatalogScope {
  all(value: '', label: '全部'),
  japan(value: 'japan', label: '日漫'),
  korea(value: 'korea', label: '韩漫'),
  west(value: 'west', label: '美漫'),
  finished(value: 'finish', label: '已完结');

  const ComicCatalogScope({required this.value, required this.label});

  final String value;
  final String label;
}

enum ComicCatalogOrdering {
  updatedDescending(value: '-datetime_updated', label: '时间倒序'),
  updatedAscending(value: 'datetime_updated', label: '时间正序'),
  popularDescending(value: '-popular', label: '热度倒序'),
  popularAscending(value: 'popular', label: '热度正序');

  const ComicCatalogOrdering({required this.value, required this.label});

  final String value;
  final String label;
}

typedef ComicCatalogFilter = ({
  String? theme,
  String? author,
  String top,
  String ordering,
});

final comicCatalogProvider =
    AsyncNotifierProvider.family<
      ComicCatalogNotifier,
      PagePagingData<ComicDto>,
      ComicCatalogFilter
    >(ComicCatalogNotifier.new);

class ComicCatalogNotifier extends AsyncNotifier<PagePagingData<ComicDto>>
    with PagePagingNotifierMixin<ComicDto> {
  ComicCatalogNotifier(this.filter);

  static const pageSize = 18;

  final ComicCatalogFilter filter;

  @override
  Future<PagePagingData<ComicDto>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<ComicDto>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;
    final result = await ref
        .read(comicsApiProvider)
        .comics(
          pageSize,
          offset,
          filter.ordering,
          filter.theme,
          filter.top,
          filter.author,
        );

    return PagePagingData(
      items: result.list,
      hasMore: offset + result.list.length < result.total,
      page: page,
    );
  }
}

class ComicCatalogPage extends HookConsumerWidget {
  const ComicCatalogPage({
    required this.title,
    this.theme,
    this.author,
    super.key,
  }) : assert(
         (theme != null) != (author != null),
         '必须且只能提供 theme 或 author 其中一个参数',
       );

  final String title;
  final String? theme;
  final String? author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scope = useState(ComicCatalogScope.all);
    final ordering = useState(ComicCatalogOrdering.updatedDescending);
    final titleController = useGlassLargeTitleController();
    final filter = (
      theme: theme,
      author: author,
      top: scope.value.value,
      ordering: ordering.value.value,
    );
    final provider = comicCatalogProvider(filter);

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
        actions: [
          GlassPullDownButton(
            icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
            menuWidth: 200,
            menuAlignment: GlassMenuAlignment.topRight,
            quality: GlassQuality.minimal,
            items: [
              for (final option in ComicCatalogScope.values)
                GlassMenuItem(
                  title: option.label,
                  isSelected: scope.value == option,
                  trailing: scope.value == option
                      ? const Icon(CupertinoIcons.checkmark, size: 18)
                      : null,
                  onTap: () => scope.value = option,
                ),
            ],
          ),
          GlassPullDownButton(
            icon: const Icon(CupertinoIcons.arrow_up_arrow_down),
            menuWidth: 220,
            menuAlignment: GlassMenuAlignment.topRight,
            quality: GlassQuality.minimal,
            items: [
              for (final option in ComicCatalogOrdering.values)
                GlassMenuItem(
                  title: option.label,
                  isSelected: ordering.value == option,
                  trailing: ordering.value == option
                      ? const Icon(CupertinoIcons.checkmark, size: 18)
                      : null,
                  onTap: () => ordering.value = option,
                ),
            ],
          ),
        ],
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
          PagingHelperSliverView(
            provider: provider,
            futureRefreshable: provider.future,
            notifierRefreshable: provider.notifier,
            contentBuilder: (data, widgetCount, endItemView) {
              if (data.items.isEmpty) {
                return const ContentStateSliver.empty(
                  icon: CupertinoIcons.square_grid_2x2,
                  title: '暂无漫画',
                  message: '这个分类暂时没有可显示的作品',
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
                sliver: SliverGrid.builder(
                  itemCount: widgetCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 20,
                    childAspectRatio: .61,
                  ),
                  itemBuilder: (context, index) {
                    if (index == widgetCount - 1) {
                      return endItemView;
                    }

                    final comic = data.items[index];
                    return ComicCoverCard(
                      cover: comic.cover,
                      name: comic.name,
                      author: comic.authors
                          .map((author) => author.name)
                          .join(','),
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
