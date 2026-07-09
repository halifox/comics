import 'package:dio/dio.dart';

import 'copy_manga_api.dart';
import 'copy_manga_preferences.dart';

class CopyMangaRepository {
  CopyMangaRepository({
    required this.api,
    required this.bootstrapApi,
    required this.requestIdApi,
    required this.websiteApi,
    required this.dio,
    required this.preferences,
  });

  final CopyMangaApi api;
  final CopyMangaBootstrapApi bootstrapApi;
  final CopyMangaRequestIdApi requestIdApi;
  final CopyMangaWebsiteApi websiteApi;
  final Dio dio;
  final CopyMangaPreferences preferences;

  Future<void> splash() async {}
}
