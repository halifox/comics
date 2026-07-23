import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'copy_manga_dto.dart';
import 'copy_manga_interceptor.dart';
import 'json_response_recorder_interceptor.dart';

part 'copy_manga_api.g.dart';

final copyMangaDioProvider = Provider((ref) {
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

final comicsApiProvider = Provider(
  (ref) => CopyMangaApi(ref.watch(copyMangaDioProvider)),
);

@RestApi(baseUrl: 'https://api.copy-manga.com')
abstract class CopyMangaApi {
  /// 创建使用指定 Dio 实例和可选基础地址的 API 客户端。
  factory CopyMangaApi(Dio dio, {String? baseUrl}) = _CopyMangaApi;

  /// 获取指定平台当前可用的 API 线路地址。
  @GET('/api/v3/system/network2')
  Future<NetworkResultDto> network({@Query('platform') int platform = 3});

  /// 获取首页推荐、热门、最新及排行等分区内容。
  @Deprecated('use homeIndex2()')
  @GET('/api/v3/h5/homeIndex')
  Future<HomeResultDto> homeIndex();

  @GET('/api/v3/h5/homeIndex2')
  Future<HomeResultDto> homeIndex2({@Query('platform') int platform = 3});

  /// 分页获取指定受众和时间范围的漫画排行榜。
  @GET('/api/v3/ranks')
  Future<RankPageResultDto> ranks({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
    @Query('type') required int type,
    @Query('audience_type') required String audienceType,
    @Query('date_type') required String dateType,
    @Query('platform') int platform = 3,
  });

  /// 按主题、地区、作者或排序条件分页获取漫画列表。
  @GET('/api/v3/comics')
  Future<ComicPageResultDto> comics({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
    @Query('ordering') String? ordering,
    @Query('theme') String? theme,
    @Query('top') String? top,
    @Query('author') String? author,
    @Query('free_type') int freeType = 1,
    @Query('platform') int platform = 3,
  });

  // 搜索

  /// 使用 App 端搜索接口分页搜索漫画。
  /// q_type: name author local
  @GET('/api/v3/search/comic')
  Future<ComicPageResultDto> search({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
    @Query('q') required String query,
    @Query('q_type') required String queryType,
    @Query('platform') int platform = 3,
  });

  /// 获取漫画详情、作者、标签及章节分组信息。
  @GET('/api/v3/comic2/{comicId}')
  Future<ComicInfoResultDto> comicInfo({
    @Path('comicId') required String comicId,
    @Query('in_mainland') bool inMainland = false,
    @Query('request_id') String requestId = '',
    @Query('platform') int platform = 3,
  });

  /// 分页获取漫画指定分组下的章节列表。
  @GET('/api/v3/comic/{comicId}/group/{groupId}/chapters')
  Future<ChapterListResultDto> chapters({
    @Path('comicId') required String comicId,
    @Path('groupId') required String groupId,
    @Query('limit') required int limit,
    @Query('offset') required int offset,
    @Query('in_mainland') bool inMainland = false,
    @Query('request_id') String requestId = '',
    @Query('platform') int platform = 3,
  });

  /// 获取指定章节的图片内容及阅读顺序。
  @GET('/api/v3/comic/{comicId}/chapter2/{chapterId}')
  Future<ChapterContentResultDto> chapter({
    @Path('comicId') required String comicId,
    @Path('chapterId') required String chapterId,
    @Query('in_mainland') bool inMainland = false,
    @Query('request_id') String requestId = '',
    @Query('platform') int platform = 3,
  });

  /// 分页获取最新上架的漫画。
  @GET('/api/v3/update/newest')
  Future<NewReleaseResultDto> newest({
    @Query('limit') required int limit,
    @Query('offset') required int offset,
    @Query('date') String date = '',
    @Query('platform') int platform = 3,
  });
}
