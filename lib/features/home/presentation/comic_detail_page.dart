import 'package:cached_network_image/cached_network_image.dart';
import 'package:comics/AmbientGlowBackground.dart';
import 'package:comics/features/home/application/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'comic_episodes_page.dart';
import 'home_sections.dart';

class ComicDetailPage extends HookConsumerWidget {
  const ComicDetailPage({
    required this.comicId,
    required this.name,
    required this.cover,
    super.key,
  });

  final String comicId;
  final String name;
  final String cover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(comicInfoProvider(comicId));
    final scrollController = useScrollController();
    final scrollOffset = useState(0.0);

    useEffect(() {
      void onScroll() {
        scrollOffset.value = scrollController.offset;
      }

      scrollController.addListener(onScroll);
      return () {
        scrollController.removeListener(onScroll);
      };
    }, [scrollController]);

    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      background: const AmbientGlowBackground(),
      appBar: GlassAppBar(
        leading: GlassIconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          useOwnLayer: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          GlassIconButton(
            icon: const Icon(CupertinoIcons.share),
            useOwnLayer: true,
            onPressed: () {},
          ),
          GlassIconButton(
            icon: const Icon(CupertinoIcons.heart),
            useOwnLayer: true,
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            pinned: false,
            backgroundColor: CupertinoColors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Transform.translate(
                offset: Offset(0, scrollOffset.value * .5),
                child: CachedNetworkImage(
                  imageUrl: cover,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          info.when(
            data: (data) {
              return SliverLayoutBuilder(
                builder: (context, constraints) {
                  return SliverToBoxAdapter(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.viewportMainAxisExtent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.comic.name,
                              style: const TextStyle(
                                color: CupertinoColors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.comic.authors
                                  .map(
                                    (author) => GlassChip(
                                      icon: const Icon(CupertinoIcons.person),
                                      label: author.name,
                                      onTap: () {},
                                    ),
                                  )
                                  .toList(),
                            ),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                GlassChip(
                                  icon: const Icon(
                                    CupertinoIcons.checkmark_seal,
                                  ),
                                  label: data.comic.status?.display ?? '',
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.calendar),
                                  label: data.comic.datetimeUpdated,
                                  onTap: () {},
                                ),
                                GlassChip(
                                  icon: const Icon(CupertinoIcons.globe),
                                  label: data.comic.region?.display ?? '',
                                  onTap: () {},
                                ),
                              ],
                            ),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.comic.themes
                                  .map(
                                    (theme) => GlassChip(
                                      icon: const Icon(CupertinoIcons.tag),
                                      label: theme.name,
                                      onTap: () {},
                                    ),
                                  )
                                  .toList(),
                            ),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.comic.alias
                                  .split(',')
                                  .map((alias) => alias.trim())
                                  .where((alias) => alias.isNotEmpty)
                                  .map(
                                    (alias) => GlassChip(
                                      icon: const Icon(
                                        CupertinoIcons.text_badge_plus,
                                      ),
                                      label: alias,
                                      onTap: () {},
                                    ),
                                  )
                                  .toList(),
                            ),
                            GlassGroupedSection(
                              margin: .zero,
                              children: data.groups.values.map((e) {
                                return GlassListTile(
                                  subtitle: Text("${e.count}话"),
                                  title: Text(e.name),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute<void>(
                                        builder: (_) => ComicEpisodesPage(
                                          comicId: comicId,
                                          comicName: data.comic.name,
                                          groupName: e.name,
                                          groupPathWord: e.pathWord,
                                        ),
                                      ),
                                    );
                                  },
                                  leading: const Icon(CupertinoIcons.book),
                                  trailing: GlassListTile.chevron,
                                );
                              }).toList(),
                            ),
                            GlassCard(
                              padding: EdgeInsets.zero,
                              child: GlassListTile(
                                title: const Text(
                                  'About',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(data.comic.brief),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const HomeStateView.loading(),
            error: (error, _) => HomeStateView.error(error),
          ),
        ],
      ),
    );
  }
}
