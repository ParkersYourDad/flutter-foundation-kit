# ADR-0002: Flutter, Dart, and UI Component Direction

- **Status:** Superseded by ADR-0008
- **Date:** 2026-11-04
- **Decision owners:** Repository owner

## Context

The kit needs a reusable mobile application foundation and should avoid rebuilding established UI primitives without a demonstrated need.

## Historical decision (superseded)

- Flutter is the application framework and Dart is the implementation language.
- The original Forui-first direction is no longer active. ADR-0008 supersedes the UI foundation decision and establishes a first-party Flutter SDK-based design system.

## Consequences

- The Forui inventory and compatibility review must happen before components are standardized.
- Material and Cupertino capabilities may be used where they are the correct platform or technical primitive; their use must be deliberate and visually consistent.
- The kit must avoid wrapping every third-party widget in redundant abstractions.
- Package version, license, maintenance, Flutter/Dart constraints, Android/iOS support, and migration risk remain subject to evidence-based review.

## Supersession

This decision was superseded on 2026-11-07 by [ADR-0008](0008-first-party-design-system.md) after the product owner chose a project-owned component system. Do not add Forui to the baseline or new implementation.