# Working Agreement

This document defines how work is researched, decided, implemented, verified, and closed.

## 1. One active workstream

- Work on one primary workstream at a time.
- Do not start dependent implementation while its prerequisite decisions are open.
- Keep the current workstream and its status visible in the README.
- Close the current workstream before advancing.

## 2. Evidence before decisions

For every material technical choice:

1. State the requirement or problem.
2. Identify credible alternatives, including built-in Flutter/Dart capabilities.
3. Consult primary sources first: official Flutter/Dart documentation, Android documentation, Apple documentation, and the package maintainer's documentation.
4. Check current version, compatibility, support, maintenance, license, security, native requirements, and migration cost where relevant.
5. Compare trade-offs against this kit's requirements.
6. Record the chosen option, rejected alternatives, evidence links, review date, and known limitations.

Do not confuse an observed fact with a recommendation or an assumption.

## 3. Decision records

Use the template in [DECISION_RECORD.md](../templates/DECISION_RECORD.md).

- Material architectural, dependency, platform, security, and product-boundary decisions require a record.
- A decision record has one of: Proposed, Accepted, Rejected, Superseded.
- A Proposed decision is not implementation permission.
- Accepted decisions are binding until properly superseded.
- Never silently change an accepted decision.

## 4. Implementation discipline

- Keep changes scoped to the active workstream.
- Prefer the smallest implementation that fully satisfies the accepted requirement.
- Do not add unrelated cleanup or speculative features.
- Do not add fake, demo-only, or static behavior that appears production-ready.
- Do not add an abstraction until its responsibility and benefit are clear.
- Keep documentation and implementation synchronized.
- Preserve existing user work; do not delete or overwrite unrelated content.

## 5. Verification

Define verification before implementation where possible.

Use the narrowest high-value checks that prove the change:
- formatting and static analysis for affected Dart code;
- focused unit/widget/integration tests for behavior changed;
- platform build checks when native configuration or platform compatibility changes;
- manual verification only when automated checks cannot reasonably prove the behavior.

Do not repeatedly rerun unchanged checks. Record the command, environment, result, and any limitation.

## 6. Definition of Done

A workstream is closed only when all applicable conditions are met:

- [ ] The requirement and boundaries are explicit.
- [ ] Relevant alternatives were considered.
- [ ] Material decisions are recorded and accepted.
- [ ] Implementation matches the accepted decisions.
- [ ] Acceptance criteria have passed.
- [ ] Focused tests/checks passed, with evidence recorded.
- [ ] Known limitations, risks, and deferred items are documented.
- [ ] User-facing and developer documentation is updated.
- [ ] No unresolved blocker remains within the workstream.
- [ ] The workstream status is marked Closed and the next dependency is clear.

A successful build alone does not close a workstream.

## 7. Reopening a closed workstream

A closed workstream is not reopened for preference churn or routine refactoring.

Reopening requires at least one of:
- a reproducible defect;
- a security or privacy issue;
- material new authoritative evidence;
- a changed product requirement;
- an upstream breaking change or platform policy change;
- a verified compatibility or maintenance problem.

Record the reason, affected decisions, migration impact, and regression checks before changing it.

## 8. Status vocabulary

| Status | Meaning |
|---|---|
| Not started | No active work |
| Researching | Evidence and alternatives are being gathered |
| Draft | Proposed scope or decision is awaiting review |
| Accepted | Decision is approved; implementation may proceed |
| In progress | Implementation or verification is active |
| Blocked | A named dependency prevents progress |
| Closed | Acceptance criteria passed and evidence recorded |
| Superseded | Replaced by a newer accepted decision |

## 9. Change control

A change that affects an accepted decision must identify:
- the new requirement or evidence;
- affected documents, code, packages, and platform settings;
- migration and compatibility impact;
- regression checks;
- the decision record that supersedes the previous one.

Avoid broad rewrites when a narrow, safe correction is sufficient.