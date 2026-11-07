# System Map

**Status:** Active delivery plan  
**Current workstream:** 06 — First-party design system foundation

Each workstream defines its boundaries, decisions, implementation, verification, and closure evidence. A capability ships in core only when its requirement and maintenance cost are justified.

| Order | Workstream | Main outputs | Status |
|---:|---|---|---|
| 00 | Product scope and principles | Product definition, platform floor, delivery, core/optional boundary, quality and maintenance policy | **Closed** |
| 01 | Platform and toolchain | Flutter/Dart, Android Gradle/SDK/JDK matrix, Xcode/iOS SDK, SwiftPM, CI host policy | **Scaffold generated; CI verification required** |
| 02 | Dependency policy and package selection | Package inventory, versions, compatibility, license, maintenance, security, upgrade policy | Pending |
| 03 | Architecture and project structure | Feature boundaries, layers, dependency direction, shared code, naming and file conventions | Pending |
| 04 | App bootstrap and lifecycle | Startup, app composition, lifecycle, configuration, error boundaries | Pending |
| 05 | UI foundation | Flutter SDK boundaries, component ownership, accessibility and platform interoperability | **First-party direction accepted** |
| 06 | Design system | Tokens, semantic colors, typography, theme composition, brand customization | **Initial implementation in progress** |
| 07 | Component library | Buttons, surfaces, fields, selection, feedback, navigation and overlays | **Button and surface primitives started** |
| 08 | Navigation and routing | Route model, nested navigation, back behavior, deep links, modal navigation | Pending |
| 09 | State and async behavior | Local/shared state, async flows, provider lifecycle, dependency ownership | Pending |
| 10 | Localization and persistence | Locale, RTL/LTR, user overrides, storage boundaries, migrations | Pending |
| 11 | Forms and input | Validation, focus, keyboard, formatting, submission and error feedback | Pending |
| 12 | Motion and interaction | Motion principles, transitions, gestures, haptics, reduced motion | Pending |
| 13 | Adaptive UI and accessibility | Safe areas, text scaling, semantics, touch targets, screen sizes, assistive technologies | Cross-cutting |
| 14 | Reliability, security, and performance | Error model, logging, privacy, dependency risk, rendering, resource management | Pending |
| 15 | Testing and developer experience | Test strategy, analyzer/lints, scripts, CI, documentation, upgrade and release workflow | Pending |

## Cross-cutting requirements

Accessibility, localization/bidirectional text, performance/resource lifecycle, privacy/security, failure/recovery states, documentation/upgradeability, Android/iOS parity, and evidence provenance must be considered in every relevant workstream.

## Rules

1. Follow the dependency order unless an accepted decision justifies a documented change.
2. Do not implement future workstreams early just because a package or idea is available.
3. Update status only when evidence supports the change.
4. Record scope changes and reordering in the decision register.
5. Remove capabilities whose value does not justify their complexity.

This map is a navigation aid, not a promise to ship every possible feature.
