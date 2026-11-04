# Decision Register

This directory contains the project's durable technical and product decisions.

## Status definitions

- **Proposed:** under evaluation; not approved for implementation.
- **Accepted:** approved and binding until superseded.
- **Rejected:** considered and not selected.
- **Superseded:** replaced by a newer accepted decision.

## Current decisions

| ID | Decision | Status |
|---|---|---|
| [ADR-0001](0001-mobile-platform-scope.md) | Android and iOS are the supported platforms | Accepted |
| [ADR-0002](0002-framework-and-ui-direction.md) | Flutter/Dart with a selective Forui-first UI direction | Accepted |

These decisions record the direction already established for this project. They do not approve unreviewed package versions, minimum OS versions, architecture, or individual component choices.

## Rules

- Use the [decision record template](../templates/DECISION_RECORD.md).
- Assign the next sequential ID; never recycle an ID.
- Keep accepted decisions immutable in meaning. Supersede rather than silently rewrite them.
- Link authoritative evidence and record when it was checked.
- Do not create an ADR for trivial implementation details; reserve it for material choices with meaningful trade-offs.