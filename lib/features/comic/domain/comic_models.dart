class PagedResult<T> {
  const PagedResult({required this.items, required this.total});

  final List<T> items;
  final int total;
}

class ComicLink {
  const ComicLink({required this.id, required this.label});

  final String id;
  final String label;
}

class ComicCardModel {
  const ComicCardModel({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.authorText,
  });

  final String id;
  final String title;
  final String coverUrl;
  final String authorText;
}

class RankedComicModel {
  const RankedComicModel({required this.comic, required this.rankLabel});

  final ComicCardModel comic;
  final String rankLabel;
}

class NewReleaseModel {
  const NewReleaseModel({required this.comic, required this.badge});

  final ComicCardModel comic;
  final String? badge;
}

class HomeFeedModel {
  const HomeFeedModel({
    required this.featured,
    required this.hot,
    required this.latest,
    required this.finished,
    required this.dayRanking,
    required this.weekRanking,
    required this.monthRanking,
  });

  final List<ComicCardModel> featured;
  final List<ComicCardModel> hot;
  final List<ComicCardModel> latest;
  final List<ComicCardModel> finished;
  final List<RankedComicModel> dayRanking;
  final List<RankedComicModel> weekRanking;
  final List<RankedComicModel> monthRanking;
}

class ComicDetailModel {
  const ComicDetailModel({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.authorText,
    required this.authors,
    required this.themes,
    required this.statusText,
    required this.updatedText,
    required this.regionText,
    required this.brief,
    required this.groups,
  });

  final String id;
  final String title;
  final String coverUrl;
  final String authorText;
  final List<ComicLink> authors;
  final List<ComicLink> themes;
  final String statusText;
  final String updatedText;
  final String regionText;
  final String brief;
  final List<ChapterGroupModel> groups;
}

class ChapterGroupModel {
  const ChapterGroupModel({
    required this.id,
    required this.title,
    required this.chapterCount,
  });

  final String id;
  final String title;
  final int chapterCount;
}

class ChapterSummaryModel {
  const ChapterSummaryModel({required this.id, required this.title});

  final String id;
  final String title;
}

class ReaderChapterModel {
  const ReaderChapterModel({required this.imageUrls});

  final List<String> imageUrls;
}

enum ComicCatalogScope {
  all(label: '全部'),
  japan(label: '日漫'),
  korea(label: '韩漫'),
  west(label: '美漫'),
  finished(label: '已完结');

  const ComicCatalogScope({required this.label});
  final String label;
}

enum ComicCatalogOrdering {
  updatedDescending(label: '最近更新'),
  popularDescending(label: '热门更新');

  const ComicCatalogOrdering({required this.label});
  final String label;
}

enum ComicSearchField {
  all(label: '全部'),
  name(label: '作品名'),
  author(label: '作者'),
  local(label: '汉化组');

  const ComicSearchField({required this.label});
  final String label;
}

enum ComicRankingAudience {
  male(label: '男频'),
  female(label: '女频');

  const ComicRankingAudience({required this.label});
  final String label;
}
