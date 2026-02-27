# UTILITY: TEST-WRITE (Test Agent — Write AC-TEST-MAP from Approved Holy Trinity)

**Purpose:** Write the full AC-TEST-MAP **once after State A** produces the approved Holy Trinity. The map covers all iterations and all A.C. — frozen baseline and scope enforcement.

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for approval phrases.

**Step 1:** Determine active feature per execute-micro-task.md Step 0. Load the approved `docs/ai/requirements/feature-{name}.md`, `docs/ai/design/feature-{name}.md`, and `docs/ai/planning/feature-{name}.md`.

**Step 2:** Copy `tests/AC-TEST-MAP-TEMPLATE.md` to `tests/AC-TEST-MAP.md` (or `tests/AC-TEST-MAP-{feature}.md`). Populate one row per A.C. across **all** iterations, ordered by iteration then A.C. ID. Derive tests from spec/AC and behavior contracts only — not implementation. Include failure-path cases. If any A.C. is ambiguous, **hard-stop** and ask the User to clarify.

**Step 3:** Confirm to the User: what was written, how many A.C. are covered, and that the baseline is now frozen. No changes to the AC-TEST-MAP during `/state-b` without State A re-plan.

**Re-run protocol:** If a pivot occurs during execution (blocker → State A re-plan → Holy Trinity updated), re-run `/test-write` to produce a new AC-TEST-MAP reflecting the updated spec.
