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

## Learning-loop record (when enabled)

When a feature uses the learning loop (trace test result → requirement/design, record outcome):

- **Location:** Design doc §5 (Learning Loop Log) of the active feature: `docs/ai/design/feature-{name}.md`. The design template (`docs/ai/design/README.md`) defines §5 with an append-only table.
- **Format:** One row per test run (or per A.C. scope): **Date** | **A.C. / Scope** | **Result** (Pass/Fail) | **Outcome (one line)** | **Req/Design ref**. Outcome must not contain `|` or newlines (so the table parses). Trace: test result → AC-TEST-MAP → requirement/design. No fabricated content; derive only from test output and AC-TEST-MAP.
- **Mechanism:** When `/test` is run, the agent (per `engine/commands/test.md`) appends one row to the active feature design doc §5. When CI runs (`tests/run-tests.sh` on push), the workflow calls `tests/append-learning-loop.sh` with the feature name and test exit code so the learning-loop row is written automatically—no separate manual doc step.

### For tooling (metrics, meta-review)

Learning-loop records accumulate without manual consolidation. Future features (e.g. metrics dashboards, meta-review scripts) can consume the log as follows:

- **Discovery:** List `docs/ai/planning/feature-*.md`; for each file, the feature name is the stem (e.g. `feature-automated-test-verification.md` → `automated-test-verification`). The log lives in `docs/ai/design/feature-{name}.md` in the section titled `# 5. LEARNING LOOP LOG`. If that section is absent, the feature has no learning loop.
- **Schema:** Markdown table. Columns in order: **Date** (YYYY-MM-DD), **A.C. / Scope** (free text: A.C. ID, "suite", "CI", etc.), **Result** (Pass | Fail), **Outcome (one line)** (free text from test output; **must not contain `|` or newlines** — writers enforce so the table parses), **Req/Design ref** (e.g. "Req Verb-AC1; Design §2.2"). Rows are append-only; data rows match the pattern `| YYYY-MM-DD | ...`.
- **Consumption:** Parse the table from the first `| Date` header row to the line before `_Do not remove or edit prior rows_.` Pass rate, failure clustering by A.C., and audit trail can be derived from Result + A.C./Scope + Req/Design ref.
