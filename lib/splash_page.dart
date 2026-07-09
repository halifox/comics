import 'package:comics/copy_manga/copy_manga.dart';
import 'package:comics/features/home/presentation/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

final splashProvider = FutureProvider<void>((ref) async {
  final dio = ref.read(copyMangaDioProvider);
  final preferences = ref.read(copyMangaPreferencesProvider);
  final bootstrapApi = ref.read(copyMangaBootstrapApiProvider);

  final result = await bootstrapApi.network(3);
  final host = result.api.firstOrNull?.firstOrNull;

  if (host != null) {
    await preferences.setApiHost(host);
    dio.options.baseUrl = 'https://$host';
  }
});

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashProvider, (_, next) {
      next.whenData((_) {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute<void>(builder: (_) => const HomePage()),
        );
      });
    });

    final state = ref.watch(splashProvider);

    return state.when(
      loading: () => const GlassScaffold(
        body: Center(
          child: GlassProgressIndicator.circular(size: 28, useOwnLayer: true),
        ),
      ),
      error: (error, stackTrace) =>
          GlassScaffold(body: Center(child: Text('初始化失败：$error'))),
      data: (_) => const GlassScaffold(body: SizedBox.shrink()),
    );
  }
}
