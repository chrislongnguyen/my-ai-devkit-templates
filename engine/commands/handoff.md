# UTILITY: HANDOFF (Resume Later)

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for cross-device continuity and recovery.

**PRIME DIRECTIVE:** Write a single handoff doc to `project_handoff_status.md` in repo root so the next session can resume with minimal context loss. Do not modify planning/requirements/design except by appending if the user asks.

**Step 1 — Active feature:** See `engine/skills/dev-lifecycle/references/execute-micro-task.md` Step 0 (canonical). Use that feature name for doc paths; exclude `docs/ai/archive/`.

**Step 2:** Read the planning doc for the active feature. Identify: current iteration, first 🔴 To Do task, last 🟢 Reviewed/Tested task. Run `git status` (and optionally `git diff --stat`).

**Step 3:** Create or overwrite `project_handoff_status.md` with: title "Project Handoff Status"; generated date/time; **Active feature**; **Planning doc** path; **Current iteration**; **Next task** (ID, title, status); **Last approved task** (ID, evidence); **Modified / uncommitted files** (from git status); **Next actions** (1–2 concrete steps). Use clear headings and bullet lists.

After writing, confirm: *"Handoff written to `project_handoff_status.md`. Next session: read this file and run /status or /state-b to continue."*
