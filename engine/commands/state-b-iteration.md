# STATE B ITERATION: Execute Full Iteration Then Test Then One Approval

**Purpose:** Optional flow. Execute **all** tasks in the **current iteration** (no per-task approval), then run tests, then present **one** approval gate for the whole iteration. Only available when **machine-verified tests exist** (CI workflow or `tests/run-tests.sh`). Default remains `/state-b` (one task → evidence → approve).

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for approval phrases.

**Gate (before running):** Machine-verified tests must exist. Check: `.github/workflows/ci.yml` exists (or equivalent) and runs `tests/run-tests.sh`, **or** `tests/run-tests.sh` is present and is the project's test contract. If **neither** is true, do **not** run iteration mode; tell the User: _"Iteration mode requires machine-verified tests (CI or tests/run-tests.sh). Use standard /state-b for one task at a time."_

**Steps when gate passes:**

1. **Determine active feature** per execute-micro-task Step 0. Read planning doc.
2. **Identify current iteration:** The iteration that contains the first `🔴 To Do` task (or the next iteration after the last 🟢 if at boundary). Count tasks in that iteration that are 🔴 To Do or ⚪ Pending (will become 🔴 when you activate them).
3. **Execute all tasks in that iteration:** For each task in the iteration (in order): run execute-micro-task Step 1 (Initialize for that task), Step 2 (Build), mark task **🔵 Draft Completed**. Do **not** stop for User approval between tasks. Do **not** update Table B to 🟢 yet. Skip 🟠 Stuck tasks.
4. **Run tests:** Execute `bash tests/run-tests.sh` from repo root. Report pass/fail. If learning-loop recording applies (design doc §5 exists), append one row per engine/commands/test.md Step 3.
5. **One approval gate:** Present to the User: _"Iteration N complete. Tasks executed: [list]. Test result: [pass/fail]. Approve entire iteration? Reply 'Approved' to mark all these tasks 🟢 Reviewed/Tested and update Table B, or give feedback to revise."_ HARD STOP.
6. **If User replies Approved:** Mark every task in that iteration that you executed as **🟢 Reviewed/Tested**. Update Table B for every A.C. those tasks deliver (set Status 🟢 and Evidence). If the next task is in a higher iteration, present the iteration transition gate (run /test, then "Proceed to Iteration N+1" or "Re-plan") per execute-micro-task Step 1.3.

**Rule:** Approval is gated on test result. Do not skip the test run. Default `/state-b` remains one task → evidence → approve; this command is opt-in.
