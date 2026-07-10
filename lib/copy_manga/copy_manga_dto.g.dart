// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_manga_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CopyMangaResponse _$CopyMangaResponseFromJson(Map<String, dynamic> json) =>
    _CopyMangaResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String? ?? '请求失败',
      results: json['results'],
    );

Map<String, dynamic> _$CopyMangaResponseToJson(_CopyMangaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'results': instance.results,
    };

_LoginResultDto _$LoginResultDtoFromJson(Map<String, dynamic> json) =>
    _LoginResultDto(token: json['token'] as String);

Map<String, dynamic> _$LoginResultDtoToJson(_LoginResultDto instance) =>
    <String, dynamic>{'token': instance.token};

_NamedPathDto _$NamedPathDtoFromJson(Map<String, dynamic> json) =>
    _NamedPathDto(
      name: json['name'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
    );

Map<String, dynamic> _$NamedPathDtoToJson(_NamedPathDto instance) =>
    <String, dynamic>{'name': instance.name, 'path_word': instance.pathWord};

_ComicStatusDto _$ComicStatusDtoFromJson(Map<String, dynamic> json) =>
    _ComicStatusDto(display: json['display'] as String? ?? '');

Map<String, dynamic> _$ComicStatusDtoToJson(_ComicStatusDto instance) =>
    <String, dynamic>{'display': instance.display};

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
  status: json['status'] == null
      ? null
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
  'status': instance.status,
};

_RankedComicDto _$RankedComicDtoFromJson(Map<String, dynamic> json) =>
    _RankedComicDto(
      comic: ComicDto.fromJson(json['comic'] as Map<String, dynamic>),
      sort: (json['sort'] as num).toInt(),
      riseSort: (json['rise_sort'] as num?)?.toInt() ?? 0,
      popular: (json['popular'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RankedComicDtoToJson(_RankedComicDto instance) =>
    <String, dynamic>{
      'comic': instance.comic,
      'sort': instance.sort,
      'rise_sort': instance.riseSort,
      'popular': instance.popular,
    };

_ComicSectionDto _$ComicSectionDtoFromJson(Map<String, dynamic> json) =>
    _ComicSectionDto(
      list: (json['list'] as List<dynamic>)
          .map((e) => ComicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicSectionDtoToJson(_ComicSectionDto instance) =>
    <String, dynamic>{'list': instance.list};

_HomeResultDto _$HomeResultDtoFromJson(Map<String, dynamic> json) =>
    _HomeResultDto(
      topics: HomeTopicSectionDto.fromJson(
        json['topics'] as Map<String, dynamic>,
      ),
      topicsList: HomeTopicSectionDto.fromJson(
        json['topicsList'] as Map<String, dynamic>,
      ),
      recommended: HomeRecommendedSectionDto.fromJson(
        json['recComics'] as Map<String, dynamic>,
      ),
      hot: (json['hotComics'] as List<dynamic>)
          .map((e) => HomeUpdateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      latest: (json['newComics'] as List<dynamic>)
          .map((e) => HomeUpdateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      finished: HomeComicSectionDto.fromJson(
        json['finishComics'] as Map<String, dynamic>,
      ),
      rankDay: HomeRankSectionDto.fromJson(
        json['rankDayComics'] as Map<String, dynamic>,
      ),
      rankWeek: HomeRankSectionDto.fromJson(
        json['rankWeekComics'] as Map<String, dynamic>,
      ),
      rankMonth: HomeRankSectionDto.fromJson(
        json['rankMonthComics'] as Map<String, dynamic>,
      ),
      banners: (json['banners'] as List<dynamic>)
          .map((e) => HomeBannerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      list: (json['list'] as List<dynamic>)
          .map((e) => HomeTopicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
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
      title: json['title'] as String,
      series: json['series'] as String?,
      journal: json['journal'] as String,
      cover: json['cover'] as String,
      period: json['period'] as String,
      type: (json['type'] as num).toInt(),
      brief: json['brief'] as String? ?? '',
      pathWord: json['path_word'] as String,
      datetimeCreated: json['datetime_created'] as String,
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
  list: (json['list'] as List<dynamic>)
      .map((e) => HomeRecommendedItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
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
  type: (json['type'] as num).toInt(),
  comic: HomeComicDto.fromJson(json['comic'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeRecommendedItemDtoToJson(
  _HomeRecommendedItemDto instance,
) => <String, dynamic>{'type': instance.type, 'comic': instance.comic};

_HomeUpdateDto _$HomeUpdateDtoFromJson(Map<String, dynamic> json) =>
    _HomeUpdateDto(
      name: json['name'] as String,
      datetimeCreated: json['datetime_created'] as String,
      comic: HomeComicDto.fromJson(json['comic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeUpdateDtoToJson(_HomeUpdateDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'datetime_created': instance.datetimeCreated,
      'comic': instance.comic,
    };

_HomeComicSectionDto _$HomeComicSectionDtoFromJson(Map<String, dynamic> json) =>
    _HomeComicSectionDto(
      name: json['name'] as String,
      pathWord: json['path_word'] as String,
      type: json['type'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => HomeComicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
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
      list: (json['list'] as List<dynamic>)
          .map((e) => HomeRankItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
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
      comic: HomeComicDto.fromJson(json['comic'] as Map<String, dynamic>),
      sort: (json['sort'] as num).toInt(),
      sortLast: (json['sort_last'] as num).toInt(),
      riseSort: (json['rise_sort'] as num).toInt(),
      riseNum: (json['rise_num'] as num).toInt(),
      popular: (json['popular'] as num).toInt(),
      dateType: (json['date_type'] as num).toInt(),
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
      name: json['name'] as String,
      pathWord: json['path_word'] as String,
      cover: json['cover'] as String,
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
      freeType: json['free_type'],
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
      cover: json['cover'] as String,
      brief: json['brief'] as String? ?? '',
      type: (json['type'] as num).toInt(),
      outUuid: json['out_uuid'] as String,
      comic: json['comic'] == null
          ? null
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
      list: (json['list'] as List<dynamic>)
          .map((e) => ComicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$ComicPageResultDtoToJson(_ComicPageResultDto instance) =>
    <String, dynamic>{'list': instance.list, 'total': instance.total};

_RankPageResultDto _$RankPageResultDtoFromJson(Map<String, dynamic> json) =>
    _RankPageResultDto(
      list: (json['list'] as List<dynamic>)
          .map((e) => RankedComicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$RankPageResultDtoToJson(_RankPageResultDto instance) =>
    <String, dynamic>{'list': instance.list, 'total': instance.total};

_ComicInfoResultDto _$ComicInfoResultDtoFromJson(Map<String, dynamic> json) =>
    _ComicInfoResultDto(
      isBanned: json['is_banned'] as bool? ?? false,
      isLock: json['is_lock'] as bool? ?? false,
      isLogin: json['is_login'] as bool? ?? false,
      isMobileBind: json['is_mobile_bind'] as bool? ?? false,
      isVip: json['is_vip'] as bool? ?? false,
      comic: ComicInfoDto.fromJson(json['comic'] as Map<String, dynamic>),
      popular: (json['popular'] as num?)?.toInt() ?? 0,
      groups: (json['groups'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ChapterGroupDto.fromJson(e as Map<String, dynamic>)),
      ),
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
      b404: json['b404'] as bool? ?? false,
      bHidden: json['b_hidden'] as bool? ?? false,
      ban: (json['ban'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      alias: json['alias'] as String? ?? '',
      pathWord: json['path_word'] as String? ?? '',
      closeComment: json['close_comment'] as bool? ?? false,
      closeRoast: json['close_roast'] as bool? ?? false,
      freeType: json['free_type'] == null
          ? null
          : LabeledValueDto.fromJson(json['free_type'] as Map<String, dynamic>),
      restrict: json['restrict'] == null
          ? null
          : LabeledValueDto.fromJson(json['restrict'] as Map<String, dynamic>),
      reclass: json['reclass'] == null
          ? null
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
          ? null
          : LabeledValueDto.fromJson(json['region'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
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
          ? null
          : ChapterDto.fromJson(json['last_chapter'] as Map<String, dynamic>),
      popular: (json['popular'] as num?)?.toInt() ?? 0,
      channel: json['channel'],
    );

Map<String, dynamic> _$ComicInfoDtoToJson(_ComicInfoDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'b404': instance.b404,
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

_FavoriteStatusResultDto _$FavoriteStatusResultDtoFromJson(
  Map<String, dynamic> json,
) => _FavoriteStatusResultDto(collect: json['collect']);

Map<String, dynamic> _$FavoriteStatusResultDtoToJson(
  _FavoriteStatusResultDto instance,
) => <String, dynamic>{'collect': instance.collect};

_ChapterListResultDto _$ChapterListResultDtoFromJson(
  Map<String, dynamic> json,
) => _ChapterListResultDto(
  list:
      (json['list'] as List<dynamic>?)
          ?.map((e) => ChapterDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChapterListResultDtoToJson(
  _ChapterListResultDto instance,
) => <String, dynamic>{'list': instance.list, 'total': instance.total};

_ChapterDto _$ChapterDtoFromJson(Map<String, dynamic> json) => _ChapterDto(
  index: (json['index'] as num?)?.toInt() ?? 0,
  uuid: json['uuid'] as String? ?? '',
  count: (json['count'] as num?)?.toInt() ?? 0,
  ordered: (json['ordered'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  comicId: json['comic_id'] as String? ?? '',
  comicPathWord: json['comic_path_word'] as String? ?? '',
  groupId: json['group_id'] as String?,
  groupPathWord: json['group_path_word'] as String? ?? '',
  type: (json['type'] as num?)?.toInt() ?? 0,
  news: json['news'] as String? ?? '',
  datetimeCreated: json['datetime_created'] as String? ?? '',
  prev: json['prev'] as String?,
  next: json['next'] as String?,
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
  chapter: ChapterContentDto.fromJson(json['chapter'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChapterContentResultDtoToJson(
  _ChapterContentResultDto instance,
) => <String, dynamic>{'chapter': instance.chapter};

_ChapterContentDto _$ChapterContentDtoFromJson(Map<String, dynamic> json) =>
    _ChapterContentDto(
      contents: (json['contents'] as List<dynamic>)
          .map((e) => ChapterImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      words: (json['words'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ChapterContentDtoToJson(_ChapterContentDto instance) =>
    <String, dynamic>{'contents': instance.contents, 'words': instance.words};

_ChapterImageDto _$ChapterImageDtoFromJson(Map<String, dynamic> json) =>
    _ChapterImageDto(url: json['url'] as String? ?? '');

Map<String, dynamic> _$ChapterImageDtoToJson(_ChapterImageDto instance) =>
    <String, dynamic>{'url': instance.url};

_CommentPageResultDto _$CommentPageResultDtoFromJson(
  Map<String, dynamic> json,
) => _CommentPageResultDto(
  list: (json['list'] as List<dynamic>)
      .map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$CommentPageResultDtoToJson(
  _CommentPageResultDto instance,
) => <String, dynamic>{'list': instance.list, 'total': instance.total};

_CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => _CommentDto(
  userName: json['user_name'] as String? ?? '',
  parentUserName: json['parent_user_name'] as String? ?? '',
  userAvatar: json['user_avatar'] as String? ?? '',
  comment: json['comment'] as String? ?? '',
  createAt: json['create_at'] as String? ?? '',
  count: (json['count'] as num?)?.toInt(),
  id: json['id'],
);

Map<String, dynamic> _$CommentDtoToJson(_CommentDto instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'parent_user_name': instance.parentUserName,
      'user_avatar': instance.userAvatar,
      'comment': instance.comment,
      'create_at': instance.createAt,
      'count': instance.count,
      'id': instance.id,
    };

_NetworkResultDto _$NetworkResultDtoFromJson(Map<String, dynamic> json) =>
    _NetworkResultDto(
      staticHost: json['static'] as String,
      imageHost: json['image'] as String,
      share: (json['share'] as List<dynamic>).map((e) => e as String).toList(),
      api: (json['api'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      ads: (json['ads'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      hostComic: json['host_comic'] as String,
      hostCartoon: json['host_cartoon'] as String,
      hostNovel: json['host_novel'] as String,
      dayDownloadsTotal: (json['day_downloads_total'] as num).toInt(),
      adsRewardDownloads: (json['ads_reward_downloads'] as num).toInt(),
      adsRewardDayShow: (json['ads_reward_day_show'] as num).toInt(),
      adsScreenShow: (json['ads_screen_show'] as num).toInt(),
      adsReadExpressShow: (json['ads_read_express_show'] as num).toInt(),
      adsHomeSeconds: (json['ads_home_seconds'] as num).toInt(),
      adsRestartSeconds: (json['ads_restart_seconds'] as num).toInt(),
      adsComicShow: (json['ads_comic_show'] as num).toInt(),
      adsCartoonShow: (json['ads_cartoon_show'] as num).toInt(),
      dayDownloads: (json['day_downloads'] as num).toInt(),
      vipDownloads: (json['vip_downloads'] as num).toInt(),
      rewardDownloads: (json['reward_downloads'] as num).toInt(),
      adsVipEnd: json['ads_vip_end'],
      adsStatSwitch: json['ads_stat_switch'] as bool,
      adsStatSwitch2: json['ads_stat_switch2'] as bool,
      adsRewardSeconds: (json['ads_reward_seconds'] as num).toInt(),
      inMainland: json['in_mainland'] as bool,
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

_ComicSummary _$ComicSummaryFromJson(Map<String, dynamic> json) =>
    _ComicSummary(
      id: json['id'] as String,
      title: json['title'] as String,
      cover: json['cover'] as String,
      subtitle: json['subtitle'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ComicSummaryToJson(_ComicSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'subtitle': instance.subtitle,
      'tags': instance.tags,
      'description': instance.description,
    };

_PagedResult<T> _$PagedResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PagedResult<T>(
  (json['items'] as List<dynamic>).map(fromJsonT).toList(),
  (json['total'] as num).toInt(),
  (json['pageSize'] as num).toInt(),
);

Map<String, dynamic> _$PagedResultToJson<T>(
  _PagedResult<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'items': instance.items.map(toJsonT).toList(),
  'total': instance.total,
  'pageSize': instance.pageSize,
};

_ChapterGroup _$ChapterGroupFromJson(Map<String, dynamic> json) =>
    _ChapterGroup(
      name: json['name'] as String,
      chapters: Map<String, String>.from(json['chapters'] as Map),
    );

Map<String, dynamic> _$ChapterGroupToJson(_ChapterGroup instance) =>
    <String, dynamic>{'name': instance.name, 'chapters': instance.chapters};

_ComicDetails _$ComicDetailsFromJson(Map<String, dynamic> json) =>
    _ComicDetails(
      title: json['title'] as String,
      cover: json['cover'] as String,
      description: json['description'] as String,
      authors: (json['authors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      updateTime: json['updateTime'] as String,
      status: json['status'] as String,
      chapterGroups: (json['chapterGroups'] as List<dynamic>)
          .map((e) => ChapterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$ComicDetailsToJson(_ComicDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'cover': instance.cover,
      'description': instance.description,
      'authors': instance.authors,
      'tags': instance.tags,
      'updateTime': instance.updateTime,
      'status': instance.status,
      'chapterGroups': instance.chapterGroups,
      'isFavorite': instance.isFavorite,
      'uuid': instance.uuid,
    };

_Comment _$CommentFromJson(Map<String, dynamic> json) => _Comment(
  userName: json['userName'] as String,
  avatar: json['avatar'] as String,
  content: json['content'] as String,
  time: json['time'] as String,
  replyCount: (json['replyCount'] as num?)?.toInt(),
  id: json['id'] as String?,
);

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
  'userName': instance.userName,
  'avatar': instance.avatar,
  'content': instance.content,
  'time': instance.time,
  'replyCount': instance.replyCount,
  'id': instance.id,
};

_ChapterImages _$ChapterImagesFromJson(Map<String, dynamic> json) =>
    _ChapterImages(
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChapterImagesToJson(_ChapterImages instance) =>
    <String, dynamic>{'images': instance.images};
