import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/library/application/comic_library_providers.dart';
import 'package:comics/features/library/data/library_database.dart';
import 'package:comics/features/reader/presentation/reader_settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:comics/copy_manga/copy_manga.dart';
import '../application/reader_settings_provider.dart';

typedef ChapterReaderQuery = ({String comicId, String chapterId});

final chapterReaderProvider =
    FutureProvider.family<ChapterContentResultDto, ChapterReaderQuery>((
      ref,
      args,
    ) {
      return ref.watch(comicsApiProvider).chapter(args.comicId, args.chapterId);
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
    final saveTimer = useRef<Timer?>(null);

    Future<void> saveProgress(int pageIndex) {
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
      saveTimer.value?.cancel();
      saveTimer.value = Timer(const Duration(milliseconds: 600), () {
        unawaited(saveProgress(pageIndex));
      });
    }

    useEffect(() {
      unawaited(saveProgress(initialPageIndex));
      return () {
        saveTimer.value?.cancel();
        unawaited(saveProgress(currentPageIndex.value));
      };
    }, [comicId, chapterId, initialPageIndex]);

    return CupertinoTheme(
      data: CupertinoTheme.of(
        context,
      ).copyWith(brightness: background.brightness),
      child: GlassScaffold(
        edgeToEdge: true,
        contentAwareBrightness: true,
        statusBarStyle: GlassStatusBarStyle.auto,
        background: ColoredBox(color: background.color),
        appBar: GlassAppBar(
          title: Text(
            '$comicName · $groupName · $chapterName',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: background.brightness == Brightness.dark
                  ? CupertinoColors.white
                  : CupertinoColors.label.resolveFrom(context),
            ),
          ),
          centerTitle: false,
          leading: GlassIconButton(
            icon: const Icon(CupertinoIcons.chevron_back),
            useOwnLayer: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            GlassIconButton(
              icon: const Icon(CupertinoIcons.slider_horizontal_3),
              useOwnLayer: true,
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (_) => const ReaderSettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: chapter.when(
          loading: () =>
              const CustomScrollView(slivers: [ContentStateSliver.loading()]),
          error: (error, _) =>
              CustomScrollView(slivers: [ContentStateSliver.error(error)]),
          data: (data) {
            final images = orderedImageUrls(data.chapter);
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

            return switch (settings.mode) {
              ReaderMode.continuous => ContinuousReader(
                images: images,
                initialPageIndex: restoredPageIndex,
                onPageChanged: onPageChanged,
              ),
              ReaderMode.paged => PagedReader(
                images: images,
                initialPageIndex: restoredPageIndex,
                onPageChanged: onPageChanged,
              ),
              ReaderMode.manga => PagedReader(
                images: images,
                initialPageIndex: restoredPageIndex,
                onPageChanged: onPageChanged,
                reverse: true,
              ),
            };
          },
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
  });

  final List<String> images;
  final int initialPageIndex;
  final ValueChanged<int> onPageChanged;

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
        preloadFollowing(context, images, page);
      }

      positionsListener.itemPositions.addListener(reportVisiblePage);
      return () {
        positionsListener.itemPositions.removeListener(reportVisiblePage);
      };
    }, [images, positionsListener]);

    return ScrollablePositionedList.builder(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 52,
        bottom: MediaQuery.paddingOf(context).bottom,
      ),
      initialScrollIndex: initialPageIndex,
      itemPositionsListener: positionsListener,
      itemCount: images.length,
      itemBuilder: (context, index) => ChapterImage(
        imageUrl: images[index],
        onBuilt: () => preloadFollowing(context, images, index),
      ),
    );
  }
}

class PagedReader extends HookWidget {
  const PagedReader({
    required this.images,
    required this.initialPageIndex,
    required this.onPageChanged,
    this.reverse = false,
  });

  final List<String> images;
  final int initialPageIndex;
  final ValueChanged<int> onPageChanged;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final pagingLocked = useState(false);
    final currentPage = useState(initialPageIndex);
    final pageController = usePageController(initialPage: initialPageIndex);

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
        preloadFollowing(context, images, initialPageIndex);
      });
      return null;
    }, [images]);

    return PageView.builder(
      controller: pageController,
      reverse: reverse,
      physics: pagingLocked.value ? const NeverScrollableScrollPhysics() : null,
      itemCount: images.length,
      onPageChanged: (index) {
        currentPage.value = index;
        onPageChanged(index);
        preloadFollowing(context, images, index);
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

    void removePointer(int pointer) {
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
      onPointerUp: (event) => removePointer(event.pointer),
      onPointerCancel: (event) => removePointer(event.pointer),
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

    final placeholder = Center(
      child: GlassProgressIndicator.circular(size: 36, useOwnLayer: true),
    );
    final error = const Center(
      child: Icon(CupertinoIcons.exclamationmark_circle),
    );
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: double.infinity,
      height: expand ? double.infinity : null,
      fit: BoxFit.contain,
      placeholder: (_, _) => expand
          ? SizedBox.expand(child: placeholder)
          : SizedBox(height: 320, child: placeholder),
      errorWidget: (_, _, _) => expand
          ? SizedBox.expand(child: error)
          : SizedBox(height: 320, child: error),
    );
    return image;
  }
}

List<String> orderedImageUrls(ChapterContentDto chapter) {
  final urls = chapter.contents
      .map((image) => image.url)
      .where((url) => url.isNotEmpty)
      .toList(growable: false);
  final orders = chapter.words;

  final validOrder =
      orders.length == urls.length &&
      orders.toSet().length == urls.length &&
      orders.every((index) => index >= 0 && index < urls.length);
  if (!validOrder) return urls;

  final ordered = List<String>.filled(urls.length, '');
  for (var index = 0; index < urls.length; index++) {
    ordered[orders[index]] = urls[index];
  }
  return ordered;
}

void preloadFollowing(BuildContext context, List<String> images, int index) {
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
