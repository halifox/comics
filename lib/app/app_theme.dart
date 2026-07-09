import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

abstract final class CopyColors {
  static const ink = Color(0xFF171719);
  static const secondaryInk = Color(0xFF6E6E73);
  static const canvas = Color(0xFFF4F3F0);
  static const darkCanvas = Color(0xFF09090B);
  static const accent = Color(0xFFFF5A5F);
  static const violet = Color(0xFF8B5CF6);
}

abstract final class CopyAppTheme {
  static ThemeData get light => _theme(Brightness.light);
  static ThemeData get dark => _theme(Brightness.dark);

  static ThemeData _theme(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: dark ? CopyColors.darkCanvas : CopyColors.canvas,
      colorScheme: ColorScheme.fromSeed(
        seedColor: CopyColors.accent,
        brightness: brightness,
        surface: dark ? const Color(0xFF1C1C1E) : Colors.white,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 34,
          height: 1.08,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.2,
        ),
        headlineSmall: TextStyle(
          fontSize: 22,
          height: 1.15,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.45,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          height: 1.2,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          height: 1.35,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          height: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: CopyColors.accent,
        scaffoldBackgroundColor: dark
            ? CopyColors.darkCanvas
            : CopyColors.canvas,
      ),
    );
  }
}

abstract final class CopyGlassTheme {
  static final data = GlassThemeData(
    light: const GlassThemeVariant(
      settings: GlassThemeSettings(
        blur: 10,
        thickness: 24,
        glassColor: Color(0x28FFFFFF),
        refractiveIndex: 1.48,
        lightIntensity: 1.1,
      ),
      quality: GlassQuality.standard,
    ),
    dark: const GlassThemeVariant(
      settings: GlassThemeSettings(
        blur: 12,
        thickness: 30,
        glassColor: Color(0x2E0A0A0C),
        refractiveIndex: 1.52,
        lightIntensity: 0.9,
      ),
      quality: GlassQuality.standard,
    ),
  );
}
