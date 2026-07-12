import 'package:comics/features/library/data/library_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final libraryDatabaseProvider = Provider<LibraryDatabase>((ref) {
  final database = LibraryDatabase();
  ref.onDispose(database.close);
  return database;
});

final favoriteComicsProvider = StreamProvider<List<ComicLibraryItem>>((ref) {
  return ref.watch(libraryDatabaseProvider).watchFavoriteComics();
});

final comicHistoryProvider = StreamProvider<List<ComicLibraryItem>>((ref) {
  return ref.watch(libraryDatabaseProvider).watchReadingHistory();
});

final comicLibraryItemProvider =
    StreamProvider.family<ComicLibraryItem?, String>((ref, pathWord) {
      return ref.watch(libraryDatabaseProvider).watchComic(pathWord: pathWord);
    });

typedef ComicGroupProgressKey = ({String comicPathWord, String groupPathWord});

final comicGroupProgressProvider =
    StreamProvider.family<ComicReadingProgress?, ComicGroupProgressKey>((
      ref,
      key,
    ) {
      return ref
          .watch(libraryDatabaseProvider)
          .watchGroupProgress(
            comicPathWord: key.comicPathWord,
            groupPathWord: key.groupPathWord,
          );
    });

final comicChapterProgressesProvider =
    StreamProvider.family<
      Map<String, ComicReadingProgress>,
      ComicGroupProgressKey
    >((ref, key) {
      return ref
          .watch(libraryDatabaseProvider)
          .watchChapterProgresses(
            comicPathWord: key.comicPathWord,
            groupPathWord: key.groupPathWord,
          );
    });
