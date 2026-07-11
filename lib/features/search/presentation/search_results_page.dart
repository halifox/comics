import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';

enum ComicSearchField {
  all(value: '', label: '全部'),
  name(value: 'name', label: '作品名'),
  author(value: 'author', label: '作者'),
  local(value: 'local', label: '汉化组');

  const ComicSearchField({required this.value, required this.label});

  final String value;
  final String label;
}

typedef ComicSearchQuery = ({String query, String queryType});

final comicSearchResultsProvider =
    AsyncNotifierProvider.family<
      ComicSearchResultsNotifier,
      PagePagingData<ComicDto>,
      ComicSearchQuery
    >(ComicSearchResultsNotifier.new);

class ComicSearchResultsNotifier extends AsyncNotifier<PagePagingData<ComicDto>>
    with PagePagingNotifierMixin<ComicDto> {
  ComicSearchResultsNotifier(this.query);

  static const pageSize = 18;

  final ComicSearchQuery query;

  @override
  Future<PagePagingData<ComicDto>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<ComicDto>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;
    final result = await ref
        .read(comicsApiProvider)
        .search(pageSize, offset, query.query, query.queryType);

    return PagePagingData(
      items: result.list,
      hasMore: offset + result.list.length < result.total,
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
      queryType: queryType.value.value,
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
          PagingHelperSliverView(
            provider: provider,
            futureRefreshable: provider.future,
            notifierRefreshable: provider.notifier,
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
                      cover: comic.cover,
                      name: comic.name,
                      author: comic.authors
                          .map((author) => author.name)
                          .join(','),
                      badge: null,
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (routeContext) => ComicDetailPage(
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
