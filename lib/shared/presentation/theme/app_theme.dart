import 'package:flutter/cupertino.dart';

abstract final class AppTheme {
  static CupertinoThemeData system() {
    return const CupertinoThemeData(
      primaryColor: Color(0xFFFF5A5F),
      scaffoldBackgroundColor: CupertinoColors.systemBackground,
      barBackgroundColor: CupertinoColors.systemBackground,
    );
  }
}
