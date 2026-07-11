import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:comics/shared/application/shared_preferences_provider.dart';

enum ReaderMode {
  continuous(label: '条漫模式'),
  paged(label: '翻页模式'),
  manga(label: '日漫模式');

  const ReaderMode({required this.label});

  final String label;
}

enum ReaderBackground {
  light(
    label: '浅色',
    hex: '#F5F5F5',
    color: Color(0xFFF5F5F5),
    brightness: Brightness.light,
  ),
  darkGray(
    label: '深灰',
    hex: '#181818',
    color: Color(0xFF181818),
    brightness: Brightness.dark,
  ),
  black(
    label: '纯黑',
    hex: '#000000',
    color: Color(0xFF000000),
    brightness: Brightness.dark,
  );

  const ReaderBackground({
    required this.label,
    required this.hex,
    required this.color,
    required this.brightness,
  });

  final String label;
  final String hex;
  final Color color;
  final Brightness brightness;
}

class ReaderSettings {
  const ReaderSettings({
    this.mode = ReaderMode.paged,
    this.background = ReaderBackground.darkGray,
  });

  final ReaderMode mode;
  final ReaderBackground background;

  ReaderSettings copyWith({ReaderMode? mode, ReaderBackground? background}) {
    return ReaderSettings(
      mode: mode ?? this.mode,
      background: background ?? this.background,
    );
  }
}

final readerSettingsProvider =
    NotifierProvider<ReaderSettingsNotifier, ReaderSettings>(
      ReaderSettingsNotifier.new,
    );

class ReaderSettingsNotifier extends Notifier<ReaderSettings> {
  static const modeKey = 'reader.settings.mode';
  static const backgroundKey = 'reader.settings.background';

  @override
  ReaderSettings build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final modeName = preferences.getString(modeKey);
    final backgroundName = preferences.getString(backgroundKey);
    return ReaderSettings(
      mode: ReaderMode.values.firstWhere(
        (value) => value.name == modeName,
        orElse: () => ReaderMode.paged,
      ),
      background: ReaderBackground.values.firstWhere(
        (value) => value.name == backgroundName,
        orElse: () => ReaderBackground.darkGray,
      ),
    );
  }

  void setMode(ReaderMode value) {
    state = state.copyWith(mode: value);
    unawaited(
      ref.read(sharedPreferencesProvider).setString(modeKey, value.name),
    );
  }

  void setBackground(ReaderBackground value) {
    state = state.copyWith(background: value);
    unawaited(
      ref.read(sharedPreferencesProvider).setString(backgroundKey, value.name),
    );
  }
}
