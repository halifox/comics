import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/navigation/presentation/main_navigation_page.dart';
import 'package:comics/shared/application/shared_preferences_provider.dart';
import 'package:comics/shared/presentation/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
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
          comicsRepositoryProvider.overrideWith(
            (ref) => ref.watch(copyMangaComicsRepositoryProvider),
          ),
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
    return CupertinoApp(
      theme: AppTheme.system(),
      home: const MainNavigationPage(),
    );
  }
}
