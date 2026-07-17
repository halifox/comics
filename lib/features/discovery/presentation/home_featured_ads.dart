import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/presentation/comic_detail_page.dart';
import 'package:comics/shared/presentation/widgets/cached_image_feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeFeaturedAds extends HookWidget {
  const HomeFeaturedAds({required this.comics, super.key});

  final List<ComicCardModel> comics;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final selectedIndex = useState(0);
    final height = MediaQuery.sizeOf(context).height * .56;

    if (comics.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              key: const PageStorageKey<String>('home-featured-ads'),
              controller: pageController,
              itemCount: comics.length,
              onPageChanged: (index) => selectedIndex.value = index,
              itemBuilder: (context, index) {
                final comic = comics[index];
                final comicName = comic.title;
                final comicId = comic.id;
                final authors = comic.authorText;

                return Semantics(
                  button: comicId.isNotEmpty,
                  label: comicName,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: comicId.isEmpty
                        ? null
                        : () {
                            Navigator.of(context).push(
                              CupertinoPageRoute<void>(
                                builder: (_) => ComicDetailPage(
                                  comicId: comicId,
                                  name: comicName,
                                  cover: comic.coverUrl,
                                ),
                              ),
                            );
                          },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: comic.coverUrl,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: buildCachedImageLoading,
                          errorWidget: buildCachedImageError,
                        ),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, .1, .7, 1],
                              colors: [
                                Color(0x12000000),
                                Color(0x00000000),
                                Color(0x00000000),
                                Color(0x5F000000),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 20,
                          bottom: 48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '编辑精选',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              if (comicName.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(
                                  comicName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    height: 1.08,
                                  ),
                                ),
                              ],
                              if (authors.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text(
                                  authors,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (comics.length > 1)
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Row(
                  children: [
                    for (var index = 0; index < comics.length; index++)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic,
                        width: selectedIndex.value == index ? 24 : 7,
                        height: 7,
                        margin: const EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                          color: selectedIndex.value == index
                              ? CupertinoColors.white
                              : const Color(0x73FFFFFF),
                          borderRadius: BorderRadius.circular(99),
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
