# Flutter Foundation Kit

A reusable, project-neutral foundation for building high-quality Flutter applications for Android and iOS.

> **Current status:** Discovery and foundation specification. This repository is not yet a production-ready starter kit. Technical choices remain open until researched, recorded, and accepted.

## Purpose

Build a dependable starting point that removes repetitive setup and establishes consistent engineering, UI, quality, and developer-experience standards without forcing application-specific product decisions.

This is a starter kit, not a framework and not a sample business application.

## Confirmed direction

- **Framework:** Flutter
- **Language:** Dart
- **Platforms:** Android and iOS only
- **UI component foundation:** Forui, used selectively and extended only where a verified gap exists
- **Approach:** Reuse suitable capabilities; customize or extend when justified; build only what is missing
- **Default integrations:** No backend, authentication, analytics, push notifications, AI, monetization, or product-specific business logic by default
- **Code generation:** Not enabled by default; any exception requires a demonstrated benefit and documented maintenance cost

These are scope constraints, not a claim that every implementation choice or package version has already been verified.

## Working principles

1. Research before choosing packages, APIs, architecture, or platform settings.
2. Prefer official Flutter, Dart, Android, Apple, and package-maintainer documentation.
3. Verify package compatibility, maintenance, licensing, security posture, and platform requirements.
4. Keep the foundation small enough to understand and flexible enough to reuse.
5. Centralize genuine shared decisions; avoid abstractions without a concrete use case.
6. Treat accessibility, localization, adaptive layouts, motion, performance, and failure states as product-quality concerns.
7. Close one workstream against explicit acceptance criteria before moving on.
8. Reopen a closed decision only for a verified defect, material new evidence, changed requirements, or upstream breaking change.

## Project documentation

- [Product scope and boundaries](docs/charter/PRODUCT_SCOPE.md)
- [Working agreement and phase closure](docs/operating-model/WORKFLOW.md)
- [System map and workstream order](docs/architecture/SYSTEM_MAP.md)
- [Decision register](docs/decisions/README.md)
- [Decision record template](docs/templates/DECISION_RECORD.md)
- [Phase closure template](docs/templates/PHASE_CLOSURE.md)

## Current work

**Active workstream:** Product scope and product principles.

The scope document is intentionally marked as a draft until its open questions and acceptance criteria are resolved. Do not treat the system map as a commitment to implement every listed capability.

## Repository status

This repository currently contains engineering documentation only. The Flutter application scaffold, package versions, architecture, and platform configuration will be added only after their requirements and decisions are closed.

## License

No license has been selected yet. Public visibility does not, by itself, grant permission to reuse, modify, or redistribute this repository.