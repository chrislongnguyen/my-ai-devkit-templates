---
description: Generate a handoff document for resuming work (e.g. new machine or session).
---

# UTILITY: HANDOFF (Resume Later)

**PRIME DIRECTIVE:** Produce a single handoff document so the next session (or another person) can resume work with minimal context loss. Write to `project_handoff_status.md` in the repo root. Do not modify planning/requirements/design docs except by appending or clarifying if the user asks.

## Step 1: Determine Active Feature
Use the same logic as State B Step 0: `docs/ai/planning/feature-*.md` (exactly one → use it); else README + CHANGELOG; else state "Unknown — specify feature name when resuming."

## Step 2: Read Planning Doc & Git State
- Read the planning doc for the active feature (`docs/ai/planning/feature-{name}.md` or `docs/ai/planning/README.md`). Identify: current iteration, first 🔴 To Do task (next task), last 🟢 Reviewed/Tested task.
- Run `git status` (and optionally `git diff --stat` or `git status -sb`) to list modified, added, or untracked files.

## Step 3: Write Handoff Document
Create or overwrite `project_handoff_status.md` in the repo root with the following structure. Use clear headings and bullet lists.

```markdown
# Project Handoff Status
*Generated: [date/time]. Use /status for a quick snapshot; use this file for full handoff.*

## Active feature
[Name]

## Planning doc
[Path]

## Current iteration
[Number and name, e.g. "2 — Working Prototype"]

## Next task
- **ID:** [e.g. T-201]
- **Title:** [from Execution Matrix]
- **Status:** 🔴 To Do

## Last approved task
- **ID:** [e.g. T-102]
- **Evidence:** [brief from Table B or task row]

## Modified / uncommitted files
[Paste or summarize git status output]

## Next actions
1. [e.g. Run /state-b to execute T-201]
2. [e.g. Review design §3 before implementing]
```

After writing, confirm to the user: *"Handoff written to `project_handoff_status.md`. Next session: read this file and run /status or /state-b to continue."*
