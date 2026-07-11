// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_database.dart';

// ignore_for_file: type=lint
class $StoredComicsTable extends StoredComics
    with TableInfo<$StoredComicsTable, StoredComic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoredComicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pathWordMeta = const VerificationMeta(
    'pathWord',
  );
  @override
  late final GeneratedColumn<String> pathWord = GeneratedColumn<String>(
    'path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coverMeta = const VerificationMeta('cover');
  @override
  late final GeneratedColumn<String> cover = GeneratedColumn<String>(
    'cover',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [pathWord, name, cover, author];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stored_comics';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredComic> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('path_word')) {
      context.handle(
        _pathWordMeta,
        pathWord.isAcceptableOrUnknown(data['path_word']!, _pathWordMeta),
      );
    } else if (isInserting) {
      context.missing(_pathWordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover')) {
      context.handle(
        _coverMeta,
        cover.isAcceptableOrUnknown(data['cover']!, _coverMeta),
      );
    } else if (isInserting) {
      context.missing(_coverMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pathWord};
  @override
  StoredComic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredComic(
      pathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_word'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      cover: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
    );
  }

  @override
  $StoredComicsTable createAlias(String alias) {
    return $StoredComicsTable(attachedDatabase, alias);
  }
}

class StoredComic extends DataClass implements Insertable<StoredComic> {
  final String pathWord;
  final String name;
  final String cover;
  final String author;
  const StoredComic({
    required this.pathWord,
    required this.name,
    required this.cover,
    required this.author,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['path_word'] = Variable<String>(pathWord);
    map['name'] = Variable<String>(name);
    map['cover'] = Variable<String>(cover);
    map['author'] = Variable<String>(author);
    return map;
  }

  StoredComicsCompanion toCompanion(bool nullToAbsent) {
    return StoredComicsCompanion(
      pathWord: Value(pathWord),
      name: Value(name),
      cover: Value(cover),
      author: Value(author),
    );
  }

  factory StoredComic.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredComic(
      pathWord: serializer.fromJson<String>(json['pathWord']),
      name: serializer.fromJson<String>(json['name']),
      cover: serializer.fromJson<String>(json['cover']),
      author: serializer.fromJson<String>(json['author']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pathWord': serializer.toJson<String>(pathWord),
      'name': serializer.toJson<String>(name),
      'cover': serializer.toJson<String>(cover),
      'author': serializer.toJson<String>(author),
    };
  }

  StoredComic copyWith({
    String? pathWord,
    String? name,
    String? cover,
    String? author,
  }) => StoredComic(
    pathWord: pathWord ?? this.pathWord,
    name: name ?? this.name,
    cover: cover ?? this.cover,
    author: author ?? this.author,
  );
  StoredComic copyWithCompanion(StoredComicsCompanion data) {
    return StoredComic(
      pathWord: data.pathWord.present ? data.pathWord.value : this.pathWord,
      name: data.name.present ? data.name.value : this.name,
      cover: data.cover.present ? data.cover.value : this.cover,
      author: data.author.present ? data.author.value : this.author,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredComic(')
          ..write('pathWord: $pathWord, ')
          ..write('name: $name, ')
          ..write('cover: $cover, ')
          ..write('author: $author')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pathWord, name, cover, author);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredComic &&
          other.pathWord == this.pathWord &&
          other.name == this.name &&
          other.cover == this.cover &&
          other.author == this.author);
}

class StoredComicsCompanion extends UpdateCompanion<StoredComic> {
  final Value<String> pathWord;
  final Value<String> name;
  final Value<String> cover;
  final Value<String> author;
  final Value<int> rowid;
  const StoredComicsCompanion({
    this.pathWord = const Value.absent(),
    this.name = const Value.absent(),
    this.cover = const Value.absent(),
    this.author = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StoredComicsCompanion.insert({
    required String pathWord,
    required String name,
    required String cover,
    required String author,
    this.rowid = const Value.absent(),
  }) : pathWord = Value(pathWord),
       name = Value(name),
       cover = Value(cover),
       author = Value(author);
  static Insertable<StoredComic> custom({
    Expression<String>? pathWord,
    Expression<String>? name,
    Expression<String>? cover,
    Expression<String>? author,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pathWord != null) 'path_word': pathWord,
      if (name != null) 'name': name,
      if (cover != null) 'cover': cover,
      if (author != null) 'author': author,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StoredComicsCompanion copyWith({
    Value<String>? pathWord,
    Value<String>? name,
    Value<String>? cover,
    Value<String>? author,
    Value<int>? rowid,
  }) {
    return StoredComicsCompanion(
      pathWord: pathWord ?? this.pathWord,
      name: name ?? this.name,
      cover: cover ?? this.cover,
      author: author ?? this.author,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pathWord.present) {
      map['path_word'] = Variable<String>(pathWord.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String>(cover.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoredComicsCompanion(')
          ..write('pathWord: $pathWord, ')
          ..write('name: $name, ')
          ..write('cover: $cover, ')
          ..write('author: $author, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComicFavoritesTable extends ComicFavorites
    with TableInfo<$ComicFavoritesTable, ComicFavorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComicFavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _comicPathWordMeta = const VerificationMeta(
    'comicPathWord',
  );
  @override
  late final GeneratedColumn<String> comicPathWord = GeneratedColumn<String>(
    'comic_path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stored_comics (path_word) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [comicPathWord, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comic_favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComicFavorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('comic_path_word')) {
      context.handle(
        _comicPathWordMeta,
        comicPathWord.isAcceptableOrUnknown(
          data['comic_path_word']!,
          _comicPathWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_comicPathWordMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {comicPathWord};
  @override
  ComicFavorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComicFavorite(
      comicPathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comic_path_word'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ComicFavoritesTable createAlias(String alias) {
    return $ComicFavoritesTable(attachedDatabase, alias);
  }
}

class ComicFavorite extends DataClass implements Insertable<ComicFavorite> {
  final String comicPathWord;
  final DateTime createdAt;
  const ComicFavorite({required this.comicPathWord, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['comic_path_word'] = Variable<String>(comicPathWord);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ComicFavoritesCompanion toCompanion(bool nullToAbsent) {
    return ComicFavoritesCompanion(
      comicPathWord: Value(comicPathWord),
      createdAt: Value(createdAt),
    );
  }

  factory ComicFavorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComicFavorite(
      comicPathWord: serializer.fromJson<String>(json['comicPathWord']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'comicPathWord': serializer.toJson<String>(comicPathWord),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ComicFavorite copyWith({String? comicPathWord, DateTime? createdAt}) =>
      ComicFavorite(
        comicPathWord: comicPathWord ?? this.comicPathWord,
        createdAt: createdAt ?? this.createdAt,
      );
  ComicFavorite copyWithCompanion(ComicFavoritesCompanion data) {
    return ComicFavorite(
      comicPathWord: data.comicPathWord.present
          ? data.comicPathWord.value
          : this.comicPathWord,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComicFavorite(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(comicPathWord, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComicFavorite &&
          other.comicPathWord == this.comicPathWord &&
          other.createdAt == this.createdAt);
}

class ComicFavoritesCompanion extends UpdateCompanion<ComicFavorite> {
  final Value<String> comicPathWord;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ComicFavoritesCompanion({
    this.comicPathWord = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComicFavoritesCompanion.insert({
    required String comicPathWord,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : comicPathWord = Value(comicPathWord),
       createdAt = Value(createdAt);
  static Insertable<ComicFavorite> custom({
    Expression<String>? comicPathWord,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (comicPathWord != null) 'comic_path_word': comicPathWord,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComicFavoritesCompanion copyWith({
    Value<String>? comicPathWord,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ComicFavoritesCompanion(
      comicPathWord: comicPathWord ?? this.comicPathWord,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (comicPathWord.present) {
      map['comic_path_word'] = Variable<String>(comicPathWord.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComicFavoritesCompanion(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComicReadingProgressesTable extends ComicReadingProgresses
    with TableInfo<$ComicReadingProgressesTable, ComicReadingProgressesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComicReadingProgressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _comicPathWordMeta = const VerificationMeta(
    'comicPathWord',
  );
  @override
  late final GeneratedColumn<String> comicPathWord = GeneratedColumn<String>(
    'comic_path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stored_comics (path_word) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterNameMeta = const VerificationMeta(
    'chapterName',
  );
  @override
  late final GeneratedColumn<String> chapterName = GeneratedColumn<String>(
    'chapter_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupPathWordMeta = const VerificationMeta(
    'groupPathWord',
  );
  @override
  late final GeneratedColumn<String> groupPathWord = GeneratedColumn<String>(
    'group_path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _pageIndexMeta = const VerificationMeta(
    'pageIndex',
  );
  @override
  late final GeneratedColumn<int> pageIndex = GeneratedColumn<int>(
    'page_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    comicPathWord,
    chapterId,
    chapterName,
    groupName,
    groupPathWord,
    pageIndex,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comic_reading_progresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComicReadingProgressesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('comic_path_word')) {
      context.handle(
        _comicPathWordMeta,
        comicPathWord.isAcceptableOrUnknown(
          data['comic_path_word']!,
          _comicPathWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_comicPathWordMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
        _chapterNameMeta,
        chapterName.isAcceptableOrUnknown(
          data['chapter_name']!,
          _chapterNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNameMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    if (data.containsKey('group_path_word')) {
      context.handle(
        _groupPathWordMeta,
        groupPathWord.isAcceptableOrUnknown(
          data['group_path_word']!,
          _groupPathWordMeta,
        ),
      );
    }
    if (data.containsKey('page_index')) {
      context.handle(
        _pageIndexMeta,
        pageIndex.isAcceptableOrUnknown(data['page_index']!, _pageIndexMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {comicPathWord};
  @override
  ComicReadingProgressesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComicReadingProgressesData(
      comicPathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comic_path_word'],
      )!,
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      chapterName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_name'],
      )!,
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      )!,
      groupPathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_path_word'],
      )!,
      pageIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_index'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ComicReadingProgressesTable createAlias(String alias) {
    return $ComicReadingProgressesTable(attachedDatabase, alias);
  }
}

class ComicReadingProgressesData extends DataClass
    implements Insertable<ComicReadingProgressesData> {
  final String comicPathWord;
  final String chapterId;
  final String chapterName;
  final String groupName;
  final String groupPathWord;
  final int pageIndex;
  final DateTime updatedAt;
  const ComicReadingProgressesData({
    required this.comicPathWord,
    required this.chapterId,
    required this.chapterName,
    required this.groupName,
    required this.groupPathWord,
    required this.pageIndex,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['comic_path_word'] = Variable<String>(comicPathWord);
    map['chapter_id'] = Variable<String>(chapterId);
    map['chapter_name'] = Variable<String>(chapterName);
    map['group_name'] = Variable<String>(groupName);
    map['group_path_word'] = Variable<String>(groupPathWord);
    map['page_index'] = Variable<int>(pageIndex);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ComicReadingProgressesCompanion toCompanion(bool nullToAbsent) {
    return ComicReadingProgressesCompanion(
      comicPathWord: Value(comicPathWord),
      chapterId: Value(chapterId),
      chapterName: Value(chapterName),
      groupName: Value(groupName),
      groupPathWord: Value(groupPathWord),
      pageIndex: Value(pageIndex),
      updatedAt: Value(updatedAt),
    );
  }

  factory ComicReadingProgressesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComicReadingProgressesData(
      comicPathWord: serializer.fromJson<String>(json['comicPathWord']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      chapterName: serializer.fromJson<String>(json['chapterName']),
      groupName: serializer.fromJson<String>(json['groupName']),
      groupPathWord: serializer.fromJson<String>(json['groupPathWord']),
      pageIndex: serializer.fromJson<int>(json['pageIndex']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'comicPathWord': serializer.toJson<String>(comicPathWord),
      'chapterId': serializer.toJson<String>(chapterId),
      'chapterName': serializer.toJson<String>(chapterName),
      'groupName': serializer.toJson<String>(groupName),
      'groupPathWord': serializer.toJson<String>(groupPathWord),
      'pageIndex': serializer.toJson<int>(pageIndex),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ComicReadingProgressesData copyWith({
    String? comicPathWord,
    String? chapterId,
    String? chapterName,
    String? groupName,
    String? groupPathWord,
    int? pageIndex,
    DateTime? updatedAt,
  }) => ComicReadingProgressesData(
    comicPathWord: comicPathWord ?? this.comicPathWord,
    chapterId: chapterId ?? this.chapterId,
    chapterName: chapterName ?? this.chapterName,
    groupName: groupName ?? this.groupName,
    groupPathWord: groupPathWord ?? this.groupPathWord,
    pageIndex: pageIndex ?? this.pageIndex,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ComicReadingProgressesData copyWithCompanion(
    ComicReadingProgressesCompanion data,
  ) {
    return ComicReadingProgressesData(
      comicPathWord: data.comicPathWord.present
          ? data.comicPathWord.value
          : this.comicPathWord,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      chapterName: data.chapterName.present
          ? data.chapterName.value
          : this.chapterName,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      groupPathWord: data.groupPathWord.present
          ? data.groupPathWord.value
          : this.groupPathWord,
      pageIndex: data.pageIndex.present ? data.pageIndex.value : this.pageIndex,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComicReadingProgressesData(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('groupName: $groupName, ')
          ..write('groupPathWord: $groupPathWord, ')
          ..write('pageIndex: $pageIndex, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    comicPathWord,
    chapterId,
    chapterName,
    groupName,
    groupPathWord,
    pageIndex,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComicReadingProgressesData &&
          other.comicPathWord == this.comicPathWord &&
          other.chapterId == this.chapterId &&
          other.chapterName == this.chapterName &&
          other.groupName == this.groupName &&
          other.groupPathWord == this.groupPathWord &&
          other.pageIndex == this.pageIndex &&
          other.updatedAt == this.updatedAt);
}

class ComicReadingProgressesCompanion
    extends UpdateCompanion<ComicReadingProgressesData> {
  final Value<String> comicPathWord;
  final Value<String> chapterId;
  final Value<String> chapterName;
  final Value<String> groupName;
  final Value<String> groupPathWord;
  final Value<int> pageIndex;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ComicReadingProgressesCompanion({
    this.comicPathWord = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
    this.groupName = const Value.absent(),
    this.groupPathWord = const Value.absent(),
    this.pageIndex = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComicReadingProgressesCompanion.insert({
    required String comicPathWord,
    required String chapterId,
    required String chapterName,
    required String groupName,
    this.groupPathWord = const Value.absent(),
    this.pageIndex = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : comicPathWord = Value(comicPathWord),
       chapterId = Value(chapterId),
       chapterName = Value(chapterName),
       groupName = Value(groupName),
       updatedAt = Value(updatedAt);
  static Insertable<ComicReadingProgressesData> custom({
    Expression<String>? comicPathWord,
    Expression<String>? chapterId,
    Expression<String>? chapterName,
    Expression<String>? groupName,
    Expression<String>? groupPathWord,
    Expression<int>? pageIndex,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (comicPathWord != null) 'comic_path_word': comicPathWord,
      if (chapterId != null) 'chapter_id': chapterId,
      if (chapterName != null) 'chapter_name': chapterName,
      if (groupName != null) 'group_name': groupName,
      if (groupPathWord != null) 'group_path_word': groupPathWord,
      if (pageIndex != null) 'page_index': pageIndex,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComicReadingProgressesCompanion copyWith({
    Value<String>? comicPathWord,
    Value<String>? chapterId,
    Value<String>? chapterName,
    Value<String>? groupName,
    Value<String>? groupPathWord,
    Value<int>? pageIndex,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ComicReadingProgressesCompanion(
      comicPathWord: comicPathWord ?? this.comicPathWord,
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
      groupName: groupName ?? this.groupName,
      groupPathWord: groupPathWord ?? this.groupPathWord,
      pageIndex: pageIndex ?? this.pageIndex,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (comicPathWord.present) {
      map['comic_path_word'] = Variable<String>(comicPathWord.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String>(chapterName.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (groupPathWord.present) {
      map['group_path_word'] = Variable<String>(groupPathWord.value);
    }
    if (pageIndex.present) {
      map['page_index'] = Variable<int>(pageIndex.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComicReadingProgressesCompanion(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('groupName: $groupName, ')
          ..write('groupPathWord: $groupPathWord, ')
          ..write('pageIndex: $pageIndex, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComicChapterReadingProgressesTable extends ComicChapterReadingProgresses
    with
        TableInfo<
          $ComicChapterReadingProgressesTable,
          ComicChapterReadingProgressesData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComicChapterReadingProgressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _comicPathWordMeta = const VerificationMeta(
    'comicPathWord',
  );
  @override
  late final GeneratedColumn<String> comicPathWord = GeneratedColumn<String>(
    'comic_path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stored_comics (path_word) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _groupPathWordMeta = const VerificationMeta(
    'groupPathWord',
  );
  @override
  late final GeneratedColumn<String> groupPathWord = GeneratedColumn<String>(
    'group_path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterNameMeta = const VerificationMeta(
    'chapterName',
  );
  @override
  late final GeneratedColumn<String> chapterName = GeneratedColumn<String>(
    'chapter_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageIndexMeta = const VerificationMeta(
    'pageIndex',
  );
  @override
  late final GeneratedColumn<int> pageIndex = GeneratedColumn<int>(
    'page_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    comicPathWord,
    groupPathWord,
    groupName,
    chapterId,
    chapterName,
    pageIndex,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comic_chapter_reading_progresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComicChapterReadingProgressesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('comic_path_word')) {
      context.handle(
        _comicPathWordMeta,
        comicPathWord.isAcceptableOrUnknown(
          data['comic_path_word']!,
          _comicPathWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_comicPathWordMeta);
    }
    if (data.containsKey('group_path_word')) {
      context.handle(
        _groupPathWordMeta,
        groupPathWord.isAcceptableOrUnknown(
          data['group_path_word']!,
          _groupPathWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_groupPathWordMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
        _chapterNameMeta,
        chapterName.isAcceptableOrUnknown(
          data['chapter_name']!,
          _chapterNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNameMeta);
    }
    if (data.containsKey('page_index')) {
      context.handle(
        _pageIndexMeta,
        pageIndex.isAcceptableOrUnknown(data['page_index']!, _pageIndexMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    comicPathWord,
    groupPathWord,
    chapterId,
  };
  @override
  ComicChapterReadingProgressesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComicChapterReadingProgressesData(
      comicPathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comic_path_word'],
      )!,
      groupPathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_path_word'],
      )!,
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      )!,
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      chapterName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_name'],
      )!,
      pageIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_index'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ComicChapterReadingProgressesTable createAlias(String alias) {
    return $ComicChapterReadingProgressesTable(attachedDatabase, alias);
  }
}

class ComicChapterReadingProgressesData extends DataClass
    implements Insertable<ComicChapterReadingProgressesData> {
  final String comicPathWord;
  final String groupPathWord;
  final String groupName;
  final String chapterId;
  final String chapterName;
  final int pageIndex;
  final DateTime updatedAt;
  const ComicChapterReadingProgressesData({
    required this.comicPathWord,
    required this.groupPathWord,
    required this.groupName,
    required this.chapterId,
    required this.chapterName,
    required this.pageIndex,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['comic_path_word'] = Variable<String>(comicPathWord);
    map['group_path_word'] = Variable<String>(groupPathWord);
    map['group_name'] = Variable<String>(groupName);
    map['chapter_id'] = Variable<String>(chapterId);
    map['chapter_name'] = Variable<String>(chapterName);
    map['page_index'] = Variable<int>(pageIndex);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ComicChapterReadingProgressesCompanion toCompanion(bool nullToAbsent) {
    return ComicChapterReadingProgressesCompanion(
      comicPathWord: Value(comicPathWord),
      groupPathWord: Value(groupPathWord),
      groupName: Value(groupName),
      chapterId: Value(chapterId),
      chapterName: Value(chapterName),
      pageIndex: Value(pageIndex),
      updatedAt: Value(updatedAt),
    );
  }

  factory ComicChapterReadingProgressesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComicChapterReadingProgressesData(
      comicPathWord: serializer.fromJson<String>(json['comicPathWord']),
      groupPathWord: serializer.fromJson<String>(json['groupPathWord']),
      groupName: serializer.fromJson<String>(json['groupName']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      chapterName: serializer.fromJson<String>(json['chapterName']),
      pageIndex: serializer.fromJson<int>(json['pageIndex']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'comicPathWord': serializer.toJson<String>(comicPathWord),
      'groupPathWord': serializer.toJson<String>(groupPathWord),
      'groupName': serializer.toJson<String>(groupName),
      'chapterId': serializer.toJson<String>(chapterId),
      'chapterName': serializer.toJson<String>(chapterName),
      'pageIndex': serializer.toJson<int>(pageIndex),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ComicChapterReadingProgressesData copyWith({
    String? comicPathWord,
    String? groupPathWord,
    String? groupName,
    String? chapterId,
    String? chapterName,
    int? pageIndex,
    DateTime? updatedAt,
  }) => ComicChapterReadingProgressesData(
    comicPathWord: comicPathWord ?? this.comicPathWord,
    groupPathWord: groupPathWord ?? this.groupPathWord,
    groupName: groupName ?? this.groupName,
    chapterId: chapterId ?? this.chapterId,
    chapterName: chapterName ?? this.chapterName,
    pageIndex: pageIndex ?? this.pageIndex,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ComicChapterReadingProgressesData copyWithCompanion(
    ComicChapterReadingProgressesCompanion data,
  ) {
    return ComicChapterReadingProgressesData(
      comicPathWord: data.comicPathWord.present
          ? data.comicPathWord.value
          : this.comicPathWord,
      groupPathWord: data.groupPathWord.present
          ? data.groupPathWord.value
          : this.groupPathWord,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      chapterName: data.chapterName.present
          ? data.chapterName.value
          : this.chapterName,
      pageIndex: data.pageIndex.present ? data.pageIndex.value : this.pageIndex,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComicChapterReadingProgressesData(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('groupPathWord: $groupPathWord, ')
          ..write('groupName: $groupName, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('pageIndex: $pageIndex, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    comicPathWord,
    groupPathWord,
    groupName,
    chapterId,
    chapterName,
    pageIndex,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComicChapterReadingProgressesData &&
          other.comicPathWord == this.comicPathWord &&
          other.groupPathWord == this.groupPathWord &&
          other.groupName == this.groupName &&
          other.chapterId == this.chapterId &&
          other.chapterName == this.chapterName &&
          other.pageIndex == this.pageIndex &&
          other.updatedAt == this.updatedAt);
}

class ComicChapterReadingProgressesCompanion
    extends UpdateCompanion<ComicChapterReadingProgressesData> {
  final Value<String> comicPathWord;
  final Value<String> groupPathWord;
  final Value<String> groupName;
  final Value<String> chapterId;
  final Value<String> chapterName;
  final Value<int> pageIndex;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ComicChapterReadingProgressesCompanion({
    this.comicPathWord = const Value.absent(),
    this.groupPathWord = const Value.absent(),
    this.groupName = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
    this.pageIndex = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComicChapterReadingProgressesCompanion.insert({
    required String comicPathWord,
    required String groupPathWord,
    required String groupName,
    required String chapterId,
    required String chapterName,
    this.pageIndex = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : comicPathWord = Value(comicPathWord),
       groupPathWord = Value(groupPathWord),
       groupName = Value(groupName),
       chapterId = Value(chapterId),
       chapterName = Value(chapterName),
       updatedAt = Value(updatedAt);
  static Insertable<ComicChapterReadingProgressesData> custom({
    Expression<String>? comicPathWord,
    Expression<String>? groupPathWord,
    Expression<String>? groupName,
    Expression<String>? chapterId,
    Expression<String>? chapterName,
    Expression<int>? pageIndex,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (comicPathWord != null) 'comic_path_word': comicPathWord,
      if (groupPathWord != null) 'group_path_word': groupPathWord,
      if (groupName != null) 'group_name': groupName,
      if (chapterId != null) 'chapter_id': chapterId,
      if (chapterName != null) 'chapter_name': chapterName,
      if (pageIndex != null) 'page_index': pageIndex,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComicChapterReadingProgressesCompanion copyWith({
    Value<String>? comicPathWord,
    Value<String>? groupPathWord,
    Value<String>? groupName,
    Value<String>? chapterId,
    Value<String>? chapterName,
    Value<int>? pageIndex,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ComicChapterReadingProgressesCompanion(
      comicPathWord: comicPathWord ?? this.comicPathWord,
      groupPathWord: groupPathWord ?? this.groupPathWord,
      groupName: groupName ?? this.groupName,
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
      pageIndex: pageIndex ?? this.pageIndex,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (comicPathWord.present) {
      map['comic_path_word'] = Variable<String>(comicPathWord.value);
    }
    if (groupPathWord.present) {
      map['group_path_word'] = Variable<String>(groupPathWord.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String>(chapterName.value);
    }
    if (pageIndex.present) {
      map['page_index'] = Variable<int>(pageIndex.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComicChapterReadingProgressesCompanion(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('groupPathWord: $groupPathWord, ')
          ..write('groupName: $groupName, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('pageIndex: $pageIndex, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ComicGroupReadingProgressesTable extends ComicGroupReadingProgresses
    with
        TableInfo<
          $ComicGroupReadingProgressesTable,
          ComicGroupReadingProgressesData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ComicGroupReadingProgressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _comicPathWordMeta = const VerificationMeta(
    'comicPathWord',
  );
  @override
  late final GeneratedColumn<String> comicPathWord = GeneratedColumn<String>(
    'comic_path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stored_comics (path_word) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _groupPathWordMeta = const VerificationMeta(
    'groupPathWord',
  );
  @override
  late final GeneratedColumn<String> groupPathWord = GeneratedColumn<String>(
    'group_path_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<String> chapterId = GeneratedColumn<String>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterNameMeta = const VerificationMeta(
    'chapterName',
  );
  @override
  late final GeneratedColumn<String> chapterName = GeneratedColumn<String>(
    'chapter_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageIndexMeta = const VerificationMeta(
    'pageIndex',
  );
  @override
  late final GeneratedColumn<int> pageIndex = GeneratedColumn<int>(
    'page_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    comicPathWord,
    groupPathWord,
    groupName,
    chapterId,
    chapterName,
    pageIndex,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comic_group_reading_progresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<ComicGroupReadingProgressesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('comic_path_word')) {
      context.handle(
        _comicPathWordMeta,
        comicPathWord.isAcceptableOrUnknown(
          data['comic_path_word']!,
          _comicPathWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_comicPathWordMeta);
    }
    if (data.containsKey('group_path_word')) {
      context.handle(
        _groupPathWordMeta,
        groupPathWord.isAcceptableOrUnknown(
          data['group_path_word']!,
          _groupPathWordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_groupPathWordMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
        _chapterNameMeta,
        chapterName.isAcceptableOrUnknown(
          data['chapter_name']!,
          _chapterNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNameMeta);
    }
    if (data.containsKey('page_index')) {
      context.handle(
        _pageIndexMeta,
        pageIndex.isAcceptableOrUnknown(data['page_index']!, _pageIndexMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {comicPathWord, groupPathWord};
  @override
  ComicGroupReadingProgressesData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ComicGroupReadingProgressesData(
      comicPathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comic_path_word'],
      )!,
      groupPathWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_path_word'],
      )!,
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      )!,
      chapterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_id'],
      )!,
      chapterName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chapter_name'],
      )!,
      pageIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_index'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ComicGroupReadingProgressesTable createAlias(String alias) {
    return $ComicGroupReadingProgressesTable(attachedDatabase, alias);
  }
}

class ComicGroupReadingProgressesData extends DataClass
    implements Insertable<ComicGroupReadingProgressesData> {
  final String comicPathWord;
  final String groupPathWord;
  final String groupName;
  final String chapterId;
  final String chapterName;
  final int pageIndex;
  final DateTime updatedAt;
  const ComicGroupReadingProgressesData({
    required this.comicPathWord,
    required this.groupPathWord,
    required this.groupName,
    required this.chapterId,
    required this.chapterName,
    required this.pageIndex,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['comic_path_word'] = Variable<String>(comicPathWord);
    map['group_path_word'] = Variable<String>(groupPathWord);
    map['group_name'] = Variable<String>(groupName);
    map['chapter_id'] = Variable<String>(chapterId);
    map['chapter_name'] = Variable<String>(chapterName);
    map['page_index'] = Variable<int>(pageIndex);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ComicGroupReadingProgressesCompanion toCompanion(bool nullToAbsent) {
    return ComicGroupReadingProgressesCompanion(
      comicPathWord: Value(comicPathWord),
      groupPathWord: Value(groupPathWord),
      groupName: Value(groupName),
      chapterId: Value(chapterId),
      chapterName: Value(chapterName),
      pageIndex: Value(pageIndex),
      updatedAt: Value(updatedAt),
    );
  }

  factory ComicGroupReadingProgressesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ComicGroupReadingProgressesData(
      comicPathWord: serializer.fromJson<String>(json['comicPathWord']),
      groupPathWord: serializer.fromJson<String>(json['groupPathWord']),
      groupName: serializer.fromJson<String>(json['groupName']),
      chapterId: serializer.fromJson<String>(json['chapterId']),
      chapterName: serializer.fromJson<String>(json['chapterName']),
      pageIndex: serializer.fromJson<int>(json['pageIndex']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'comicPathWord': serializer.toJson<String>(comicPathWord),
      'groupPathWord': serializer.toJson<String>(groupPathWord),
      'groupName': serializer.toJson<String>(groupName),
      'chapterId': serializer.toJson<String>(chapterId),
      'chapterName': serializer.toJson<String>(chapterName),
      'pageIndex': serializer.toJson<int>(pageIndex),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ComicGroupReadingProgressesData copyWith({
    String? comicPathWord,
    String? groupPathWord,
    String? groupName,
    String? chapterId,
    String? chapterName,
    int? pageIndex,
    DateTime? updatedAt,
  }) => ComicGroupReadingProgressesData(
    comicPathWord: comicPathWord ?? this.comicPathWord,
    groupPathWord: groupPathWord ?? this.groupPathWord,
    groupName: groupName ?? this.groupName,
    chapterId: chapterId ?? this.chapterId,
    chapterName: chapterName ?? this.chapterName,
    pageIndex: pageIndex ?? this.pageIndex,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ComicGroupReadingProgressesData copyWithCompanion(
    ComicGroupReadingProgressesCompanion data,
  ) {
    return ComicGroupReadingProgressesData(
      comicPathWord: data.comicPathWord.present
          ? data.comicPathWord.value
          : this.comicPathWord,
      groupPathWord: data.groupPathWord.present
          ? data.groupPathWord.value
          : this.groupPathWord,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      chapterName: data.chapterName.present
          ? data.chapterName.value
          : this.chapterName,
      pageIndex: data.pageIndex.present ? data.pageIndex.value : this.pageIndex,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ComicGroupReadingProgressesData(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('groupPathWord: $groupPathWord, ')
          ..write('groupName: $groupName, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('pageIndex: $pageIndex, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    comicPathWord,
    groupPathWord,
    groupName,
    chapterId,
    chapterName,
    pageIndex,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComicGroupReadingProgressesData &&
          other.comicPathWord == this.comicPathWord &&
          other.groupPathWord == this.groupPathWord &&
          other.groupName == this.groupName &&
          other.chapterId == this.chapterId &&
          other.chapterName == this.chapterName &&
          other.pageIndex == this.pageIndex &&
          other.updatedAt == this.updatedAt);
}

class ComicGroupReadingProgressesCompanion
    extends UpdateCompanion<ComicGroupReadingProgressesData> {
  final Value<String> comicPathWord;
  final Value<String> groupPathWord;
  final Value<String> groupName;
  final Value<String> chapterId;
  final Value<String> chapterName;
  final Value<int> pageIndex;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ComicGroupReadingProgressesCompanion({
    this.comicPathWord = const Value.absent(),
    this.groupPathWord = const Value.absent(),
    this.groupName = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.chapterName = const Value.absent(),
    this.pageIndex = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ComicGroupReadingProgressesCompanion.insert({
    required String comicPathWord,
    required String groupPathWord,
    required String groupName,
    required String chapterId,
    required String chapterName,
    this.pageIndex = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : comicPathWord = Value(comicPathWord),
       groupPathWord = Value(groupPathWord),
       groupName = Value(groupName),
       chapterId = Value(chapterId),
       chapterName = Value(chapterName),
       updatedAt = Value(updatedAt);
  static Insertable<ComicGroupReadingProgressesData> custom({
    Expression<String>? comicPathWord,
    Expression<String>? groupPathWord,
    Expression<String>? groupName,
    Expression<String>? chapterId,
    Expression<String>? chapterName,
    Expression<int>? pageIndex,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (comicPathWord != null) 'comic_path_word': comicPathWord,
      if (groupPathWord != null) 'group_path_word': groupPathWord,
      if (groupName != null) 'group_name': groupName,
      if (chapterId != null) 'chapter_id': chapterId,
      if (chapterName != null) 'chapter_name': chapterName,
      if (pageIndex != null) 'page_index': pageIndex,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ComicGroupReadingProgressesCompanion copyWith({
    Value<String>? comicPathWord,
    Value<String>? groupPathWord,
    Value<String>? groupName,
    Value<String>? chapterId,
    Value<String>? chapterName,
    Value<int>? pageIndex,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ComicGroupReadingProgressesCompanion(
      comicPathWord: comicPathWord ?? this.comicPathWord,
      groupPathWord: groupPathWord ?? this.groupPathWord,
      groupName: groupName ?? this.groupName,
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
      pageIndex: pageIndex ?? this.pageIndex,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (comicPathWord.present) {
      map['comic_path_word'] = Variable<String>(comicPathWord.value);
    }
    if (groupPathWord.present) {
      map['group_path_word'] = Variable<String>(groupPathWord.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<String>(chapterId.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String>(chapterName.value);
    }
    if (pageIndex.present) {
      map['page_index'] = Variable<int>(pageIndex.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComicGroupReadingProgressesCompanion(')
          ..write('comicPathWord: $comicPathWord, ')
          ..write('groupPathWord: $groupPathWord, ')
          ..write('groupName: $groupName, ')
          ..write('chapterId: $chapterId, ')
          ..write('chapterName: $chapterName, ')
          ..write('pageIndex: $pageIndex, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LibraryDatabase extends GeneratedDatabase {
  _$LibraryDatabase(QueryExecutor e) : super(e);
  $LibraryDatabaseManager get managers => $LibraryDatabaseManager(this);
  late final $StoredComicsTable storedComics = $StoredComicsTable(this);
  late final $ComicFavoritesTable comicFavorites = $ComicFavoritesTable(this);
  late final $ComicReadingProgressesTable comicReadingProgresses =
      $ComicReadingProgressesTable(this);
  late final $ComicChapterReadingProgressesTable comicChapterReadingProgresses =
      $ComicChapterReadingProgressesTable(this);
  late final $ComicGroupReadingProgressesTable comicGroupReadingProgresses =
      $ComicGroupReadingProgressesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    storedComics,
    comicFavorites,
    comicReadingProgresses,
    comicChapterReadingProgresses,
    comicGroupReadingProgresses,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'stored_comics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('comic_favorites', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'stored_comics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('comic_reading_progresses', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'stored_comics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate(
          'comic_chapter_reading_progresses',
          kind: UpdateKind.delete,
        ),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'stored_comics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('comic_group_reading_progresses', kind: UpdateKind.delete),
      ],
    ),
  ]);
}

typedef $$StoredComicsTableCreateCompanionBuilder =
    StoredComicsCompanion Function({
      required String pathWord,
      required String name,
      required String cover,
      required String author,
      Value<int> rowid,
    });
typedef $$StoredComicsTableUpdateCompanionBuilder =
    StoredComicsCompanion Function({
      Value<String> pathWord,
      Value<String> name,
      Value<String> cover,
      Value<String> author,
      Value<int> rowid,
    });

final class $$StoredComicsTableReferences
    extends BaseReferences<_$LibraryDatabase, $StoredComicsTable, StoredComic> {
  $$StoredComicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ComicFavoritesTable, List<ComicFavorite>>
  _comicFavoritesRefsTable(_$LibraryDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.comicFavorites,
        aliasName: 'stored_comics__path_word__comic_favorites__comic_path_word',
      );

  $$ComicFavoritesTableProcessedTableManager get comicFavoritesRefs {
    final manager = $$ComicFavoritesTableTableManager($_db, $_db.comicFavorites)
        .filter(
          (f) => f.comicPathWord.pathWord.sqlEquals(
            $_itemColumn<String>('path_word')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_comicFavoritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ComicReadingProgressesTable,
    List<ComicReadingProgressesData>
  >
  _comicReadingProgressesRefsTable(
    _$LibraryDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.comicReadingProgresses,
    aliasName:
        'stored_comics__path_word__comic_reading_progresses__comic_path_word',
  );

  $$ComicReadingProgressesTableProcessedTableManager
  get comicReadingProgressesRefs {
    final manager =
        $$ComicReadingProgressesTableTableManager(
          $_db,
          $_db.comicReadingProgresses,
        ).filter(
          (f) => f.comicPathWord.pathWord.sqlEquals(
            $_itemColumn<String>('path_word')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _comicReadingProgressesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ComicChapterReadingProgressesTable,
    List<ComicChapterReadingProgressesData>
  >
  _comicChapterReadingProgressesRefsTable(
    _$LibraryDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.comicChapterReadingProgresses,
    aliasName:
        'stored_comics__path_word__comic_chapter_reading_progresses__comic_path_word',
  );

  $$ComicChapterReadingProgressesTableProcessedTableManager
  get comicChapterReadingProgressesRefs {
    final manager =
        $$ComicChapterReadingProgressesTableTableManager(
          $_db,
          $_db.comicChapterReadingProgresses,
        ).filter(
          (f) => f.comicPathWord.pathWord.sqlEquals(
            $_itemColumn<String>('path_word')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _comicChapterReadingProgressesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ComicGroupReadingProgressesTable,
    List<ComicGroupReadingProgressesData>
  >
  _comicGroupReadingProgressesRefsTable(
    _$LibraryDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.comicGroupReadingProgresses,
    aliasName:
        'stored_comics__path_word__comic_group_reading_progresses__comic_path_word',
  );

  $$ComicGroupReadingProgressesTableProcessedTableManager
  get comicGroupReadingProgressesRefs {
    final manager =
        $$ComicGroupReadingProgressesTableTableManager(
          $_db,
          $_db.comicGroupReadingProgresses,
        ).filter(
          (f) => f.comicPathWord.pathWord.sqlEquals(
            $_itemColumn<String>('path_word')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _comicGroupReadingProgressesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StoredComicsTableFilterComposer
    extends Composer<_$LibraryDatabase, $StoredComicsTable> {
  $$StoredComicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pathWord => $composableBuilder(
    column: $table.pathWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cover => $composableBuilder(
    column: $table.cover,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> comicFavoritesRefs(
    Expression<bool> Function($$ComicFavoritesTableFilterComposer f) f,
  ) {
    final $$ComicFavoritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pathWord,
      referencedTable: $db.comicFavorites,
      getReferencedColumn: (t) => t.comicPathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComicFavoritesTableFilterComposer(
            $db: $db,
            $table: $db.comicFavorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> comicReadingProgressesRefs(
    Expression<bool> Function($$ComicReadingProgressesTableFilterComposer f) f,
  ) {
    final $$ComicReadingProgressesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.pathWord,
          referencedTable: $db.comicReadingProgresses,
          getReferencedColumn: (t) => t.comicPathWord,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ComicReadingProgressesTableFilterComposer(
                $db: $db,
                $table: $db.comicReadingProgresses,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> comicChapterReadingProgressesRefs(
    Expression<bool> Function(
      $$ComicChapterReadingProgressesTableFilterComposer f,
    )
    f,
  ) {
    final $$ComicChapterReadingProgressesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.pathWord,
          referencedTable: $db.comicChapterReadingProgresses,
          getReferencedColumn: (t) => t.comicPathWord,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ComicChapterReadingProgressesTableFilterComposer(
                $db: $db,
                $table: $db.comicChapterReadingProgresses,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> comicGroupReadingProgressesRefs(
    Expression<bool> Function(
      $$ComicGroupReadingProgressesTableFilterComposer f,
    )
    f,
  ) {
    final $$ComicGroupReadingProgressesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.pathWord,
          referencedTable: $db.comicGroupReadingProgresses,
          getReferencedColumn: (t) => t.comicPathWord,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ComicGroupReadingProgressesTableFilterComposer(
                $db: $db,
                $table: $db.comicGroupReadingProgresses,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StoredComicsTableOrderingComposer
    extends Composer<_$LibraryDatabase, $StoredComicsTable> {
  $$StoredComicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pathWord => $composableBuilder(
    column: $table.pathWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cover => $composableBuilder(
    column: $table.cover,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoredComicsTableAnnotationComposer
    extends Composer<_$LibraryDatabase, $StoredComicsTable> {
  $$StoredComicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pathWord =>
      $composableBuilder(column: $table.pathWord, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get cover =>
      $composableBuilder(column: $table.cover, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  Expression<T> comicFavoritesRefs<T extends Object>(
    Expression<T> Function($$ComicFavoritesTableAnnotationComposer a) f,
  ) {
    final $$ComicFavoritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pathWord,
      referencedTable: $db.comicFavorites,
      getReferencedColumn: (t) => t.comicPathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ComicFavoritesTableAnnotationComposer(
            $db: $db,
            $table: $db.comicFavorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> comicReadingProgressesRefs<T extends Object>(
    Expression<T> Function($$ComicReadingProgressesTableAnnotationComposer a) f,
  ) {
    final $$ComicReadingProgressesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.pathWord,
          referencedTable: $db.comicReadingProgresses,
          getReferencedColumn: (t) => t.comicPathWord,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ComicReadingProgressesTableAnnotationComposer(
                $db: $db,
                $table: $db.comicReadingProgresses,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> comicChapterReadingProgressesRefs<T extends Object>(
    Expression<T> Function(
      $$ComicChapterReadingProgressesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ComicChapterReadingProgressesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.pathWord,
          referencedTable: $db.comicChapterReadingProgresses,
          getReferencedColumn: (t) => t.comicPathWord,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ComicChapterReadingProgressesTableAnnotationComposer(
                $db: $db,
                $table: $db.comicChapterReadingProgresses,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> comicGroupReadingProgressesRefs<T extends Object>(
    Expression<T> Function(
      $$ComicGroupReadingProgressesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$ComicGroupReadingProgressesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.pathWord,
          referencedTable: $db.comicGroupReadingProgresses,
          getReferencedColumn: (t) => t.comicPathWord,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ComicGroupReadingProgressesTableAnnotationComposer(
                $db: $db,
                $table: $db.comicGroupReadingProgresses,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StoredComicsTableTableManager
    extends
        RootTableManager<
          _$LibraryDatabase,
          $StoredComicsTable,
          StoredComic,
          $$StoredComicsTableFilterComposer,
          $$StoredComicsTableOrderingComposer,
          $$StoredComicsTableAnnotationComposer,
          $$StoredComicsTableCreateCompanionBuilder,
          $$StoredComicsTableUpdateCompanionBuilder,
          (StoredComic, $$StoredComicsTableReferences),
          StoredComic,
          PrefetchHooks Function({
            bool comicFavoritesRefs,
            bool comicReadingProgressesRefs,
            bool comicChapterReadingProgressesRefs,
            bool comicGroupReadingProgressesRefs,
          })
        > {
  $$StoredComicsTableTableManager(
    _$LibraryDatabase db,
    $StoredComicsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoredComicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoredComicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoredComicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> pathWord = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> cover = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StoredComicsCompanion(
                pathWord: pathWord,
                name: name,
                cover: cover,
                author: author,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String pathWord,
                required String name,
                required String cover,
                required String author,
                Value<int> rowid = const Value.absent(),
              }) => StoredComicsCompanion.insert(
                pathWord: pathWord,
                name: name,
                cover: cover,
                author: author,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StoredComicsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                comicFavoritesRefs = false,
                comicReadingProgressesRefs = false,
                comicChapterReadingProgressesRefs = false,
                comicGroupReadingProgressesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (comicFavoritesRefs) db.comicFavorites,
                    if (comicReadingProgressesRefs) db.comicReadingProgresses,
                    if (comicChapterReadingProgressesRefs)
                      db.comicChapterReadingProgresses,
                    if (comicGroupReadingProgressesRefs)
                      db.comicGroupReadingProgresses,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (comicFavoritesRefs)
                        await $_getPrefetchedData<
                          StoredComic,
                          $StoredComicsTable,
                          ComicFavorite
                        >(
                          currentTable: table,
                          referencedTable: $$StoredComicsTableReferences
                              ._comicFavoritesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StoredComicsTableReferences(
                                db,
                                table,
                                p0,
                              ).comicFavoritesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.comicPathWord == item.pathWord,
                              ),
                          typedResults: items,
                        ),
                      if (comicReadingProgressesRefs)
                        await $_getPrefetchedData<
                          StoredComic,
                          $StoredComicsTable,
                          ComicReadingProgressesData
                        >(
                          currentTable: table,
                          referencedTable: $$StoredComicsTableReferences
                              ._comicReadingProgressesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StoredComicsTableReferences(
                                db,
                                table,
                                p0,
                              ).comicReadingProgressesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.comicPathWord == item.pathWord,
                              ),
                          typedResults: items,
                        ),
                      if (comicChapterReadingProgressesRefs)
                        await $_getPrefetchedData<
                          StoredComic,
                          $StoredComicsTable,
                          ComicChapterReadingProgressesData
                        >(
                          currentTable: table,
                          referencedTable: $$StoredComicsTableReferences
                              ._comicChapterReadingProgressesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StoredComicsTableReferences(
                                db,
                                table,
                                p0,
                              ).comicChapterReadingProgressesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.comicPathWord == item.pathWord,
                              ),
                          typedResults: items,
                        ),
                      if (comicGroupReadingProgressesRefs)
                        await $_getPrefetchedData<
                          StoredComic,
                          $StoredComicsTable,
                          ComicGroupReadingProgressesData
                        >(
                          currentTable: table,
                          referencedTable: $$StoredComicsTableReferences
                              ._comicGroupReadingProgressesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StoredComicsTableReferences(
                                db,
                                table,
                                p0,
                              ).comicGroupReadingProgressesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.comicPathWord == item.pathWord,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StoredComicsTableProcessedTableManager =
    ProcessedTableManager<
      _$LibraryDatabase,
      $StoredComicsTable,
      StoredComic,
      $$StoredComicsTableFilterComposer,
      $$StoredComicsTableOrderingComposer,
      $$StoredComicsTableAnnotationComposer,
      $$StoredComicsTableCreateCompanionBuilder,
      $$StoredComicsTableUpdateCompanionBuilder,
      (StoredComic, $$StoredComicsTableReferences),
      StoredComic,
      PrefetchHooks Function({
        bool comicFavoritesRefs,
        bool comicReadingProgressesRefs,
        bool comicChapterReadingProgressesRefs,
        bool comicGroupReadingProgressesRefs,
      })
    >;
typedef $$ComicFavoritesTableCreateCompanionBuilder =
    ComicFavoritesCompanion Function({
      required String comicPathWord,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ComicFavoritesTableUpdateCompanionBuilder =
    ComicFavoritesCompanion Function({
      Value<String> comicPathWord,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ComicFavoritesTableReferences
    extends
        BaseReferences<_$LibraryDatabase, $ComicFavoritesTable, ComicFavorite> {
  $$ComicFavoritesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StoredComicsTable _comicPathWordTable(_$LibraryDatabase db) =>
      db.storedComics.createAlias(
        'comic_favorites__comic_path_word__stored_comics__path_word',
      );

  $$StoredComicsTableProcessedTableManager get comicPathWord {
    final $_column = $_itemColumn<String>('comic_path_word')!;

    final manager = $$StoredComicsTableTableManager(
      $_db,
      $_db.storedComics,
    ).filter((f) => f.pathWord.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_comicPathWordTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ComicFavoritesTableFilterComposer
    extends Composer<_$LibraryDatabase, $ComicFavoritesTable> {
  $$ComicFavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StoredComicsTableFilterComposer get comicPathWord {
    final $$StoredComicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableFilterComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicFavoritesTableOrderingComposer
    extends Composer<_$LibraryDatabase, $ComicFavoritesTable> {
  $$ComicFavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StoredComicsTableOrderingComposer get comicPathWord {
    final $$StoredComicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableOrderingComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicFavoritesTableAnnotationComposer
    extends Composer<_$LibraryDatabase, $ComicFavoritesTable> {
  $$ComicFavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$StoredComicsTableAnnotationComposer get comicPathWord {
    final $$StoredComicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableAnnotationComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicFavoritesTableTableManager
    extends
        RootTableManager<
          _$LibraryDatabase,
          $ComicFavoritesTable,
          ComicFavorite,
          $$ComicFavoritesTableFilterComposer,
          $$ComicFavoritesTableOrderingComposer,
          $$ComicFavoritesTableAnnotationComposer,
          $$ComicFavoritesTableCreateCompanionBuilder,
          $$ComicFavoritesTableUpdateCompanionBuilder,
          (ComicFavorite, $$ComicFavoritesTableReferences),
          ComicFavorite,
          PrefetchHooks Function({bool comicPathWord})
        > {
  $$ComicFavoritesTableTableManager(
    _$LibraryDatabase db,
    $ComicFavoritesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComicFavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ComicFavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ComicFavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> comicPathWord = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComicFavoritesCompanion(
                comicPathWord: comicPathWord,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String comicPathWord,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ComicFavoritesCompanion.insert(
                comicPathWord: comicPathWord,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ComicFavoritesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({comicPathWord = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (comicPathWord) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.comicPathWord,
                                referencedTable: $$ComicFavoritesTableReferences
                                    ._comicPathWordTable(db),
                                referencedColumn:
                                    $$ComicFavoritesTableReferences
                                        ._comicPathWordTable(db)
                                        .pathWord,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ComicFavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$LibraryDatabase,
      $ComicFavoritesTable,
      ComicFavorite,
      $$ComicFavoritesTableFilterComposer,
      $$ComicFavoritesTableOrderingComposer,
      $$ComicFavoritesTableAnnotationComposer,
      $$ComicFavoritesTableCreateCompanionBuilder,
      $$ComicFavoritesTableUpdateCompanionBuilder,
      (ComicFavorite, $$ComicFavoritesTableReferences),
      ComicFavorite,
      PrefetchHooks Function({bool comicPathWord})
    >;
typedef $$ComicReadingProgressesTableCreateCompanionBuilder =
    ComicReadingProgressesCompanion Function({
      required String comicPathWord,
      required String chapterId,
      required String chapterName,
      required String groupName,
      Value<String> groupPathWord,
      Value<int> pageIndex,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ComicReadingProgressesTableUpdateCompanionBuilder =
    ComicReadingProgressesCompanion Function({
      Value<String> comicPathWord,
      Value<String> chapterId,
      Value<String> chapterName,
      Value<String> groupName,
      Value<String> groupPathWord,
      Value<int> pageIndex,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ComicReadingProgressesTableReferences
    extends
        BaseReferences<
          _$LibraryDatabase,
          $ComicReadingProgressesTable,
          ComicReadingProgressesData
        > {
  $$ComicReadingProgressesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StoredComicsTable _comicPathWordTable(_$LibraryDatabase db) =>
      db.storedComics.createAlias(
        'comic_reading_progresses__comic_path_word__stored_comics__path_word',
      );

  $$StoredComicsTableProcessedTableManager get comicPathWord {
    final $_column = $_itemColumn<String>('comic_path_word')!;

    final manager = $$StoredComicsTableTableManager(
      $_db,
      $_db.storedComics,
    ).filter((f) => f.pathWord.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_comicPathWordTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ComicReadingProgressesTableFilterComposer
    extends Composer<_$LibraryDatabase, $ComicReadingProgressesTable> {
  $$ComicReadingProgressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageIndex => $composableBuilder(
    column: $table.pageIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StoredComicsTableFilterComposer get comicPathWord {
    final $$StoredComicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableFilterComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicReadingProgressesTableOrderingComposer
    extends Composer<_$LibraryDatabase, $ComicReadingProgressesTable> {
  $$ComicReadingProgressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageIndex => $composableBuilder(
    column: $table.pageIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StoredComicsTableOrderingComposer get comicPathWord {
    final $$StoredComicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableOrderingComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicReadingProgressesTableAnnotationComposer
    extends Composer<_$LibraryDatabase, $ComicReadingProgressesTable> {
  $$ComicReadingProgressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageIndex =>
      $composableBuilder(column: $table.pageIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$StoredComicsTableAnnotationComposer get comicPathWord {
    final $$StoredComicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableAnnotationComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicReadingProgressesTableTableManager
    extends
        RootTableManager<
          _$LibraryDatabase,
          $ComicReadingProgressesTable,
          ComicReadingProgressesData,
          $$ComicReadingProgressesTableFilterComposer,
          $$ComicReadingProgressesTableOrderingComposer,
          $$ComicReadingProgressesTableAnnotationComposer,
          $$ComicReadingProgressesTableCreateCompanionBuilder,
          $$ComicReadingProgressesTableUpdateCompanionBuilder,
          (ComicReadingProgressesData, $$ComicReadingProgressesTableReferences),
          ComicReadingProgressesData,
          PrefetchHooks Function({bool comicPathWord})
        > {
  $$ComicReadingProgressesTableTableManager(
    _$LibraryDatabase db,
    $ComicReadingProgressesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComicReadingProgressesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ComicReadingProgressesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ComicReadingProgressesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> comicPathWord = const Value.absent(),
                Value<String> chapterId = const Value.absent(),
                Value<String> chapterName = const Value.absent(),
                Value<String> groupName = const Value.absent(),
                Value<String> groupPathWord = const Value.absent(),
                Value<int> pageIndex = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComicReadingProgressesCompanion(
                comicPathWord: comicPathWord,
                chapterId: chapterId,
                chapterName: chapterName,
                groupName: groupName,
                groupPathWord: groupPathWord,
                pageIndex: pageIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String comicPathWord,
                required String chapterId,
                required String chapterName,
                required String groupName,
                Value<String> groupPathWord = const Value.absent(),
                Value<int> pageIndex = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ComicReadingProgressesCompanion.insert(
                comicPathWord: comicPathWord,
                chapterId: chapterId,
                chapterName: chapterName,
                groupName: groupName,
                groupPathWord: groupPathWord,
                pageIndex: pageIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ComicReadingProgressesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({comicPathWord = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (comicPathWord) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.comicPathWord,
                                referencedTable:
                                    $$ComicReadingProgressesTableReferences
                                        ._comicPathWordTable(db),
                                referencedColumn:
                                    $$ComicReadingProgressesTableReferences
                                        ._comicPathWordTable(db)
                                        .pathWord,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ComicReadingProgressesTableProcessedTableManager =
    ProcessedTableManager<
      _$LibraryDatabase,
      $ComicReadingProgressesTable,
      ComicReadingProgressesData,
      $$ComicReadingProgressesTableFilterComposer,
      $$ComicReadingProgressesTableOrderingComposer,
      $$ComicReadingProgressesTableAnnotationComposer,
      $$ComicReadingProgressesTableCreateCompanionBuilder,
      $$ComicReadingProgressesTableUpdateCompanionBuilder,
      (ComicReadingProgressesData, $$ComicReadingProgressesTableReferences),
      ComicReadingProgressesData,
      PrefetchHooks Function({bool comicPathWord})
    >;
typedef $$ComicChapterReadingProgressesTableCreateCompanionBuilder =
    ComicChapterReadingProgressesCompanion Function({
      required String comicPathWord,
      required String groupPathWord,
      required String groupName,
      required String chapterId,
      required String chapterName,
      Value<int> pageIndex,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ComicChapterReadingProgressesTableUpdateCompanionBuilder =
    ComicChapterReadingProgressesCompanion Function({
      Value<String> comicPathWord,
      Value<String> groupPathWord,
      Value<String> groupName,
      Value<String> chapterId,
      Value<String> chapterName,
      Value<int> pageIndex,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ComicChapterReadingProgressesTableReferences
    extends
        BaseReferences<
          _$LibraryDatabase,
          $ComicChapterReadingProgressesTable,
          ComicChapterReadingProgressesData
        > {
  $$ComicChapterReadingProgressesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StoredComicsTable _comicPathWordTable(
    _$LibraryDatabase db,
  ) => db.storedComics.createAlias(
    'comic_chapter_reading_progresses__comic_path_word__stored_comics__path_word',
  );

  $$StoredComicsTableProcessedTableManager get comicPathWord {
    final $_column = $_itemColumn<String>('comic_path_word')!;

    final manager = $$StoredComicsTableTableManager(
      $_db,
      $_db.storedComics,
    ).filter((f) => f.pathWord.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_comicPathWordTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ComicChapterReadingProgressesTableFilterComposer
    extends Composer<_$LibraryDatabase, $ComicChapterReadingProgressesTable> {
  $$ComicChapterReadingProgressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageIndex => $composableBuilder(
    column: $table.pageIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StoredComicsTableFilterComposer get comicPathWord {
    final $$StoredComicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableFilterComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicChapterReadingProgressesTableOrderingComposer
    extends Composer<_$LibraryDatabase, $ComicChapterReadingProgressesTable> {
  $$ComicChapterReadingProgressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageIndex => $composableBuilder(
    column: $table.pageIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StoredComicsTableOrderingComposer get comicPathWord {
    final $$StoredComicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableOrderingComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicChapterReadingProgressesTableAnnotationComposer
    extends Composer<_$LibraryDatabase, $ComicChapterReadingProgressesTable> {
  $$ComicChapterReadingProgressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => column,
  );

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<String> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageIndex =>
      $composableBuilder(column: $table.pageIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$StoredComicsTableAnnotationComposer get comicPathWord {
    final $$StoredComicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableAnnotationComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicChapterReadingProgressesTableTableManager
    extends
        RootTableManager<
          _$LibraryDatabase,
          $ComicChapterReadingProgressesTable,
          ComicChapterReadingProgressesData,
          $$ComicChapterReadingProgressesTableFilterComposer,
          $$ComicChapterReadingProgressesTableOrderingComposer,
          $$ComicChapterReadingProgressesTableAnnotationComposer,
          $$ComicChapterReadingProgressesTableCreateCompanionBuilder,
          $$ComicChapterReadingProgressesTableUpdateCompanionBuilder,
          (
            ComicChapterReadingProgressesData,
            $$ComicChapterReadingProgressesTableReferences,
          ),
          ComicChapterReadingProgressesData,
          PrefetchHooks Function({bool comicPathWord})
        > {
  $$ComicChapterReadingProgressesTableTableManager(
    _$LibraryDatabase db,
    $ComicChapterReadingProgressesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComicChapterReadingProgressesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ComicChapterReadingProgressesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ComicChapterReadingProgressesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> comicPathWord = const Value.absent(),
                Value<String> groupPathWord = const Value.absent(),
                Value<String> groupName = const Value.absent(),
                Value<String> chapterId = const Value.absent(),
                Value<String> chapterName = const Value.absent(),
                Value<int> pageIndex = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComicChapterReadingProgressesCompanion(
                comicPathWord: comicPathWord,
                groupPathWord: groupPathWord,
                groupName: groupName,
                chapterId: chapterId,
                chapterName: chapterName,
                pageIndex: pageIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String comicPathWord,
                required String groupPathWord,
                required String groupName,
                required String chapterId,
                required String chapterName,
                Value<int> pageIndex = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ComicChapterReadingProgressesCompanion.insert(
                comicPathWord: comicPathWord,
                groupPathWord: groupPathWord,
                groupName: groupName,
                chapterId: chapterId,
                chapterName: chapterName,
                pageIndex: pageIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ComicChapterReadingProgressesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({comicPathWord = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (comicPathWord) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.comicPathWord,
                                referencedTable:
                                    $$ComicChapterReadingProgressesTableReferences
                                        ._comicPathWordTable(db),
                                referencedColumn:
                                    $$ComicChapterReadingProgressesTableReferences
                                        ._comicPathWordTable(db)
                                        .pathWord,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ComicChapterReadingProgressesTableProcessedTableManager =
    ProcessedTableManager<
      _$LibraryDatabase,
      $ComicChapterReadingProgressesTable,
      ComicChapterReadingProgressesData,
      $$ComicChapterReadingProgressesTableFilterComposer,
      $$ComicChapterReadingProgressesTableOrderingComposer,
      $$ComicChapterReadingProgressesTableAnnotationComposer,
      $$ComicChapterReadingProgressesTableCreateCompanionBuilder,
      $$ComicChapterReadingProgressesTableUpdateCompanionBuilder,
      (
        ComicChapterReadingProgressesData,
        $$ComicChapterReadingProgressesTableReferences,
      ),
      ComicChapterReadingProgressesData,
      PrefetchHooks Function({bool comicPathWord})
    >;
typedef $$ComicGroupReadingProgressesTableCreateCompanionBuilder =
    ComicGroupReadingProgressesCompanion Function({
      required String comicPathWord,
      required String groupPathWord,
      required String groupName,
      required String chapterId,
      required String chapterName,
      Value<int> pageIndex,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ComicGroupReadingProgressesTableUpdateCompanionBuilder =
    ComicGroupReadingProgressesCompanion Function({
      Value<String> comicPathWord,
      Value<String> groupPathWord,
      Value<String> groupName,
      Value<String> chapterId,
      Value<String> chapterName,
      Value<int> pageIndex,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ComicGroupReadingProgressesTableReferences
    extends
        BaseReferences<
          _$LibraryDatabase,
          $ComicGroupReadingProgressesTable,
          ComicGroupReadingProgressesData
        > {
  $$ComicGroupReadingProgressesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StoredComicsTable _comicPathWordTable(
    _$LibraryDatabase db,
  ) => db.storedComics.createAlias(
    'comic_group_reading_progresses__comic_path_word__stored_comics__path_word',
  );

  $$StoredComicsTableProcessedTableManager get comicPathWord {
    final $_column = $_itemColumn<String>('comic_path_word')!;

    final manager = $$StoredComicsTableTableManager(
      $_db,
      $_db.storedComics,
    ).filter((f) => f.pathWord.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_comicPathWordTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ComicGroupReadingProgressesTableFilterComposer
    extends Composer<_$LibraryDatabase, $ComicGroupReadingProgressesTable> {
  $$ComicGroupReadingProgressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageIndex => $composableBuilder(
    column: $table.pageIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StoredComicsTableFilterComposer get comicPathWord {
    final $$StoredComicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableFilterComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicGroupReadingProgressesTableOrderingComposer
    extends Composer<_$LibraryDatabase, $ComicGroupReadingProgressesTable> {
  $$ComicGroupReadingProgressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageIndex => $composableBuilder(
    column: $table.pageIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StoredComicsTableOrderingComposer get comicPathWord {
    final $$StoredComicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableOrderingComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicGroupReadingProgressesTableAnnotationComposer
    extends Composer<_$LibraryDatabase, $ComicGroupReadingProgressesTable> {
  $$ComicGroupReadingProgressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupPathWord => $composableBuilder(
    column: $table.groupPathWord,
    builder: (column) => column,
  );

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<String> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageIndex =>
      $composableBuilder(column: $table.pageIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$StoredComicsTableAnnotationComposer get comicPathWord {
    final $$StoredComicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.comicPathWord,
      referencedTable: $db.storedComics,
      getReferencedColumn: (t) => t.pathWord,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredComicsTableAnnotationComposer(
            $db: $db,
            $table: $db.storedComics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ComicGroupReadingProgressesTableTableManager
    extends
        RootTableManager<
          _$LibraryDatabase,
          $ComicGroupReadingProgressesTable,
          ComicGroupReadingProgressesData,
          $$ComicGroupReadingProgressesTableFilterComposer,
          $$ComicGroupReadingProgressesTableOrderingComposer,
          $$ComicGroupReadingProgressesTableAnnotationComposer,
          $$ComicGroupReadingProgressesTableCreateCompanionBuilder,
          $$ComicGroupReadingProgressesTableUpdateCompanionBuilder,
          (
            ComicGroupReadingProgressesData,
            $$ComicGroupReadingProgressesTableReferences,
          ),
          ComicGroupReadingProgressesData,
          PrefetchHooks Function({bool comicPathWord})
        > {
  $$ComicGroupReadingProgressesTableTableManager(
    _$LibraryDatabase db,
    $ComicGroupReadingProgressesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ComicGroupReadingProgressesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ComicGroupReadingProgressesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ComicGroupReadingProgressesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> comicPathWord = const Value.absent(),
                Value<String> groupPathWord = const Value.absent(),
                Value<String> groupName = const Value.absent(),
                Value<String> chapterId = const Value.absent(),
                Value<String> chapterName = const Value.absent(),
                Value<int> pageIndex = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ComicGroupReadingProgressesCompanion(
                comicPathWord: comicPathWord,
                groupPathWord: groupPathWord,
                groupName: groupName,
                chapterId: chapterId,
                chapterName: chapterName,
                pageIndex: pageIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String comicPathWord,
                required String groupPathWord,
                required String groupName,
                required String chapterId,
                required String chapterName,
                Value<int> pageIndex = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ComicGroupReadingProgressesCompanion.insert(
                comicPathWord: comicPathWord,
                groupPathWord: groupPathWord,
                groupName: groupName,
                chapterId: chapterId,
                chapterName: chapterName,
                pageIndex: pageIndex,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ComicGroupReadingProgressesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({comicPathWord = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (comicPathWord) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.comicPathWord,
                                referencedTable:
                                    $$ComicGroupReadingProgressesTableReferences
                                        ._comicPathWordTable(db),
                                referencedColumn:
                                    $$ComicGroupReadingProgressesTableReferences
                                        ._comicPathWordTable(db)
                                        .pathWord,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ComicGroupReadingProgressesTableProcessedTableManager =
    ProcessedTableManager<
      _$LibraryDatabase,
      $ComicGroupReadingProgressesTable,
      ComicGroupReadingProgressesData,
      $$ComicGroupReadingProgressesTableFilterComposer,
      $$ComicGroupReadingProgressesTableOrderingComposer,
      $$ComicGroupReadingProgressesTableAnnotationComposer,
      $$ComicGroupReadingProgressesTableCreateCompanionBuilder,
      $$ComicGroupReadingProgressesTableUpdateCompanionBuilder,
      (
        ComicGroupReadingProgressesData,
        $$ComicGroupReadingProgressesTableReferences,
      ),
      ComicGroupReadingProgressesData,
      PrefetchHooks Function({bool comicPathWord})
    >;

class $LibraryDatabaseManager {
  final _$LibraryDatabase _db;
  $LibraryDatabaseManager(this._db);
  $$StoredComicsTableTableManager get storedComics =>
      $$StoredComicsTableTableManager(_db, _db.storedComics);
  $$ComicFavoritesTableTableManager get comicFavorites =>
      $$ComicFavoritesTableTableManager(_db, _db.comicFavorites);
  $$ComicReadingProgressesTableTableManager get comicReadingProgresses =>
      $$ComicReadingProgressesTableTableManager(
        _db,
        _db.comicReadingProgresses,
      );
  $$ComicChapterReadingProgressesTableTableManager
  get comicChapterReadingProgresses =>
      $$ComicChapterReadingProgressesTableTableManager(
        _db,
        _db.comicChapterReadingProgresses,
      );
  $$ComicGroupReadingProgressesTableTableManager
  get comicGroupReadingProgresses =>
      $$ComicGroupReadingProgressesTableTableManager(
        _db,
        _db.comicGroupReadingProgresses,
      );
}
