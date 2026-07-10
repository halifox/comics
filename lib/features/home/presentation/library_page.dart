import 'package:comics/AmbientGlowBackground.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import 'home_sections.dart';
import 'large_title_helpers.dart';

class LibraryPage extends HookConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useGlassLargeTitleController();

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
      body: CustomScrollView(
        controller: titleController.scrollController,
        key: const PageStorageKey<String>('library-scroll'),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          GlassLargeTitle(
            text: '书架',
            controller: titleController,
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.paddingOf(context).top + 16,
              16,
              8,
            ),
          ),
          const HomeStateView.empty(
            icon: CupertinoIcons.book,
            title: '你的书架',
            message: '收藏的漫画和阅读记录会出现在这里',
          ),
        ],
      ),
    );
  }
}
