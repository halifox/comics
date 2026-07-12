import 'package:freezed_annotation/freezed_annotation.dart';

part 'copy_manga_dto.freezed.dart';
part 'copy_manga_dto.g.dart';

@freezed
abstract class CopyMangaResponse with _$CopyMangaResponse {
  const factory CopyMangaResponse({
    @Default(0) int code,
    @Default('请求失败') String message,
    @Default(<String, dynamic>{}) Object results,
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
    @Default(ComicStatusDto()) ComicStatusDto status,
  }) = _ComicDto;

  factory ComicDto.fromJson(Map<String, dynamic> json) =>
      _$ComicDtoFromJson(json);
}

@freezed
abstract class RankedComicDto with _$RankedComicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RankedComicDto({
    @Default(ComicDto()) ComicDto comic,
    @Default(0) int sort,
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
    @Default(HomeTopicSectionDto()) HomeTopicSectionDto topics,
    @Default(HomeTopicSectionDto()) HomeTopicSectionDto topicsList,
    @JsonKey(name: 'recComics')
    @Default(HomeRecommendedSectionDto())
    HomeRecommendedSectionDto recommended,
    @JsonKey(name: 'hotComics') @Default([]) List<HomeUpdateDto> hot,
    @JsonKey(name: 'newComics') @Default([]) List<HomeUpdateDto> latest,
    @JsonKey(name: 'finishComics')
    @Default(HomeComicSectionDto())
    HomeComicSectionDto finished,
    @JsonKey(name: 'rankDayComics')
    @Default(HomeRankSectionDto())
    HomeRankSectionDto rankDay,
    @JsonKey(name: 'rankWeekComics')
    @Default(HomeRankSectionDto())
    HomeRankSectionDto rankWeek,
    @JsonKey(name: 'rankMonthComics')
    @Default(HomeRankSectionDto())
    HomeRankSectionDto rankMonth,
    @Default([]) List<HomeBannerDto> banners,
  }) = _HomeResultDto;

  factory HomeResultDto.fromJson(Map<String, dynamic> json) =>
      _$HomeResultDtoFromJson(json);
}

@freezed
abstract class HomeTopicSectionDto with _$HomeTopicSectionDto {
  const factory HomeTopicSectionDto({
    @Default([]) List<HomeTopicDto> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _HomeTopicSectionDto;

  factory HomeTopicSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeTopicSectionDtoFromJson(json);
}

@freezed
abstract class HomeTopicDto with _$HomeTopicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeTopicDto({
    @Default('') String title,
    @Default('') String series,
    @Default('') String journal,
    @Default('') String cover,
    @Default('') String period,
    @Default(0) int type,
    @Default('') String brief,
    @Default('') String pathWord,
    @Default('') String datetimeCreated,
  }) = _HomeTopicDto;

  factory HomeTopicDto.fromJson(Map<String, dynamic> json) =>
      _$HomeTopicDtoFromJson(json);
}

@freezed
abstract class HomeRecommendedSectionDto with _$HomeRecommendedSectionDto {
  const factory HomeRecommendedSectionDto({
    @Default([]) List<HomeRecommendedItemDto> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _HomeRecommendedSectionDto;

  factory HomeRecommendedSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRecommendedSectionDtoFromJson(json);
}

@freezed
abstract class HomeRecommendedItemDto with _$HomeRecommendedItemDto {
  const factory HomeRecommendedItemDto({
    @Default(0) int type,
    @Default(HomeComicDto()) HomeComicDto comic,
  }) = _HomeRecommendedItemDto;

  factory HomeRecommendedItemDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRecommendedItemDtoFromJson(json);
}

@freezed
abstract class HomeUpdateDto with _$HomeUpdateDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeUpdateDto({
    @Default('') String name,
    @Default('') String datetimeCreated,
    @Default(HomeComicDto()) HomeComicDto comic,
  }) = _HomeUpdateDto;

  factory HomeUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$HomeUpdateDtoFromJson(json);
}

@freezed
abstract class HomeComicSectionDto with _$HomeComicSectionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeComicSectionDto({
    @Default('') String name,
    @Default('') String pathWord,
    @Default('') String type,
    @Default([]) List<HomeComicDto> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _HomeComicSectionDto;

  factory HomeComicSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeComicSectionDtoFromJson(json);
}

@freezed
abstract class HomeRankSectionDto with _$HomeRankSectionDto {
  const factory HomeRankSectionDto({
    @Default([]) List<HomeRankItemDto> list,
    @Default(0) int total,
    @Default(0) int limit,
    @Default(0) int offset,
  }) = _HomeRankSectionDto;

  factory HomeRankSectionDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRankSectionDtoFromJson(json);
}

@freezed
abstract class HomeRankItemDto with _$HomeRankItemDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeRankItemDto({
    @Default(HomeComicDto()) HomeComicDto comic,
    @Default(0) int sort,
    @Default(0) int sortLast,
    @Default(0) int riseSort,
    @Default(0) int riseNum,
    @Default(0) int popular,
    @Default(0) int dateType,
  }) = _HomeRankItemDto;

  factory HomeRankItemDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRankItemDtoFromJson(json);
}

@freezed
abstract class HomeComicDto with _$HomeComicDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeComicDto({
    @Default('') String name,
    @Default('') String pathWord,
    @Default('') String cover,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @Default('') String authorAlias,
    @Default(0) int popular,
    @Default('') String datetimeUpdated,
    @Default('') String lastChapterName,
    @Default([]) List<NamedPathDto> females,
    @Default([]) List<NamedPathDto> males,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    @Default('') Object freeType,
  }) = _HomeComicDto;

  factory HomeComicDto.fromJson(Map<String, dynamic> json) =>
      _$HomeComicDtoFromJson(json);
}

@freezed
abstract class HomeBannerDto with _$HomeBannerDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HomeBannerDto({
    @Default('') String cover,
    @Default('') String brief,
    @Default(0) int type,
    @Default('') String outUuid,
    @Default(NamedPathDto()) NamedPathDto comic,
  }) = _HomeBannerDto;

  factory HomeBannerDto.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerDtoFromJson(json);
}

@freezed
abstract class ComicPageResultDto with _$ComicPageResultDto {
  const factory ComicPageResultDto({
    @Default([]) List<ComicDto> list,
    @Default(0) int total,
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
    @Default(ComicInfoDto()) ComicInfoDto comic,
    @Default(0) int popular,
    @Default({}) Map<String, ChapterGroupDto> groups,
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
    @Default(LabeledValueDto()) LabeledValueDto freeType,
    @Default(LabeledValueDto()) LabeledValueDto restrict,
    @Default(LabeledValueDto()) LabeledValueDto reclass,
    @Default([]) List<NamedPathDto> females,
    @Default([]) List<NamedPathDto> males,
    @Default([]) List<NamedPathDto> clubs,
    @Default('') String seoBaidu,
    @Default(LabeledValueDto()) LabeledValueDto region,
    @Default(ComicStatusDto()) ComicStatusDto status,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    @Default([]) List<NamedPathDto> parodies,
    @Default('') String brief,
    @Default('') String datetimeUpdated,
    @Default('') String cover,
    @Default(ChapterDto()) ChapterDto lastChapter,
    @Default(0) int popular,
    @Default('') Object channel,
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
    @Default('') String groupId,
    @Default('') String groupPathWord,
    @Default(0) int type,
    @Default('') String news,
    @Default('') String datetimeCreated,
    @Default('') String prev,
    @Default('') String next,
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
    @Default(ChapterComicDto()) ChapterComicDto comic,
    @Default(ChapterContentDto()) ChapterContentDto chapter,
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
    @Default(LabeledValueDto()) LabeledValueDto restrict,
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
    @Default('') String groupId,
    @Default('') String groupPathWord,
    @Default(0) int type,
    @Default('') String news,
    @Default('') String datetimeCreated,
    @Default('') String prev,
    @Default('') String next,
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
    @JsonKey(name: 'static') @Default('') String staticHost,
    @JsonKey(name: 'image') @Default('') String imageHost,
    @Default([]) List<String> share,
    @Default([]) List<List<String>> api,
    @Default([]) List<List<String>> ads,
    @Default('') String hostComic,
    @Default('') String hostCartoon,
    @Default('') String hostNovel,
    @Default(0) int dayDownloadsTotal,
    @Default(0) int adsRewardDownloads,
    @Default(0) int adsRewardDayShow,
    @Default(0) int adsScreenShow,
    @Default(0) int adsReadExpressShow,
    @Default(0) int adsHomeSeconds,
    @Default(0) int adsRestartSeconds,
    @Default(0) int adsComicShow,
    @Default(0) int adsCartoonShow,
    @Default(0) int dayDownloads,
    @Default(0) int vipDownloads,
    @Default(0) int rewardDownloads,
    @Default('') Object adsVipEnd,
    @Default(false) bool adsStatSwitch,
    @Default(false) bool adsStatSwitch2,
    @Default(0) int adsRewardSeconds,
    @Default(false) bool inMainland,
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
