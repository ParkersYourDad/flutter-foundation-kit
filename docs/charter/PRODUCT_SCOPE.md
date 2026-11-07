# Product Scope and Product Principles

**Status:** Accepted  
**Accepted:** 2026-11-04  
**Decision authority:** Repository owner

## 1. Product definition

Flutter Foundation Kit is a reusable, project-neutral starting point for maintainable Flutter applications on Android and iOS.

The deliverable is a **GitHub Template Repository** containing a complete, runnable Flutter application foundation, engineering conventions, selected UI foundations, automated quality checks, documentation, and scoped optional recipes.

It is not a general-purpose Flutter framework, published package ecosystem, complete business application, backend/service platform, package collection assembled for quantity, or rigid architecture imposed on every app.

## 2. Intended user and outcomes

The primary user is a developer or small product team starting a Flutter mobile app who wants a dependable, understandable baseline instead of repeating common setup.

The kit should make it easier to:
- generate a new app repository from the template;
- start from a runnable foundation with coherent engineering and UI conventions;
- reuse foundations without inheriting application-specific business logic;
- add integrations only when the product needs them;
- understand why each dependency and abstraction exists;
- upgrade deliberately through documented releases and migration notes.

Generated repositories are independent application snapshots; they do not automatically receive future template changes.

## 3. Supported platforms and minimum OS

Supported application platforms:
- Android phones and compatible Android mobile devices.
- iPhone and compatible iOS devices.

Web, Windows, macOS, and Linux are outside the supported application scope.

Initial minimum device OS:
| Platform | Minimum | Basis |
|---|---:|---|
| Android | API 24 / Android 7.0 | Flutter 3.47 supported floor on 2026-11-04 |
| iOS | iOS 15 | Flutter 3.47 supported floor on 2026-11-04 |

These are minimum device OS versions, not compile SDK or store target API versions. A required dependency may raise the floor; it must not be lowered below the selected Flutter release's supported range. Revalidate against the exact Flutter stable version and required native dependencies before the first release.

### Separate build and store requirements

- Android minimum OS, compile SDK, and target SDK are distinct values.
- Android compile/target SDK should follow the selected Flutter stable release and current store submission rules rather than stale hardcoded values.
- As of 2026-11-04, Google Play requires new apps and updates to target Android 16 / API 36 or higher from 2026-08-31.
- As of 2026-11-04, Apple requires uploads to use Xcode 26 or later with an iOS 26 SDK. Apple's listed minimum OS submission threshold is iOS 13 or later; this kit's iOS 15 floor is driven by Flutter support, not Apple's lower submission threshold.
- Revalidate store rules immediately before each stable release.

## 4. Confirmed product constraints

| Area | Decision |
|---|---|
| Framework/language | Flutter / Dart |
| Platforms | Android and iOS only |
| Delivery | GitHub Template Repository |
| Product form | Project-neutral runnable application starter |
| UI direction | First-party Flutter SDK-based design system; no third-party visual UI framework |
| Component method | Use → customize → extend → build only for a verified gap |
| Localization | Arabic and English in baseline |
| Locale default | Device locale; independently persisted user override |
| Theme default | System appearance; independently persisted System/Light/Dark override |
| Visual direction | Neutral, premium-minimal, low-clutter, replaceable through tokens |
| Default integrations | No backend, auth, remote DB, analytics, ads, push, AI, payments, or app-specific logic |
| Code generation | No package-driven app source generation by default |
| License | MIT for original repository material; external assets keep their licenses |

The first-party design system is the visual and component source of truth. Flutter SDK primitives are the implementation base; third-party visual UI kits are not part of the baseline.

## 5. Core template scope

The runnable template is expected to include these foundations, with implementation details decided in their own workstreams:

1. **App foundation:** startup/bootstrap, lifecycle, configuration boundaries, and intentional first-launch/loading behavior.
2. **Project structure:** pragmatic feature-oriented organization, clear responsibility boundaries, and no unnecessary layers.
3. **UI foundation:** first-party components built on Flutter SDK primitives. Material and Cupertino APIs may be used deliberately as low-level platform/behavior primitives, but no third-party UI kit defines the visual foundation. Shared wrappers must preserve the project's tokens, accessibility, and interaction contract.
4. **Design system:** semantic tokens, typography, spacing, shape, borders, themes, and replaceable neutral defaults.
5. **Navigation and state foundations:** selected after current documentation and compatibility/trade-off review.
6. **Localization and preferences:** Arabic/English, RTL/LTR, system defaults, independent persisted overrides, and local preference persistence.
7. **Forms and feedback:** shared input conventions and appropriate loading, success, empty, and error patterns.
8. **Motion and interaction:** consistent, purposeful motion and micro-interactions with reduced-motion behavior.
9. **Adaptive/accessibility:** safe areas, keyboard insets, responsive layouts, text scaling, semantics, screen-reader support, contrast, and usable touch targets.
10. **Quality:** formatting, static analysis, tests, platform build smoke checks, and focused regression coverage.
11. **Developer experience:** concise setup/use/upgrade docs, naming conventions, useful scripts, and CI workflows.

Exact packages, versions, routing/state/DI choices, persistence mechanism, folder structure, font, and component inventory remain deferred to their named workstreams.

## 6. Optional recipes — not installed by default

- Backend clients and remote APIs.
- Authentication and account management.
- Remote databases and synchronization.
- Analytics, advertising, and crash-reporting vendors.
- Push notifications.
- AI providers and cloud inference.
- Payments, subscriptions, and monetization.
- Camera, gallery, barcode, maps, and location.
- Biometrics and other sensitive device capabilities.
- Background tasks and advanced offline synchronization.
- Product-specific domain features.

Each optional capability requires a real use case and review of its security/privacy impact, license, maintenance cost, native requirements, and reuse boundary. Local persistence for theme/locale preferences is core; a general-purpose app database is not.

## 7. Locale and theme behavior

### Locale
- Device locale is the default.
- Arabic and English are supported in the baseline.
- Settings allow System, Arabic, or English.
- System restores device-driven behavior.
- Locale and theme overrides are independent and persisted separately.
- Effective locale determines text/layout direction where appropriate.
- Dates, numbers, currency, and pluralization use locale-aware formatting.
- Adding another language must not require editing feature widgets individually.

### Theme
- System appearance is the default.
- Settings allow System, Light, or Dark.
- System restores device-driven appearance.
- Theme and locale preferences are independent and persisted.

No language/theme choice is forced during onboarding. Persistence, state, and localization implementation are selected later.

## 8. Visual and interaction principles

- Restrained, premium-minimal defaults designed for readability and comfort.
- Neutral palette; no permanent brand accent.
- Prioritize hierarchy, readable text, whitespace, alignment, and subtle separation.
- Avoid default-looking Material styling, unnecessary cards, heavy elevation, decorative shadows, glows, and indiscriminate gradients/glass effects.
- Centralize genuine visual decisions in replaceable tokens; branding must be replaceable without rewriting component internals.
- Default font must support Arabic and Latin well; exact font and license are deferred.
- Motion communicates hierarchy, state change, continuity, or feedback; do not animate everything or slow routine tasks.
- Respect reduced-motion settings.
- Initial launch must be intentional and quick; no fake progress or prolonged splash masking startup work.

## 9. Quality, accessibility, security, and testing baseline

### Accessibility/adaptive behavior

Core components and screens must account for semantics, contrast, visible focus, touch targets, text scaling, bidirectional text, keyboard/focus behavior, reduced motion, small/large mobile screens, safe areas, and keyboard insets.

### Initial CI and test gates

The first template release must have automated PR and main-branch checks for:
- Dart formatting;
- Flutter static analysis with no unapproved diagnostics;
- unit and widget tests;
- Android debug build smoke check;
- iOS simulator build smoke check on a macOS runner.

Testing policy:
- unit tests for deterministic logic;
- widget tests for shared components, state changes, and loading/error/empty behavior;
- integration tests for important end-to-end journeys and native integrations when introduced;
- selective golden tests for stable shared UI surfaces, not every screen;
- no arbitrary global coverage percentage that encourages meaningless tests.

Exact CI actions, runner images, and pinned SDK versions are deferred to platform/toolchain and developer-experience workstreams.

### Security/privacy baseline

- No secrets, signing keys, credentials, or private environment values in the repository.
- No data collection, tracking, analytics, or permission prompts by default.
- Ask for sensitive permissions only when a user-triggered capability needs them.
- Optional integrations require privacy, data-flow, permission, platform, and dependency review.
- This charter does not claim OWASP or other certification compliance.

## 10. Dependency and code-generation policy

Before adoption, review the built-in Flutter/Dart alternative, maintainer/docs/release history, stable version and SDK constraints, Android/iOS support, native setup, maintenance, license, transitive footprint, security, migration cost, lock-in, and actual requirement.

Popularity or download count alone is insufficient.

Package-driven application-source generation is not a default. An exception requires a material benefit, an accepted decision, tooling/CI requirements, and documented regeneration and upgrade behavior. Flutter-required registrants and tooling outputs do not justify adding a general code-generation stack.

## 11. Maintenance, versioning, and upgrades

- This repository is the canonical maintained template.
- A generated repository is an independent snapshot; template changes do not propagate automatically.
- Tag stable template releases using Semantic Versioning as a communication convention: major for breaking template changes, minor for backward-compatible capability additions, patch for fixes.
- Each release includes a changelog and migration instructions when needed.
- Maintain the latest stable template release. No automatic updates or indefinite backports are promised for generated apps.
- Enable GitHub's template flag only after the first candidate passes the complete release checklist.
- Revalidate upstream toolchain and store requirements before each release.

## 12. License

Original repository material is licensed under MIT. This permits reuse and modification subject to retaining copyright/license notices. It does not grant trademark rights or replace licenses for third-party dependencies, fonts, icons, images, or other imported assets. Third-party material must retain its required license and attribution.

## 13. Deferred implementation decisions

The following remain open and must be finalized before relevant implementation:
- exact Flutter stable version and Dart SDK constraint;
- Android Gradle Plugin, Gradle, Kotlin, JDK, Android SDK, NDK, and Xcode versions;
- exact non-UI package inventory and dependency versions;
- state management, routing, DI, and persistence selections;
- final project structure and architecture layers;
- exact design tokens, typography scale, and font/assets;
- first-party component inventory and staged component acceptance;
- CI action versions, runner images, and secret handling;
- release automation and signing workflow.

Closing product scope does not approve any of these implementation details.

## 14. Phase 00 acceptance

- [x] Product definition and intended user are unambiguous.
- [x] Platforms and OS floors are evidence-based.
- [x] Delivery model and generated-repository behavior are defined.
- [x] Core versus optional scope is explicit.
- [x] Visual direction and branding replaceability are defined.
- [x] Locale/theme and RTL/LTR behavior are defined.
- [x] Accessibility/adaptive expectations are defined.
- [x] Quality, testing, CI, security, and privacy expectations are defined.
- [x] Dependency and code-generation policies are defined.
- [x] Maintenance, versioning, and upgrade expectations are defined.
- [x] License is selected and included.
- [x] Remaining technical decisions are assigned to named workstreams.
- [x] README, system map, decision register, and issue tracker are synchronized.

**Phase 00 is closed.** Reopen only under the conditions in the working agreement.
