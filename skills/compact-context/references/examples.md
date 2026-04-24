# Compact Examples

These examples show the expected output quality for `compact-context`.
They are intentionally short, specific, and execution-oriented.

Always name artifacts with:

`YYYY-MM-DD-HHMM-<artifact-type>-<readable-english-title>.md`

## Example 1: Session Compact

Filename:

`2026-04-24-1030-session-compact-auth-token-refresh.md`

```md
# Task
Fix token refresh so expired access tokens recover without forcing a new login.

# Constraints
- Do not change the public auth API contract.
- Preserve current refresh-token rotation behavior.
- Keep existing middleware flow intact unless required for the fix.

# Relevant Files
- `src/auth/token_service.ts`: refresh and expiry logic
- `src/http/auth_middleware.ts`: request-time auth recovery path
- `tests/auth/token_refresh.test.ts`: existing refresh coverage

# Confirmed Findings
- Expired access tokens currently fail before refresh is attempted.
- Middleware returns 401 too early instead of invoking refresh flow.
- Token rotation logic itself appears correct.

# Decision
- chosen approach: move refresh attempt earlier in middleware when access token is expired but refresh token is still valid
- avoided approach: adding retry logic in callers because it spreads auth recovery across the codebase

# Next Steps
1. Update middleware expiry branch to attempt refresh before returning 401.
2. Add a test for expired access token plus valid refresh token.
3. Run auth-focused tests and inspect any regressions around invalid refresh tokens.

# Open Questions
- Should refresh be attempted for all protected routes or only session-backed routes?

# Verification Status
- done: traced failure path and identified early return in middleware
- not yet run: updated tests after middleware change
```

## Example 2: Execution Compact

Filename:

`2026-04-24-1145-execution-compact-inventory-stack-refactor.md`

```md
# Task
Finish the inventory stack refactor so stack merging is consistent across pickup and drag-drop paths.

# Current Status
- completed: introduced shared `mergeStacks()` helper
- in progress: pickup flow now uses helper
- blocked on: drag-drop path still contains duplicate merge logic

# Constraints
- Do not change save format.
- Preserve current max-stack rules.
- Avoid UI-only fixes that bypass the shared inventory model.

# Relevant Files
- `src/inventory/inventory_model.ts`: shared stack behavior
- `src/inventory/pickup_controller.ts`: already migrated to helper
- `src/ui/inventory_drag_controller.ts`: still uses old merge logic
- `tests/inventory/stacking.test.ts`: needs coverage for drag-drop parity

# Implemented So Far
- Added `mergeStacks(source, target)` in model layer.
- Replaced pickup-specific merge code with shared helper.
- Confirmed no save-schema changes are required.

# Remaining Work
1. Replace duplicate merge logic in drag controller with model helper.
2. Add tests covering pickup and drag-drop with identical stack edge cases.
3. Run inventory tests and manually verify partial-stack behavior.

# Risks Or Watchpoints
- Drag controller may still depend on UI-side slot mutation order.
- Partial-stack overflow behavior must match preexisting rules exactly.

# Verification Status
- passing: pickup path unit tests
- failing: no current failure, but drag-drop parity coverage is missing
- not yet run: full inventory test suite after drag controller change
```

## Example 3: Resume Brief

Filename:

`2026-04-24-1305-resume-brief-combat-target-selection.md`

```md
# Task
Continue the combat target-selection fix so melee attacks choose the intended nearest valid target.

# Current Goal
- finish the selection logic change and verify it does not break manual target locking

# Constraints
- Keep manual target lock higher priority than auto-selection.
- Do not change attack range calculations in this pass.
- Avoid unrelated combat refactors.

# Relevant Files
- `src/combat/target_selector.ts`: main candidate selection logic
- `src/combat/combat_controller.ts`: call site for attack target resolution
- `tests/combat/target_selector.test.ts`: current nearest-target coverage
- `tests/combat/manual_lock_priority.test.ts`: lock precedence behavior

# What Was Established
- Auto-selection currently uses first-valid candidate, not nearest-valid candidate.
- Manual lock already bypasses candidate sorting correctly.
- Range filtering works and should stay unchanged.

# Current State
- completed: root cause identified and candidate sorting strategy chosen
- pending: implement nearest-distance sort before final fallback
- unresolved: whether tie-breaking should remain stable by existing list order

# Immediate Next Steps
1. Update `target_selector.ts` to sort valid auto-target candidates by distance.
2. Add a test for two valid targets where the nearer one is not first in the source list.
3. Run combat target tests, then verify manual lock still wins.

# Open Questions
- If two targets are at equal distance, should current source order remain the tiebreaker?

# Verification Status
- done: codepath traced and desired behavior clarified
- pending: implementation and test run
```

## What Makes These Good

- They preserve only durable facts needed for the next phase.
- They name specific files and why they matter.
- They separate confirmed decisions from open questions.
- They make the next action obvious.
- They are much smaller than the sessions they replace.
