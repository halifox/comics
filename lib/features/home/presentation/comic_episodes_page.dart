import 'package:comics/AmbientGlowBackground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

import '../../../copy_manga/copy_manga.dart';
import 'home_sections.dart';
import 'large_title_helpers.dart';

typedef EpisodePageArgs = ({String comicId, String groupPathWord});

final episodePageProvider =
    AsyncNotifierProvider.family<
      EpisodePageNotifier,
      PagePagingData<ChapterDto>,
      EpisodePageArgs
    >(EpisodePageNotifier.new);

class EpisodePageNotifier extends AsyncNotifier<PagePagingData<ChapterDto>>
    with PagePagingNotifierMixin<ChapterDto> {
  EpisodePageNotifier(this.args);

  static const _pageSize = 100;

  final EpisodePageArgs args;

  @override
  Future<PagePagingData<ChapterDto>> build() => fetch(page: 1);

  @override
  Future<PagePagingData<ChapterDto>> fetch({required int page}) async {
    final offset = (page - 1) * _pageSize;

    final result = await ref
        .read(copyMangaApiProvider)
        .chapters(
          args.comicId,
          args.groupPathWord,
          _pageSize,
          offset,
          true,
          "",
        );

    return PagePagingData(
      items: result.list,
      hasMore: offset + result.list.length < result.total,
      page: page,
    );
  }
}

class ComicEpisodesPage extends HookConsumerWidget {
  const ComicEpisodesPage({
    required this.comicId,
    required this.comicName,
    required this.groupName,
    required this.groupPathWord,
    super.key,
  });

  final String comicId;
  final String comicName;
  final String groupName;
  final String groupPathWord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useGlassLargeTitleController();
    final selectedEpisodeId = useState<String?>(null);
    final provider = episodePageProvider((
      comicId: comicId,
      groupPathWord: groupPathWord,
    ));

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
      appBar: GlassAppBar(
        title: Text(
          groupName,
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
            text: groupName,
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              24,
              MediaQuery.paddingOf(context).top + 56,
              24,
              8,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Text(
                comicName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          PagingHelperSliverView(
            provider: provider,
            futureRefreshable: provider.future,
            notifierRefreshable: provider.notifier,
            contentBuilder: (data, widgetCount, endItemView) {
              if (data.items.isEmpty) {
                return const HomeStateView.empty(
                  icon: CupertinoIcons.book,
                  title: '暂无集数',
                  message: '这个分组暂时没有可选择的集数',
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
                sliver: SliverList.builder(
                  itemCount: widgetCount,
                  itemBuilder: (context, index) {
                    if (index == widgetCount - 1) {
                      return endItemView;
                    }

                    final episode = data.items[index];
                    return _EpisodeTile(
                      episode: episode,
                      selected: selectedEpisodeId.value == episode.uuid,
                      onTap: () => selectedEpisodeId.value = episode.uuid,
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

class _EpisodeTile extends StatelessWidget {
  const _EpisodeTile({
    required this.episode,
    required this.selected,
    required this.onTap,
  });

  final ChapterDto episode;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        padding: EdgeInsets.zero,
        child: GlassListTile(
          leading: const Icon(CupertinoIcons.book),
          title: Text(episode.name),
          subtitle: Text('章节 ID ${episode.uuid}'),
          trailing: selected
              ? const Icon(CupertinoIcons.checkmark_circle_fill)
              : GlassListTile.chevron,
          onTap: onTap,
        ),
      ),
    );
  }
}
