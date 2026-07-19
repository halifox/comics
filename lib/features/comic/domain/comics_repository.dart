import 'package:comics/features/comic/domain/comic_models.dart';
import 'package:comics/features/ranking/domain/comic_ranking_period.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final comicsRepositoryProvider = Provider<ComicsRepository>(
  (ref) => throw UnimplementedError(
    'comicsRepositoryProvider 必须在 ProviderScope 中被覆盖',
  ),
);

abstract interface class ComicsRepository {
  Future<HomeFeedModel> getHomeFeed();

  Future<PagedResult<ComicCardModel>> getCatalog({
    required int limit,
    required int offset,
    required ComicCatalogScope scope,
    required ComicCatalogOrdering ordering,
    String? theme,
    String? author,
  });

  Future<PagedResult<ComicCardModel>> search({
    required int limit,
    required int offset,
    required String query,
    required ComicSearchField field,
  });

  Future<PagedResult<RankedComicModel>> getRanking({
    required int limit,
    required int offset,
    required ComicRankingAudience audience,
    required ComicRankingPeriod period,
  });

  Future<ComicDetailModel> getComicDetail({required String comicId});

  Future<PagedResult<ChapterSummaryModel>> getChapters({
    required String comicId,
    required String groupId,
    required int limit,
    required int offset,
  });

  Future<ReaderChapterModel> getChapter({
    required String comicId,
    required String chapterId,
  });

  Future<PagedResult<NewReleaseModel>> getNewReleases({
    required int limit,
    required int offset,
  });
}
