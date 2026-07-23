import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/shared/presentation/widgets/cupertino_paging_sliver_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

typedef ComicSearchQuery = ({String query, ComicSearchField field});

final comicSearchResultsProvider = AsyncNotifierProvider.autoDispose.family(
  ComicSearchResultsNotifier.new,
);

class ComicSearchResultsNotifier
    extends AsyncNotifier<PagePagingData<ComicCardModel>>
    with PagePagingNotifierMixin<ComicCardModel> {
  ComicSearchResultsNotifier(this.query);

  static const pageSize = 18;
  final ComicSearchQuery query;

  @override
  Future<PagePagingData<ComicCardModel>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<ComicCardModel>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;
    final result = await ref
        .read(comicsRepositoryProvider)
        .search(
          limit: pageSize,
          offset: offset,
          query: query.query,
          field: query.field,
        );
    return PagePagingData(
      items: result.items,
      hasMore: offset + result.items.length < result.total,
      page: page,
    );
  }
}

class SearchResultsPage extends HookConsumerWidget {
  const SearchResultsPage({required this.query, super.key});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryType = useState(ComicSearchField.all);
    final titleController = useGlassLargeTitleController();
    final provider = comicSearchResultsProvider((
      query: query,
      field: queryType.value,
    ));

    return GlassScaffold(
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      appBar: GlassAppBar(
        title: Text(
          '搜索结果',
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
        actions: [
          GlassPullDownButton(
            icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
            menuWidth: 200,
            menuAlignment: GlassMenuAlignment.topRight,
            items: [
              for (final option in ComicSearchField.values)
                GlassMenuItem(
                  title: option.label,
                  isSelected: queryType.value == option,
                  trailing: queryType.value == option
                      ? const Icon(CupertinoIcons.checkmark, size: 18)
                      : null,
                  onTap: () => queryType.value = option,
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
            text: query,
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
                return ContentStateSliver.empty(
                  icon: CupertinoIcons.search,
                  title: '没有找到相关漫画',
                  message: '没有与“$query”匹配的结果',
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
                      cover: comic.coverUrl,
                      name: comic.title,
                      author: comic.authorText,
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (routeContext) => ComicDetailPage(
                              comicId: comic.id,
                              name: comic.title,
                              cover: comic.coverUrl,
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
