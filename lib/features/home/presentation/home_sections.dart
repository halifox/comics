import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../../app/app_theme.dart';
import '../../../copy_manga/copy_manga.dart';

const _horizontalPadding = 20.0;

class HomeContent extends StatelessWidget {
  const HomeContent({required this.data, super.key});

  final HomeResultDto data;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const _SectionHeader('首页推荐'),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 324,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              itemCount: data.recommended.list.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, index) =>
                  _UpNextCard(comic: data.recommended.list[index].comic),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const _SectionHeader('热门更新'),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              itemCount: data.hot.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, index) => _WideUpdateCard(item: data.hot[index]),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const _SectionHeader('最新更新'),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverList.separated(
          itemCount: data.latest.length,
          separatorBuilder: (_, _) => Divider(
            height: 1,
            indent: 76,
            color: CupertinoColors.separator.resolveFrom(context),
          ),
          itemBuilder: (_, index) => _RecentRow(item: data.latest[index]),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const _SectionHeader('已完结'),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 155,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              itemCount: data.finished.list.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (_, index) =>
                  _ComicCard(comic: data.finished.list[index]),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const _SectionHeader('日榜'),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 155,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              itemCount: data.rankDay.list.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (_, index) =>
                  _RankCard(item: data.rankDay.list[index]),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const _SectionHeader('周榜'),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 155,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              itemCount: data.rankWeek.list.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (_, index) =>
                  _RankCard(item: data.rankWeek.list[index]),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const _SectionHeader('月榜'),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 155,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
              ),
              itemCount: data.rankMonth.list.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (_, index) =>
                  _RankCard(item: data.rankMonth.list[index]),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 124)),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              CupertinoIcons.chevron_right,
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _UpNextCard extends StatelessWidget {
  const _UpNextCard({required this.comic});

  final HomeComicDto comic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 220,
              height: 238,
              child: _NetworkImage(url: comic.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            comic.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 3),
          Text(
            _authorOf(comic),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            comic.lastChapterName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: CopyColors.violet,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _WideUpdateCard extends StatelessWidget {
  const _WideUpdateCard({required this.item});

  final HomeUpdateDto item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemBackground.resolveFrom(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 96,
              height: 140,
              child: _NetworkImage(url: item.comic.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.comic.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RankCard extends StatelessWidget {
  const _RankCard({required this.item});

  final HomeRankItemDto item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 108,
              height: 108,
              child: _NetworkImage(url: item.comic.cover),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            item.comic.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _ComicCard extends StatelessWidget {
  const _ComicCard({required this.comic});

  final HomeComicDto comic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 108,
              height: 108,
              child: _NetworkImage(url: comic.cover),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            comic.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _RecentRow extends StatelessWidget {
  const _RecentRow({required this.item});

  final HomeUpdateDto item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(_horizontalPadding, 10, 16, 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 48,
              height: 64,
              child: _NetworkImage(url: item.comic.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.comic.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      placeholder: (context, _) => ColoredBox(
        color: CupertinoColors.secondarySystemBackground.resolveFrom(context),
        child: const Center(child: GlassProgressIndicator.circular()),
      ),
      errorWidget: (context, _, _) => ColoredBox(
        color: CupertinoColors.secondarySystemBackground.resolveFrom(context),
        child: Icon(
          CupertinoIcons.book,
          color: CupertinoColors.tertiaryLabel.resolveFrom(context),
          size: 28,
        ),
      ),
    );
  }
}

String _authorOf(HomeComicDto comic) {
  if (comic.authorAlias.isNotEmpty) return comic.authorAlias;
  return comic.authors.map((author) => author.name).join(' · ');
}

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: GlassProgressIndicator.circular(size: 30));
  }
}

class HomeErrorView extends StatelessWidget {
  const HomeErrorView({
    required this.message,
    required this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.wifi_exclamationmark,
              size: 42,
              color: CopyColors.violet,
            ),
            const SizedBox(height: 16),
            const Text(
              '首页暂时走丢了',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
            const SizedBox(height: 20),
            GlassButton.custom(
              onTap: onRetry,
              width: 132,
              height: 44,
              useOwnLayer: true,
              child: const Text('重新加载'),
            ),
          ],
        ),
      ),
    );
  }
}
