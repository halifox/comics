import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'library_database.g.dart';

final libraryDatabaseProvider = Provider((ref) {
  final database = LibraryDatabase();
  ref.onDispose(database.close);
  return database;
});

class StoredComics extends Table {
  TextColumn get pathWord => text()();

  TextColumn get name => text()();

  TextColumn get cover => text()();

  TextColumn get author => text()();

  @override
  Set<Column<Object>> get primaryKey => {pathWord};
}

class ComicFavorites extends Table {
  TextColumn get comicPathWord =>
      text().references(StoredComics, #pathWord, onDelete: KeyAction.cascade)();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {comicPathWord};
}

class ComicReadingProgresses extends Table {
  TextColumn get comicPathWord =>
      text().references(StoredComics, #pathWord, onDelete: KeyAction.cascade)();

  TextColumn get chapterId => text()();

  TextColumn get chapterName => text()();

  TextColumn get groupName => text()();

  TextColumn get groupPathWord => text().withDefault(const Constant(''))();

  IntColumn get pageIndex => integer().withDefault(const Constant(0))();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {comicPathWord};
}

class ComicChapterReadingProgresses extends Table {
  TextColumn get comicPathWord =>
      text().references(StoredComics, #pathWord, onDelete: KeyAction.cascade)();

  TextColumn get groupPathWord => text()();

  TextColumn get groupName => text()();

  TextColumn get chapterId => text()();

  TextColumn get chapterName => text()();

  IntColumn get pageIndex => integer().withDefault(const Constant(0))();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {
    comicPathWord,
    groupPathWord,
    chapterId,
  };
}

class ComicGroupReadingProgresses extends Table {
  TextColumn get comicPathWord =>
      text().references(StoredComics, #pathWord, onDelete: KeyAction.cascade)();

  TextColumn get groupPathWord => text()();

  TextColumn get groupName => text()();

  TextColumn get chapterId => text()();

  TextColumn get chapterName => text()();

  IntColumn get pageIndex => integer().withDefault(const Constant(0))();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {comicPathWord, groupPathWord};
}

class SearchHistories extends Table {
  TextColumn get normalizedQuery => text()();

  TextColumn get query => text()();

  DateTimeColumn get searchedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {normalizedQuery};
}

class ComicMetadata {
  const ComicMetadata({
    required this.pathWord,
    required this.name,
    required this.cover,
    required this.author,
  });

  final String pathWord;
  final String name;
  final String cover;
  final String author;
}

class ComicReadingProgress {
  const ComicReadingProgress({
    required this.chapterId,
    required this.chapterName,
    required this.groupName,
    required this.groupPathWord,
    required this.pageIndex,
    required this.updatedAt,
  });

  final String chapterId;
  final String chapterName;
  final String groupName;
  final String groupPathWord;
  final int pageIndex;
  final DateTime updatedAt;
}

class ComicLibraryItem {
  const ComicLibraryItem({
    required this.comic,
    required this.isFavorite,
    this.favoritedAt,
    this.progress,
  });

  final ComicMetadata comic;
  final bool isFavorite;
  final DateTime? favoritedAt;
  final ComicReadingProgress? progress;
}

@DriftDatabase(
  tables: [
    StoredComics,
    ComicFavorites,
    ComicReadingProgresses,
    ComicChapterReadingProgresses,
    ComicGroupReadingProgresses,
    SearchHistories,
  ],
)
class LibraryDatabase extends _$LibraryDatabase {
  LibraryDatabase() : super(driftDatabase(name: 'comic_library'));

  static const maximumSearchHistoryEntries = 12;

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(searchHistories);
      }
    },
  );

  Stream<List<String>> watchSearchHistory() {
    final query = select(searchHistories)
      ..orderBy([(row) => OrderingTerm.desc(row.searchedAt)]);
    return query.watch().map(
      (entries) => entries.map((entry) => entry.query).toList(growable: false),
    );
  }

  Future<void> recordSearch({required String query}) async {
    final normalizedQuery = query.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return;
    }

    await transaction(() async {
      await into(searchHistories).insertOnConflictUpdate(
        SearchHistoriesCompanion.insert(
          normalizedQuery: normalizedQuery,
          query: query.trim(),
          searchedAt: DateTime.now(),
        ),
      );

      final overflow =
          await (select(searchHistories)
                ..orderBy([(row) => OrderingTerm.desc(row.searchedAt)])
                ..limit(1000, offset: maximumSearchHistoryEntries))
              .get();
      if (overflow.isNotEmpty) {
        await (delete(searchHistories)..where(
              (row) => row.normalizedQuery.isIn(
                overflow.map((entry) => entry.normalizedQuery),
              ),
            ))
            .go();
      }
    });
  }

  Future<void> removeSearch({required String query}) async {
    await (delete(searchHistories)..where(
          (row) => row.normalizedQuery.equals(query.trim().toLowerCase()),
        ))
        .go();
  }

  Future<void> clearSearchHistory() => delete(searchHistories).go();

  Stream<List<ComicLibraryItem>> watchFavoriteComics() {
    final query = select(storedComics).join([
      innerJoin(
        comicFavorites,
        comicFavorites.comicPathWord.equalsExp(storedComics.pathWord),
      ),
      leftOuterJoin(
        comicReadingProgresses,
        comicReadingProgresses.comicPathWord.equalsExp(storedComics.pathWord),
      ),
    ])..orderBy([OrderingTerm.desc(comicFavorites.createdAt)]);

    return query.watch().map(
      (rows) =>
          rows.map((e) => libraryItemFromRow(row: e)).toList(growable: false),
    );
  }

  Stream<List<ComicLibraryItem>> watchReadingHistory() {
    final query = select(storedComics).join([
      innerJoin(
        comicReadingProgresses,
        comicReadingProgresses.comicPathWord.equalsExp(storedComics.pathWord),
      ),
      leftOuterJoin(
        comicFavorites,
        comicFavorites.comicPathWord.equalsExp(storedComics.pathWord),
      ),
    ])..orderBy([OrderingTerm.desc(comicReadingProgresses.updatedAt)]);

    return query.watch().map(
      (rows) =>
          rows.map((e) => libraryItemFromRow(row: e)).toList(growable: false),
    );
  }

  Future<void> clearReadingHistory() => delete(comicReadingProgresses).go();

  Stream<ComicReadingProgress?> watchLatestComicProgress({
    required String comicPathWord,
  }) {
    final query = select(comicGroupReadingProgresses)
      ..where((row) => row.comicPathWord.equals(comicPathWord))
      ..orderBy([(row) => OrderingTerm.desc(row.updatedAt)])
      ..limit(1);

    return query.watchSingleOrNull().map(
      (row) => row == null
          ? null
          : ComicReadingProgress(
              chapterId: row.chapterId,
              chapterName: row.chapterName,
              groupName: row.groupName,
              groupPathWord: row.groupPathWord,
              pageIndex: row.pageIndex,
              updatedAt: row.updatedAt,
            ),
    );
  }

  Stream<ComicLibraryItem?> watchComic({required String pathWord}) {
    final query = select(storedComics).join([
      leftOuterJoin(
        comicFavorites,
        comicFavorites.comicPathWord.equalsExp(storedComics.pathWord),
      ),
      leftOuterJoin(
        comicReadingProgresses,
        comicReadingProgresses.comicPathWord.equalsExp(storedComics.pathWord),
      ),
    ])..where(storedComics.pathWord.equals(pathWord));

    return query.watchSingleOrNull().map(
      (row) => row == null ? null : libraryItemFromRow(row: row),
    );
  }

  Stream<ComicReadingProgress?> watchGroupProgress({
    required String comicPathWord,
    required String groupPathWord,
  }) {
    final query = select(comicGroupReadingProgresses)
      ..where(
        (row) =>
            row.comicPathWord.equals(comicPathWord) &
            row.groupPathWord.equals(groupPathWord),
      );

    return query.watchSingleOrNull().map(
      (row) => row == null
          ? null
          : ComicReadingProgress(
              chapterId: row.chapterId,
              chapterName: row.chapterName,
              groupName: row.groupName,
              groupPathWord: row.groupPathWord,
              pageIndex: row.pageIndex,
              updatedAt: row.updatedAt,
            ),
    );
  }

  Stream<Map<String, ComicReadingProgress>> watchChapterProgresses({
    required String comicPathWord,
    required String groupPathWord,
  }) {
    final query = select(comicChapterReadingProgresses)
      ..where(
        (row) =>
            row.comicPathWord.equals(comicPathWord) &
            row.groupPathWord.equals(groupPathWord),
      );

    return query.watch().map(
      (rows) => {
        for (final row in rows)
          row.chapterId: ComicReadingProgress(
            chapterId: row.chapterId,
            chapterName: row.chapterName,
            groupName: row.groupName,
            groupPathWord: row.groupPathWord,
            pageIndex: row.pageIndex,
            updatedAt: row.updatedAt,
          ),
      },
    );
  }

  Future<void> toggleFavorite({required ComicMetadata comic}) async {
    await transaction(() async {
      await upsertComic(comic: comic);
      final favorite =
          await (select(comicFavorites)
                ..where((row) => row.comicPathWord.equals(comic.pathWord)))
              .getSingleOrNull();

      if (favorite == null) {
        await into(comicFavorites).insert(
          ComicFavoritesCompanion.insert(
            comicPathWord: comic.pathWord,
            createdAt: DateTime.now(),
          ),
        );
      } else {
        await (delete(
          comicFavorites,
        )..where((row) => row.comicPathWord.equals(comic.pathWord))).go();
      }
    });
  }

  Future<void> recordReading({
    required ComicMetadata comic,
    required String chapterId,
    required String chapterName,
    required String groupName,
    required String groupPathWord,
    required int pageIndex,
  }) async {
    await transaction(() async {
      await upsertComic(comic: comic);
      await into(comicReadingProgresses).insertOnConflictUpdate(
        ComicReadingProgressesCompanion.insert(
          comicPathWord: comic.pathWord,
          chapterId: chapterId,
          chapterName: chapterName,
          groupName: groupName,
          groupPathWord: Value(groupPathWord),
          pageIndex: Value(pageIndex),
          updatedAt: DateTime.now(),
        ),
      );
      await into(comicChapterReadingProgresses).insertOnConflictUpdate(
        ComicChapterReadingProgressesCompanion.insert(
          comicPathWord: comic.pathWord,
          groupPathWord: groupPathWord,
          groupName: groupName,
          chapterId: chapterId,
          chapterName: chapterName,
          pageIndex: Value(pageIndex),
          updatedAt: DateTime.now(),
        ),
      );
      await into(comicGroupReadingProgresses).insertOnConflictUpdate(
        ComicGroupReadingProgressesCompanion.insert(
          comicPathWord: comic.pathWord,
          groupPathWord: groupPathWord,
          groupName: groupName,
          chapterId: chapterId,
          chapterName: chapterName,
          pageIndex: Value(pageIndex),
          updatedAt: DateTime.now(),
        ),
      );
    });
  }

  Future<void> upsertComic({required ComicMetadata comic}) async {
    await into(storedComics).insertOnConflictUpdate(
      StoredComicsCompanion.insert(
        pathWord: comic.pathWord,
        name: comic.name,
        cover: comic.cover,
        author: comic.author,
      ),
    );
  }

  ComicLibraryItem libraryItemFromRow({required TypedResult row}) {
    final comic = row.readTable(storedComics);
    final favorite = row.readTableOrNull(comicFavorites);
    final progress = row.readTableOrNull(comicReadingProgresses);

    return ComicLibraryItem(
      comic: ComicMetadata(
        pathWord: comic.pathWord,
        name: comic.name,
        cover: comic.cover,
        author: comic.author,
      ),
      isFavorite: favorite != null,
      favoritedAt: favorite?.createdAt,
      progress: progress == null
          ? null
          : ComicReadingProgress(
              chapterId: progress.chapterId,
              chapterName: progress.chapterName,
              groupName: progress.groupName,
              groupPathWord: progress.groupPathWord,
              pageIndex: progress.pageIndex,
              updatedAt: progress.updatedAt,
            ),
    );
  }
}
