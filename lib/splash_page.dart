import 'dart:async';

import 'package:comics/features/home/presentation/home_sections.dart';
import 'package:comics/features/home/presentation/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

final splashProvider = FutureProvider<void>((ref) async {
  // final dio = ref.read(copyMangaDioProvider);
  // final preferences = ref.read(copyMangaPreferencesProvider);
  // final bootstrapApi = ref.read(copyMangaBootstrapApiProvider);
  //
  // final result = await bootstrapApi.network(3);
  // final host = result.api.firstOrNull?.firstOrNull;
  //
  // if (host != null) {
  //   await preferences.setApiHost(host);
  //   dio.options.baseUrl = 'https://$host';
  // }
});

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(splashProvider, (_, next) {
    //   next.whenData((_) {
    //     Navigator.of(context).pushReplacement(
    //       CupertinoPageRoute<void>(builder: (_) => const MainPage()),
    //     );
    //   });
    // });

    useEffect(() {
      final timer = Timer(const Duration(seconds: 1), () {
        if (!context.mounted) return;

        Navigator.of(
          context,
        ).pushReplacement(CupertinoPageRoute(builder: (_) => const MainPage()));
      });

      return timer.cancel;
    }, const []);

    final state = ref.watch(splashProvider);
    return GlassScaffold(
      body: CustomScrollView(
        slivers: [
          state.when(
            data: (_) => HomeStateView.empty(
              icon: CupertinoIcons.book,
              title: '欢迎回来',
              message: '发现喜欢的漫画，收藏并继续你的阅读旅程',
            ),
            error: (error, _) => HomeStateView.error(error),
            loading: () => const HomeStateView.loading(),
          ),
        ],
      ),
    );
  }
}
