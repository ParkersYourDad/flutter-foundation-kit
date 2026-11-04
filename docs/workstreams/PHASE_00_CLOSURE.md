# Phase 00 — Product Scope and Principles

- **Status:** Closed
- **Started:** 2026-11-04
- **Closed:** 2026-11-04
- **GitHub issue:** [#1 — Close product scope and product principles](https://github.com/ParkersYourDad/flutter-foundation-kit/issues/1)

## Goal

Define the reusable product, supported platforms, distribution model, default capabilities, and quality/maintenance expectations before implementation.

## Accepted outputs

- Project: project-neutral, runnable Flutter application starter.
- Delivery: GitHub Template Repository, enabled only after first release candidate passes its release checklist.
- Framework/language: Flutter and Dart.
- Platforms: Android and iOS only.
- Initial OS floor: Android API 24 and iOS 15.
- UI: selective Forui-first component strategy.
- Locale: Arabic/English baseline, system default, independent persisted override.
- Theme: system default, independent persisted System/Light/Dark override.
- Visual direction: neutral, premium-minimal, replaceable token system.
- Default integrations: no backend/auth/analytics/push/AI/payment/business-specific services.
- Code generation: no package-driven app source generation by default.
- Testing, CI, accessibility, security, and privacy baselines documented in the product charter.
- Maintenance: SemVer-tagged template releases, changelog/migration guidance, no automatic propagation to generated repositories.
- License: MIT for original repository material.

## Accepted decisions

| ADR | Decision |
|---|---|
| ADR-0001 | Android and iOS only |
| ADR-0002 | Flutter/Dart with selective Forui-first UI direction |
| ADR-0003 | GitHub Template Repository delivery |
| ADR-0004 | Android API 24 and iOS 15 initial floors |
| ADR-0005 | System locale/theme defaults with independent overrides |
| ADR-0006 | MIT for original repository material |

## Deferred/rejected options

- Packages for every shared capability: deferred until stable, independently useful boundaries exist.
- Custom project-generation CLI: not justified for the initial delivery.
- Backend, authentication, remote DB, analytics, push, AI, payments, ads, and product-specific integrations: optional only.
- Exact SDK versions, packages, routing/state/DI, architecture, fonts, and detailed component inventory: assigned to later workstreams.

## Evidence reviewed

- [Flutter supported deployment platforms](https://docs.flutter.dev/reference/supported-platforms) — Android API 24 and iOS 15 floor for Flutter 3.47.
- [Google Play target API requirements](https://support.google.com/googleplay/android-developer/answer/11926878) — target API 36 for new apps/updates from 2026-08-31.
- [Apple upcoming requirements](https://developer.apple.com/news/upcoming-requirements/) — Xcode 26/iOS 26 SDK upload requirement and iOS 13 minimum submission threshold.
- [GitHub template repository docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository) and [create from template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) — template behavior and generated histories.

Sources checked 2026-11-04. Revalidate version-sensitive facts in implementation and before each stable release.

## Acceptance checklist

- [x] Product definition and intended user are unambiguous.
- [x] Platforms and OS floors are evidence-based.
- [x] Delivery model and generated-repository behavior are defined.
- [x] Core versus optional scope is explicit.
- [x] Visual direction and brand replaceability are defined.
- [x] Localization, RTL/LTR, and independent theme/locale preferences are defined.
- [x] Accessibility/adaptive expectations are defined.
- [x] Quality, testing, CI, security, and privacy expectations are defined.
- [x] Dependency and code-generation policies are defined.
- [x] Maintenance, versioning, and upgrade expectations are defined.
- [x] License is selected and included.
- [x] Technical implementation decisions are deferred to named workstreams.
- [x] README, system map, decision register, and issue tracker are synchronized.

## Closure statement

Product boundaries are sufficiently defined to start platform/toolchain research. No Flutter application code or dependency version was selected in this phase; those decisions remain in their dedicated workstreams.

Phase 00 is closed. Reopen only under the conditions in [WORKFLOW.md](../operating-model/WORKFLOW.md).
