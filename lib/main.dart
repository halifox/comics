import 'package:comics/features/navigation/presentation/main_navigation_page.dart';
import 'package:comics/shared/application/shared_preferences_provider.dart';
import 'package:comics/shared/presentation/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SentryFlutter.init(
    (options) {
      options.dsn = String.fromEnvironment('SENTRY_DSN');
      // Adds request headers and IP for users, for more info visit:
      // https://docs.sentry.io/platforms/dart/guides/flutter/data-management/data-collected/
      options.sendDefaultPii = true;
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // Record session replays for 100% of errors and 10% of sessions
      options.replay.onErrorSampleRate = 1.0;
      options.replay.sessionSampleRate = 0.1;
    },
    appRunner: () async {
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
    },
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
