# foundation_ui

A first-party Flutter UI foundation package owned by Flutter Foundation Kit.

## Status

Early development. The public API is not stable and this package is not published to pub.dev.

## Add to a Flutter app

Use a path dependency while consuming the package from this repository:

\`\`\`yaml
dependencies:
  foundation_ui:
    path: packages/foundation_ui
\`\`\`

## Configure the theme

\`\`\`dart
MaterialApp(
  theme: FoundationTheme.light(),
  darkTheme: FoundationTheme.dark(),
  themeMode: ThemeMode.system,
)
\`\`\`

Provide an app-specific semantic palette without changing shared components:

\`\`\`dart
MaterialApp(
  theme: FoundationTheme.light(
    colors: const FoundationColors(
      primary: Color(0xFF3157D5),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFE8ECFA),
      onSecondary: Color(0xFF18244A),
      surface: Color(0xFFFFFFFF),
      surfaceSubtle: Color(0xFFF5F6FA),
      onSurface: Color(0xFF171923),
      onSurfaceMuted: Color(0xFF626779),
      outline: Color(0xFFDDE0EA),
      danger: Color(0xFFB42318),
      onDanger: Color(0xFFFFFFFF),
      focus: Color(0xFF3157D5),
    ),
  ),
)
\`\`\`

## Current API

- FoundationSpacing, FoundationRadii, FoundationTypography, FoundationMotion
- FoundationColors and FoundationTheme
- FoundationSurface
- FoundationButton

Components use semantic theme values. Do not add product-specific colors, copy, routes, business rules, or dependencies to this package.

## Verification

From this directory:

\`\`\`powershell
flutter analyze --fatal-infos
flutter test
\`\`\`
