# ADR-0002: Flutter SDK and First-Party UI Direction

- **Status:** Superseded
- **Date:** 2026-11-07
- **Decision owners:** Repository owner

## Context

The kit must provide a reusable visual and interaction foundation owned by this repository. A third-party UI framework would make its component API, design constraints, upgrade path, and visual direction externally dependent.

## Historical decision

The original decision selected Forui as the primary component foundation. That direction is no longer active.

## Superseding decision

See [ADR-0008: First-Party Design System](0008-first-party-design-system.md).

## Consequences

- Forui is not part of the approved dependency baseline.
- Flutter SDK primitives remain available as implementation tools; using a low-level SDK primitive does not make Material or Cupertino the visual design system.
- The repository-owned component API and design tokens are the stable public surface.
