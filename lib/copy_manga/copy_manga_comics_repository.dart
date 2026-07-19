import 'package:comics/copy_manga/copy_manga_api.dart';
import 'package:comics/copy_manga/copy_manga_dto.dart';
import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/ranking/domain/comic_ranking_period.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final copyMangaComicsRepositoryProvider = Provider<ComicsRepository>(
  (ref) => CopyMangaComicsRepository(
    api: ref.watch(comicsApiProvider),
  ),
);

class CopyMangaComicsRepository implements ComicsRepository {
  const CopyMangaComicsRepository({
    required this.api,
  });

  final CopyMangaApi api;

  @override
  Future<HomeFeedModel> getHomeFeed() async {
    final dto = await api.homeIndex2();
    return HomeFeedModel(
      featured: dto.recommended.list
          .map((item) => mapHomeComic(dto: item.comic))
          .toList(growable: false),
      hot: dto.hot
          .map((item) => mapHomeComic(dto: item.comic))
          .toList(growable: false),
      latest: dto.latest
          .map((item) => mapHomeComic(dto: item.comic))
          .toList(growable: false),
      finished: dto.finished.list
          .map((item) => mapHomeComic(dto: item))
          .toList(growable: false),
      dayRanking: dto.rankDay.list
          .map((item) => mapHomeRanking(dto: item))
          .toList(growable: false),
      weekRanking: dto.rankWeek.list
          .map((item) => mapHomeRanking(dto: item))
          .toList(growable: false),
      monthRanking: dto.rankMonth.list
          .map((item) => mapHomeRanking(dto: item))
          .toList(growable: false),
    );
  }

  @override
  Future<PagedResult<ComicCardModel>> getCatalog({
    required int limit,
    required int offset,
    required ComicCatalogScope scope,
    required ComicCatalogOrdering ordering,
    String? theme,
    String? author,
  }) async {
    final result = await api.comics(
      limit: limit,
      offset: offset,
      ordering: mapCatalogOrdering(ordering: ordering),
      theme: theme,
      top: mapCatalogScope(scope: scope),
      author: author,
    );
    return PagedResult(
      items: result.list
          .map((item) => mapComic(dto: item))
          .toList(growable: false),
      total: result.total,
    );
  }

  @override
  Future<PagedResult<ComicCardModel>> search({
    required int limit,
    required int offset,
    required String query,
    required ComicSearchField field,
  }) async {
    final result = await api.search(
      limit: limit,
      offset: offset,
      query: query,
      queryType: mapSearchField(field: field),
    );
    return PagedResult(
      items: result.list
          .map((item) => mapComic(dto: item))
          .toList(growable: false),
      total: result.total,
    );
  }

  @override
  Future<PagedResult<RankedComicModel>> getRanking({
    required int limit,
    required int offset,
    required ComicRankingAudience audience,
    required ComicRankingPeriod period,
  }) async {
    final result = await api.ranks(
      limit: limit,
      offset: offset,
      type: 1,
      audienceType: mapRankingAudience(audience: audience),
      dateType: mapRankingPeriod(period: period),
    );
    return PagedResult(
      items: result.list
          .map(
            (item) => RankedComicModel(
              comic: mapComic(dto: item.comic),
              rankLabel: '#${item.sort}',
            ),
          )
          .toList(growable: false),
      total: result.total,
    );
  }

  @override
  Future<ComicDetailModel> getComicDetail({required String comicId}) async {
    final result = await api.comicInfo(comicId: comicId);
    final comic = result.comic;
    final authors = comic.authors
        .map((item) => mapLink(dto: item))
        .toList(growable: false);
    return ComicDetailModel(
      id: comic.pathWord,
      title: comic.name,
      coverUrl: comic.cover,
      authorText: authors.map((item) => item.label).join(','),
      authors: authors,
      themes: comic.themes
          .map((item) => mapLink(dto: item))
          .toList(growable: false),
      statusText: comic.status.display,
      updatedText: comic.datetimeUpdated,
      regionText: comic.region.display,
      brief: comic.brief,
      groups: result.groups.values
          .map(
            (group) => ChapterGroupModel(
              id: group.pathWord,
              title: group.name,
              chapterCount: group.count,
            ),
          )
          .toList(growable: false),
    );
  }

  @override
  Future<PagedResult<ChapterSummaryModel>> getChapters({
    required String comicId,
    required String groupId,
    required int limit,
    required int offset,
  }) async {
    final result = await api.chapters(
      comicId: comicId,
      groupId: groupId,
      limit: limit,
      offset: offset,
    );
    return PagedResult(
      items: result.list
          .map((chapter) => ChapterSummaryModel(id: chapter.uuid, title: chapter.name))
          .toList(growable: false),
      total: result.total,
    );
  }

  @override
  Future<ReaderChapterModel> getChapter({
    required String comicId,
    required String chapterId,
  }) async {
    final result = await api.chapter(comicId: comicId, chapterId: chapterId);
    return ReaderChapterModel(imageUrls: orderImages(chapter: result.chapter));
  }

  @override
  Future<PagedResult<NewReleaseModel>> getNewReleases({
    required int limit,
    required int offset,
  }) async {
    final result = await api.newest(
      limit: limit,
      offset: offset,
    );
    return PagedResult(
      items: result.list
          .map((item) => mapNewRelease(dto: item))
          .toList(growable: false),
      total: result.total,
    );
  }
}

ComicCardModel mapComic({required ComicDto dto}) => ComicCardModel(
  id: dto.pathWord,
  title: dto.name,
  coverUrl: dto.cover,
  authorText: dto.authors.map((item) => item.name).join(','),
);

ComicCardModel mapHomeComic({required HomeComicDto dto}) => ComicCardModel(
  id: dto.pathWord,
  title: dto.name,
  coverUrl: dto.cover,
  authorText: dto.authors.map((item) => item.name).join(','),
);

RankedComicModel mapHomeRanking({required HomeRankItemDto dto}) => RankedComicModel(
  comic: mapHomeComic(dto: dto.comic),
  rankLabel: '${dto.sort}',
);

ComicLink mapLink({required NamedPathDto dto}) =>
    ComicLink(id: dto.pathWord, label: dto.name);

NewReleaseModel mapNewRelease({required HomeUpdateDto dto}) {
  return NewReleaseModel(
    comic: mapHomeComic(dto: dto.comic),
    badge: dto.name.isEmpty ? null : dto.name,
  );
}

List<String> orderImages({required ChapterContentDto chapter}) {
  final urls = chapter.contents
      .map((image) => image.url)
      .where((url) => url.isNotEmpty)
      .toList(growable: false);
  final orders = chapter.words;
  final validOrder = orders.length == urls.length &&
      orders.toSet().length == urls.length &&
      orders.every((index) => index >= 0 && index < urls.length);
  if (!validOrder) return urls;
  final ordered = List<String>.filled(urls.length, '');
  for (var index = 0; index < urls.length; index++) {
    ordered[orders[index]] = urls[index];
  }
  return ordered;
}

String mapCatalogScope({required ComicCatalogScope scope}) => switch (scope) {
  ComicCatalogScope.all => '',
  ComicCatalogScope.japan => 'japan',
  ComicCatalogScope.korea => 'korea',
  ComicCatalogScope.west => 'west',
  ComicCatalogScope.finished => 'finish',
};

String mapCatalogOrdering({required ComicCatalogOrdering ordering}) => switch (ordering) {
  ComicCatalogOrdering.updatedDescending => '-datetime_updated',
  ComicCatalogOrdering.popularDescending => '-popular',
};

String mapSearchField({required ComicSearchField field}) => switch (field) {
  ComicSearchField.all => '',
  ComicSearchField.name => 'name',
  ComicSearchField.author => 'author',
  ComicSearchField.local => 'local',
};

String mapRankingAudience({required ComicRankingAudience audience}) => switch (audience) {
  ComicRankingAudience.male => 'male',
  ComicRankingAudience.female => 'female',
};

String mapRankingPeriod({required ComicRankingPeriod period}) => switch (period) {
  ComicRankingPeriod.day => 'day',
  ComicRankingPeriod.week => 'week',
  ComicRankingPeriod.month => 'month',
  ComicRankingPeriod.total => 'total',
};
