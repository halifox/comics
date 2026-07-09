import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'copy_manga_api.dart';
import 'copy_manga_interceptor.dart';
import 'copy_manga_preferences.dart';
import 'copy_manga_repository.dart';
import 'json_response_recorder_interceptor.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(
    'sharedPreferencesProvider 必须在 ProviderScope 中被覆盖',
  ),
);

final copyMangaPreferencesProvider = Provider<CopyMangaPreferences>(
  (ref) => CopyMangaPreferences(ref.watch(sharedPreferencesProvider)),
);

final copyMangaDioProvider = Provider<Dio>((ref) {
  final preferences = ref.watch(copyMangaPreferencesProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://${preferences.apiHost}',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) => status == 200,
    ),
  );
  dio.interceptors.add(JsonResponseRecorderInterceptor());
  dio.interceptors.add(CopyMangaInterceptor(preferences));
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: false,
      enabled: kDebugMode,
    ),
  );
  ref.onDispose(() => dio.close(force: true));
  return dio;
});

final copyMangaApiProvider = Provider<CopyMangaApi>(
  (ref) => CopyMangaApi(ref.watch(copyMangaDioProvider)),
);

final copyMangaBootstrapApiProvider = Provider<CopyMangaBootstrapApi>(
  (ref) => CopyMangaBootstrapApi(ref.watch(copyMangaDioProvider)),
);

final copyMangaRequestIdApiProvider = Provider<CopyMangaRequestIdApi>(
  (ref) => CopyMangaRequestIdApi(ref.watch(copyMangaDioProvider)),
);

final copyMangaWebsiteApiProvider = Provider<CopyMangaWebsiteApi>(
  (ref) => CopyMangaWebsiteApi(ref.watch(copyMangaDioProvider)),
);

final copyMangaRepositoryProvider = Provider<CopyMangaRepository>(
  (ref) => CopyMangaRepository(
    api: ref.watch(copyMangaApiProvider),
    bootstrapApi: ref.watch(copyMangaBootstrapApiProvider),
    requestIdApi: ref.watch(copyMangaRequestIdApiProvider),
    websiteApi: ref.watch(copyMangaWebsiteApiProvider),
    dio: ref.watch(copyMangaDioProvider),
    preferences: ref.watch(copyMangaPreferencesProvider),
  ),
);
