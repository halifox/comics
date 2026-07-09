import 'package:freezed_annotation/freezed_annotation.dart';

part 'copy_manga_dto.freezed.dart';
part 'copy_manga_dto.g.dart';

@freezed
abstract class CopyMangaResponse with _$CopyMangaResponse {
  const factory CopyMangaResponse({
    required int code,
    @Default('请求失败') String message,
    Object? results,
  }) = _CopyMangaResponse;

  factory CopyMangaResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyMangaResponseFromJson(json);
}

@freezed
abstract class LoginResultDto with _$LoginResultDto {
  const factory LoginResultDto({required String token}) = _LoginResultDto;

  factory LoginResultDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResultDtoFromJson(json);
}

@freezed
abstract class NamedPathDto with _$NamedPathDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NamedPathDto({
    @Default('') String name,
    @Default('') String pathWord,
  }) = _NamedPathDto;

  factory NamedPathDto.fromJson(Map<String, dynamic> json) =>
      _$NamedPathDtoFromJson(json);
}

@freezed
abstract class ComicStatusDto with _$ComicStatusDto {
  const factory ComicStatusDto({@Default('') String display}) = _ComicStatusDto;

  factory ComicStatusDto.fromJson(Map<String, dynamic> json) =>
      _$ComicStatusDtoFromJson(json);
}

@freezed
abstract class ComicDto with _$ComicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ComicDto({
    @Default('') String pathWord,
    @Default('') String uuid,
    @Default('') String name,
    @Default('') String cover,
    @Default('') String brief,
    @Default('') String datetimeUpdated,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    ComicStatusDto? status,
  }) = _ComicDto;

  factory ComicDto.fromJson(Map<String, dynamic> json) =>
      _$ComicDtoFromJson(json);
}

@freezed
abstract class RankedComicDto with _$RankedComicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RankedComicDto({
    required ComicDto comic,
    required int sort,
    @Default(0) int riseSort,
    @Default(0) int popular,
  }) = _RankedComicDto;

  factory RankedComicDto.fromJson(Map<String, dynamic> json) =>
      _$RankedComicDtoFromJson(json);
}

@freezed
abstract class ComicSectionDto with _$ComicSectionDto {
  const factory ComicSectionDto({required List<ComicDto> list}) =
      _ComicSectionDto;

  factory ComicSectionDto.fromJson(Map<String, dynamic> json) =>
      _$ComicSectionDtoFromJson(json);
}

@freezed
abstract class HomeResultDto with _$HomeResultDto {
  const factory HomeResultDto({
    required HomeTopicSectionDto topics,
    required HomeTopicSectionDto topicsList,
    @JsonKey(name: 'recComics') required HomeRecommendedSectionDto recommended,
    @JsonKey(name: 'hotComics') required List<HomeUpdateDto> hot,
    @JsonKey(name: 'newComics') required List<HomeUpdateDto> latest,
    @JsonKey(name: 'finishComics') required HomeComicSectionDto finished,
    @JsonKey(name: 'rankDayComics') required HomeRankSectionDto rankDay,
    @JsonKey(name: 'rankWeekComics') required HomeRankSectionDto rankWeek,
    @JsonKey(name: 'rankMonthComics') required HomeRankSectionDto rankMonth,
    required List<HomeBannerDto> banners,
  }) = _HomeResultDto;

  factory HomeResultDto.fromJson(Map<String, dynamic> json) =>
      _$HomeResultDtoFromJson(json);
}

@freezed
abstract class HomeTopicSectionDto with _$HomeTopicSectionDto {
  const factory HomeTopicSectionDto({
    required List<HomeTopicDto> list,
    required int total,
    required int limit,
    required int offset,
  }) = _HomeTopicSectionDto;

  factory HomeTopicSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeTopicSectionDtoFromJson(json);
}

@freezed
abstract class HomeTopicDto with _$HomeTopicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeTopicDto({
    required String title,
    String? series,
    required String journal,
    required String cover,
    required String period,
    required int type,
    @Default('') String brief,
    required String pathWord,
    required String datetimeCreated,
  }) = _HomeTopicDto;

  factory HomeTopicDto.fromJson(Map<String, dynamic> json) =>
      _$HomeTopicDtoFromJson(json);
}

@freezed
abstract class HomeRecommendedSectionDto with _$HomeRecommendedSectionDto {
  const factory HomeRecommendedSectionDto({
    required List<HomeRecommendedItemDto> list,
    required int total,
    required int limit,
    required int offset,
  }) = _HomeRecommendedSectionDto;

  factory HomeRecommendedSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRecommendedSectionDtoFromJson(json);
}

@freezed
abstract class HomeRecommendedItemDto with _$HomeRecommendedItemDto {
  const factory HomeRecommendedItemDto({
    required int type,
    required HomeComicDto comic,
  }) = _HomeRecommendedItemDto;

  factory HomeRecommendedItemDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRecommendedItemDtoFromJson(json);
}

@freezed
abstract class HomeUpdateDto with _$HomeUpdateDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeUpdateDto({
    required String name,
    required String datetimeCreated,
    required HomeComicDto comic,
  }) = _HomeUpdateDto;

  factory HomeUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$HomeUpdateDtoFromJson(json);
}

@freezed
abstract class HomeComicSectionDto with _$HomeComicSectionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeComicSectionDto({
    required String name,
    required String pathWord,
    required String type,
    required List<HomeComicDto> list,
    required int total,
    required int limit,
    required int offset,
  }) = _HomeComicSectionDto;

  factory HomeComicSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeComicSectionDtoFromJson(json);
}

@freezed
abstract class HomeRankSectionDto with _$HomeRankSectionDto {
  const factory HomeRankSectionDto({
    required List<HomeRankItemDto> list,
    required int total,
    required int limit,
    required int offset,
  }) = _HomeRankSectionDto;

  factory HomeRankSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRankSectionDtoFromJson(json);
}

@freezed
abstract class HomeRankItemDto with _$HomeRankItemDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeRankItemDto({
    required HomeComicDto comic,
    required int sort,
    required int sortLast,
    required int riseSort,
    required int riseNum,
    required int popular,
    required int dateType,
  }) = _HomeRankItemDto;

  factory HomeRankItemDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRankItemDtoFromJson(json);
}

@freezed
abstract class HomeComicDto with _$HomeComicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeComicDto({
    required String name,
    required String pathWord,
    required String cover,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @Default('') String authorAlias,
    @Default(0) int popular,
    @Default('') String datetimeUpdated,
    @Default('') String lastChapterName,
    @Default([]) List<NamedPathDto> females,
    @Default([]) List<NamedPathDto> males,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    Object? freeType,
  }) = _HomeComicDto;

  factory HomeComicDto.fromJson(Map<String, dynamic> json) =>
      _$HomeComicDtoFromJson(json);
}

@freezed
abstract class HomeBannerDto with _$HomeBannerDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeBannerDto({
    required String cover,
    @Default('') String brief,
    required int type,
    required String outUuid,
    NamedPathDto? comic,
  }) = _HomeBannerDto;

  factory HomeBannerDto.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerDtoFromJson(json);
}

@freezed
abstract class ComicPageResultDto with _$ComicPageResultDto {
  const factory ComicPageResultDto({
    required List<ComicDto> list,
    required int total,
  }) = _ComicPageResultDto;

  factory ComicPageResultDto.fromJson(Map<String, dynamic> json) =>
      _$ComicPageResultDtoFromJson(json);
}

@freezed
abstract class RankPageResultDto with _$RankPageResultDto {
  const factory RankPageResultDto({
    required List<RankedComicDto> list,
    required int total,
  }) = _RankPageResultDto;

  factory RankPageResultDto.fromJson(Map<String, dynamic> json) =>
      _$RankPageResultDtoFromJson(json);
}

@freezed
abstract class ComicInfoResultDto with _$ComicInfoResultDto {
  const factory ComicInfoResultDto({
    required ComicDto comic,
    required Map<String, ChapterGroupDto> groups,
  }) = _ComicInfoResultDto;

  factory ComicInfoResultDto.fromJson(Map<String, dynamic> json) =>
      _$ComicInfoResultDtoFromJson(json);
}

@freezed
abstract class ChapterGroupDto with _$ChapterGroupDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapterGroupDto({
    @Default('') String name,
    @Default('') String pathWord,
  }) = _ChapterGroupDto;

  factory ChapterGroupDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterGroupDtoFromJson(json);
}

@freezed
abstract class FavoriteStatusResultDto with _$FavoriteStatusResultDto {
  const factory FavoriteStatusResultDto({Object? collect}) =
      _FavoriteStatusResultDto;

  factory FavoriteStatusResultDto.fromJson(Map<String, dynamic> json) =>
      _$FavoriteStatusResultDtoFromJson(json);
}

@freezed
abstract class ChapterListResultDto with _$ChapterListResultDto {
  const factory ChapterListResultDto({
    required List<ChapterDto> list,
    required int total,
  }) = _ChapterListResultDto;

  factory ChapterListResultDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterListResultDtoFromJson(json);
}

@freezed
abstract class ChapterDto with _$ChapterDto {
  const factory ChapterDto({
    @Default('') String uuid,
    @Default('') String name,
  }) = _ChapterDto;

  factory ChapterDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterDtoFromJson(json);
}

@freezed
abstract class ChapterContentResultDto with _$ChapterContentResultDto {
  const factory ChapterContentResultDto({required ChapterContentDto chapter}) =
      _ChapterContentResultDto;

  factory ChapterContentResultDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterContentResultDtoFromJson(json);
}

@freezed
abstract class ChapterContentDto with _$ChapterContentDto {
  const factory ChapterContentDto({
    required List<ChapterImageDto> contents,
    required List<int> words,
  }) = _ChapterContentDto;

  factory ChapterContentDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterContentDtoFromJson(json);
}

@freezed
abstract class ChapterImageDto with _$ChapterImageDto {
  const factory ChapterImageDto({@Default('') String url}) = _ChapterImageDto;

  factory ChapterImageDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterImageDtoFromJson(json);
}

@freezed
abstract class CommentPageResultDto with _$CommentPageResultDto {
  const factory CommentPageResultDto({
    required List<CommentDto> list,
    required int total,
  }) = _CommentPageResultDto;

  factory CommentPageResultDto.fromJson(Map<String, dynamic> json) =>
      _$CommentPageResultDtoFromJson(json);
}

@freezed
abstract class CommentDto with _$CommentDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CommentDto({
    @Default('') String userName,
    @Default('') String parentUserName,
    @Default('') String userAvatar,
    @Default('') String comment,
    @Default('') String createAt,
    int? count,
    Object? id,
  }) = _CommentDto;

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}

@freezed
abstract class NetworkResultDto with _$NetworkResultDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NetworkResultDto({
    @JsonKey(name: 'static') required String staticHost,
    @JsonKey(name: 'image') required String imageHost,
    required List<String> share,
    required List<List<String>> api,
    required List<List<String>> ads,
    required String hostComic,
    required String hostCartoon,
    required String hostNovel,
    required int dayDownloadsTotal,
    required int adsRewardDownloads,
    required int adsRewardDayShow,
    required int adsScreenShow,
    required int adsReadExpressShow,
    required int adsHomeSeconds,
    required int adsRestartSeconds,
    required int adsComicShow,
    required int adsCartoonShow,
    required int dayDownloads,
    required int vipDownloads,
    required int rewardDownloads,
    Object? adsVipEnd,
    required bool adsStatSwitch,
    required bool adsStatSwitch2,
    required int adsRewardSeconds,
    required bool inMainland,
  }) = _NetworkResultDto;

  factory NetworkResultDto.fromJson(Map<String, dynamic> json) =>
      _$NetworkResultDtoFromJson(json);
}

@freezed
abstract class RequestIdResultDto with _$RequestIdResultDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RequestIdResultDto({@Default('') String requestId}) =
      _RequestIdResultDto;

  factory RequestIdResultDto.fromJson(Map<String, dynamic> json) =>
      _$RequestIdResultDtoFromJson(json);
}

@freezed
abstract class ComicSummary with _$ComicSummary {
  const factory ComicSummary({
    required String id,
    required String title,
    required String cover,
    String? subtitle,
    @Default([]) List<String> tags,
    String? description,
  }) = _ComicSummary;

  factory ComicSummary.fromJson(Map<String, dynamic> json) =>
      _$ComicSummaryFromJson(json);
}

@Freezed(genericArgumentFactories: true)
abstract class PagedResult<T> with _$PagedResult<T> {
  const factory PagedResult(List<T> items, int total, int pageSize) =
      _PagedResult<T>;

  factory PagedResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PagedResultFromJson(json, fromJsonT);
}

@freezed
abstract class ChapterGroup with _$ChapterGroup {
  const factory ChapterGroup({
    required String name,
    required Map<String, String> chapters,
  }) = _ChapterGroup;

  factory ChapterGroup.fromJson(Map<String, dynamic> json) =>
      _$ChapterGroupFromJson(json);
}

@freezed
abstract class ComicDetails with _$ComicDetails {
  const factory ComicDetails({
    required String title,
    required String cover,
    required String description,
    required List<String> authors,
    required List<String> tags,
    required String updateTime,
    required String status,
    required List<ChapterGroup> chapterGroups,
    required bool isFavorite,
    required String uuid,
  }) = _ComicDetails;

  factory ComicDetails.fromJson(Map<String, dynamic> json) =>
      _$ComicDetailsFromJson(json);
}

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    required String userName,
    required String avatar,
    required String content,
    required String time,
    int? replyCount,
    String? id,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
abstract class ChapterImages with _$ChapterImages {
  const factory ChapterImages(List<String> images) = _ChapterImages;

  factory ChapterImages.fromJson(Map<String, dynamic> json) =>
      _$ChapterImagesFromJson(json);
}
