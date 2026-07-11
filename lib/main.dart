import 'package:comics/features/discovery/presentation/home_feed_widgets.dart';
import 'package:comics/features/navigation/presentation/main_navigation_page.dart';
import 'package:comics/shared/application/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LiquidGlassWidgets.initialize();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    LiquidGlassWidgets.wrap(
      adaptiveQuality: true,
      child: ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        retry: (retryCount, error) => null,
        child: const ComicsApp(),
      ),
    ),
  );
}

class ComicsApp extends HookConsumerWidget {
  const ComicsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        extensions: [
          PagingHelperViewTheme(
            sliverLoadingViewBuilder: (_) => const ContentStateSliver.loading(),
            endLoadingViewBuilder: (_) => Center(
              child: const GlassProgressIndicator.circular(
                size: 40,
                useOwnLayer: true,
              ),
            ),
          ),
        ],
      ),
      home: const MainNavigationPage(),
    );
  }
}
