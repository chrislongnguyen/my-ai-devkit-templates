# Test Skeleton — Contract

## Commands

- **`/test-write`** — Test Agent writes the **AC-TEST-MAP** from the approved Holy Trinity. Runs **once after State A** (requirements + design + planning approved). Covers **all** iterations and **all** A.C. in one map. See `tests/AC-TEST-MAP-TEMPLATE.md`.
- **`/test`** — Runs `tests/run-tests.sh` at each **iteration boundary** (after the last task in an iteration is approved, before "Proceed to Iteration N+1"). Prior iterations' tests must still pass (regression).
- **`/ship`** — Git commit and push **only**. Does **not** run tests.

## AC-TEST-MAP: Frozen Baseline & Scope Enforcement

The AC-TEST-MAP (`tests/AC-TEST-MAP.md` or `tests/AC-TEST-MAP-{feature}.md`) is a **mirror of the Holy Trinity**. One row per A.C., MECE, ordered by iteration.

- **Frozen during execution:** No test in the map may be added, removed, or modified during `/state-b` without going back through State A.
- **Scope enforcement:** Anything built during `/state-b` that has no corresponding row in the AC-TEST-MAP is scope creep. At the iteration boundary, verify: nothing was built outside the map.
- **Pivot protocol:** If a task is blocked and the User decides to pivot (change approach, adjust A.C.), the flow is: State A re-plan → Holy Trinity updated → `/test-write` re-runs → new AC-TEST-MAP → execution resumes.

## Causal Chain

```
State A → Holy Trinity approved
  → /test-write → AC-TEST-MAP (frozen, all iterations, all A.C.)
    → /state-b tasks (scoped to A.C. only, one at a time)
      → Evidence of Truth (proves A.C., nothing more)
        → /test at iteration boundary (validates that iteration's A.C. + regression)
          → Scope check: nothing built outside AC-TEST-MAP
            → "Proceed to Iteration N+1"
```

## Run Tests

From repo root: `./tests/run-tests.sh` (or invoke `/test`).
