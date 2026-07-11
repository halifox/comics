import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'library_database.g.dart';

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
  ],
)
class LibraryDatabase extends _$LibraryDatabase {
  LibraryDatabase() : super(driftDatabase(name: 'comic_library'));

  @override
  int get schemaVersion => 1;

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
      (rows) => rows.map(libraryItemFromRow).toList(growable: false),
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
      (rows) => rows.map(libraryItemFromRow).toList(growable: false),
    );
  }

  Stream<ComicLibraryItem?> watchComic(String pathWord) {
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
      (row) => row == null ? null : libraryItemFromRow(row),
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

  Future<void> toggleFavorite(ComicMetadata comic) async {
    await transaction(() async {
      await upsertComic(comic);
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
      await upsertComic(comic);
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

  Future<void> upsertComic(ComicMetadata comic) async {
    await into(storedComics).insertOnConflictUpdate(
      StoredComicsCompanion.insert(
        pathWord: comic.pathWord,
        name: comic.name,
        cover: comic.cover,
        author: comic.author,
      ),
    );
  }

  ComicLibraryItem libraryItemFromRow(TypedResult row) {
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
