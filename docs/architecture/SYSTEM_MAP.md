# System Map

**Status:** Active delivery plan  
**Current workstream:** 01 — Platform and toolchain

Each workstream defines its boundaries, decisions, implementation, verification, and closure evidence. A capability ships in core only when its requirement and maintenance cost are justified.

| Order | Workstream | Main outputs | Status |
|---:|---|---|---|
| 00 | Product scope and principles | Product definition, platform floor, delivery, core/optional boundary, quality and maintenance policy | **Closed** |
| 01 | Platform and toolchain | Flutter/Dart, Android Gradle/SDK/JDK matrix, Xcode/iOS SDK, SwiftPM, CI host policy | **Active — local check pending** |
| 02 | Dependency policy and package selection | Package inventory, versions, compatibility, license, maintenance, security, upgrade policy | Not started |
| 03 | Architecture and project structure | Feature boundaries, layers, dependency direction, shared code, naming and file conventions | Not started |
| 04 | App bootstrap and lifecycle | Startup, app composition, lifecycle, configuration, error boundaries | Not started |
| 05 | UI foundation and Forui integration | Widget inventory, adoption/customization/extension/build rules, Material/Cupertino boundaries | Not started |
| 06 | Design system and theming | Tokens, typography, semantic colors, theme modes, component styling, branding flexibility | Not started |
| 07 | Navigation and routing | Route model, nested navigation, back behavior, deep links, modal navigation | Not started |
| 08 | State, async behavior, and dependency injection | Local/shared state, async flows, provider lifecycle, dependency ownership | Not started |
| 09 | Localization, preferences, and persistence | Locale, RTL/LTR, user overrides, storage boundaries, migrations | Not started |
| 10 | Forms and input | Validation, focus, keyboard, formatting, submission and error feedback | Not started |
| 11 | Motion and interaction | Motion principles, transitions, gestures, haptics, reduced motion | Not started |
| 12 | Adaptive UI and accessibility | Safe areas, text scaling, semantics, touch targets, screen sizes, assistive technologies | Not started |
| 13 | Platform integration | Permissions, system UI, share, clipboard, platform channels, lifecycle constraints | Not started |
| 14 | Reliability, security, and performance | Error model, logging, privacy, dependency risk, rendering, resource management | Not started |
| 15 | Testing and developer experience | Test strategy, analyzer/lints, scripts, CI, documentation, upgrade and release workflow | Not started |

## Cross-cutting requirements

Accessibility, localization/bidirectional text, performance/resource lifecycle, privacy/security, failure/recovery states, documentation/upgradeability, Android/iOS parity, and evidence provenance must be considered in every relevant workstream.

## Rules

1. Follow the dependency order unless an accepted decision justifies a documented change.
2. Do not implement future workstreams early just because a package or idea is available.
3. Update status only when evidence supports the change.
4. Record scope changes and reordering in the decision register.
5. Remove capabilities whose value does not justify their complexity.

This map is a navigation aid, not a promise to ship every possible feature.
