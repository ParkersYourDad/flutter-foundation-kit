# Decision Register

Status meanings:
- **Proposed:** under evaluation; not approved for implementation.
- **Accepted:** approved and binding until superseded.
- **Rejected:** considered and not selected.
- **Superseded:** replaced by a newer accepted decision.

| ID | Decision | Status |
|---|---|---|
| [ADR-0001](0001-mobile-platform-scope.md) | Android and iOS are the supported platforms | Accepted |
| [ADR-0002](0002-framework-and-ui-direction.md) | Flutter/Dart with selective Forui-first UI direction | Accepted |
| [ADR-0003](0003-delivery-model.md) | GitHub Template Repository is the delivery model | Accepted |
| [ADR-0004](0004-platform-support-floor.md) | Android API 24 and iOS 15 initial OS floors | Accepted |
| [ADR-0005](0005-system-preferences.md) | System locale/theme defaults with independent overrides | Accepted |
| [ADR-0006](0006-project-license.md) | MIT license for original repository material | Accepted |
| [ADR-0007](0007-toolchain-baseline.md) | Flutter 3.47.9 and aligned native toolchain baseline | Accepted |

Use the [decision record template](../templates/DECISION_RECORD.md). Assign sequential IDs and never recycle them. Supersede accepted decisions rather than silently changing their meaning. Link primary sources and record when they were checked. Reserve ADRs for material decisions with meaningful trade-offs.
