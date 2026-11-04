# ADR-0003: Primary Delivery Model

- **Status:** Accepted
- **Date:** 2026-11-04
- **Decision owner:** Repository owner
- **Workstream:** Product scope and principles

## Context

The goal is to start new Android/iOS apps quickly with a runnable project and shared conventions, without prematurely maintaining a framework or package ecosystem.

## Options

### A — GitHub Template Repository
Benefits: creates a new repository with the template structure and files; no custom CLI required; can contain a complete Flutter app, docs, scripts, and recipes.
Costs: generated repositories do not automatically receive template updates; generated branches have unrelated histories and cannot be merged or used for PRs against template branches.

### B — Published Dart/Flutter packages
Benefits: shared code can be independently versioned and updated through dependency releases.
Costs: packages do not create the complete app/platform project; API/versioning/compatibility/release/migration work adds maintenance; splitting before stable boundaries is premature.

### C — Template plus custom CLI or package distribution
Benefits: could automate feature selection.
Costs: adds a separately maintained tool and is not justified while GitHub templates meet the current need.

## Decision

Use a **GitHub Template Repository** as the primary delivery model. It will contain a complete, runnable Flutter application foundation and its documentation. Optional capabilities will initially be opt-in recipes/modules, not a set of prematurely published packages.

Do not publish a custom CLI or split the foundation into Dart packages at the beginning. Extract a capability into a package only when it has a stable, independently useful API, multiple consumers, and a justified maintenance/release boundary.

Enable the template setting only after the first release candidate passes the full release checklist.

## Evidence

- [GitHub: Creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) — generated structure and independent histories; checked 2026-11-04.
- [GitHub: Creating a template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository) — admin can mark an existing repository as a template; checked 2026-11-04.

## Consequences

Positive: one clear delivery method; no package publishing or custom CLI at the start; validate a complete app rather than isolated libraries.

Trade-offs: generated apps need deliberate manual upgrades; template must stay self-contained and have release/migration documentation.

## Revisit

Reconsider if consumers need centralized updates across many existing apps, template use creates repeated errors, or stable shared modules justify independent versioning.
