# ADR-0003: Primary Delivery Model

- **Status:** Proposed
- **Date:** 2026-11-04
- **Decision owners:** Repository owner
- **Related workstream:** Product scope and principles

## Context

The primary product is a reusable Flutter application foundation. The goal is to start new Android/iOS applications quickly, with a ready-to-run app structure and project-level engineering conventions, while avoiding the ongoing cost of maintaining a framework or package ecosystem before one is needed.

## Options considered

### Option A — GitHub template repository

**Benefits**
- GitHub can generate a new repository with the template's directory structure and files.
- The new repository starts as an independent project rather than a fork intended for upstream contribution.
- The user can create a new repository through GitHub's UI without installing a custom tool.
- The template can contain a complete Flutter app scaffold, documentation, scripts, and optional recipes.

**Costs and risks**
- New repositories do not receive future template changes automatically.
- Template-derived branches have unrelated histories; GitHub documents that pull requests and merges between the template and generated repository branches are not supported.
- A template is a starting point, not a versioned dependency update mechanism.

### Option B — Published Dart/Flutter packages

**Benefits**
- Shared library code can be versioned and consumed as dependencies.
- Improvements to a shared package can reach consuming apps through dependency upgrades.
- Suitable for genuinely reusable, independently bounded libraries.

**Costs and risks**
- A package does not by itself create a complete mobile application, platform project, app configuration, or developer workflow.
- Package APIs, semantic versioning, release management, compatibility matrices, and migration support add maintenance obligations.
- Splitting code into packages before stable boundaries emerge creates premature architecture.

### Option C — Template plus custom CLI or package distribution

**Benefits**
- Could automate project creation and optional feature selection.

**Costs and risks**
- Adds a tool that itself needs design, distribution, compatibility, testing, and maintenance.
- Duplicates some capabilities already supplied by GitHub's template workflow.
- Not justified until the simpler delivery model demonstrates a concrete limitation.

## Proposed decision

Use a **GitHub template repository as the primary delivery model**.

The template should contain a complete, runnable Flutter application foundation and its supporting documentation. Optional capabilities should initially be delivered as clearly documented, opt-in recipes or modules within the repository rather than a set of prematurely published packages.

Do not publish a custom CLI or split the foundation into Dart packages at the beginning.

Consider extracting a capability into a separately versioned package only when:
- it has a stable, independently useful API;
- multiple applications need the same implementation;
- sharing changes across application repositories provides real value;
- package ownership, versioning, compatibility, and release costs are justified.

## Evidence

| Source | What it verifies | Checked |
|---|---|---|
| [GitHub: Creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) | A repository can be generated from a template with its files and directory structure; template-derived branches have unrelated histories and cannot be merged or used for PRs against the template branches | 2026-11-04 |
| [GitHub: Creating a template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository) | An administrator can mark an existing repository as a template | 2026-11-04 |
| [Flutter: Create a new app](https://docs.flutter.dev/reference/create-new-app) | The standard Flutter app-creation workflow uses the Flutter application template and project options | 2026-11-04 |

## Consequences

### Positive
- One clear distribution method for starting new apps.
- No package publishing or custom CLI requirement at the beginning.
- The foundation can be validated as a complete app, not just as isolated libraries.

### Negative / trade-offs
- Generated projects will not automatically receive future improvements.
- Consumers that need ongoing shared-code updates may eventually need a package or another explicit update strategy.
- The template must remain self-contained and documented.

### Follow-up
- Confirm this proposal before enabling GitHub's template-repository setting.
- Define the project-generation instructions and post-generation checklist.
- Define how the template itself is tested before a release.

## Revisit conditions

Reconsider if users need centralized updates across many existing apps, if the template workflow creates repeated errors, or if stable shared modules emerge that justify independent package versioning.