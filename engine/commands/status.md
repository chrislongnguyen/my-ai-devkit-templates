# UTILITY: STATUS (Where Am I?)

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for recovery and cross-device continuity.

**PRIME DIRECTIVE:** Read-only snapshot of current enablement state. Do not modify any docs or execute tasks.

**Step 1 — Active feature:** See `engine/skills/dev-lifecycle/references/execute-micro-task.md` Step 0 (canonical). List `docs/ai/planning/feature-*.md` only; exclude `docs/ai/archive/`. Exactly one → use it; multiple → show Feature Dashboard (Step 4) then use most recently modified; none → README/CHANGELOG or state "Active feature: unknown."

**Step 2:** Read the planning doc for the active feature. Parse Master Scope Mapping (Table A, B) and Execution Matrix (task statuses: 🔴 To Do, 🔵 Draft Completed, 🟢 Reviewed/Tested, 🟠 Stuck, ⚪ Pending).

**Step 3 — Output:** Active feature; Planning doc path; Template version (`.template-version` if present); Current iteration (iteration of first 🔴 To Do); Next task (ID + title); Last approved task (ID, evidence); Task counts (🟢 🔵 🔴 🟠 ⚪); Next actions (1–2 steps). Scannable format; do not change any file.

**Step 4 — Multi-feature:** If multiple feature docs exist, output dashboard table first: Feature | Iteration | Next Task | 🟢 | 🔵 | 🔴 | 🟠. Then detailed report for active feature only. See execute-micro-task.md Step 0 for which is "active."
