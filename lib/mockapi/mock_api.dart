import 'package:comics/mockapi/mock_api_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mockApiProvider = Provider((ref) => const MockApi());

final mockComicsData = List.unmodifiable(buildMockComics());

class MockApi {
  const MockApi({this.latency = const Duration(milliseconds: 260)});

  final Duration latency;

  Future<List<MockComicDto>> fetchComics() async {
    await Future.delayed(latency);
    return mockComicsData;
  }

  Future<MockComicDto> fetchComic({required String comicId}) async {
    await Future.delayed(latency);
    return mockComicsData.firstWhere(
      (comic) => comic.id == comicId,
      orElse: () => throw StateError('未找到模拟漫画：$comicId'),
    );
  }

  Future<MockChapterDto> fetchChapter({
    required String comicId,
    required String chapterId,
  }) async {
    final comic = await fetchComic(comicId: comicId);
    for (final group in comic.groups) {
      for (final chapter in group.chapters) {
        if (chapter.id == chapterId) return chapter;
      }
    }
    throw StateError('未找到模拟章节：$chapterId');
  }
}

List<MockComicDto> buildMockComics() {
  const titles = [
    '星海回响',
    '雾都侦探社',
    '青空便利店',
    '机械心脏',
    '月下花火',
    '深渊来信',
    '春日列车',
    '龙与旧书店',
    '第七码头',
    '银河食堂',
    '风之绘卷',
    '时间收藏家',
  ];
  const authors = [
    MockLinkDto(id: 'author-lin', name: '林川'),
    MockLinkDto(id: 'author-xia', name: '夏目遥'),
    MockLinkDto(id: 'author-zhou', name: '周屿'),
    MockLinkDto(id: 'author-an', name: '安藤澪'),
    MockLinkDto(id: 'author-luo', name: '洛青'),
    MockLinkDto(id: 'author-han', name: '韩知夏'),
  ];
  const themes = [
    MockLinkDto(id: 'theme-fantasy', name: '奇幻'),
    MockLinkDto(id: 'theme-adventure', name: '冒险'),
    MockLinkDto(id: 'theme-scifi', name: '科幻'),
    MockLinkDto(id: 'theme-mystery', name: '悬疑'),
    MockLinkDto(id: 'theme-romance', name: '恋爱'),
    MockLinkDto(id: 'theme-youth', name: '青春'),
  ];
  const translators = [
    MockLinkDto(id: 'local-starlight', name: '星光汉化组'),
    MockLinkDto(id: 'local-soda', name: '苏打翻译社'),
    MockLinkDto(id: 'local-forest', name: '森林汉化'),
  ];
  const regions = ['japan', 'korea', 'west'];

  return List.generate(36, (index) {
    final number = index + 1;
    final id = 'mock-comic-${number.toString().padLeft(2, '0')}';
    final title = '${titles[index % titles.length]} ${index ~/ titles.length + 1}';
    final primaryAuthor = authors[index % authors.length];
    final secondaryAuthor = authors[(index + 3) % authors.length];
    final mainTheme = themes[index % themes.length];
    final secondaryTheme = themes[(index + 2) % themes.length];
    return MockComicDto(
      id: id,
      title: title,
      coverUrl: 'https://picsum.photos/seed/$id-cover/600/900',
      authors: [primaryAuthor, if (index % 4 == 0) secondaryAuthor],
      themes: [mainTheme, secondaryTheme],
      translator: translators[index % translators.length],
      region: regions[index % regions.length],
      audience: index.isEven ? 'male' : 'female',
      isFinished: index % 5 == 0,
      updatedOrder: 1000 - index * 7,
      popularity: 5000 - ((index * 137) % 2900),
      brief: '这是一部用于界面开发与交互验证的模拟漫画。故事围绕“$title”展开，'
          '包含完整的目录、详情、章节和阅读数据，不依赖真实漫画接口。',
      groups: [
        buildMockGroup(comicId: id, groupId: 'main', title: '正篇', count: 24),
        buildMockGroup(comicId: id, groupId: 'extra', title: '番外篇', count: 6),
      ],
    );
  }, growable: false);
}

MockChapterGroupDto buildMockGroup({
  required String comicId,
  required String groupId,
  required String title,
  required int count,
}) {
  return MockChapterGroupDto(
    id: groupId,
    title: title,
    chapters: List.generate(count, (index) {
      final chapterNumber = index + 1;
      final chapterId = '$comicId-$groupId-$chapterNumber';
      return MockChapterDto(
        id: chapterId,
        title: '第 $chapterNumber 话',
        imageUrls: List.generate(
          10,
          (pageIndex) =>
              'https://picsum.photos/seed/$chapterId-page-${pageIndex + 1}/900/1400',
          growable: false,
        ),
      );
    }, growable: false),
  );
}
