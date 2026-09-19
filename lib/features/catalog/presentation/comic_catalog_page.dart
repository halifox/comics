import 'package:comics/copy_manga/copy_manga_api.dart';
import 'package:comics/copy_manga/copy_manga_dto.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/comic/presentation/comic_author_names.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/shared/presentation/widgets/cupertino_paging_sliver_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

enum ComicCatalogScope {
  all(label: '全部', apiValue: ''),
  japan(label: '日漫', apiValue: 'japan'),
  korea(label: '韩漫', apiValue: 'korea'),
  west(label: '美漫', apiValue: 'west'),
  finished(label: '已完结', apiValue: 'finish');

  const ComicCatalogScope({required this.label, required this.apiValue});

  final String label;
  final String apiValue;
}

enum ComicCatalogOrdering {
  updatedDescending(label: '最近更新', apiValue: '-datetime_updated'),
  popularDescending(label: '热门更新', apiValue: '-popular');

  const ComicCatalogOrdering({required this.label, required this.apiValue});

  final String label;
  final String apiValue;
}

typedef ComicCatalogFilter = ({
  String? theme,
  String? author,
  ComicCatalogScope scope,
  ComicCatalogOrdering ordering,
});

final comicCatalogProvider =
    AsyncNotifierProvider.autoDispose.family<
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
    final result = await ref.read(comicsApiProvider).comics(
      limit: pageSize,
      offset: offset,
      ordering: filter.ordering.apiValue,
      theme: filter.theme,
      top: filter.scope.apiValue,
      author: filter.author,
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
    this.initialScope = ComicCatalogScope.all,
    this.initialOrdering = ComicCatalogOrdering.updatedDescending,
    this.showActions = true,
    this.theme,
    this.author,
    super.key,
  }) : assert(theme == null || author == null, 'theme 和 author 不能同时提供');

  final String title;
  final ComicCatalogScope initialScope;
  final ComicCatalogOrdering initialOrdering;
  final bool showActions;
  final String? theme;
  final String? author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scope = useState(initialScope);
    final ordering = useState(initialOrdering);
    final titleController = useGlassLargeTitleController();
    final filter = (
      theme: theme,
      author: author,
      scope: scope.value,
      ordering: ordering.value,
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: showActions
            ? [
                GlassPullDownButton(
                  icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
                  menuWidth: 200,
                  menuAlignment: GlassMenuAlignment.topRight,
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
              ]
            : const [],
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
          CupertinoPagingSliverView(
            state: ref.watch(provider),
            onLoadNext: () => ref.read(provider.notifier).loadNext(),
            onRetry: () => ref.read(provider.notifier).forceRefresh(),
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
                      author: comicAuthorNames(authors: comic.authors),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (routeContext) => ComicDetailPage(
                              comicId: comic.pathWord,
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
