# System Map

**Status:** Planning map — not an implementation commitment.

This map keeps the full problem space visible while preserving one-workstream-at-a-time delivery. A capability is included in the shipped core only after its requirement and cost are justified.

## Workstream order

| Order | Workstream | Main questions / outputs | Status |
|---:|---|---|---|
| 00 | Product scope and principles | Product definition, platform boundary, core vs optional, quality expectations | **Active** |
| 01 | Platform and toolchain | Flutter/Dart channel and constraints, Android/iOS minimums, Xcode, JDK, Gradle, build modes | Not started |
| 02 | Dependency policy and package selection | Package inventory, version compatibility, license, maintenance, security, upgrade policy | Not started |
| 03 | Architecture and project structure | Feature boundaries, layers, dependency direction, shared code, naming and file conventions | Not started |
| 04 | App bootstrap and lifecycle | Startup, app composition, lifecycle, configuration, error boundaries | Not started |
| 05 | UI foundation and Forui integration | Widget inventory, adoption/customization/extension/build rules, Material/Cupertino boundaries | Not started |
| 06 | Design system and theming | Tokens, typography, semantic colors, theme modes, component styling, branding flexibility | Not started |
| 07 | Navigation and routing | Route model, nested navigation, back behavior, deep links, modal navigation | Not started |
| 08 | State, async behavior, and DI | Local vs shared state, async flows, provider lifecycle, dependency ownership | Not started |
| 09 | Localization, preferences, and persistence | Locale, RTL/LTR, user overrides, storage boundaries, migrations | Not started |
| 10 | Forms and input | Validation, focus, keyboard, formatting, submission and error feedback | Not started |
| 11 | Motion and interaction | Motion principles, transitions, gestures, haptics, reduced motion | Not started |
| 12 | Adaptive UI and accessibility | Safe areas, text scaling, semantics, touch targets, screen sizes, assistive technologies | Not started |
| 13 | Platform integration | Permissions, system UI, share, clipboard, platform channels, lifecycle constraints | Not started |
| 14 | Reliability, security, and performance | Error model, logging, privacy, dependency risk, rendering, resource management | Not started |
| 15 | Testing and developer experience | Test strategy, analyzer/lints, scripts, CI, documentation, upgrade and release workflow | Not started |

## Cross-cutting requirements

These are considered throughout the relevant workstreams rather than implemented as isolated afterthoughts:

- Accessibility.
- Localization and bidirectional text.
- Performance and resource lifecycle.
- Privacy and security.
- Failure and recovery behavior.
- Documentation and upgradeability.
- Android/iOS parity and platform-specific differences.

## How to use this map

1. Work in the listed dependency order unless a documented dependency requires a change.
2. Do not implement future workstreams early merely because a package or idea is available.
3. Update status only when evidence supports the change.
4. Record scope changes and reorderings in the decision log.
5. Remove a candidate capability if its value does not justify its complexity.

The system map is a navigation aid, not a promise to ship every possible feature.