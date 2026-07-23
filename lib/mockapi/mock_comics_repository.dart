import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/comic/domain/comics_repository.dart';
import 'package:comics/features/ranking/domain/comic_ranking_period.dart';
import 'package:comics/mockapi/mock_api.dart';
import 'package:comics/mockapi/mock_api_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mockComicsRepositoryProvider = Provider(
  (ref) => MockComicsRepository(api: ref.watch(mockApiProvider)),
);

class MockComicsRepository implements ComicsRepository {
  const MockComicsRepository({required this.api});

  final MockApi api;

  @override
  Future<HomeFeedModel> getHomeFeed() async {
    final comics = await api.fetchComics();
    final popular = [...comics]
      ..sort((first, second) => second.popularity.compareTo(first.popularity));
    final latest = [...comics]
      ..sort((first, second) => second.updatedOrder.compareTo(first.updatedOrder));
    final finished = comics.where((comic) => comic.isFinished).toList();
    return HomeFeedModel(
      featured: comics
          .take(6)
          .map((comic) => mapMockComic(dto: comic))
          .toList(growable: false),
      hot: popular
          .take(12)
          .map((comic) => mapMockComic(dto: comic))
          .toList(growable: false),
      latest: latest
          .take(12)
          .map((comic) => mapMockComic(dto: comic))
          .toList(growable: false),
      finished: finished
          .take(12)
          .map((comic) => mapMockComic(dto: comic))
          .toList(growable: false),
      dayRanking: buildHomeRanking(comics: comics, offset: 0),
      weekRanking: buildHomeRanking(comics: comics, offset: 3),
      monthRanking: buildHomeRanking(comics: comics, offset: 6),
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
    final comics = await api.fetchComics();
    final filtered = comics.where((comic) {
      final matchesScope = switch (scope) {
        ComicCatalogScope.all => true,
        ComicCatalogScope.japan => comic.region == 'japan',
        ComicCatalogScope.korea => comic.region == 'korea',
        ComicCatalogScope.west => comic.region == 'west',
        ComicCatalogScope.finished => comic.isFinished,
      };
      final matchesTheme =
          theme == null || comic.themes.any((item) => item.id == theme);
      final matchesAuthor =
          author == null || comic.authors.any((item) => item.id == author);
      return matchesScope && matchesTheme && matchesAuthor;
    }).toList();
    filtered.sort(
      switch (ordering) {
        ComicCatalogOrdering.updatedDescending =>
          (first, second) => second.updatedOrder.compareTo(first.updatedOrder),
        ComicCatalogOrdering.popularDescending =>
          (first, second) => second.popularity.compareTo(first.popularity),
      },
    );
    return pagedResult(
      items: filtered
          .map((comic) => mapMockComic(dto: comic))
          .toList(growable: false),
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<PagedResult<ComicCardModel>> search({
    required int limit,
    required int offset,
    required String query,
    required ComicSearchField field,
  }) async {
    final comics = await api.fetchComics();
    final normalizedQuery = query.trim().toLowerCase();
    final matches = comics.where((comic) {
      final title = comic.title.toLowerCase();
      final authors = comic.authors.map((item) => item.name).join(' ').toLowerCase();
      final translator = comic.translator.name.toLowerCase();
      return switch (field) {
        ComicSearchField.all => title.contains(normalizedQuery) ||
            authors.contains(normalizedQuery) ||
            translator.contains(normalizedQuery),
        ComicSearchField.name => title.contains(normalizedQuery),
        ComicSearchField.author => authors.contains(normalizedQuery),
        ComicSearchField.local => translator.contains(normalizedQuery),
      };
    })
        .map((comic) => mapMockComic(dto: comic))
        .toList(growable: false);
    return pagedResult(items: matches, limit: limit, offset: offset);
  }

  @override
  Future<PagedResult<RankedComicModel>> getRanking({
    required int limit,
    required int offset,
    required ComicRankingAudience audience,
    required ComicRankingPeriod period,
  }) async {
    final comics = await api.fetchComics();
    final audienceValue = switch (audience) {
      ComicRankingAudience.male => 'male',
      ComicRankingAudience.female => 'female',
    };
    final ranked = comics.where((comic) => comic.audience == audienceValue).toList();
    ranked.sort((first, second) {
      final firstScore = rankingScore(comic: first, period: period);
      final secondScore = rankingScore(comic: second, period: period);
      return secondScore.compareTo(firstScore);
    });
    final items = List.generate(
      ranked.length,
      (index) => RankedComicModel(
        comic: mapMockComic(dto: ranked[index]),
        rankLabel: '#${index + 1}',
      ),
      growable: false,
    );
    return pagedResult(items: items, limit: limit, offset: offset);
  }

  @override
  Future<ComicDetailModel> getComicDetail({required String comicId}) async {
    final comic = await api.fetchComic(comicId: comicId);
    return ComicDetailModel(
      id: comic.id,
      title: comic.title,
      coverUrl: comic.coverUrl,
      authorText: comic.authors.map((item) => item.name).join(', '),
      authors: comic.authors
          .map((author) => mapMockLink(dto: author))
          .toList(growable: false),
      themes: comic.themes
          .map((theme) => mapMockLink(dto: theme))
          .toList(growable: false),
      statusText: comic.isFinished ? '已完结' : '连载中',
      updatedText: '2026-07-${((comic.updatedOrder % 28) + 1).toString().padLeft(2, '0')}',
      regionText: switch (comic.region) {
        'japan' => '日本',
        'korea' => '韩国',
        _ => '欧美',
      },
      brief: comic.brief,
      groups: comic.groups
          .map(
            (group) => ChapterGroupModel(
              id: group.id,
              title: group.title,
              chapterCount: group.chapters.length,
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
    final comic = await api.fetchComic(comicId: comicId);
    final group = comic.groups.firstWhere(
      (item) => item.id == groupId,
      orElse: () => throw StateError('未找到模拟章节组：$groupId'),
    );
    final chapters = group.chapters
        .map((chapter) => ChapterSummaryModel(id: chapter.id, title: chapter.title))
        .toList(growable: false);
    return pagedResult(items: chapters, limit: limit, offset: offset);
  }

  @override
  Future<ReaderChapterModel> getChapter({
    required String comicId,
    required String chapterId,
  }) async {
    final chapter = await api.fetchChapter(
      comicId: comicId,
      chapterId: chapterId,
    );
    return ReaderChapterModel(imageUrls: chapter.imageUrls);
  }

  @override
  Future<PagedResult<NewReleaseModel>> getNewReleases({
    required int limit,
    required int offset,
  }) async {
    final comics = await api.fetchComics();
    final latest = [...comics]
      ..sort((first, second) => second.updatedOrder.compareTo(first.updatedOrder));
    final items = List.generate(
      latest.length,
      (index) => NewReleaseModel(
        comic: mapMockComic(dto: latest[index]),
        badge: index < 6 ? '本周新作' : null,
      ),
      growable: false,
    );
    return pagedResult(items: items, limit: limit, offset: offset);
  }
}

ComicCardModel mapMockComic({required MockComicDto dto}) => ComicCardModel(
  id: dto.id,
  title: dto.title,
  coverUrl: dto.coverUrl,
  authorText: dto.authors.map((item) => item.name).join(', '),
);

ComicLink mapMockLink({required MockLinkDto dto}) =>
    ComicLink(id: dto.id, label: dto.name);

List<RankedComicModel> buildHomeRanking({
  required List<MockComicDto> comics,
  required int offset,
}) {
  final rotated = [...comics.skip(offset), ...comics.take(offset)];
  return List.generate(
    10,
    (index) => RankedComicModel(
      comic: mapMockComic(dto: rotated[index]),
      rankLabel: '${index + 1}',
    ),
    growable: false,
  );
}

int rankingScore({
  required MockComicDto comic,
  required ComicRankingPeriod period,
}) {
  return switch (period) {
    ComicRankingPeriod.day => comic.popularity + comic.updatedOrder * 2,
    ComicRankingPeriod.week => comic.popularity * 2 + comic.updatedOrder,
    ComicRankingPeriod.month => comic.popularity * 3 - comic.updatedOrder,
    ComicRankingPeriod.total => comic.popularity * 4 + comic.id.hashCode.abs() % 500,
  };
}

PagedResult<T> pagedResult<T>({
  required List<T> items,
  required int limit,
  required int offset,
}) {
  final start = offset.clamp(0, items.length).toInt();
  final end = (start + limit).clamp(start, items.length).toInt();
  return PagedResult(items: items.sublist(start, end), total: items.length);
}
