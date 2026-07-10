import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../copy_manga/copy_manga.dart';

final homeProvider = FutureProvider<HomeResultDto>((ref) async {
  final repository = ref.watch(copyMangaRepositoryProvider);
  return repository.api.home();
});

typedef RankingFilter = ({String audienceType, String dateType});

final rankingProvider = FutureProvider.family<RankPageResultDto, RankingFilter>(
  (ref, filter) {
    return ref
        .watch(copyMangaRepositoryProvider)
        .api
        .ranks(30, 0, true, 1, filter.audienceType, filter.dateType);
  },
);

final themeComicsProvider = FutureProvider.family<ComicPageResultDto, String>((
  ref,
  themeSlug,
) async {
  final repository = ref.watch(copyMangaRepositoryProvider);
  return repository.api.comics(
    limit: 30,
    offset: 0,
    ordering: '-popular',
    theme: themeSlug,
  );
});

final comicInfoProvider = FutureProvider.family<ComicInfoResultDto, String>((
  ref,
  comicId,
) async {
  return ref
      .watch(copyMangaApiProvider)
      .comicInfo(comicId, true, "", 3);
});
