# Project Handoff Status
*Generated: 2026-02-25. Use /status for a quick snapshot; use this file for full handoff.*

## Active feature
`claude_ptc` — PTC bridge: Cursor `/heavy` → MCP tool `run_heavy_analysis_ptc` → Node MCP server → Anthropic API (code execution) → summary only to IDE.

## Planning doc
`docs/ai/planning/feature-claude_ptc.md`

## Current iteration
**I4 — Scalability** (final iteration — all executable tasks complete)

## Next task
- **ID:** T-302
- **Title:** (Reserved for future: Context Compaction implementation when long-session design exists.)
- **Status:** 🔴 To Do — **intentionally deferred**; no action required until a long-session API design is created.

## Last approved task
- **ID:** T-401
- **Title:** Final verification: all A.C. have evidence; handoff-ready.
- **Evidence:** Table B 22/22 🟢; all tasks T-101–T-301 🟢 Reviewed/Tested; code and docs verified aligned.

## Feature completion summary
All 22 Acceptance Criteria are 🟢. All 6 executable tasks (T-101 through T-301) plus T-401 (final verification) are 🟢 Reviewed/Tested. The feature is **complete and handoff-ready**.

Key artifacts:
- `.cursor/commands/heavy.md` — `/heavy` command + IDE-agnostic contract
- `tools/claude-ptc-mcp/src/index.js` — MCP server: `run_heavy_analysis_ptc`, Elicitation, `CACHEABLE_SYSTEM_BLOCK`, scope reader, summary-only result
- `README.md` — MCP setup section (per-device install instructions)
- `docs/ai/requirements/feature-claude_ptc.md` — requirements with repeated-use + Context Compaction notes
- `docs/ai/design/feature-claude_ptc.md` — design §2.4 (repeated use & long sessions)

## Modified / uncommitted files
```
M  README.md
M  docs/ai/design/feature-claude_ptc.md
M  docs/ai/planning/feature-claude_ptc.md
M  docs/ai/requirements/feature-claude_ptc.md
?? .cursor/commands/heavy.md          (new file — untracked)
?? tools/                             (new directory — untracked, contains MCP server)
```

## Next actions
1. Run `/ship` to commit and push all changes (the prompt is ready below).
2. On a new device: `git pull`, then `cd tools/claude-ptc-mcp && npm install`, register the MCP server in Cursor (see README MCP setup section), set `ANTHROPIC_API_KEY`.
3. T-302 (Context Compaction) is reserved for a future design — only action when long-session API use is being designed.
