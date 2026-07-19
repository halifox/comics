import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/shared/presentation/hooks/glass_large_title_hook.dart';
import 'package:comics/shared/presentation/widgets/ambient_glow_background.dart';
import 'package:comics/shared/presentation/widgets/cupertino_paging_sliver_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

final newReleaseProvider =
    AsyncNotifierProvider<
      NewReleaseNotifier,
      PagePagingData<NewReleaseModel>
    >(NewReleaseNotifier.new);

class NewReleaseNotifier extends AsyncNotifier<PagePagingData<NewReleaseModel>>
    with PagePagingNotifierMixin<NewReleaseModel> {
  static const pageSize = 18;

  @override
  Future<PagePagingData<NewReleaseModel>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<NewReleaseModel>> fetch({required int page}) async {
    final offset = (page - 1) * pageSize;
    final result = await ref
        .read(comicsRepositoryProvider)
        .getNewReleases(limit: pageSize, offset: offset);
    return PagePagingData(
      items: result.items,
      hasMore: offset + result.items.length < result.total,
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
                      cover: comic.coverUrl,
                      name: comic.title,
                      author: comic.authorText,
                      badge: entry.badge,
                      onTap: () {
                        if (comic.id.isEmpty) return;
                        Navigator.of(context).push(
                          CupertinoPageRoute<void>(
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
