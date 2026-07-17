import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/reader/presentation/reader_settings_page.dart';
import 'package:comics/shared/presentation/widgets/cached_image_feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../application/reader_settings_provider.dart';

typedef ChapterReaderQuery = ({String comicId, String chapterId});

final chapterReaderProvider =
    FutureProvider.family<ReaderChapterModel, ChapterReaderQuery>((ref, args) {
      return ref
          .watch(comicsRepositoryProvider)
          .getChapter(comicId: args.comicId, chapterId: args.chapterId);
    });

class ChapterReaderPage extends HookConsumerWidget {
  const ChapterReaderPage({
    required this.comicId,
    required this.comicName,
    required this.comicCover,
    required this.comicAuthor,
    required this.groupName,
    required this.groupPathWord,
    required this.chapterId,
    required this.chapterName,
    this.initialPageIndex = 0,
    super.key,
  });

  final String comicId;
  final String comicName;
  final String comicCover;
  final String comicAuthor;
  final String groupName;
  final String groupPathWord;
  final String chapterId;
  final String chapterName;
  final int initialPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapter = ref.watch(
      chapterReaderProvider((comicId: comicId, chapterId: chapterId)),
    );
    final settings = ref.watch(readerSettingsProvider);
    final background = settings.background;
    final database = ref.read(libraryDatabaseProvider);
    final currentPageIndex = useRef(initialPageIndex);
    final displayedPageIndex = useState(initialPageIndex);
    final controlsVisible = useState(true);
    final saveTimer = useRef<Timer?>(null);

    Future<void> saveProgress({required int pageIndex}) {
      return database.recordReading(
        comic: ComicMetadata(
          pathWord: comicId,
          name: comicName,
          cover: comicCover,
          author: comicAuthor,
        ),
        chapterId: chapterId,
        chapterName: chapterName,
        groupName: groupName,
        groupPathWord: groupPathWord,
        pageIndex: pageIndex,
      );
    }

    void onPageChanged(int pageIndex) {
      if (currentPageIndex.value == pageIndex) {
        return;
      }
      currentPageIndex.value = pageIndex;
      displayedPageIndex.value = pageIndex;
      saveTimer.value?.cancel();
      saveTimer.value = Timer(const Duration(milliseconds: 600), () {
        unawaited(saveProgress(pageIndex: pageIndex));
      });
    }

    useEffect(() {
      unawaited(saveProgress(pageIndex: initialPageIndex));
      return () {
        saveTimer.value?.cancel();
        unawaited(saveProgress(pageIndex: currentPageIndex.value));
      };
    }, [comicId, chapterId, initialPageIndex]);

    return CupertinoTheme(
      data: CupertinoTheme.of(
        context,
      ).copyWith(brightness: background.brightness),
      child: GlassScaffold(
        edgeToEdge: true,
        contentAwareBrightness: false,
        statusBarStyle: GlassStatusBarStyle.auto,
        background: ColoredBox(color: background.color),
        body: Stack(
          children: [
            Positioned.fill(
              child: chapter.when(
                loading: () => const CustomScrollView(
                  slivers: [ContentStateSliver.loading()],
                ),
                error: (error, stackTrace) => CustomScrollView(
                  slivers: [
                    ContentStateSliver.error(
                      error: error,
                      onRetry: () => ref.invalidate(
                        chapterReaderProvider((
                          comicId: comicId,
                          chapterId: chapterId,
                        )),
                      ),
                    ),
                  ],
                ),
                data: (data) {
                  final images = data.imageUrls;
                  if (images.isEmpty) {
                    return const CustomScrollView(
                      slivers: [
                        ContentStateSliver.empty(
                          icon: CupertinoIcons.photo,
                          title: '暂无图片',
                          message: '这一章节暂时没有可显示的图片',
                        ),
                      ],
                    );
                  }

                  final restoredPageIndex = currentPageIndex.value
                      .clamp(0, images.length - 1)
                      .toInt();
                  final visiblePageNumber =
                      displayedPageIndex.value.clamp(0, images.length - 1) + 1;

                  final reader = switch (settings.mode) {
                    ReaderMode.continuous => ContinuousReader(
                      images: images,
                      initialPageIndex: restoredPageIndex,
                      onPageChanged: onPageChanged,
                      onToggleControls: () {
                        controlsVisible.value = !controlsVisible.value;
                      },
                    ),
                    ReaderMode.paged => PagedReader(
                      images: images,
                      initialPageIndex: restoredPageIndex,
                      onPageChanged: onPageChanged,
                      onToggleControls: () {
                        controlsVisible.value = !controlsVisible.value;
                      },
                    ),
                    ReaderMode.manga => PagedReader(
                      images: images,
                      initialPageIndex: restoredPageIndex,
                      onPageChanged: onPageChanged,
                      onToggleControls: () {
                        controlsVisible.value = !controlsVisible.value;
                      },
                      reverse: true,
                    ),
                  };

                  return Stack(
                    children: [
                      Positioned.fill(child: reader),
                      PositionedDirectional(
                        end: 12,
                        bottom: MediaQuery.paddingOf(context).bottom + 12,
                        child: IgnorePointer(
                          child: GlassContainer(
                            padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            quality: GlassQuality.premium,
                            useOwnLayer: true,
                            child: Builder(
                              builder: (context) {
                                return Text(
                                  '$visiblePageNumber / ${images.length}',
                                  style: TextStyle(
                                    color: CupertinoColors.label.resolveFrom(
                                      context,
                                    ),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFeatures: [
                                      FontFeature.tabularFigures(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            if (controlsVisible.value)
              PositionedDirectional(
                top: 0,
                start: 0,
                end: 0,
                child: GlassAppBar(
                  title: Builder(
                    builder: (themedContext) => Text(
                      '$comicName · $groupName · $chapterName',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.label.resolveFrom(themedContext),
                      ),
                    ),
                  ),
                  centerTitle: false,
                  leading: Semantics(
                    button: true,
                    label: '返回',
                    child: GlassIconButton(
                      icon: const Icon(CupertinoIcons.chevron_back),
                      useOwnLayer: true,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  actions: [
                    Semantics(
                      button: true,
                      label: '阅读设置',
                      child: GlassIconButton(
                        icon: const Icon(CupertinoIcons.slider_horizontal_3),
                        useOwnLayer: true,
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute<void>(
                              builder: (context) => const ReaderSettingsPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ContinuousReader extends HookWidget {
  const ContinuousReader({
    required this.images,
    required this.initialPageIndex,
    required this.onPageChanged,
    required this.onToggleControls,
  });

  final List<String> images;
  final int initialPageIndex;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onToggleControls;

  @override
  Widget build(BuildContext context) {
    final positionsListener = useMemoized(ItemPositionsListener.create);
    final lastReportedPage = useRef(initialPageIndex);

    useEffect(() {
      void reportVisiblePage() {
        final visible =
            positionsListener.itemPositions.value
                .where(
                  (position) =>
                      position.itemTrailingEdge > 0 &&
                      position.itemLeadingEdge < 1,
                )
                .toList()
              ..sort(
                (first, second) =>
                    first.itemLeadingEdge.compareTo(second.itemLeadingEdge),
              );
        if (visible.isEmpty) {
          return;
        }

        final page =
            visible
                .where((position) => position.itemLeadingEdge <= 0)
                .fold<ItemPosition?>(
                  null,
                  (current, position) =>
                      current == null ||
                          position.itemLeadingEdge > current.itemLeadingEdge
                      ? position
                      : current,
                )
                ?.index ??
            visible.first.index;
        if (page == lastReportedPage.value) {
          return;
        }
        lastReportedPage.value = page;
        onPageChanged(page);
        preloadFollowing(context: context, images: images, index: page);
      }

      positionsListener.itemPositions.addListener(reportVisiblePage);
      return () {
        positionsListener.itemPositions.removeListener(reportVisiblePage);
      };
    }, [images, positionsListener]);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onToggleControls,
      child: ScrollablePositionedList.builder(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top + 52,
          bottom: MediaQuery.paddingOf(context).bottom,
        ),
        initialScrollIndex: initialPageIndex,
        itemPositionsListener: positionsListener,
        itemCount: images.length,
        itemBuilder: (context, index) => ChapterImage(
          imageUrl: images[index],
          onBuilt: () =>
              preloadFollowing(context: context, images: images, index: index),
        ),
      ),
    );
  }
}

class PagedReader extends HookWidget {
  const PagedReader({
    required this.images,
    required this.initialPageIndex,
    required this.onPageChanged,
    required this.onToggleControls,
    this.reverse = false,
  });

  final List<String> images;
  final int initialPageIndex;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onToggleControls;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final pagingLocked = useState(false);
    final currentPage = useState(initialPageIndex);
    final pageController = usePageController(initialPage: initialPageIndex);

    void moveToPage({required int page}) {
      if (!pageController.hasClients || page < 0 || page >= images.length) {
        return;
      }
      unawaited(
        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
        ),
      );
    }

    void handleTap(TapUpDetails details) {
      final width = MediaQuery.sizeOf(context).width;
      final horizontalPosition = details.localPosition.dx;
      if (horizontalPosition < width / 3) {
        moveToPage(page: currentPage.value + (reverse ? 1 : -1));
      } else if (horizontalPosition > width * 2 / 3) {
        moveToPage(page: currentPage.value + (reverse ? -1 : 1));
      } else {
        onToggleControls();
      }
    }

    void setPagingLocked(bool value) {
      if (pagingLocked.value == value) return;
      pagingLocked.value = value;
      if (value) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted || !pageController.hasClients) return;
        unawaited(
          pageController.animateToPage(
            currentPage.value,
            duration: const Duration(milliseconds: 140),
            curve: Curves.easeOut,
          ),
        );
      });
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        preloadFollowing(
          context: context,
          images: images,
          index: initialPageIndex,
        );
      });
      return null;
    }, [images]);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapUp: handleTap,
      child: PageView.builder(
        controller: pageController,
        reverse: reverse,
        physics: pagingLocked.value
            ? const NeverScrollableScrollPhysics()
            : null,
        itemCount: images.length,
        onPageChanged: (index) {
          currentPage.value = index;
          onPageChanged(index);
          preloadFollowing(context: context, images: images, index: index);
        },
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 52,
            bottom: MediaQuery.paddingOf(context).bottom,
          ),
          child: ZoomableChapterImage(
            imageUrl: images[index],
            onPagingLockChanged: setPagingLocked,
          ),
        ),
      ),
    );
  }
}

class ZoomableChapterImage extends HookWidget {
  const ZoomableChapterImage({
    required this.imageUrl,
    required this.onPagingLockChanged,
  });

  final String imageUrl;
  final ValueChanged<bool> onPagingLockChanged;

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(TransformationController.new);
    final isZoomed = useState(false);
    final activePointers = useRef(<int>{});

    useEffect(() {
      return controller.dispose;
    }, [controller]);

    void updateZoomState() {
      final zoomed = controller.value.getMaxScaleOnAxis() > 1.01;
      if (isZoomed.value != zoomed) isZoomed.value = zoomed;
    }

    void removePointer({required int pointer}) {
      activePointers.value.remove(pointer);
      if (activePointers.value.isEmpty && !isZoomed.value) {
        onPagingLockChanged(false);
      }
    }

    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (event) {
        activePointers.value.add(event.pointer);
        if (activePointers.value.length >= 2) onPagingLockChanged(true);
      },
      onPointerUp: (event) => removePointer(pointer: event.pointer),
      onPointerCancel: (event) => removePointer(pointer: event.pointer),
      child: InteractiveViewer(
        transformationController: controller,
        minScale: 1,
        maxScale: 4,
        panEnabled: isZoomed.value,
        scaleEnabled: true,
        clipBehavior: Clip.hardEdge,
        onInteractionStart: (details) {
          if (details.pointerCount >= 2 || isZoomed.value) {
            onPagingLockChanged(true);
          }
        },
        onInteractionUpdate: (details) {
          updateZoomState();
          if (details.pointerCount >= 2 || isZoomed.value) {
            onPagingLockChanged(true);
          }
        },
        onInteractionEnd: (_) {
          updateZoomState();
          onPagingLockChanged(
            isZoomed.value || activePointers.value.isNotEmpty,
          );
          if (!isZoomed.value) controller.value = Matrix4.identity();
        },
        child: SizedBox.expand(
          child: ChapterImage(imageUrl: imageUrl, expand: true),
        ),
      ),
    );
  }
}

class ChapterImage extends HookWidget {
  const ChapterImage({
    required this.imageUrl,
    this.onBuilt,
    this.expand = false,
  });

  final String imageUrl;
  final VoidCallback? onBuilt;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      onBuilt?.call();
      return null;
    }, [imageUrl]);

    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: double.infinity,
      height: expand ? double.infinity : null,
      fit: BoxFit.contain,
      progressIndicatorBuilder: (context, url, progress) => expand
          ? SizedBox.expand(
              child: CachedImageLoading(progress: progress.progress),
            )
          : SizedBox(
              height: 320,
              child: CachedImageLoading(progress: progress.progress),
            ),
      errorWidget: (context, url, error) => expand
          ? const SizedBox.expand(child: CachedImageError())
          : const SizedBox(height: 320, child: CachedImageError()),
    );
    return image;
  }
}

void preloadFollowing({
  required BuildContext context,
  required List<String> images,
  required int index,
}) {
  final end = (index + 5).clamp(0, images.length);
  for (var next = index + 1; next < end; next++) {
    unawaited(
      precacheImage(
        CachedNetworkImageProvider(images[next]),
        context,
      ).catchError((_) {}),
    );
  }
}
