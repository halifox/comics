class MockLinkDto {
  const MockLinkDto({required this.id, required this.name});

  final String id;
  final String name;
}

class MockChapterDto {
  const MockChapterDto({
    required this.id,
    required this.title,
    required this.imageUrls,
  });

  final String id;
  final String title;
  final List<String> imageUrls;
}

class MockChapterGroupDto {
  const MockChapterGroupDto({
    required this.id,
    required this.title,
    required this.chapters,
  });

  final String id;
  final String title;
  final List<MockChapterDto> chapters;
}

class MockComicDto {
  const MockComicDto({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.authors,
    required this.themes,
    required this.translator,
    required this.region,
    required this.audience,
    required this.isFinished,
    required this.updatedOrder,
    required this.popularity,
    required this.brief,
    required this.groups,
  });

  final String id;
  final String title;
  final String coverUrl;
  final List<MockLinkDto> authors;
  final List<MockLinkDto> themes;
  final MockLinkDto translator;
  final String region;
  final String audience;
  final bool isFinished;
  final int updatedOrder;
  final int popularity;
  final String brief;
  final List<MockChapterGroupDto> groups;
}
