// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_manga_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CopyMangaResponse _$CopyMangaResponseFromJson(Map<String, dynamic> json) =>
    _CopyMangaResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '请求失败',
      results: json['results'] as Object? ?? const <String, dynamic>{},
    );

Map<String, dynamic> _$CopyMangaResponseToJson(_CopyMangaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'results': instance.results,
    };

_NamedPathDto _$NamedPathDtoFromJson(Map<String, dynamic> json) =>
    _NamedPathDto(
      name: json['name'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
    );

Map<String, dynamic> _$NamedPathDtoToJson(_NamedPathDto instance) =>
    <String, dynamic>{'name': instance.name, 'path_word': instance.pathWord};

_ComicStatusDto _$ComicStatusDtoFromJson(Map<String, dynamic> json) =>
    _ComicStatusDto(
      value: (json['value'] as num?)?.toInt() ?? 0,
      display: json['display'] as String? ?? '',
    );

Map<String, dynamic> _$ComicStatusDtoToJson(_ComicStatusDto instance) =>
    <String, dynamic>{'value': instance.value, 'display': instance.display};

_ComicDto _$ComicDtoFromJson(Map<String, dynamic> json) => _ComicDto(
  pathWord: json['path_word'] as String? ?? '',
  uuid: json['uuid'] as String? ?? '',
  name: json['name'] as String? ?? '',
  cover: json['cover'] as String? ?? '',
  brief: json['brief'] as String? ?? '',
  datetimeUpdated: json['datetime_updated'] as String? ?? '',
  authors:
      (json['author'] as List<dynamic>?)
          ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  themes:
      (json['theme'] as List<dynamic>?)
          ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  females:
      (json['females'] as List<dynamic>?)
          ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  males:
      (json['males'] as List<dynamic>?)
          ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  authorAlias: json['author_alias'] as String? ?? '',
  popular: (json['popular'] as num?)?.toInt() ?? 0,
  status: json['status'] == null
      ? const ComicStatusDto()
      : ComicStatusDto.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ComicDtoToJson(_ComicDto instance) => <String, dynamic>{
  'path_word': instance.pathWord,
  'uuid': instance.uuid,
  'name': instance.name,
  'cover': instance.cover,
  'brief': instance.brief,
  'datetime_updated': instance.datetimeUpdated,
  'author': instance.authors,
  'theme': instance.themes,
  'females': instance.females,
  'males': instance.males,
  'author_alias': instance.authorAlias,
  'popular': instance.popular,
  'status': instance.status,
};

_RankedComicDto _$RankedComicDtoFromJson(Map<String, dynamic> json) =>
    _RankedComicDto(
      comic: json['comic'] == null
          ? const ComicDto()
          : ComicDto.fromJson(json['comic'] as Map<String, dynamic>),
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      sortLast: (json['sort_last'] as num?)?.toInt() ?? 0,
      riseSort: (json['rise_sort'] as num?)?.toInt() ?? 0,
      riseNum: (json['rise_num'] as num?)?.toInt() ?? 0,
      dateType: (json['date_type'] as num?)?.toInt() ?? 0,
      popular: (json['popular'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RankedComicDtoToJson(_RankedComicDto instance) =>
    <String, dynamic>{
      'comic': instance.comic,
      'sort': instance.sort,
      'sort_last': instance.sortLast,
      'rise_sort': instance.riseSort,
      'rise_num': instance.riseNum,
      'date_type': instance.dateType,
      'popular': instance.popular,
    };

_HomeResultDto _$HomeResultDtoFromJson(Map<String, dynamic> json) =>
    _HomeResultDto(
      topics: json['topics'] == null
          ? const HomeTopicSectionDto()
          : HomeTopicSectionDto.fromJson(
              json['topics'] as Map<String, dynamic>,
            ),
      topicsList: json['topicsList'] == null
          ? const HomeTopicSectionDto()
          : HomeTopicSectionDto.fromJson(
              json['topicsList'] as Map<String, dynamic>,
            ),
      recommended: json['recComics'] == null
          ? const HomeRecommendedSectionDto()
          : HomeRecommendedSectionDto.fromJson(
              json['recComics'] as Map<String, dynamic>,
            ),
      hot:
          (json['hotComics'] as List<dynamic>?)
              ?.map((e) => HomeUpdateDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      latest:
          (json['newComics'] as List<dynamic>?)
              ?.map((e) => HomeUpdateDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      finished: json['finishComics'] == null
          ? const HomeComicSectionDto()
          : HomeComicSectionDto.fromJson(
              json['finishComics'] as Map<String, dynamic>,
            ),
      rankDay: json['rankDayComics'] == null
          ? const HomeRankSectionDto()
          : HomeRankSectionDto.fromJson(
              json['rankDayComics'] as Map<String, dynamic>,
            ),
      rankWeek: json['rankWeekComics'] == null
          ? const HomeRankSectionDto()
          : HomeRankSectionDto.fromJson(
              json['rankWeekComics'] as Map<String, dynamic>,
            ),
      rankMonth: json['rankMonthComics'] == null
          ? const HomeRankSectionDto()
          : HomeRankSectionDto.fromJson(
              json['rankMonthComics'] as Map<String, dynamic>,
            ),
      banners:
          (json['banners'] as List<dynamic>?)
              ?.map((e) => HomeBannerDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeResultDtoToJson(_HomeResultDto instance) =>
    <String, dynamic>{
      'topics': instance.topics,
      'topicsList': instance.topicsList,
      'recComics': instance.recommended,
      'hotComics': instance.hot,
      'newComics': instance.latest,
      'finishComics': instance.finished,
      'rankDayComics': instance.rankDay,
      'rankWeekComics': instance.rankWeek,
      'rankMonthComics': instance.rankMonth,
      'banners': instance.banners,
    };

_HomeTopicSectionDto _$HomeTopicSectionDtoFromJson(Map<String, dynamic> json) =>
    _HomeTopicSectionDto(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => HomeTopicDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HomeTopicSectionDtoToJson(
  _HomeTopicSectionDto instance,
) => <String, dynamic>{
  'list': instance.list,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};

_HomeTopicDto _$HomeTopicDtoFromJson(Map<String, dynamic> json) =>
    _HomeTopicDto(
      title: json['title'] as String? ?? '',
      series: json['series'] as String? ?? '',
      journal: json['journal'] as String? ?? '',
      cover: json['cover'] as String? ?? '',
      period: json['period'] as String? ?? '',
      type: (json['type'] as num?)?.toInt() ?? 0,
      brief: json['brief'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
      datetimeCreated: json['datetime_created'] as String? ?? '',
    );

Map<String, dynamic> _$HomeTopicDtoToJson(_HomeTopicDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'series': instance.series,
      'journal': instance.journal,
      'cover': instance.cover,
      'period': instance.period,
      'type': instance.type,
      'brief': instance.brief,
      'path_word': instance.pathWord,
      'datetime_created': instance.datetimeCreated,
    };

_HomeRecommendedSectionDto _$HomeRecommendedSectionDtoFromJson(
  Map<String, dynamic> json,
) => _HomeRecommendedSectionDto(
  list:
      (json['list'] as List<dynamic>?)
          ?.map(
            (e) => HomeRecommendedItemDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  offset: (json['offset'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$HomeRecommendedSectionDtoToJson(
  _HomeRecommendedSectionDto instance,
) => <String, dynamic>{
  'list': instance.list,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};

_HomeRecommendedItemDto _$HomeRecommendedItemDtoFromJson(
  Map<String, dynamic> json,
) => _HomeRecommendedItemDto(
  type: (json['type'] as num?)?.toInt() ?? 0,
  comic: json['comic'] == null
      ? const HomeComicDto()
      : HomeComicDto.fromJson(json['comic'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeRecommendedItemDtoToJson(
  _HomeRecommendedItemDto instance,
) => <String, dynamic>{'type': instance.type, 'comic': instance.comic};

_HomeUpdateDto _$HomeUpdateDtoFromJson(Map<String, dynamic> json) =>
    _HomeUpdateDto(
      name: json['name'] as String? ?? '',
      datetimeCreated: json['datetime_created'] as String? ?? '',
      comic: json['comic'] == null
          ? const HomeComicDto()
          : HomeComicDto.fromJson(json['comic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeUpdateDtoToJson(_HomeUpdateDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'datetime_created': instance.datetimeCreated,
      'comic': instance.comic,
    };

_HomeComicSectionDto _$HomeComicSectionDtoFromJson(Map<String, dynamic> json) =>
    _HomeComicSectionDto(
      name: json['name'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
      type: json['type'] as String? ?? '',
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => HomeComicDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HomeComicSectionDtoToJson(
  _HomeComicSectionDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'path_word': instance.pathWord,
  'type': instance.type,
  'list': instance.list,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};

_HomeRankSectionDto _$HomeRankSectionDtoFromJson(Map<String, dynamic> json) =>
    _HomeRankSectionDto(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => HomeRankItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HomeRankSectionDtoToJson(_HomeRankSectionDto instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };

_HomeRankItemDto _$HomeRankItemDtoFromJson(Map<String, dynamic> json) =>
    _HomeRankItemDto(
      comic: json['comic'] == null
          ? const HomeComicDto()
          : HomeComicDto.fromJson(json['comic'] as Map<String, dynamic>),
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      sortLast: (json['sort_last'] as num?)?.toInt() ?? 0,
      riseSort: (json['rise_sort'] as num?)?.toInt() ?? 0,
      riseNum: (json['rise_num'] as num?)?.toInt() ?? 0,
      popular: (json['popular'] as num?)?.toInt() ?? 0,
      dateType: (json['date_type'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HomeRankItemDtoToJson(_HomeRankItemDto instance) =>
    <String, dynamic>{
      'comic': instance.comic,
      'sort': instance.sort,
      'sort_last': instance.sortLast,
      'rise_sort': instance.riseSort,
      'rise_num': instance.riseNum,
      'popular': instance.popular,
      'date_type': instance.dateType,
    };

_HomeComicDto _$HomeComicDtoFromJson(Map<String, dynamic> json) =>
    _HomeComicDto(
      name: json['name'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
      cover: json['cover'] as String? ?? '',
      authors:
          (json['author'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      authorAlias: json['author_alias'] as String? ?? '',
      popular: (json['popular'] as num?)?.toInt() ?? 0,
      datetimeUpdated: json['datetime_updated'] as String? ?? '',
      lastChapterName: json['last_chapter_name'] as String? ?? '',
      females:
          (json['females'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      males:
          (json['males'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      themes:
          (json['theme'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      freeType: json['free_type'] as Object? ?? '',
    );

Map<String, dynamic> _$HomeComicDtoToJson(_HomeComicDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path_word': instance.pathWord,
      'cover': instance.cover,
      'author': instance.authors,
      'author_alias': instance.authorAlias,
      'popular': instance.popular,
      'datetime_updated': instance.datetimeUpdated,
      'last_chapter_name': instance.lastChapterName,
      'females': instance.females,
      'males': instance.males,
      'theme': instance.themes,
      'free_type': instance.freeType,
    };

_HomeBannerDto _$HomeBannerDtoFromJson(Map<String, dynamic> json) =>
    _HomeBannerDto(
      cover: json['cover'] as String? ?? '',
      brief: json['brief'] as String? ?? '',
      type: (json['type'] as num?)?.toInt() ?? 0,
      outUuid: json['out_uuid'] as String? ?? '',
      comic: json['comic'] == null
          ? const NamedPathDto()
          : NamedPathDto.fromJson(json['comic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeBannerDtoToJson(_HomeBannerDto instance) =>
    <String, dynamic>{
      'cover': instance.cover,
      'brief': instance.brief,
      'type': instance.type,
      'out_uuid': instance.outUuid,
      'comic': instance.comic,
    };

_ComicPageResultDto _$ComicPageResultDtoFromJson(Map<String, dynamic> json) =>
    _ComicPageResultDto(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => ComicDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ComicPageResultDtoToJson(_ComicPageResultDto instance) =>
    <String, dynamic>{'list': instance.list, 'total': instance.total};

_RankPageResultDto _$RankPageResultDtoFromJson(Map<String, dynamic> json) =>
    _RankPageResultDto(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => RankedComicDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RankPageResultDtoToJson(_RankPageResultDto instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };

_ComicInfoResultDto _$ComicInfoResultDtoFromJson(Map<String, dynamic> json) =>
    _ComicInfoResultDto(
      isBanned: json['is_banned'] as bool? ?? false,
      isLock: json['is_lock'] as bool? ?? false,
      isLogin: json['is_login'] as bool? ?? false,
      isMobileBind: json['is_mobile_bind'] as bool? ?? false,
      isVip: json['is_vip'] as bool? ?? false,
      comic: json['comic'] == null
          ? const ComicInfoDto()
          : ComicInfoDto.fromJson(json['comic'] as Map<String, dynamic>),
      popular: (json['popular'] as num?)?.toInt() ?? 0,
      groups:
          (json['groups'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              ChapterGroupDto.fromJson(e as Map<String, dynamic>),
            ),
          ) ??
          const {},
    );

Map<String, dynamic> _$ComicInfoResultDtoToJson(_ComicInfoResultDto instance) =>
    <String, dynamic>{
      'is_banned': instance.isBanned,
      'is_lock': instance.isLock,
      'is_login': instance.isLogin,
      'is_mobile_bind': instance.isMobileBind,
      'is_vip': instance.isVip,
      'comic': instance.comic,
      'popular': instance.popular,
      'groups': instance.groups,
    };

_ComicInfoDto _$ComicInfoDtoFromJson(Map<String, dynamic> json) =>
    _ComicInfoDto(
      uuid: json['uuid'] as String? ?? '',
      b404: json['b_404'] as bool? ?? false,
      bHidden: json['b_hidden'] as bool? ?? false,
      ban: (json['ban'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      alias: json['alias'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
      closeComment: json['close_comment'] as bool? ?? false,
      closeRoast: json['close_roast'] as bool? ?? false,
      freeType: json['free_type'] == null
          ? const LabeledValueDto()
          : LabeledValueDto.fromJson(json['free_type'] as Map<String, dynamic>),
      restrict: json['restrict'] == null
          ? const LabeledValueDto()
          : LabeledValueDto.fromJson(json['restrict'] as Map<String, dynamic>),
      reclass: json['reclass'] == null
          ? const LabeledValueDto()
          : LabeledValueDto.fromJson(json['reclass'] as Map<String, dynamic>),
      females:
          (json['females'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      males:
          (json['males'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      clubs:
          (json['clubs'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      seoBaidu: json['seo_baidu'] as String? ?? '',
      region: json['region'] == null
          ? const LabeledValueDto()
          : LabeledValueDto.fromJson(json['region'] as Map<String, dynamic>),
      status: json['status'] == null
          ? const ComicStatusDto()
          : ComicStatusDto.fromJson(json['status'] as Map<String, dynamic>),
      authors:
          (json['author'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      themes:
          (json['theme'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      parodies:
          (json['parodies'] as List<dynamic>?)
              ?.map((e) => NamedPathDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brief: json['brief'] as String? ?? '',
      datetimeUpdated: json['datetime_updated'] as String? ?? '',
      cover: json['cover'] as String? ?? '',
      lastChapter: json['last_chapter'] == null
          ? const ChapterDto()
          : ChapterDto.fromJson(json['last_chapter'] as Map<String, dynamic>),
      popular: (json['popular'] as num?)?.toInt() ?? 0,
      channel: json['channel'] as Object? ?? '',
    );

Map<String, dynamic> _$ComicInfoDtoToJson(_ComicInfoDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'b_404': instance.b404,
      'b_hidden': instance.bHidden,
      'ban': instance.ban,
      'name': instance.name,
      'alias': instance.alias,
      'path_word': instance.pathWord,
      'close_comment': instance.closeComment,
      'close_roast': instance.closeRoast,
      'free_type': instance.freeType,
      'restrict': instance.restrict,
      'reclass': instance.reclass,
      'females': instance.females,
      'males': instance.males,
      'clubs': instance.clubs,
      'seo_baidu': instance.seoBaidu,
      'region': instance.region,
      'status': instance.status,
      'author': instance.authors,
      'theme': instance.themes,
      'parodies': instance.parodies,
      'brief': instance.brief,
      'datetime_updated': instance.datetimeUpdated,
      'cover': instance.cover,
      'last_chapter': instance.lastChapter,
      'popular': instance.popular,
      'channel': instance.channel,
    };

_LabeledValueDto _$LabeledValueDtoFromJson(Map<String, dynamic> json) =>
    _LabeledValueDto(
      value: (json['value'] as num?)?.toInt() ?? 0,
      display: json['display'] as String? ?? '',
    );

Map<String, dynamic> _$LabeledValueDtoToJson(_LabeledValueDto instance) =>
    <String, dynamic>{'value': instance.value, 'display': instance.display};

_ChapterGroupDto _$ChapterGroupDtoFromJson(Map<String, dynamic> json) =>
    _ChapterGroupDto(
      name: json['name'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChapterGroupDtoToJson(_ChapterGroupDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path_word': instance.pathWord,
      'count': instance.count,
    };

_ChapterListResultDto _$ChapterListResultDtoFromJson(
  Map<String, dynamic> json,
) => _ChapterListResultDto(
  list:
      (json['list'] as List<dynamic>?)
          ?.map((e) => ChapterDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  offset: (json['offset'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChapterListResultDtoToJson(
  _ChapterListResultDto instance,
) => <String, dynamic>{
  'list': instance.list,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};

_ChapterDto _$ChapterDtoFromJson(Map<String, dynamic> json) => _ChapterDto(
  index: (json['index'] as num?)?.toInt() ?? 0,
  uuid: json['uuid'] as String? ?? '',
  count: (json['count'] as num?)?.toInt() ?? 0,
  ordered: (json['ordered'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  comicId: json['comic_id'] as String? ?? '',
  comicPathWord: json['comic_path_word'] as String? ?? '',
  groupId: json['group_id'] as String? ?? '',
  groupPathWord: json['group_path_word'] as String? ?? '',
  type: (json['type'] as num?)?.toInt() ?? 0,
  news: json['news'] as String? ?? '',
  datetimeCreated: json['datetime_created'] as String? ?? '',
  prev: json['prev'] as String? ?? '',
  next: json['next'] as String? ?? '',
);

Map<String, dynamic> _$ChapterDtoToJson(_ChapterDto instance) =>
    <String, dynamic>{
      'index': instance.index,
      'uuid': instance.uuid,
      'count': instance.count,
      'ordered': instance.ordered,
      'size': instance.size,
      'name': instance.name,
      'comic_id': instance.comicId,
      'comic_path_word': instance.comicPathWord,
      'group_id': instance.groupId,
      'group_path_word': instance.groupPathWord,
      'type': instance.type,
      'news': instance.news,
      'datetime_created': instance.datetimeCreated,
      'prev': instance.prev,
      'next': instance.next,
    };

_ChapterContentResultDto _$ChapterContentResultDtoFromJson(
  Map<String, dynamic> json,
) => _ChapterContentResultDto(
  showApp: json['show_app'] as bool? ?? false,
  isLock: json['is_lock'] as bool? ?? false,
  isLogin: json['is_login'] as bool? ?? false,
  isMobileBind: json['is_mobile_bind'] as bool? ?? false,
  isVip: json['is_vip'] as bool? ?? false,
  comic: json['comic'] == null
      ? const ChapterComicDto()
      : ChapterComicDto.fromJson(json['comic'] as Map<String, dynamic>),
  chapter: json['chapter'] == null
      ? const ChapterContentDto()
      : ChapterContentDto.fromJson(json['chapter'] as Map<String, dynamic>),
  isBanned: json['is_banned'] as bool? ?? false,
);

Map<String, dynamic> _$ChapterContentResultDtoToJson(
  _ChapterContentResultDto instance,
) => <String, dynamic>{
  'show_app': instance.showApp,
  'is_lock': instance.isLock,
  'is_login': instance.isLogin,
  'is_mobile_bind': instance.isMobileBind,
  'is_vip': instance.isVip,
  'comic': instance.comic,
  'chapter': instance.chapter,
  'is_banned': instance.isBanned,
};

_ChapterComicDto _$ChapterComicDtoFromJson(Map<String, dynamic> json) =>
    _ChapterComicDto(
      name: json['name'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
      restrict: json['restrict'] == null
          ? const LabeledValueDto()
          : LabeledValueDto.fromJson(json['restrict'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChapterComicDtoToJson(_ChapterComicDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'path_word': instance.pathWord,
      'restrict': instance.restrict,
    };

_ChapterContentDto _$ChapterContentDtoFromJson(Map<String, dynamic> json) =>
    _ChapterContentDto(
      index: (json['index'] as num?)?.toInt() ?? 0,
      uuid: json['uuid'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      ordered: (json['ordered'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      comicId: json['comic_id'] as String? ?? '',
      comicPathWord: json['comic_path_word'] as String? ?? '',
      groupId: json['group_id'] as String? ?? '',
      groupPathWord: json['group_path_word'] as String? ?? '',
      type: (json['type'] as num?)?.toInt() ?? 0,
      news: json['news'] as String? ?? '',
      datetimeCreated: json['datetime_created'] as String? ?? '',
      prev: json['prev'] as String? ?? '',
      next: json['next'] as String? ?? '',
      contents:
          (json['contents'] as List<dynamic>?)
              ?.map((e) => ChapterImageDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      words:
          (json['words'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      isLong: json['is_long'] as bool? ?? false,
    );

Map<String, dynamic> _$ChapterContentDtoToJson(_ChapterContentDto instance) =>
    <String, dynamic>{
      'index': instance.index,
      'uuid': instance.uuid,
      'count': instance.count,
      'ordered': instance.ordered,
      'size': instance.size,
      'name': instance.name,
      'comic_id': instance.comicId,
      'comic_path_word': instance.comicPathWord,
      'group_id': instance.groupId,
      'group_path_word': instance.groupPathWord,
      'type': instance.type,
      'news': instance.news,
      'datetime_created': instance.datetimeCreated,
      'prev': instance.prev,
      'next': instance.next,
      'contents': instance.contents,
      'words': instance.words,
      'is_long': instance.isLong,
    };

_ChapterImageDto _$ChapterImageDtoFromJson(Map<String, dynamic> json) =>
    _ChapterImageDto(url: json['url'] as String? ?? '');

Map<String, dynamic> _$ChapterImageDtoToJson(_ChapterImageDto instance) =>
    <String, dynamic>{'url': instance.url};

_NetworkResultDto _$NetworkResultDtoFromJson(
  Map<String, dynamic> json,
) => _NetworkResultDto(
  staticHost: json['static'] as String? ?? '',
  imageHost: json['image'] as String? ?? '',
  share:
      (json['share'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  api:
      (json['api'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList() ??
      const [],
  ads:
      (json['ads'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList() ??
      const [],
  hostComic: json['host_comic'] as String? ?? '',
  hostCartoon: json['host_cartoon'] as String? ?? '',
  hostNovel: json['host_novel'] as String? ?? '',
  dayDownloadsTotal: (json['day_downloads_total'] as num?)?.toInt() ?? 0,
  adsRewardDownloads: (json['ads_reward_downloads'] as num?)?.toInt() ?? 0,
  adsRewardDayShow: (json['ads_reward_day_show'] as num?)?.toInt() ?? 0,
  adsScreenShow: (json['ads_screen_show'] as num?)?.toInt() ?? 0,
  adsReadExpressShow: (json['ads_read_express_show'] as num?)?.toInt() ?? 0,
  adsHomeSeconds: (json['ads_home_seconds'] as num?)?.toInt() ?? 0,
  adsRestartSeconds: (json['ads_restart_seconds'] as num?)?.toInt() ?? 0,
  adsComicShow: (json['ads_comic_show'] as num?)?.toInt() ?? 0,
  adsCartoonShow: (json['ads_cartoon_show'] as num?)?.toInt() ?? 0,
  dayDownloads: (json['day_downloads'] as num?)?.toInt() ?? 0,
  vipDownloads: (json['vip_downloads'] as num?)?.toInt() ?? 0,
  rewardDownloads: (json['reward_downloads'] as num?)?.toInt() ?? 0,
  adsVipEnd: json['ads_vip_end'] as Object? ?? '',
  adsStatSwitch: json['ads_stat_switch'] as bool? ?? false,
  adsStatSwitch2: json['ads_stat_switch2'] as bool? ?? false,
  adsRewardSeconds: (json['ads_reward_seconds'] as num?)?.toInt() ?? 0,
  inMainland: json['in_mainland'] as bool? ?? false,
);

Map<String, dynamic> _$NetworkResultDtoToJson(_NetworkResultDto instance) =>
    <String, dynamic>{
      'static': instance.staticHost,
      'image': instance.imageHost,
      'share': instance.share,
      'api': instance.api,
      'ads': instance.ads,
      'host_comic': instance.hostComic,
      'host_cartoon': instance.hostCartoon,
      'host_novel': instance.hostNovel,
      'day_downloads_total': instance.dayDownloadsTotal,
      'ads_reward_downloads': instance.adsRewardDownloads,
      'ads_reward_day_show': instance.adsRewardDayShow,
      'ads_screen_show': instance.adsScreenShow,
      'ads_read_express_show': instance.adsReadExpressShow,
      'ads_home_seconds': instance.adsHomeSeconds,
      'ads_restart_seconds': instance.adsRestartSeconds,
      'ads_comic_show': instance.adsComicShow,
      'ads_cartoon_show': instance.adsCartoonShow,
      'day_downloads': instance.dayDownloads,
      'vip_downloads': instance.vipDownloads,
      'reward_downloads': instance.rewardDownloads,
      'ads_vip_end': instance.adsVipEnd,
      'ads_stat_switch': instance.adsStatSwitch,
      'ads_stat_switch2': instance.adsStatSwitch2,
      'ads_reward_seconds': instance.adsRewardSeconds,
      'in_mainland': instance.inMainland,
    };

_RequestIdResultDto _$RequestIdResultDtoFromJson(Map<String, dynamic> json) =>
    _RequestIdResultDto(requestId: json['request_id'] as String? ?? '');

Map<String, dynamic> _$RequestIdResultDtoToJson(_RequestIdResultDto instance) =>
    <String, dynamic>{'request_id': instance.requestId};
