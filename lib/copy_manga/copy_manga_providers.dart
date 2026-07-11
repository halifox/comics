import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:comics/shared/application/shared_preferences_provider.dart';

import 'copy_manga_api.dart';
import 'copy_manga_interceptor.dart';
import 'json_response_recorder_interceptor.dart';

final copyMangaDioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) => status == 200,
    ),
  );
  if (kDebugMode) {
    dio.interceptors.add(JsonResponseRecorderInterceptor());
  }
  dio.interceptors.add(CopyMangaInterceptor());
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

final comicsApiProvider = Provider<CopyMangaApi>(
  (ref) => CopyMangaApi(ref.watch(copyMangaDioProvider)),
);

final copyMangaRequestIdApiProvider = Provider<CopyMangaRequestIdApi>(
  (ref) => CopyMangaRequestIdApi(ref.watch(copyMangaDioProvider)),
);
