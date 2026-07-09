class CopyMangaException implements Exception {
  const CopyMangaException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => statusCode == null
      ? 'CopyMangaException: $message'
      : 'CopyMangaException($statusCode): $message';
}

class CopyMangaLoginExpiredException extends CopyMangaException {
  const CopyMangaLoginExpiredException() : super('登录状态已过期', statusCode: 401);
}
