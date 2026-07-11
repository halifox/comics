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
  const factory ComicStatusDto({
    @Default(0) int value,
    @Default('') String display,
  }) = _ComicStatusDto;

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
    @Default([]) List<NamedPathDto> females,
    @Default([]) List<NamedPathDto> males,
    @Default('') String authorAlias,
    @Default(0) int popular,
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
    @Default(0) int sortLast,
    @Default(0) int riseSort,
    @Default(0) int riseNum,
    @Default(0) int dateType,
    @Default(0) int popular,
  }) = _RankedComicDto;

  factory RankedComicDto.fromJson(Map<String, dynamic> json) =>
      _$RankedComicDtoFromJson(json);
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
    @Default([]) List<RankedComicDto> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _RankPageResultDto;

  factory RankPageResultDto.fromJson(Map<String, dynamic> json) =>
      _$RankPageResultDtoFromJson(json);
}

@freezed
abstract class ComicInfoResultDto with _$ComicInfoResultDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ComicInfoResultDto({
    @Default(false) bool isBanned,
    @Default(false) bool isLock,
    @Default(false) bool isLogin,
    @Default(false) bool isMobileBind,
    @Default(false) bool isVip,
    required ComicInfoDto comic,
    @Default(0) int popular,
    required Map<String, ChapterGroupDto> groups,
  }) = _ComicInfoResultDto;

  factory ComicInfoResultDto.fromJson(Map<String, dynamic> json) =>
      _$ComicInfoResultDtoFromJson(json);
}

@freezed
abstract class ComicInfoDto with _$ComicInfoDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ComicInfoDto({
    @Default('') String uuid,
    @JsonKey(name: 'b_404') @Default(false) bool b404,
    @Default(false) bool bHidden,
    @Default(0) int ban,
    @Default('') String name,
    @Default('') String alias,
    @Default('') String pathWord,
    @Default(false) bool closeComment,
    @Default(false) bool closeRoast,
    LabeledValueDto? freeType,
    LabeledValueDto? restrict,
    LabeledValueDto? reclass,
    @Default([]) List<NamedPathDto> females,
    @Default([]) List<NamedPathDto> males,
    @Default([]) List<NamedPathDto> clubs,
    @Default('') String seoBaidu,
    LabeledValueDto? region,
    ComicStatusDto? status,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    @Default([]) List<NamedPathDto> parodies,
    @Default('') String brief,
    @Default('') String datetimeUpdated,
    @Default('') String cover,
    ChapterDto? lastChapter,
    @Default(0) int popular,
    Object? channel,
  }) = _ComicInfoDto;

  factory ComicInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ComicInfoDtoFromJson(json);
}

@freezed
abstract class LabeledValueDto with _$LabeledValueDto {
  const factory LabeledValueDto({
    @Default(0) int value,
    @Default('') String display,
  }) = _LabeledValueDto;

  factory LabeledValueDto.fromJson(Map<String, dynamic> json) =>
      _$LabeledValueDtoFromJson(json);
}

@freezed
abstract class ChapterGroupDto with _$ChapterGroupDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapterGroupDto({
    @Default('') String name,
    @Default('') String pathWord,
    @Default(0) int count,
  }) = _ChapterGroupDto;

  factory ChapterGroupDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterGroupDtoFromJson(json);
}

@freezed
abstract class ChapterListResultDto with _$ChapterListResultDto {
  const factory ChapterListResultDto({
    @Default([]) List<ChapterDto> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _ChapterListResultDto;

  factory ChapterListResultDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterListResultDtoFromJson(json);
}

@freezed
abstract class ChapterDto with _$ChapterDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapterDto({
    @Default(0) int index,
    @Default('') String uuid,
    @Default(0) int count,
    @Default(0) int ordered,
    @Default(0) int size,
    @Default('') String name,
    @Default('') String comicId,
    @Default('') String comicPathWord,
    String? groupId,
    @Default('') String groupPathWord,
    @Default(0) int type,
    @Default('') String news,
    @Default('') String datetimeCreated,
    String? prev,
    String? next,
  }) = _ChapterDto;

  factory ChapterDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterDtoFromJson(json);
}

@freezed
abstract class ChapterContentResultDto with _$ChapterContentResultDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapterContentResultDto({
    @Default(false) bool showApp,
    @Default(false) bool isLock,
    @Default(false) bool isLogin,
    @Default(false) bool isMobileBind,
    @Default(false) bool isVip,
    required ChapterComicDto comic,
    required ChapterContentDto chapter,
    @Default(false) bool isBanned,
  }) = _ChapterContentResultDto;

  factory ChapterContentResultDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterContentResultDtoFromJson(json);
}

@freezed
abstract class ChapterComicDto with _$ChapterComicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapterComicDto({
    @Default('') String name,
    @Default('') String uuid,
    @Default('') String pathWord,
    LabeledValueDto? restrict,
  }) = _ChapterComicDto;

  factory ChapterComicDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterComicDtoFromJson(json);
}

@freezed
abstract class ChapterContentDto with _$ChapterContentDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChapterContentDto({
    @Default(0) int index,
    @Default('') String uuid,
    @Default(0) int count,
    @Default(0) int ordered,
    @Default(0) int size,
    @Default('') String name,
    @Default('') String comicId,
    @Default('') String comicPathWord,
    String? groupId,
    @Default('') String groupPathWord,
    @Default(0) int type,
    @Default('') String news,
    @Default('') String datetimeCreated,
    String? prev,
    String? next,
    @Default([]) List<ChapterImageDto> contents,
    @Default([]) List<int> words,
    @Default(false) bool isLong,
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
