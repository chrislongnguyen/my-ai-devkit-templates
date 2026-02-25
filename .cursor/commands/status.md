---
description: Show current execution state — active feature, iteration, next task, and template version.
---

# UTILITY: STATUS (Where Am I?)

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for recovery and cross-device continuity.

**PRIME DIRECTIVE:** Provide a read-only snapshot of the current venture state so the User (or a new session) can resume work without context loss. Do not modify any docs or execute tasks.

## Step 1: Determine Active Feature(s)
Use the same logic as **execute-micro-task.md Step 0 (Canonical)**. List files matching `docs/ai/planning/feature-*.md` **only** under `docs/ai/planning/` — **exclude `docs/ai/archive/`**.

- **If exactly one exists:** That is the active feature.
- **If multiple exist:** Show the **Feature Dashboard** (see Step 4 below) listing all features, then use the **most recently modified** `feature-*.md` as the "active" one for the detailed report. The User can ask for a different feature by name.
- **If none exist:** Read `README.md` and `CHANGELOG.md` for context; if still ambiguous, state "Active feature: unknown — run /state-b and specify the feature name when asked."

## Step 2: Read Planning Doc
Read the planning doc for the active feature: `docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md`. Parse:
- Master Scope Mapping (Table A, Table B) and Execution Matrix (Iteration 1–4 task tables).
- For each task row, note Status (🔴 To Do, 🔵 Draft Completed, 🟢 Reviewed/Tested, 🟠 Stuck, ⚪ Pending).

## Step 3: Output Status Report
Present the following in a clear, scannable format. Do not change any file.

**Active feature:** [name or "unknown"]
**Planning doc:** [path used]
**Template version:** [read from `.template-version` if present, else "not set"]

**Current iteration:** [the iteration that contains the first 🔴 To Do task; if no 🔴 To Do, state "All tasks complete or none defined"]
**Next task:** [first task ID and title with 🔴 To Do, or "None — all done or plan empty"]
**Last approved task:** [most recent task with 🟢 Reviewed/Tested, if any: ID, title, and brief evidence from Table B]

**Task counts (this feature):**
- 🟢 Reviewed/Tested: [count]
- 🔵 Draft Completed (awaiting approval): [count]
- 🔴 To Do: [count]
- 🟠 Stuck: [count]
- ⚪ Pending: [count]

**Next actions:** [1–2 concrete next steps, e.g. "Run /state-b to execute T-201" or "Run /state-a to add a new feature"]

## Step 4: Feature Dashboard (Multi-Feature Only)
If multiple `docs/ai/planning/feature-*.md` files exist, output this dashboard **before** the detailed report for the active feature:

**All features in this workspace:**

| Feature | Iteration | Next Task | 🟢 | 🔵 | 🔴 | 🟠 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [name-1] | [N] | [task ID or "Done"] | [count] | [count] | [count] | [count] |
| [name-2] | [N] | [task ID or "Done"] | [count] | [count] | [count] | [count] |

*Read each feature's planning doc to populate. Then show the full detailed report (Steps 2–3) for the active feature only.*
