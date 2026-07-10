import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'copy_manga_dto.dart';

part 'copy_manga_api.g.dart';

@RestApi()
abstract class CopyMangaApi {
  /// 创建使用指定 Dio 实例和可选基础地址的 API 客户端。
  factory CopyMangaApi(Dio dio, {String? baseUrl}) = _CopyMangaApi;

  /// 使用标准表单字段登录账号并获取访问令牌。
  @POST('/api/v3/login')
  @FormUrlEncoded()
  Future<LoginResultDto> loginForm(
    @Field('username') String username,
    @Field('password') String password,
    @Field('salt') int salt,
    @Field('authorization') String authorization,
  );

  /// 获取首页推荐、热门、最新及排行等分区内容。
  @GET('/api/v3/h5/homeIndex')
  Future<HomeResultDto> home();

  /// 分页获取指定受众和时间范围的漫画排行榜。
  @GET('/api/v3/ranks')
  Future<RankPageResultDto> ranks(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('_update') bool update,
    @Query('type') int type,
    @Query('audience_type') String audienceType,
    @Query('date_type') String dateType,
  );

  /// 按主题、地区、作者或排序条件分页获取漫画列表。
  @GET('/api/v3/comics')
  Future<ComicPageResultDto> comics({
    @Query('limit') int limit = 30,
    @Query('offset') required int offset,
    @Query('ordering') String? ordering,
    @Query('theme') String? theme,
    @Query('top') String? top,
    @Query('author') String? author,
  });

  /// 使用 App 端搜索接口分页搜索漫画。
  @GET('/api/v3/search/comic')
  Future<ComicPageResultDto> search(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('q') String query,
    @Query('q_type') String queryType,
  );

  /// 使用网页端搜索接口分页搜索漫画。
  @GET('/api/kb/web/searchb/comics')
  Future<ComicPageResultDto> webSearch(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('q') String query,
    @Query('q_type') String queryType,
  );

  /// 分页获取当前登录用户收藏的漫画。
  @GET('/api/v3/member/collect/comics')
  Future<ComicPageResultDto> favorites(
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('free_type') int freeType,
    @Query('ordering') String ordering,
  );

  /// 添加或取消收藏指定漫画。
  @POST('/api/v3/member/collect/comic')
  @FormUrlEncoded()
  Future<void> setFavorite(
    @Field('comic_id') String comicId,
    @Field('is_collect') int isCollect,
    @Field('authorization') String authorization,
  );

  /// 获取漫画详情、作者、标签及章节分组信息。
  @GET('/api/v3/comic2/{id}')
  Future<ComicInfoResultDto> comicInfo(
    @Path('id') String id,
    @Query('in_mainland') bool inMainland,
    @Query('request_id') String requestId,
    @Query('platform') int platform,
  );

  /// 查询当前用户是否已收藏指定漫画。
  @GET('/api/v3/comic2/{id}/query')
  Future<FavoriteStatusResultDto> favoriteStatus(@Path('id') String id);

  /// 分页获取漫画指定分组下的章节列表。
  @GET('/api/v3/comic/{id}/group/{group}/chapters')
  Future<ChapterListResultDto> chapters(
    @Path('id') String id,
    @Path('group') String group,
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('in_mainland') bool inMainland,
    @Query('request_id') String requestId,
  );

  /// 获取指定章节的图片内容及阅读顺序。
  @GET('/api/v3/comic/{comicId}/chapter2/{chapterId}')
  Future<ChapterContentResultDto> chapter(
    @Path('comicId') String comicId,
    @Path('chapterId') String chapterId,
    @Query('in_mainland') bool inMainland,
    @Query('request_id') String requestId,
  );

  /// 分页获取漫画评论或指定评论的回复。
  @GET('/api/v3/comments')
  Future<CommentPageResultDto> comments(
    @Query('comic_id') String comicId,
    @Query('limit') int limit,
    @Query('offset') int offset, {
    @Query('reply_id') String? replyId,
    @Query('_update') bool? update,
  });

  /// 发表漫画评论或回复已有评论。
  @POST('/api/v3/member/comment')
  @FormUrlEncoded()
  Future<void> sendComment(
    @Field('comic_id') String comicId,
    @Field('comment') String comment,
    @Field('reply_id') String replyId,
  );

  /// 分页获取指定章节的吐槽评论。
  @GET('/api/v3/roasts')
  Future<CommentPageResultDto> roasts(
    @Query('chapter_id') String chapterId,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  /// 向指定章节发表吐槽评论。
  @POST('/api/v3/member/roast')
  @FormUrlEncoded()
  Future<void> sendRoast(
    @Field('chapter_id') String chapterId,
    @Field('roast') String roast,
  );
}

@RestApi(baseUrl: 'https://api.copy-manga.com')
abstract class CopyMangaBootstrapApi {
  /// 创建用于发现可用 API 线路的客户端。
  factory CopyMangaBootstrapApi(Dio dio, {String? baseUrl}) =
      _CopyMangaBootstrapApi;

  /// 获取指定平台当前可用的 API 线路地址。
  @GET('/api/v3/system/network2')
  Future<NetworkResultDto> network(@Query('platform') int platform);
}

@RestApi(baseUrl: 'https://marketing.aiacgn.com')
abstract class CopyMangaRequestIdApi {
  /// 创建用于获取大陆线路请求 ID 的客户端。
  factory CopyMangaRequestIdApi(Dio dio, {String? baseUrl}) =
      _CopyMangaRequestIdApi;

  /// 获取大陆线路访问漫画内容所需的请求 ID。
  @GET('/api/v2/adopr/query3/')
  Future<RequestIdResultDto> query(
    @Query('format') String format,
    @Query('ident') String ident,
  );
}

@RestApi(baseUrl: 'https://www.copy20.com')
abstract class CopyMangaWebsiteApi {
  /// 创建用于访问拷贝漫画网页端的客户端。
  factory CopyMangaWebsiteApi(Dio dio, {String? baseUrl}) =
      _CopyMangaWebsiteApi;

  /// 获取搜索页源码，以发现网页端动态搜索接口路径。
  @GET('/search')
  @DioResponseType(ResponseType.plain)
  Future<String> searchPage();
}
