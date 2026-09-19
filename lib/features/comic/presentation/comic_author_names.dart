import 'package:comics/copy_manga/copy_manga_dto.dart';

String comicAuthorNames({required List<NamedPathDto> authors}) =>
    authors.map((author) => author.name).join(',');
