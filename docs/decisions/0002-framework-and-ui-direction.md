# ADR-0002: Flutter, Dart, and UI Component Direction

- **Status:** Accepted
- **Date:** 2026-11-04
- **Decision owners:** Repository owner

## Context

The kit needs a reusable mobile application foundation and should avoid rebuilding established UI primitives without a demonstrated need.

## Decision

- Use **Flutter** as the application framework and **Dart** as the implementation language.
- Use **Forui as the primary UI component foundation**, with a selective adoption strategy:
  1. use a component when it already satisfies the requirement;
  2. customize it through supported extension points when needed;
  3. extend it when the existing component is close but incomplete;
  4. build a new component only when a verified gap remains.

Forui is a strategic direction, not blanket approval of every widget, API, version, transitive dependency, or native behavior.

## Consequences

- The Forui inventory and compatibility review must happen before components are standardized.
- Material and Cupertino capabilities may be used where they are the correct platform or technical primitive; their use must be deliberate and visually consistent.
- The kit must avoid wrapping every third-party widget in redundant abstractions.
- Package version, license, maintenance, Flutter/Dart constraints, Android/iOS support, and migration risk remain subject to evidence-based review.

## Revisit conditions

Reconsider if Forui becomes incompatible, unmaintained, unsuitable for a required capability, or imposes unacceptable upgrade or accessibility costs. Evaluate alternatives with the same evidence standard.