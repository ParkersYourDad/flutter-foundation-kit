import 'package:flutter/material.dart';

import '../tokens/foundation_typography.dart';
import 'foundation_colors.dart';

abstract final class FoundationTheme {
  static ThemeData light({
    FoundationColors colors = FoundationColors.light,
    TextTheme? textTheme,
  }) =>
      _build(Brightness.light, colors, textTheme);

  static ThemeData dark({
    FoundationColors colors = FoundationColors.dark,
    TextTheme? textTheme,
  }) =>
      _build(Brightness.dark, colors, textTheme);

  static ThemeData _build(
    Brightness brightness,
    FoundationColors colors,
    TextTheme? textTheme,
  ) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      error: colors.danger,
      onError: colors.onDanger,
      surface: colors.surface,
      onSurface: colors.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.surface,
      extensions: <ThemeExtension<dynamic>>[colors],
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      textTheme: textTheme ?? _textTheme(colors),
      dividerColor: colors.outline,
    );
  }

  static TextTheme _textTheme(FoundationColors colors) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: FoundationTypography.display,
        height: 1.15,
        fontWeight: FoundationTypography.bold,
        color: colors.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: FoundationTypography.headline,
        height: 1.2,
        fontWeight: FoundationTypography.semibold,
        color: colors.onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: FoundationTypography.title,
        height: 1.3,
        fontWeight: FoundationTypography.semibold,
        color: colors.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: FoundationTypography.body,
        height: 1.5,
        fontWeight: FoundationTypography.regular,
        color: colors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: FoundationTypography.bodySmall,
        height: 1.45,
        fontWeight: FoundationTypography.regular,
        color: colors.onSurfaceMuted,
      ),
      labelLarge: TextStyle(
        fontSize: FoundationTypography.body,
        height: 1.2,
        fontWeight: FoundationTypography.semibold,
        color: colors.onSurface,
      ),
    );
  }
}
