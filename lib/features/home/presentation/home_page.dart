import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../../app/app_theme.dart';
import '../application/home_provider.dart';
import 'home_sections.dart';
import 'library_page.dart';
import 'ranking_page.dart';
import 'search_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(0);
    final searchActive = useState(false);
    final searchFieldFocused = useState(false);
    final home = ref.watch(homeProvider);
    final dark = Theme.of(context).brightness == Brightness.dark;

    return GlassScaffold(
      edgeToEdge: true,
      contentAwareBrightness: true,
      statusBarStyle: GlassStatusBarStyle.auto,
      background: _AmbientBackground(dark: dark),
      appBar: const GlassAppBar(),
      bottomBar: GlassTabBar.searchable(
        selectedIndex: selectedTab.value,
        isSearchActive: searchActive.value,
        onTabSelected: (value) {
          selectedTab.value = value;
          searchActive.value = false;
          searchFieldFocused.value = false;
        },
        searchConfig: GlassSearchBarConfig(
          hintText: '搜索漫画',
          autoFocusOnExpand: false,
          showsCancelButton: true,
          textInputAction: TextInputAction.search,
          onSearchToggle: (active) {
            searchActive.value = active;
            if (!active) searchFieldFocused.value = false;
          },
          onSearchFocusChanged: (focused) => searchFieldFocused.value = focused,
        ),
        barHeight: 62,
        searchBarHeight: 52,
        verticalPadding: 12,
        horizontalPadding: 18,
        indicatorColor: CopyColors.accent.withValues(alpha: .18),
        interactionGlowColor: CopyColors.accent,
        tabs: const [
          GlassTab(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: '首页',
            glowColor: CopyColors.accent,
          ),
          GlassTab(
            icon: Icon(CupertinoIcons.chart_bar),
            activeIcon: Icon(CupertinoIcons.chart_bar_fill),
            label: '排行',
            glowColor: CopyColors.violet,
          ),
          GlassTab(
            icon: Icon(CupertinoIcons.book),
            activeIcon: Icon(CupertinoIcons.book_fill),
            label: '书架',
          ),
        ],
      ),
      body: searchActive.value
          ? SearchPage(fieldFocused: searchFieldFocused.value)
          : switch (selectedTab.value) {
              0 => CustomScrollView(
                key: const PageStorageKey<String>('home-scroll'),
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () async {
                      ref.invalidate(homeProvider);
                      await ref.read(homeProvider.future);
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        MediaQuery.paddingOf(context).top + 12,
                        16,
                        20,
                      ),
                      child: Text(
                        '首页',
                        style: TextStyle(
                          color: CupertinoColors.label.resolveFrom(context),
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                  ),
                  home.when(
                    data: (data) => HomeContent(data: data),
                    loading: () => const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 120),
                        child: HomeLoadingView(),
                      ),
                    ),
                    error: (error, _) => SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 120),
                        child: HomeErrorView(
                          message: error.toString(),
                          onRetry: () => ref.invalidate(homeProvider),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              1 => const RankingPage(),
              _ => const LibraryPage(),
            },
    );
  }
}

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground({required this.dark});
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: dark ? CopyColors.darkCanvas : CopyColors.canvas,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? const [Color(0xFF17131D), Color(0xFF09090B), Color(0xFF10171A)]
              : const [Color(0xFFFFF4EE), Color(0xFFF4F3F0), Color(0xFFEDF5F6)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -60,
            child: _Glow(
              color: CopyColors.accent.withValues(alpha: dark ? .16 : .11),
              size: 260,
            ),
          ),
          Positioned(
            top: 420,
            left: -100,
            child: _Glow(
              color: CopyColors.violet.withValues(alpha: dark ? .12 : .08),
              size: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [BoxShadow(color: color, blurRadius: 90, spreadRadius: 35)],
    ),
  );
}
