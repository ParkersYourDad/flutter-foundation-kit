# ADR-0006: License for Original Repository Material

- **Status:** Accepted
- **Date:** 2026-11-04
- **Workstream:** Product scope and principles

## Context

The repository is public and intended to be reused. Public visibility alone does not grant permission to reuse, modify, or redistribute its contents.

## Options considered

- **MIT:** short permissive license; allows commercial use, modification, distribution, and sublicensing subject to retaining notices.
- **Apache-2.0:** permissive and contains an express patent license, but has a larger notice/compliance footprint.
- **No license/proprietary:** retains exclusive rights but conflicts with the intended friction-light reuse model.

## Decision

Apply the **MIT License** to original material authored for this repository. It provides a straightforward permissive reuse model suitable for a starter intended to be copied into application repositories.

The license only covers material the repository owner has the right to license. It grants no trademark rights and does not override third-party licenses for dependencies, fonts, icons, images, or other imported assets. It provides no warranty or support guarantee.

## Consequences

- Keep the root LICENSE file.
- Record third-party asset licenses and attribution before distributing them.
- Do not bundle external fonts/icons/images without reviewing redistribution requirements.

## Revisit

Revisit if an express patent grant, different reuse restrictions, or a changed distribution model becomes necessary.
