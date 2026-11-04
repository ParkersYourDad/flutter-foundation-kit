# ADR-0001: Mobile Platform Scope

- **Status:** Accepted
- **Date:** 2026-11-04
- **Decision owners:** Repository owner

## Context

The kit is intended to be a reusable foundation for mobile applications built with Flutter. Supporting additional platforms would introduce platform-specific requirements, verification, and maintenance obligations that are not part of the current product goal.

## Decision

The supported application platforms are **Android and iOS only**.

Web, Windows, macOS, and Linux are outside the supported scope of the starter kit.

## Consequences

- Toolchain, platform configuration, testing, and release guidance will focus on Android and iOS.
- Flutter capabilities that are only useful for excluded platforms will not be added by default.
- Shared Dart code should avoid unnecessary platform assumptions, but this does not create a promise of desktop or web support.
- Minimum Android and iOS versions remain open and will be selected in the platform/toolchain workstream.

## Revisit conditions

Reconsider only if the product requirements materially change or if a dependency makes this boundary impractical. Record the support and maintenance impact before changing scope.