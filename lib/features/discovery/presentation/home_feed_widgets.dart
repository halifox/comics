import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';

const horizontalPadding = 20.0;

class HomeFeedContent extends StatelessWidget {
  const HomeFeedContent({required this.data, super.key});

  final HomeResultDto data;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        HorizontalComicSection(
          title: '推荐',
          comics: data.recommended.list.map((item) => item.comic).toList(),
        ),
        HorizontalComicSection(
          title: '热门更新',
          comics: data.hot.map((item) => item.comic).toList(),
        ),
        HorizontalComicSection(
          title: '最新更新',
          comics: data.latest.map((item) => item.comic).toList(),
        ),
        HorizontalComicSection(title: '已完结', comics: data.finished.list),
        HorizontalComicSection(
          title: '日榜',
          comics: data.rankDay.list.map((item) => item.comic).toList(),
          badges: data.rankDay.list.map((item) => '${item.sort}').toList(),
        ),
        HorizontalComicSection(
          title: '周榜',
          comics: data.rankWeek.list.map((item) => item.comic).toList(),
          badges: data.rankWeek.list.map((item) => '${item.sort}').toList(),
        ),
        HorizontalComicSection(
          title: '月榜',
          comics: data.rankMonth.list.map((item) => item.comic).toList(),
          badges: data.rankMonth.list.map((item) => '${item.sort}').toList(),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 92)),
      ],
    );
  }
}

class HorizontalComicSection extends HookWidget {
  const HorizontalComicSection({
    required this.title,
    required this.comics,
    this.badges,
  });

  final String title;
  final List<HomeComicDto> comics;
  final List<String>? badges;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(viewportFraction: .88);

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
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
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: PageView.builder(
                key: PageStorageKey<String>('PageView-${title}'),
                controller: pageController,
                padEnds: false,
                physics: const LeadingAlignedPagePhysics(viewportFraction: .82),
                itemCount: comics.isEmpty ? 0 : comics.length + 1,
                itemBuilder: (context, index) {
                  if (index == comics.length) {
                    return const EndOfCarouselCard();
                  }

                  final comic = comics[index];

                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      final page = pageController.hasClients
                          ? pageController.page ?? 0
                          : 0.0;
                      final distance = (page - index).abs().clamp(0.0, 1.0);

                      return Padding(
                        padding: const EdgeInsets.only(right: 14, bottom: 12),
                        child: Transform.scale(
                          alignment: Alignment.centerLeft,
                          scale: 1 - distance * .1,
                          child: Opacity(
                            opacity: 1 - distance * .18,
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: ComicCoverCard(
                      cover: comic.cover,
                      name: comic.name,
                      author: comic.authors
                          .map((author) => author.name)
                          .join(','),
                      badge: null,
                      onTap: () async {
                        final page = pageController.hasClients
                            ? pageController.page ?? 0
                            : 0.0;
                        final isLeading = (page - index).abs() < .01;

                        if (!isLeading) {
                          await pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOutCubic,
                          );
                          return;
                        }

                        if (comic.pathWord.isEmpty) return;
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
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
      ],
    );
  }
}

class EndOfCarouselCard extends StatelessWidget {
  const EndOfCarouselCard();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 2, bottom: 12),
        child: SizedBox(
          width: 62,
          height: double.infinity,
          child: GlassContainer(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            shape: const LiquidRoundedSuperellipse(borderRadius: 26),
            quality: GlassQuality.minimal,
            useOwnLayer: true,
            alignment: .center,
            child: Text(
              '没\n有\n更\n多\n了',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LeadingAlignedPagePhysics extends PageScrollPhysics {
  const LeadingAlignedPagePhysics({
    required this.viewportFraction,
    super.parent,
  });

  final double viewportFraction;

  @override
  LeadingAlignedPagePhysics applyTo(ScrollPhysics? ancestor) {
    return LeadingAlignedPagePhysics(
      viewportFraction: viewportFraction,
      parent: buildParent(ancestor),
    );
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    final trailingPlaceholderExtent =
        position.viewportDimension * (2 * viewportFraction - 1);
    final maxLeadingOffset =
        position.maxScrollExtent - trailingPlaceholderExtent;

    if (value > maxLeadingOffset && position.pixels <= maxLeadingOffset) {
      return value - maxLeadingOffset;
    }
    if (position.pixels > maxLeadingOffset && value > position.pixels) {
      return value - position.pixels;
    }

    return super.applyBoundaryConditions(position, value);
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
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

class ComicCoverCard extends StatelessWidget {
  const ComicCoverCard({
    required this.cover,
    required this.name,
    required this.author,
    required this.badge,
    required this.onTap,
    super.key,
  });

  final String cover;
  final String name;
  final String author;
  final String? badge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      pressedOpacity: .72,
      borderRadius: BorderRadius.circular(26),
      onPressed: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: cover,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorWidget: (_, _, _) => ColoredBox(
                color: CupertinoColors.systemFill.resolveFrom(context),
                child: const Icon(CupertinoIcons.book, size: 42),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, .55, 1],
                  colors: [
                    Color(0x00000000),
                    Color(0x12000000),
                    Color(0x5F000000),
                  ],
                ),
              ),
            ),
            if (badge != null)
              Positioned(
                top: 8,
                right: 8,
                child: GlassContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  shape: const LiquidRoundedSuperellipse(borderRadius: 26),
                  quality: GlassQuality.minimal,
                  useOwnLayer: true,
                  child: Text(
                    badge!,
                    style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
              ),
            Positioned(
              left: 4,
              right: 4,
              bottom: 4,
              child: GlassContainer(
                padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
                shape: const LiquidRoundedSuperellipse(borderRadius: 26),
                quality: GlassQuality.minimal,
                useOwnLayer: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: CupertinoColors.white.withValues(alpha: .9),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef ErrorPresentation = (IconData icon, String title, String message);

class ContentStateSliver extends StatelessWidget {
  const ContentStateSliver.loading({super.key})
    : icon = CupertinoIcons.circle,
      title = '正在加载',
      message = '正在获取内容，请稍候',
      iconColor = const Color(0xFFFF5A5F),
      loading = true;

  factory ContentStateSliver.error(Object error, {Key? key}) {
    final presentation = errorPresentation(error);
    return ContentStateSliver.internal(
      key: key,
      icon: presentation.$1,
      title: presentation.$2,
      message: presentation.$3,
      iconColor: Color(0xFF8B5CF6),
      loading: false,
    );
  }

  const ContentStateSliver.internal({
    required this.icon,
    required this.title,
    required this.message,
    required this.iconColor,
    required this.loading,
    super.key,
  });

  const ContentStateSliver.empty({
    required IconData icon,
    required String title,
    required String message,
    super.key,
  }) : icon = icon,
       title = title,
       message = message,
       iconColor = const Color(0xFFFF5A5F),
       loading = false;

  final IconData icon;
  final String title;
  final String message;
  final Color iconColor;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              loading
                  ? const Center(
                      child: GlassProgressIndicator.circular(
                        size: 40,
                        useOwnLayer: true,
                      ),
                    )
                  : Icon(icon, size: 48, color: iconColor),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static ErrorPresentation errorPresentation(Object error) {
    if (error is DioException) {
      final message = responsePayloadMessage(error);

      if (error.type == DioExceptionType.badResponse) {
        return switch (error.response?.statusCode) {
          210 => (CupertinoIcons.shield_fill, '访问受限', message),
          400 => (
            CupertinoIcons.exclamationmark_triangle_fill,
            '请求有误',
            message,
          ),
          401 => (
            CupertinoIcons.person_crop_circle_badge_exclam,
            '登录已失效',
            message,
          ),
          403 => (CupertinoIcons.lock_shield_fill, '无权访问', message),
          404 => (CupertinoIcons.search_circle, '内容不存在', message),
          405 => (
            CupertinoIcons.exclamationmark_triangle_fill,
            '请求不受支持',
            message,
          ),
          408 => (CupertinoIcons.clock_fill, '请求超时', message),
          409 => (
            CupertinoIcons.exclamationmark_triangle_fill,
            '请求冲突',
            message,
          ),
          422 => (CupertinoIcons.doc_text_search, '内容无法处理', message),
          429 => (CupertinoIcons.hourglass, '请求过于频繁', message),
          int code when code >= 500 => (
            CupertinoIcons.gear_solid,
            '服务异常',
            message,
          ),
          _ => (CupertinoIcons.exclamationmark_triangle_fill, '加载失败', message),
        };
      }

      return switch (error.type) {
        DioExceptionType.connectionTimeout => (
          CupertinoIcons.clock_fill,
          '连接超时',
          message,
        ),
        DioExceptionType.sendTimeout => (
          CupertinoIcons.arrow_up_circle_fill,
          '发送超时',
          message,
        ),
        DioExceptionType.receiveTimeout => (
          CupertinoIcons.arrow_down_circle_fill,
          '响应超时',
          message,
        ),
        DioExceptionType.connectionError => (
          CupertinoIcons.wifi_exclamationmark,
          '网络不可用',
          message,
        ),
        DioExceptionType.badCertificate => (
          CupertinoIcons.lock_shield_fill,
          '安全连接失败',
          message,
        ),
        DioExceptionType.cancel => (
          CupertinoIcons.xmark_circle_fill,
          '请求已取消',
          message,
        ),
        DioExceptionType.transformTimeout => (
          CupertinoIcons.clock_fill,
          '数据处理超时',
          message,
        ),
        DioExceptionType.badResponse => (
          CupertinoIcons.exclamationmark_triangle_fill,
          '加载失败',
          message,
        ),
        DioExceptionType.unknown => (
          error.error is FormatException || error.error is TypeError
              ? CupertinoIcons.doc_text_search
              : CupertinoIcons.exclamationmark_triangle_fill,
          error.error is FormatException || error.error is TypeError
              ? '数据异常'
              : '网络异常',
          message,
        ),
      };
    }

    return switch (error) {
      FormatException() ||
      TypeError() => (CupertinoIcons.doc_text_search, '数据异常', ''),
      StateError() => (CupertinoIcons.gear_solid, '状态异常', ''),
      _ => (CupertinoIcons.exclamationmark_triangle_fill, '出现问题', ''),
    };
  }

  static String responsePayloadMessage(DioException error) {
    final data = error.response?.data;
    if (data is Map) {
      for (final key in const ['message', 'detail', 'error']) {
        final value = data[key];
        if (value is String && value.trim().isNotEmpty) {
          return value.trim();
        }
      }
    }

    final statusMessage = error.response?.statusMessage?.trim();
    if (statusMessage != null && statusMessage.isNotEmpty) {
      return statusMessage;
    }

    return "";
  }
}
