# ADR-0008: First-Party Design System and Component Library

- **Status:** Accepted
- **Date:** 2026-11-07
- **Decision owners:** Repository owner

## Context

The Foundation Kit must be reusable across multiple Android and iOS Flutter applications without imposing one product's brand, visual identity, or business rules on every adopting app.

## Decision

1. Own the design tokens, semantic theme model, component APIs, interaction states, and component tests in this repository.
2. Implement components using Flutter SDK foundations. Material and Cupertino SDK widgets may be used intentionally as low-level interoperability or platform primitives, but neither is the visual design system.
3. Keep reusable UI in the standalone local package \`packages/foundation_ui\`, consumed by the starter app through a path dependency.
4. Keep brand-specific decisions outside the shared package. Apps may provide their own semantic color palettes, typography configuration, and theme composition without editing shared component source.
5. Do not add dependencies or code generation for the design system unless a demonstrated requirement and maintenance case justify them.
6. Prefer composable, accessible primitives over a large catalog of narrowly specialized widgets.
7. Every interactive component must define enabled, disabled, focused, pressed, loading, and error behavior where applicable, plus semantics and keyboard behavior.
8. Motion must respect platform reduced-motion settings. Decorative motion is never required to understand or complete an action.

## Initial implementation boundary

The first implementation slice establishes:
- foundational spacing, radius, typography, and motion tokens;
- semantic light/dark colors through a theme extension;
- a first-party surface primitive;
- a first-party button with variants, sizes, disabled and loading states;
- a showcase screen and widget tests.

This is a starting API, not a claim that the component library is complete or release-ready.

## Reuse and release policy

- The package remains local to the template repository initially.
- It is not published to pub.dev until its public API, documentation, compatibility policy, tests, and license review are ready.
- Consumers should be able to rebrand through theme inputs rather than fork or edit component internals.
