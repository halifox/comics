import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/shared/presentation/widgets/cupertino_paging_sliver_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class NewReleaseEntry {
  const NewReleaseEntry({
    required this.name,
    required this.datetimeCreated,
    required this.comic,
  });

  factory NewReleaseEntry.fromJson({
    required Map<String, dynamic> json,
  }) {
    final comicJson = json['comic'];
    return NewReleaseEntry(
      name: json['name'] as String? ?? '',
      datetimeCreated: json['datetime_created'] as String? ?? '',
      comic: comicJson is Map<String, dynamic>
          ? HomeComicDto.fromJson(comicJson)
          : const HomeComicDto(),
    );
  }

  final String name;
  final String datetimeCreated;
  final HomeComicDto comic;
}

class NewReleaseResult {
  const NewReleaseResult({
    required this.list,
    required this.total,
    required this.limit,
    required this.offset,
  });

  factory NewReleaseResult.fromJson({
    required Map<String, dynamic> json,
  }) {
    final items = json['list'];
    return NewReleaseResult(
      list: items is List
          ? items
                .whereType<Map<String, dynamic>>()
                .map((json) => NewReleaseEntry.fromJson(json: json))
                .toList()
          : const [],
      total: json['total'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
      offset: json['offset'] as int? ?? 0,
    );
  }

  final List<NewReleaseEntry> list;
  final int total;
  final int limit;
  final int offset;
}

class NewReleaseApi {
  const NewReleaseApi({required this.dio});

  final Dio dio;

  Future<NewReleaseResult> newest({
    required int limit,
    required int offset,
    String date = '',
    int platform = 3,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      'https://api.copy202601.com/api/v3/update/newest',
      queryParameters: {
        'date': date,
        'limit': limit,
        'offset': offset,
        'platform': platform,
      },
    );
    return NewReleaseResult.fromJson(json: response.data ?? const {});
  }
}

final newReleaseApiProvider = Provider<NewReleaseApi>(
  (ref) => NewReleaseApi(dio: ref.watch(copyMangaDioProvider)),
);

final newReleaseProvider =
    AsyncNotifierProvider<
      NewReleaseNotifier,
      PagePagingData<NewReleaseEntry>
    >(NewReleaseNotifier.new);

class NewReleaseNotifier extends AsyncNotifier<PagePagingData<NewReleaseEntry>>
    with PagePagingNotifierMixin<NewReleaseEntry> {
  static const pageSize = 18;

  @override
  Future<PagePagingData<NewReleaseEntry>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<NewReleaseEntry>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;
    final result = await ref
        .read(newReleaseApiProvider)
        .newest(limit: pageSize, offset: offset);

    return PagePagingData(
      items: result.list,
      hasMore: offset + result.list.length < result.total,
      page: page,
    );
  }
}

class NewReleasePage extends HookConsumerWidget {
  const NewReleasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useGlassLargeTitleController();

    return GlassScaffold(
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      appBar: GlassAppBar(
        title: Text(
          '全新上架',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.label.resolveFrom(context),
          ),
        ),
        centerTitle: false,
        largeTitleController: titleController,
        leading: Semantics(
          button: true,
          label: '返回',
          child: GlassIconButton(
            icon: const Icon(CupertinoIcons.chevron_back),
            useOwnLayer: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: titleController.scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: '全新上架',
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              24,
              MediaQuery.paddingOf(context).top + 44,
              24,
              8,
            ),
          ),
          CupertinoPagingSliverView(
            state: ref.watch(newReleaseProvider),
            onLoadNext: () => ref.read(newReleaseProvider.notifier).loadNext(),
            onRetry: () =>
                ref.read(newReleaseProvider.notifier).forceRefresh(),
            contentBuilder: (data, widgetCount, endItemView) {
              if (data.items.isEmpty) {
                return const ContentStateSliver.empty(
                  icon: CupertinoIcons.sparkles,
                  title: '暂无新作',
                  message: '暂时没有新上架的漫画',
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

                    final entry = data.items[index];
                    final comic = entry.comic;
                    return ComicCoverCard(
                      cover: comic.cover,
                      name: comic.name,
                      author: comic.authors
                          .map((author) => author.name)
                          .join(','),
                      badge: entry.name.isEmpty ? null : entry.name,
                      onTap: () {
                        if (comic.pathWord.isEmpty) return;
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
