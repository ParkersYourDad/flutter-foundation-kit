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

Provide an app-specific semantic palette without changing shared components.

## Current API

- Tokens: FoundationSpacing, FoundationRadii, FoundationTypography, FoundationMotion
- Theme: FoundationColors, FoundationTheme
- Components: FoundationSurface, FoundationButton, FoundationTextField

FoundationTextField uses Flutter's TextFormField for keyboard, focus, autofill, and form integration while applying the package's own semantic visual treatment. The package does not own or dispose caller-supplied controllers or focus nodes.

Components use semantic theme values. Do not add product-specific colors, copy, routes, business rules, or dependencies to this package.

## Verification

From this directory:

\`\`\`powershell
flutter analyze --fatal-infos
flutter test
\`\`\`
