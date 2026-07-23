import 'package:freezed_annotation/freezed_annotation.dart';

part 'copy_manga_dto.freezed.dart';
part 'copy_manga_dto.g.dart';

@freezed
abstract class CopyMangaResponse with _$CopyMangaResponse {
  const factory CopyMangaResponse({
    @JsonKey(name: 'code') @Default(0) int code,
    @JsonKey(name: 'message') @Default('请求失败') String message,
    @JsonKey(name: 'results') @Default(<String, dynamic>{}) Object results,
  }) = _CopyMangaResponse;

  factory CopyMangaResponse.fromJson(Map<String, dynamic> json) => _$CopyMangaResponseFromJson(json);
}

@freezed
abstract class NamedPathDto with _$NamedPathDto {
  const factory NamedPathDto({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'path_word') @Default('') String pathWord,
  }) = _NamedPathDto;

  factory NamedPathDto.fromJson(Map<String, dynamic> json) => _$NamedPathDtoFromJson(json);
}

@freezed
abstract class ComicStatusDto with _$ComicStatusDto {
  const factory ComicStatusDto({
    @JsonKey(name: 'value') @Default(0) int value,
    @JsonKey(name: 'display') @Default('') String display,
  }) = _ComicStatusDto;

  factory ComicStatusDto.fromJson(Map<String, dynamic> json) => _$ComicStatusDtoFromJson(json);
}

@freezed
abstract class ComicDto with _$ComicDto {
  const factory ComicDto({
    @JsonKey(name: 'path_word') @Default('') String pathWord,
    @JsonKey(name: 'uuid') @Default('') String uuid,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'cover') @Default('') String cover,
    @JsonKey(name: 'brief') @Default('') String brief,
    @JsonKey(name: 'datetime_updated') @Default('') String datetimeUpdated,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    @JsonKey(name: 'females') @Default([]) List<NamedPathDto> females,
    @JsonKey(name: 'males') @Default([]) List<NamedPathDto> males,
    @JsonKey(name: 'author_alias') @Default('') String authorAlias,
    @JsonKey(name: 'popular') @Default(0) int popular,
    @JsonKey(name: 'status') @Default(ComicStatusDto()) ComicStatusDto status,
  }) = _ComicDto;

  factory ComicDto.fromJson(Map<String, dynamic> json) => _$ComicDtoFromJson(json);
}

@freezed
abstract class RankedComicDto with _$RankedComicDto {
  const factory RankedComicDto({
    @JsonKey(name: 'comic') @Default(ComicDto()) ComicDto comic,
    @JsonKey(name: 'sort') @Default(0) int sort,
    @JsonKey(name: 'sort_last') @Default(0) int sortLast,
    @JsonKey(name: 'rise_sort') @Default(0) int riseSort,
    @JsonKey(name: 'rise_num') @Default(0) int riseNum,
    @JsonKey(name: 'date_type') @Default(0) int dateType,
    @JsonKey(name: 'popular') @Default(0) int popular,
  }) = _RankedComicDto;

  factory RankedComicDto.fromJson(Map<String, dynamic> json) => _$RankedComicDtoFromJson(json);
}

@freezed
abstract class HomeResultDto with _$HomeResultDto {
  const factory HomeResultDto({
    @JsonKey(name: 'topics') @Default(HomeTopicSectionDto()) HomeTopicSectionDto topics,
    @JsonKey(name: 'topicsList') @Default(HomeTopicSectionDto()) HomeTopicSectionDto topicsList,
    @JsonKey(name: 'recComics') @Default(HomeRecommendedSectionDto()) HomeRecommendedSectionDto recommended,
    @JsonKey(name: 'hotComics') @Default([]) List<HomeUpdateDto> hot,
    @JsonKey(name: 'newComics') @Default([]) List<HomeUpdateDto> latest,
    @JsonKey(name: 'finishComics') @Default(HomeComicSectionDto()) HomeComicSectionDto finished,
    @JsonKey(name: 'rankDayComics') @Default(HomeRankSectionDto()) HomeRankSectionDto rankDay,
    @JsonKey(name: 'rankWeekComics') @Default(HomeRankSectionDto()) HomeRankSectionDto rankWeek,
    @JsonKey(name: 'rankMonthComics') @Default(HomeRankSectionDto()) HomeRankSectionDto rankMonth,
    @JsonKey(name: 'banners') @Default([]) List<HomeBannerDto> banners,
  }) = _HomeResultDto;

  factory HomeResultDto.fromJson(Map<String, dynamic> json) => _$HomeResultDtoFromJson(json);
}

@freezed
abstract class HomeTopicSectionDto with _$HomeTopicSectionDto {
  const factory HomeTopicSectionDto({
    @JsonKey(name: 'list') @Default([]) List<HomeTopicDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'limit') @Default(0) int limit,
    @JsonKey(name: 'offset') @Default(0) int offset,
  }) = _HomeTopicSectionDto;

  factory HomeTopicSectionDto.fromJson(Map<String, dynamic> json) => _$HomeTopicSectionDtoFromJson(json);
}

@freezed
abstract class HomeTopicDto with _$HomeTopicDto {
  const factory HomeTopicDto({
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'series') @Default('') String series,
    @JsonKey(name: 'journal') @Default('') String journal,
    @JsonKey(name: 'cover') @Default('') String cover,
    @JsonKey(name: 'period') @Default('') String period,
    @JsonKey(name: 'type') @Default(0) int type,
    @JsonKey(name: 'brief') @Default('') String brief,
    @JsonKey(name: 'path_word') @Default('') String pathWord,
    @JsonKey(name: 'datetime_created') @Default('') String datetimeCreated,
  }) = _HomeTopicDto;

  factory HomeTopicDto.fromJson(Map<String, dynamic> json) => _$HomeTopicDtoFromJson(json);
}

@freezed
abstract class HomeRecommendedSectionDto with _$HomeRecommendedSectionDto {
  const factory HomeRecommendedSectionDto({
    @JsonKey(name: 'list') @Default([]) List<HomeRecommendedItemDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'limit') @Default(0) int limit,
    @JsonKey(name: 'offset') @Default(0) int offset,
  }) = _HomeRecommendedSectionDto;

  factory HomeRecommendedSectionDto.fromJson(Map<String, dynamic> json) => _$HomeRecommendedSectionDtoFromJson(json);
}

@freezed
abstract class HomeRecommendedItemDto with _$HomeRecommendedItemDto {
  const factory HomeRecommendedItemDto({
    @JsonKey(name: 'type') @Default(0) int type,
    @JsonKey(name: 'comic') @Default(HomeComicDto()) HomeComicDto comic,
  }) = _HomeRecommendedItemDto;

  factory HomeRecommendedItemDto.fromJson(Map<String, dynamic> json) => _$HomeRecommendedItemDtoFromJson(json);
}

@freezed
abstract class HomeUpdateDto with _$HomeUpdateDto {
  const factory HomeUpdateDto({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'datetime_created') @Default('') String datetimeCreated,
    @JsonKey(name: 'comic') @Default(HomeComicDto()) HomeComicDto comic,
  }) = _HomeUpdateDto;

  factory HomeUpdateDto.fromJson(Map<String, dynamic> json) => _$HomeUpdateDtoFromJson(json);
}

@freezed
abstract class NewReleaseResultDto with _$NewReleaseResultDto {
  const factory NewReleaseResultDto({
    @JsonKey(name: 'list') @Default([]) List<HomeUpdateDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'limit') @Default(0) int limit,
    @JsonKey(name: 'offset') @Default(0) int offset,
  }) = _NewReleaseResultDto;

  factory NewReleaseResultDto.fromJson(Map<String, dynamic> json) => _$NewReleaseResultDtoFromJson(json);
}

@freezed
abstract class HomeComicSectionDto with _$HomeComicSectionDto {
  const factory HomeComicSectionDto({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'path_word') @Default('') String pathWord,
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'list') @Default([]) List<HomeComicDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'limit') @Default(0) int limit,
    @JsonKey(name: 'offset') @Default(0) int offset,
  }) = _HomeComicSectionDto;

  factory HomeComicSectionDto.fromJson(Map<String, dynamic> json) => _$HomeComicSectionDtoFromJson(json);
}

@freezed
abstract class HomeRankSectionDto with _$HomeRankSectionDto {
  const factory HomeRankSectionDto({
    @JsonKey(name: 'list') @Default([]) List<HomeRankItemDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'limit') @Default(0) int limit,
    @JsonKey(name: 'offset') @Default(0) int offset,
  }) = _HomeRankSectionDto;

  factory HomeRankSectionDto.fromJson(Map<String, dynamic> json) => _$HomeRankSectionDtoFromJson(json);
}

@freezed
abstract class HomeRankItemDto with _$HomeRankItemDto {
  const factory HomeRankItemDto({
    @JsonKey(name: 'comic') @Default(HomeComicDto()) HomeComicDto comic,
    @JsonKey(name: 'sort') @Default(0) int sort,
    @JsonKey(name: 'sort_last') @Default(0) int sortLast,
    @JsonKey(name: 'rise_sort') @Default(0) int riseSort,
    @JsonKey(name: 'rise_num') @Default(0) int riseNum,
    @JsonKey(name: 'popular') @Default(0) int popular,
    @JsonKey(name: 'date_type') @Default(0) int dateType,
  }) = _HomeRankItemDto;

  factory HomeRankItemDto.fromJson(Map<String, dynamic> json) => _$HomeRankItemDtoFromJson(json);
}

@freezed
abstract class HomeComicDto with _$HomeComicDto {
  const factory HomeComicDto({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'path_word') @Default('') String pathWord,
    @JsonKey(name: 'cover') @Default('') String cover,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @JsonKey(name: 'author_alias') @Default('') String authorAlias,
    @JsonKey(name: 'popular') @Default(0) int popular,
    @JsonKey(name: 'datetime_updated') @Default('') String datetimeUpdated,
    @JsonKey(name: 'last_chapter_name') @Default('') String lastChapterName,
    @JsonKey(name: 'females') @Default([]) List<NamedPathDto> females,
    @JsonKey(name: 'males') @Default([]) List<NamedPathDto> males,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    @JsonKey(name: 'free_type') @Default('') Object freeType,
  }) = _HomeComicDto;

  factory HomeComicDto.fromJson(Map<String, dynamic> json) => _$HomeComicDtoFromJson(json);
}

@freezed
abstract class HomeBannerDto with _$HomeBannerDto {
  const factory HomeBannerDto({
    @JsonKey(name: 'cover') @Default('') String cover,
    @JsonKey(name: 'brief') @Default('') String brief,
    @JsonKey(name: 'type') @Default(0) int type,
    @JsonKey(name: 'out_uuid') @Default('') String outUuid,
    @JsonKey(name: 'comic') @Default(NamedPathDto()) NamedPathDto comic,
  }) = _HomeBannerDto;

  factory HomeBannerDto.fromJson(Map<String, dynamic> json) => _$HomeBannerDtoFromJson(json);
}

@freezed
abstract class ComicPageResultDto with _$ComicPageResultDto {
  const factory ComicPageResultDto({
    @JsonKey(name: 'list') @Default([]) List<ComicDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
  }) = _ComicPageResultDto;

  factory ComicPageResultDto.fromJson(Map<String, dynamic> json) => _$ComicPageResultDtoFromJson(json);
}

@freezed
abstract class RankPageResultDto with _$RankPageResultDto {
  const factory RankPageResultDto({
    @JsonKey(name: 'list') @Default([]) List<RankedComicDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'limit') @Default(0) int limit,
    @JsonKey(name: 'offset') @Default(0) int offset,
  }) = _RankPageResultDto;

  factory RankPageResultDto.fromJson(Map<String, dynamic> json) => _$RankPageResultDtoFromJson(json);
}

@freezed
abstract class ComicInfoResultDto with _$ComicInfoResultDto {
  const factory ComicInfoResultDto({
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
    @JsonKey(name: 'is_lock') @Default(false) bool isLock,
    @JsonKey(name: 'is_login') @Default(false) bool isLogin,
    @JsonKey(name: 'is_mobile_bind') @Default(false) bool isMobileBind,
    @JsonKey(name: 'is_vip') @Default(false) bool isVip,
    @JsonKey(name: 'comic') @Default(ComicInfoDto()) ComicInfoDto comic,
    @JsonKey(name: 'popular') @Default(0) int popular,
    @JsonKey(name: 'groups') @Default({}) Map<String, ChapterGroupDto> groups,
  }) = _ComicInfoResultDto;

  factory ComicInfoResultDto.fromJson(Map<String, dynamic> json) => _$ComicInfoResultDtoFromJson(json);
}

@freezed
abstract class ComicInfoDto with _$ComicInfoDto {
  const factory ComicInfoDto({
    @JsonKey(name: 'uuid') @Default('') String uuid,
    @JsonKey(name: 'b_404') @Default(false) bool b404,
    @JsonKey(name: 'b_hidden') @Default(false) bool bHidden,
    @JsonKey(name: 'ban') @Default(0) int ban,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'alias') @Default('') String alias,
    @JsonKey(name: 'path_word') @Default('') String pathWord,
    @JsonKey(name: 'close_comment') @Default(false) bool closeComment,
    @JsonKey(name: 'close_roast') @Default(false) bool closeRoast,
    @JsonKey(name: 'free_type') @Default(LabeledValueDto()) LabeledValueDto freeType,
    @JsonKey(name: 'restrict') @Default(LabeledValueDto()) LabeledValueDto restrict,
    @JsonKey(name: 'reclass') @Default(LabeledValueDto()) LabeledValueDto reclass,
    @JsonKey(name: 'females') @Default([]) List<NamedPathDto> females,
    @JsonKey(name: 'males') @Default([]) List<NamedPathDto> males,
    @JsonKey(name: 'clubs') @Default([]) List<NamedPathDto> clubs,
    @JsonKey(name: 'seo_baidu') @Default('') String seoBaidu,
    @JsonKey(name: 'region') @Default(LabeledValueDto()) LabeledValueDto region,
    @JsonKey(name: 'status') @Default(ComicStatusDto()) ComicStatusDto status,
    @JsonKey(name: 'author') @Default([]) List<NamedPathDto> authors,
    @JsonKey(name: 'theme') @Default([]) List<NamedPathDto> themes,
    @JsonKey(name: 'parodies') @Default([]) List<NamedPathDto> parodies,
    @JsonKey(name: 'brief') @Default('') String brief,
    @JsonKey(name: 'datetime_updated') @Default('') String datetimeUpdated,
    @JsonKey(name: 'cover') @Default('') String cover,
    @JsonKey(name: 'last_chapter') @Default(ChapterDto()) ChapterDto lastChapter,
    @JsonKey(name: 'popular') @Default(0) int popular,
    @JsonKey(name: 'channel') @Default('') Object channel,
  }) = _ComicInfoDto;

  factory ComicInfoDto.fromJson(Map<String, dynamic> json) => _$ComicInfoDtoFromJson(json);
}

@freezed
abstract class LabeledValueDto with _$LabeledValueDto {
  const factory LabeledValueDto({
    @JsonKey(name: 'value') @Default(0) int value,
    @JsonKey(name: 'display') @Default('') String display,
  }) = _LabeledValueDto;

  factory LabeledValueDto.fromJson(Map<String, dynamic> json) => _$LabeledValueDtoFromJson(json);
}

@freezed
abstract class ChapterGroupDto with _$ChapterGroupDto {
  const factory ChapterGroupDto({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'path_word') @Default('') String pathWord,
    @JsonKey(name: 'count') @Default(0) int count,
  }) = _ChapterGroupDto;

  factory ChapterGroupDto.fromJson(Map<String, dynamic> json) => _$ChapterGroupDtoFromJson(json);
}

@freezed
abstract class ChapterListResultDto with _$ChapterListResultDto {
  const factory ChapterListResultDto({
    @JsonKey(name: 'list') @Default([]) List<ChapterDto> list,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'limit') @Default(0) int limit,
    @JsonKey(name: 'offset') @Default(0) int offset,
  }) = _ChapterListResultDto;

  factory ChapterListResultDto.fromJson(Map<String, dynamic> json) => _$ChapterListResultDtoFromJson(json);
}

@freezed
abstract class ChapterDto with _$ChapterDto {
  const factory ChapterDto({
    @JsonKey(name: 'index') @Default(0) int index,
    @JsonKey(name: 'uuid') @Default('') String uuid,
    @JsonKey(name: 'count') @Default(0) int count,
    @JsonKey(name: 'ordered') @Default(0) int ordered,
    @JsonKey(name: 'size') @Default(0) int size,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'comic_id') @Default('') String comicId,
    @JsonKey(name: 'comic_path_word') @Default('') String comicPathWord,
    @JsonKey(name: 'group_id') @Default('') String groupId,
    @JsonKey(name: 'group_path_word') @Default('') String groupPathWord,
    @JsonKey(name: 'type') @Default(0) int type,
    @JsonKey(name: 'news') @Default('') String news,
    @JsonKey(name: 'datetime_created') @Default('') String datetimeCreated,
    @JsonKey(name: 'prev') @Default('') String prev,
    @JsonKey(name: 'next') @Default('') String next,
  }) = _ChapterDto;

  factory ChapterDto.fromJson(Map<String, dynamic> json) => _$ChapterDtoFromJson(json);
}

@freezed
abstract class ChapterContentResultDto with _$ChapterContentResultDto {
  const factory ChapterContentResultDto({
    @JsonKey(name: 'show_app') @Default(false) bool showApp,
    @JsonKey(name: 'is_lock') @Default(false) bool isLock,
    @JsonKey(name: 'is_login') @Default(false) bool isLogin,
    @JsonKey(name: 'is_mobile_bind') @Default(false) bool isMobileBind,
    @JsonKey(name: 'is_vip') @Default(false) bool isVip,
    @JsonKey(name: 'comic') @Default(ChapterComicDto()) ChapterComicDto comic,
    @JsonKey(name: 'chapter') @Default(ChapterContentDto()) ChapterContentDto chapter,
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
  }) = _ChapterContentResultDto;

  factory ChapterContentResultDto.fromJson(Map<String, dynamic> json) => _$ChapterContentResultDtoFromJson(json);
}

@freezed
abstract class ChapterComicDto with _$ChapterComicDto {
  const factory ChapterComicDto({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'uuid') @Default('') String uuid,
    @JsonKey(name: 'path_word') @Default('') String pathWord,
    @JsonKey(name: 'restrict') @Default(LabeledValueDto()) LabeledValueDto restrict,
  }) = _ChapterComicDto;

  factory ChapterComicDto.fromJson(Map<String, dynamic> json) => _$ChapterComicDtoFromJson(json);
}

@freezed
abstract class ChapterContentDto with _$ChapterContentDto {
  const factory ChapterContentDto({
    @JsonKey(name: 'index') @Default(0) int index,
    @JsonKey(name: 'uuid') @Default('') String uuid,
    @JsonKey(name: 'count') @Default(0) int count,
    @JsonKey(name: 'ordered') @Default(0) int ordered,
    @JsonKey(name: 'size') @Default(0) int size,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'comic_id') @Default('') String comicId,
    @JsonKey(name: 'comic_path_word') @Default('') String comicPathWord,
    @JsonKey(name: 'group_id') @Default('') String groupId,
    @JsonKey(name: 'group_path_word') @Default('') String groupPathWord,
    @JsonKey(name: 'type') @Default(0) int type,
    @JsonKey(name: 'news') @Default('') String news,
    @JsonKey(name: 'datetime_created') @Default('') String datetimeCreated,
    @JsonKey(name: 'prev') @Default('') String prev,
    @JsonKey(name: 'next') @Default('') String next,
    @JsonKey(name: 'contents') @Default([]) List<ChapterImageDto> contents,
    @JsonKey(name: 'words') @Default([]) List<int> words,
    @JsonKey(name: 'is_long') @Default(false) bool isLong,
  }) = _ChapterContentDto;

  factory ChapterContentDto.fromJson(Map<String, dynamic> json) => _$ChapterContentDtoFromJson(json);
}

@freezed
abstract class ChapterImageDto with _$ChapterImageDto {
  const factory ChapterImageDto({@JsonKey(name: 'url') @Default('') String url}) = _ChapterImageDto;

  factory ChapterImageDto.fromJson(Map<String, dynamic> json) => _$ChapterImageDtoFromJson(json);
}

@freezed
abstract class NetworkResultDto with _$NetworkResultDto {
  const factory NetworkResultDto({
    @JsonKey(name: 'static') @Default('') String staticHost,
    @JsonKey(name: 'image') @Default('') String imageHost,
    @JsonKey(name: 'share') @Default([]) List<String> share,
    @JsonKey(name: 'api') @Default([]) List<List<String>> api,
    @JsonKey(name: 'ads') @Default([]) List<List<String>> ads,
    @JsonKey(name: 'host_comic') @Default('') String hostComic,
    @JsonKey(name: 'host_cartoon') @Default('') String hostCartoon,
    @JsonKey(name: 'host_novel') @Default('') String hostNovel,
    @JsonKey(name: 'day_downloads_total') @Default(0) int dayDownloadsTotal,
    @JsonKey(name: 'ads_reward_downloads') @Default(0) int adsRewardDownloads,
    @JsonKey(name: 'ads_reward_day_show') @Default(0) int adsRewardDayShow,
    @JsonKey(name: 'ads_screen_show') @Default(0) int adsScreenShow,
    @JsonKey(name: 'ads_read_express_show') @Default(0) int adsReadExpressShow,
    @JsonKey(name: 'ads_home_seconds') @Default(0) int adsHomeSeconds,
    @JsonKey(name: 'ads_restart_seconds') @Default(0) int adsRestartSeconds,
    @JsonKey(name: 'ads_comic_show') @Default(0) int adsComicShow,
    @JsonKey(name: 'ads_cartoon_show') @Default(0) int adsCartoonShow,
    @JsonKey(name: 'day_downloads') @Default(0) int dayDownloads,
    @JsonKey(name: 'vip_downloads') @Default(0) int vipDownloads,
    @JsonKey(name: 'reward_downloads') @Default(0) int rewardDownloads,
    @JsonKey(name: 'ads_vip_end') @Default('') Object adsVipEnd,
    @JsonKey(name: 'ads_stat_switch') @Default(false) bool adsStatSwitch,
    @JsonKey(name: 'ads_stat_switch2') @Default(false) bool adsStatSwitch2,
    @JsonKey(name: 'ads_reward_seconds') @Default(0) int adsRewardSeconds,
    @JsonKey(name: 'in_mainland') @Default(false) bool inMainland,
  }) = _NetworkResultDto;

  factory NetworkResultDto.fromJson(Map<String, dynamic> json) => _$NetworkResultDtoFromJson(json);
}

@freezed
abstract class RequestIdResultDto with _$RequestIdResultDto {
  const factory RequestIdResultDto({@JsonKey(name: 'request_id') @Default('') String requestId}) = _RequestIdResultDto;

  factory RequestIdResultDto.fromJson(Map<String, dynamic> json) => _$RequestIdResultDtoFromJson(json);
}
