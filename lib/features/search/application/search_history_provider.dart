import 'package:comics/features/library/application/comic_library_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchHistoryProvider = StreamProvider<List<String>>((ref) {
  return ref.watch(libraryDatabaseProvider).watchSearchHistory();
});
