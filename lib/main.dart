import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'copy_manga/copy_manga.dart';
import 'splash_page.dart';

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
        child: const CopyMangaApp(),
      ),
    ),
  );
}

class CopyMangaApp extends HookConsumerWidget {
  const CopyMangaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(home: const SplashPage());
  }
}
