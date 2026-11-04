# Platform and Toolchain Baseline

**Status:** Baseline accepted; local Windows verification pending  
**Checked:** 2026-11-04  
**Related decision:** ADR-0007  
**Related issue:** [Phase 01 — Platform and toolchain](https://github.com/ParkersYourDad/flutter-foundation-kit/issues/2)

## 1. Version policy

Use the latest verified stable Flutter patch as the baseline, but pin the exact Flutter release in development instructions and CI. Do not use beta or main for the production template baseline.

### Flutter and Dart

| Item | Baseline |
|---|---|
| Flutter channel | stable |
| Flutter SDK | **3.47.9** |
| Bundled Dart SDK | **3.13.7** |
| Flutter release date | 2026-10-29 |
| Flutter release ref | \`c197ca5199e9ee5661e865596c9c07294dfab51c\` |
| Windows SDK SHA-256 | \`c2c875da25a1a1448d18ee4e8f398b2f6fce888b4775d8f9130538e16d826cb4\` |

Dart is supplied by the Flutter SDK. Do not install or update a separate Dart SDK for this project unless a specific tool requires it and the decision is documented.

The application SDK constraints should require at least Dart 3.13.7 and Flutter 3.47.9, while CI uses the exact Flutter 3.47.9 patch. Re-evaluate this baseline when a newer stable Flutter release is selected for a release cycle.

## 2. Android toolchain

Use the values in the Flutter 3.47.9 application template as the starting point. Avoid independently upgrading Gradle, AGP, Kotlin, or NDK without a demonstrated need and a successful build.

| Item | Baseline |
|---|---:|
| Android minimum OS | API 24 |
| Android compile SDK | 36 |
| Android target SDK | 36 |
| Android Build Tools | 36.0.0 |
| Android NDK | 28.2.13676358 |
| Android Gradle Plugin | 9.1.0 |
| Gradle Wrapper | 9.3.1 |
| Kotlin Gradle Plugin | 2.4.0 |
| JDK for Gradle | 17 |

These are the version constants used by Flutter 3.47.9's own project-generation tooling. The Flutter-generated Android Gradle properties also set:
- \`android.newDsl=false\`
- \`android.builtInKotlin=false\`

Keep those generated compatibility settings initially. Do not independently enable the new AGP DSL or built-in Kotlin migration. Flutter 3.47 supports enabling built-in Kotlin only after the app and all included plugins have migrated; the project template deliberately retains the compatibility flags.

### Android SDK Manager

Install through the current stable Android Studio SDK Manager:
- Android SDK Platform 36.
- Android SDK Build-Tools 36.0.0.
- Android SDK Command-line Tools (latest stable).
- Android SDK Platform-Tools.
- Android Emulator only if an emulator is needed.
- NDK side-by-side 28.2.13676358.

Android Studio's bundled JBR is suitable for running Android Studio. The command-line Gradle JDK must resolve consistently to JDK 17 for this baseline. Verify which Java installation Flutter and Gradle actually use; multiple installed JDKs are a common source of mismatched builds.

### Important distinction

- \`minSdk\` decides the oldest Android OS that can install/run the app.
- \`compileSdk\` decides which Android APIs are available at compile time.
- \`targetSdk\` opts the app into the relevant Android platform behavior and store policy.
- The Google Play target API requirement is not the same as \`minSdk\`.

As of 2026-11-04, Google Play requires new apps and updates to target API 36 or higher. Recheck this before every release.

## 3. iOS toolchain

| Item | Baseline |
|---|---|
| Minimum deployment target | iOS 15 |
| Xcode baseline | **26.6** |
| macOS requirement for Xcode 26.6 | macOS Tahoe 26.2 or later |
| SDK used for App Store submission | iOS 26.5 SDK included with Xcode 26.6 |
| CI runner | GitHub Actions \`macos-26\` |

Xcode 26.6 is the stable Xcode 26-line baseline listed by Apple and is sufficient for Apple's current upload requirement (Xcode 26 or later with an iOS 26 SDK). It supports iOS 15 deployment targets. It is intentionally chosen instead of a beta toolchain.

A local iOS build, simulator, device deployment, or signing operation requires macOS and Xcode. Windows is the local Android development environment; iOS build verification will run on a macOS CI runner or a Mac.

### Native iOS dependency manager

Flutter 3.44+ uses Swift Package Manager (SwiftPM) by default for iOS/macOS plugin dependencies. Flutter automatically falls back to CocoaPods for dependencies that have not migrated to SwiftPM.

Policy:
- Prefer plugins that explicitly support SwiftPM.
- Do not install or configure CocoaPods as a default project prerequisite.
- If a required plugin forces CocoaPods fallback, record the dependency, reason, and migration risk before adoption.
- CocoaPods remains in maintenance mode and its registry is scheduled to become read-only on 2026-12-02. Treat CocoaPods-only dependencies as a material risk for new projects.

This does not mean every Flutter plugin supports SwiftPM today. Compatibility must be checked individually in the dependency-selection workstream.

## 4. CI host policy

Use stable, named GitHub-hosted runner images rather than floating \`*-latest\` labels when possible.

| Job | Runner | Toolchain |
|---|---|---|
| Android build/test | \`ubuntu-24.04\` | Flutter 3.47.9; Android toolchain as above |
| iOS build/test | \`macos-26\` | Flutter 3.47.9; explicitly select Xcode 26.6 |
| Local development | Windows 10/11 | Flutter 3.47.9; Android toolchain |

Runner images are periodically updated. Pin Flutter and explicitly select Xcode; do not assume a hosted image's default SDK will remain unchanged.

GitHub Actions action versions, workflow permissions, caching, artifact handling, and dependency pinning are defined in the developer-experience/CI workstream. Do not add workflows in this phase before that workstream.

## 5. Forui compatibility signal

The current pub.dev listing shows Forui 0.27.7, and Forui 0.26.0+ requires Flutter 3.47.0 or later. Flutter 3.47.9 satisfies that minimum.

This is a compatibility check only, not final dependency approval. Forui's exact version, transitive dependency review, license review, release policy, and component-by-component adoption remain in the dependency and Forui workstreams. Forui is pre-1.0; do not assume that a caret constraint automatically adopts later minor releases.

## 6. Reproducibility rules

1. Flutter patch version is pinned to 3.47.9 in CI.
2. Dart comes from the pinned Flutter SDK.
3. Android Gradle/AGP/Kotlin/NDK values start from the Flutter 3.47.9-generated template values above.
4. Xcode is explicitly selected as 26.6 in iOS CI.
5. Store requirements are rechecked before a release.
6. No local absolute paths, signing keys, tokens, or machine-specific environment values are committed.
7. Do not update one part of the native toolchain independently. Review the complete compatibility matrix and verify the actual build.
8. Run \`scripts/check_environment.ps1\` once on the Windows development machine before closing Phase 01.

## 7. Local Windows verification

From the repository root, run:

\`\`\`powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\\scripts\\check_environment.ps1
\`\`\`

The script is read-only. It reports Flutter/Dart, Java, Android tooling, SDK environment variables, Git, and \`flutter doctor -v\`. It does not install, update, or modify anything.

Interpret warnings in scope:
- Android toolchain/device issues are relevant to local Android development.
- Missing Xcode on Windows is expected; iOS builds run on macOS CI.
- Warnings for web/desktop tools are out of scope and do not block this mobile-only kit.

## 8. Closure requirements

Phase 01 can close after:
- [x] Current stable Flutter and bundled Dart versions are verified and pinned.
- [x] Android build-tool matrix is taken from the exact Flutter release template and cross-checked against Android's official compatibility requirements.
- [x] Android minimum/compile/target SDK values are separated.
- [x] iOS minimum, Xcode, SDK, host, and App Store requirements are separated.
- [x] SwiftPM default and CocoaPods fallback risk are documented.
- [x] Forui's minimum Flutter compatibility is checked.
- [x] CI host policy and version pinning policy are documented.
- [ ] The one-time Windows environment report is reviewed and local Android toolchain blockers are resolved or explicitly recorded.

Until the final item is reviewed, Phase 01 remains open.
