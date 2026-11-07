# ADR-0008: First-Party Flutter Design System

- **Status:** Accepted
- **Date:** 2026-11-07
- **Decision owner:** Repository owner
- **Related workstreams:** 05 — Flutter SDK UI foundation; 06 — Design system and theming
- **Supersedes:** The UI direction in ADR-0002

## Context

The product requires a reusable visual foundation and component library that belongs to this project, can be branded independently by different apps, and does not inherit the visual identity or release constraints of a third-party UI kit.

The earlier Forui-first choice conflicts with the newer requirement to own the visual language, tokens, components, behavior, accessibility contract, and maintenance lifecycle.

## Decision drivers

- Full ownership of visual design, component APIs, behavior, and upgrade schedule.
- Reuse across Android/iOS Flutter apps without importing a third-party design framework.
- Flutter SDK compatibility and platform-native behavior where users expect it.
- A small, understandable architecture with no speculative package ecosystem.
- Brand customization without editing shared component internals.

## Options considered

### Option A — Keep Forui as the visual foundation

**Benefits**
- Existing component inventory could reduce initial implementation effort.
- Existing theme and component APIs could accelerate early screens.

**Costs and risks**
- Component APIs, release cadence, styling constraints, and transitive dependencies remain external.
- The project must adapt its visual language and upgrade plan to another UI library.
- It does not meet the ownership requirement.

### Option B — Build the project-owned system with Flutter SDK primitives

**Benefits**
- Tokens, theme, components, interaction, and accessibility remain first-party.
- Uses supported Flutter widgets, rendering, focus, semantics, and animation primitives.
- No third-party UI framework is required as a visual or component dependency.
- App branding is configuration, not a fork of shared widgets.

**Costs and risks**
- The project owns component correctness, accessibility, platform adaptation, testing, and maintenance.
- High-complexity controls must be built selectively; rebuilding every platform capability would be wasteful.

## Decision

Choose Option B.

1. Flutter and Dart remain the only required application framework/language.
2. The system lives under `lib/design_system/`, with a single public entry point at `lib/design_system.dart`. Implementation details stay private beneath the design-system source tree.
3. The system owns semantic color roles, typography roles, spacing, radii, sizing, motion policy, theme data, brand configuration, component APIs, states, semantics, and documentation.
4. Components are built on Flutter SDK primitives. Use Material or Cupertino SDK primitives only as deliberate low-level behavior/accessibility/platform tools, wrapped locally where visual tokens or consistent APIs are required. Neither becomes the visual foundation.
5. The default theme is neutral and restrained. A consuming app provides brand configuration; it must not need to edit shared tokens or component internals to change its accent and visual personality.
6. Light and dark themes are separately tuned semantic palettes. Components must not infer semantic meaning from raw palette names.
7. Feature code consumes public design-system APIs and semantic tokens only. It must not introduce arbitrary colors, spacing, radii, typography, or motion values.
8. Reuse is delivered initially through the maintained GitHub template: new app repositories inherit the same first-party source. Do not publish or split into additional packages yet. Reconsider package extraction only when multiple independent app repositories demonstrate a stable shared API and need independently versioned updates.
9. Build components when a real app requirement needs them. Do not create empty placeholder components or an exhaustive catalogue speculatively.
10. No copied Apple/competitor pixels, logos, branded assets, proprietary artwork, or trade dress. HIG informs craft and platform familiarity, not imitation.

## Component acceptance gate

A shared component is reusable only when it has:

- A narrow, documented purpose and consistent public API.
- Explicit applicable states and predictable disabled/loading behavior.
- Semantic labels and correct focus/keyboard behavior where interactive.
- A minimum 48 logical-pixel interactive target unless a documented platform exception applies.
- Light and dark theme coverage.
- LTR and RTL behavior, including directional icon mirroring only when semantically appropriate.
- Dynamic text scaling without clipping or loss of content.
- Reduced-motion behavior for non-essential animation.
- Unit/widget tests for state transitions, interactions, and semantics.
- A focused usage example and dartdoc.
- No dependency on app-specific business logic or third-party UI-kit styling.

## Consequences

### Positive
- The project owns its design language and component contracts.
- New apps can adopt a consistent, brandable foundation without depending on Forui.
- Upstream Flutter improvements remain available without inheriting a third-party visual API.

### Negative / trade-offs
- The project must budget for accessibility, platform adaptation, testing, and maintenance.
- A custom component is not automatically better than a platform SDK control; use platform primitives when they provide required behavior more reliably.
- Template-created repositories are snapshots. They do not receive automatic future updates.

### Follow-up
- Implement the SDK foundation, then semantic tokens/theme, then a small validated component set.
- Keep the system app-neutral and expose it through the public entry point.
- Record API-breaking changes and migration notes.

## Evidence

| Source | What it verifies | Checked |
|---|---|---|
| [Flutter UI overview](https://docs.flutter.dev/ui) | Flutter recommends the widgets layer for custom design systems and design-agnostic packages | 2026-11-07 |
| [Flutter Semantics API](https://api.flutter.dev/flutter/widgets/Semantics-class.html) | SDK semantics primitives for accessible custom controls | 2026-11-07 |
| [Flutter WidgetsApp API](https://api.flutter.dev/flutter/widgets/WidgetsApp-class.html) | Framework-level app foundation independent of MaterialApp/CupertinoApp visual systems | 2026-11-07 |
| [Flutter accessibility design and styling](https://docs.flutter.dev/ui/accessibility/ui-design-and-styling) | Dynamic text, contrast, and touch-target guidance | 2026-11-07 |

## Revisit conditions

Revisit only if measured app requirements demonstrate a capability gap that the Flutter SDK cannot reasonably satisfy, multiple app repositories need independently versioned updates, or a platform change materially alters the technical trade-offs.
