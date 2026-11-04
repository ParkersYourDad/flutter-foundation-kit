# Flutter Foundation Kit

A reusable, project-neutral Flutter application starter for Android and iOS.

**Project status:** Product scope accepted. Platform/toolchain research is next. This repository is not yet a released or ready-to-use application template.

## Purpose

A maintained GitHub template repository containing a runnable Flutter application foundation, engineering conventions, reusable UI foundations, quality checks, and practical documentation. It is not a Flutter framework, package collection, or prebuilt business application.

## Confirmed direction

- Flutter and Dart; Android and iOS only.
- GitHub Template Repository as the delivery model; enable the template flag only after the first release candidate passes release checks.
- Forui-first, selective UI component adoption: use, customize, extend, or build only to close a verified gap.
- Neutral, premium-minimal, low-clutter visual defaults, replaceable through design tokens.
- Arabic and English baseline; device locale by default, with an independent persisted user override.
- System theme by default, with an independent persisted System/Light/Dark override.
- No backend, authentication, remote database, analytics, advertising, push, AI, payments, or business-specific logic by default.
- No package-driven application source generation by default.
- MIT license for original repository material; third-party assets retain their own licenses.

## Initial platform floor

Android API 24 and iOS 15, matching the Flutter 3.47 supported mobile platform floor documented on 2026-11-04. Required plugins may force a higher floor. Store target SDK and build-tool requirements are separate and must be revalidated before releases.

## Workstream status

1. Product scope and principles — **Closed**
2. Platform and toolchain — **Active**
3. Dependency policy and package selection
4. Architecture and project structure
5. App bootstrap and lifecycle
6. UI foundation and Forui integration
7. Design system and theming
8. Navigation and routing
9. State, async behavior, and dependency injection
10. Localization, preferences, and persistence
11. Forms and input
12. Motion and interaction
13. Adaptive UI and accessibility
14. Platform integration
15. Reliability, security, and performance
16. Testing and developer experience

## Documentation

- [Product scope](docs/charter/PRODUCT_SCOPE.md)
- [Working agreement](docs/operating-model/WORKFLOW.md)
- [System map](docs/architecture/SYSTEM_MAP.md)
- [Decision register](docs/decisions/README.md)
- [Phase 00 closure record](docs/workstreams/PHASE_00_CLOSURE.md)

## Template activation

The template flag will be enabled only after the runnable Flutter scaffold, automated checks, documentation, and first-release acceptance checklist are complete. The template feature must not expose an unfinished starter for reuse.

## License

See [LICENSE](LICENSE). Original project material is offered under MIT. Third-party dependencies, fonts, icons, and imported assets retain their own license and attribution obligations.
