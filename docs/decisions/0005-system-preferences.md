# ADR-0005: System Defaults for Locale and Theme

- **Status:** Accepted
- **Date:** 2026-11-04
- **Workstream:** Product scope and principles

## Context

The app should behave naturally on first launch without forcing preference decisions, while still allowing explicit user control.

## Decision

### Locale
- Follow device locale by default.
- Include Arabic and English in the baseline.
- Settings allow System, Arabic, or English.
- System restores device-driven locale behavior.
- Persist the locale override independently from theme.
- Effective locale determines text/layout direction where appropriate; locale-sensitive values use locale-aware formatting.

### Theme
- Follow operating-system appearance by default.
- Settings allow System, Light, or Dark.
- System restores device-driven appearance.
- Persist the theme override independently from locale.

Do not force language or theme selection during onboarding. The exact persistence package, state-management implementation, and localization mechanism are decided in later workstreams.

## Consequences

Resetting one preference to System must not reset the other. Tests must cover device-following behavior, explicit overrides, persistence, reset, and Arabic/English direction.

## Revisit

Only for material product-scope or platform changes, or verified implementation evidence that the policy cannot be met reliably.
