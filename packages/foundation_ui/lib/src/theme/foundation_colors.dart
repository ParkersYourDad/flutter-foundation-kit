import 'package:flutter/material.dart';

@immutable
class FoundationColors extends ThemeExtension<FoundationColors> {
  const FoundationColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.surfaceSubtle,
    required this.onSurface,
    required this.onSurfaceMuted,
    required this.outline,
    required this.danger,
    required this.onDanger,
    required this.focus,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surface;
  final Color surfaceSubtle;
  final Color onSurface;
  final Color onSurfaceMuted;
  final Color outline;
  final Color danger;
  final Color onDanger;
  final Color focus;

  static const light = FoundationColors(
    primary: Color(0xFF242424),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFECEBE8),
    onSecondary: Color(0xFF242424),
    surface: Color(0xFFFFFFFF),
    surfaceSubtle: Color(0xFFF6F5F2),
    onSurface: Color(0xFF20201E),
    onSurfaceMuted: Color(0xFF686762),
    outline: Color(0xFFE1E0DB),
    danger: Color(0xFFB42318),
    onDanger: Color(0xFFFFFFFF),
    focus: Color(0xFF356AE6),
  );

  static const dark = FoundationColors(
    primary: Color(0xFFF2F1ED),
    onPrimary: Color(0xFF20201E),
    secondary: Color(0xFF343430),
    onSecondary: Color(0xFFF2F1ED),
    surface: Color(0xFF191917),
    surfaceSubtle: Color(0xFF242421),
    onSurface: Color(0xFFF2F1ED),
    onSurfaceMuted: Color(0xFFB2B0A8),
    outline: Color(0xFF41413C),
    danger: Color(0xFFFF6B61),
    onDanger: Color(0xFF25100E),
    focus: Color(0xFF8EAEFF),
  );

  @override
  FoundationColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? surfaceSubtle,
    Color? onSurface,
    Color? onSurfaceMuted,
    Color? outline,
    Color? danger,
    Color? onDanger,
    Color? focus,
  }) {
    return FoundationColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      surfaceSubtle: surfaceSubtle ?? this.surfaceSubtle,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceMuted: onSurfaceMuted ?? this.onSurfaceMuted,
      outline: outline ?? this.outline,
      danger: danger ?? this.danger,
      onDanger: onDanger ?? this.onDanger,
      focus: focus ?? this.focus,
    );
  }

  @override
  FoundationColors lerp(ThemeExtension<FoundationColors>? other, double t) {
    if (other is! FoundationColors) return this;
    return FoundationColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSubtle: Color.lerp(surfaceSubtle, other.surfaceSubtle, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceMuted: Color.lerp(onSurfaceMuted, other.onSurfaceMuted, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      onDanger: Color.lerp(onDanger, other.onDanger, t)!,
      focus: Color.lerp(focus, other.focus, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FoundationColors &&
        primary == other.primary &&
        onPrimary == other.onPrimary &&
        secondary == other.secondary &&
        onSecondary == other.onSecondary &&
        surface == other.surface &&
        surfaceSubtle == other.surfaceSubtle &&
        onSurface == other.onSurface &&
        onSurfaceMuted == other.onSurfaceMuted &&
        outline == other.outline &&
        danger == other.danger &&
        onDanger == other.onDanger &&
        focus == other.focus;
  }

  @override
  int get hashCode => Object.hash(
        primary,
        onPrimary,
        secondary,
        onSecondary,
        surface,
        surfaceSubtle,
        onSurface,
        onSurfaceMuted,
        outline,
        danger,
        onDanger,
        focus,
      );
}
