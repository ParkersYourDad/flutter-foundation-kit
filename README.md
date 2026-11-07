# Flutter Foundation Kit

A reusable, project-neutral Flutter application starter for Android and iOS, with a repository-owned design system and component library.

**Project status:** Active construction. The Flutter scaffold exists; the first-party UI package is being established. This is not a released template or published package.

## Purpose

A maintained GitHub template repository containing a runnable Flutter application foundation, first-party UI foundations, engineering conventions, quality checks, and practical documentation. It is not a Flutter framework or a prebuilt business application.

## Confirmed direction

- Flutter 3.47.9 stable / bundled Dart 3.13.7 baseline.
- Android and iOS only.
- Flutter SDK primitives as implementation foundations; no third-party UI framework as the visual foundation.
- First-party design system and component library in \`packages/foundation_ui\`.
- App-specific brand identity is supplied through semantic theme inputs; shared components must not hardcode one app's brand.
- Arabic and English baseline; device locale by default, with independent persisted user override.
- System theme by default, with independent persisted System/Light/Dark override.
- No backend, authentication, remote database, analytics, advertising, push, AI, payments, or business-specific logic by default.
- No package-driven Dart source generation by default; official Flutter gen-l10n from ARB is allowed when localization is implemented.
- MIT license for original repository material; third-party assets retain their own licenses.

## First-party UI package

The initial package is a local path dependency and is not yet published.

- Tokens: spacing, radii, typography, motion.
- Theme: semantic light/dark colors, overridable per app.
- Components currently started: \`FoundationSurface\`, \`FoundationButton\`.
- Tests: interaction callback, disabled behavior, loading semantics, and starter showcase smoke test.

The package API is intentionally small until real app use demonstrates which additional components are needed.

## Current workstream

**First-party Design System foundation.**

See:
- [ADR-0008 — First-party Design System](docs/decisions/0008-first-party-design-system.md)
- [System Map](docs/architecture/SYSTEM_MAP.md)
- [Working agreement](docs/operating-model/WORKFLOW.md)
- [Toolchain baseline](docs/platform/TOOLCHAIN_BASELINE.md)
- [Decision register](docs/decisions/README.md)

## Local verification

From the repository root:

\`\`\`powershell
flutter pub get
flutter analyze --fatal-infos
flutter test
cd packages/foundation_ui
flutter test
\`\`\`

The repository CI runs Android and iOS checks on their respective hosted runners. A green workflow is required before marking a change verified.

## Template activation

The template flag will be enabled only after the runnable Flutter scaffold, first-party package, automated checks, documentation, and first-release acceptance checklist are complete.

## License

See [LICENSE](LICENSE). Original project material is offered under MIT. Third-party dependencies, fonts, icons, and imported assets retain their own license and attribution obligations.
