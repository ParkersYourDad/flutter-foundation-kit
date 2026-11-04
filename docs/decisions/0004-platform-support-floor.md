# ADR-0004: Initial Mobile OS Support Floor

- **Status:** Accepted
- **Date:** 2026-11-04
- **Workstream:** Product scope and principles

## Context

The kit must not claim support for OS versions that the selected Flutter release no longer supports. Store submission targets are separate from runtime minimums.

## Options considered

- Follow the supported Flutter platform floor: current, simple, and avoids unsupported OS claims, but excludes older devices.
- Target below Flutter's supported floor: potentially wider reach, but requires unsupported workarounds and a separate maintenance commitment.
- Choose a higher floor: may simplify later integrations but excludes devices before a need is demonstrated.

## Decision

Initial minimum device OS:
- **Android API 24 (Android 7.0)**
- **iOS 15**

These match the mobile platform floor Flutter lists as supported for Flutter 3.47 on 2026-11-04. Revalidate against the exact selected Flutter stable release and required plugins before the first template release. A required dependency may raise the floor; do not lower it below Flutter's supported range.

These are not Android compileSdk/targetSdk values or Xcode/iOS SDK versions.

## Separate submission policy

- Google Play requires new apps and updates to target Android 16 / API 36 or higher from 2026-08-31.
- Apple requires uploads to use Xcode 26 or later with an iOS 26 SDK from 2026-04-28. Apple's listed minimum OS submission threshold is iOS 13 or later; Flutter's supported iOS floor is higher at iOS 15.
- Recheck store rules before each release.

## Evidence

- [Flutter supported deployment platforms](https://docs.flutter.dev/reference/supported-platforms) — Flutter 3.47 supports Android API 24+ and iOS 15+; checked 2026-11-04.
- [Flutter Android defaults](https://github.com/flutter/flutter/blob/master/packages/flutter_tools/gradle/src/main/kotlin/FlutterExtension.kt) — current Flutter minSdk default is API 24; checked 2026-11-04.
- [Google Play target API requirements](https://support.google.com/googleplay/android-developer/answer/11926878) — target API 36 requirement; checked 2026-11-04.
- [Apple upcoming requirements](https://developer.apple.com/news/upcoming-requirements/) — Xcode 26/iOS 26 SDK and iOS 13 minimum submission threshold; checked 2026-11-04.

## Consequences

The platform/toolchain workstream must pin and test the complete SDK/build matrix. Release validation checks store target rules separately from minimum device OS.

## Revisit

Revisit when Flutter's support matrix changes, a required plugin raises the minimum, or target device coverage changes materially.
