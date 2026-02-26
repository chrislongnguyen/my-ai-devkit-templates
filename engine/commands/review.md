# UTILITY: REVIEW (Iteration Retrospective)

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for approval phrases. At iteration boundaries, `/state-b` hard-stops; run `/review` before "Proceed to Iteration N+1" or "Re-plan".

**PRIME DIRECTIVE:** Structured evidence review of a completed (or in-progress) iteration so the User can decide if UDO/UDS/UBS still holds. Read-only — do not modify docs or execute tasks.

**Step 0 — Active feature:** See `engine/skills/dev-lifecycle/references/execute-micro-task.md` Step 0. Only `docs/ai/planning/feature-*.md`; exclude `docs/ai/archive/`.

**Step 1:** Identify iteration to review: default = most recently completed (all tasks 🟢); or User-specified; or current iteration if none complete.

**Step 2:** From planning doc (Execution Matrix + Table B) collect: all tasks in iteration (ID, title, status, evidence); all A.C. validated (🟢 with evidence); 🟠 Stuck; unvalidated A.C. for this iteration.

**Step 3 — Output:** "Iteration [N]: [Name] — Review"; Validated tasks table (Task | Title | A.C. | Evidence); A.C. now 🟢 table; Gaps/Risks (stuck, unvalidated A.C., open blockers); Reflection prompt: *Does UDO still hold? New UBS/UDS? Scope for next iteration OK? Reply "Proceed to Iteration N+1" or "Re-plan".* See Manifesto for full prompt.

**When to run:** At iteration gate (before Proceed/Re-plan); mid-iteration audit; before /handoff.
