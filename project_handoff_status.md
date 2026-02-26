# Project Handoff Status
*Generated: 2026-02-20. Use /status for a quick snapshot; use this file for full handoff.*

## Active feature
engine-hardening

## Planning doc
`docs/ai/planning/feature-engine-hardening.md`

## Current iteration
**3 — MVE (Minimum Viable Enablement)**

## Next task
- **ID:** T-304
- **Title:** Create `tests/` with `tests/run-tests.sh` (discovery script), `tests/README.md`, `/test-write` command (Test Agent), `/test` command; `/ship` remains commit-only. Verify test authoring flow and no-runner / with-runner cases.
- **Status:** ⚪ Pending

## Last approved task
- **ID:** T-303
- **Evidence:** T-303 approved; all `engine/commands/*.md` ≤ 30 lines; active-feature logic canonical in execute-micro-task Step 0; handoff/status/review use See: pointer. EffAdv-AC3 🟢 in Table B.

## Modified / uncommitted files
- **Staged (changes to be committed):** Deletions of legacy_codeaholic, ai-devkit vestiges, docs/ai/archive/* (many files).
- **Not staged:** Modified — .cursor/commands/* (debug, handoff, heavy, help, remember, review, ship, state-a, state-b, status), .cursor/skills/.../strategy-mapping.md, CHANGELOG.md, README.md, docs/ai/Effective_Execution_Manifesto.md, docs/ai/Orchestrator_Roadmap.md, docs/ai/design/feature-engine-hardening.md, docs/ai/examples/walkthrough.md, docs/ai/frameworks/effective-system-design.md, docs/ai/planning/README.md, docs/ai/planning/feature-engine-hardening.md, docs/ai/requirements/feature-engine-hardening.md, tools/claude-ptc-mcp/test-protocol.md.
- **Untracked:** .antigravity/, .claude/, .cursor/commands/test.md, CLAUDE.md, check-engine.sh, docs/ai/archive/, docs/ai/examples/*-evidence.md (several), engine/, openclaw/, scripts/, setup.sh.

## Next actions
1. Run `/state-b` to execute T-304 (set T-304 to 🔴 To Do first if needed, then implement test skeleton: tests/, run-tests.sh, /test-write, /test, tests/README.md).
2. Optionally run `/ship` to commit and push after staging Holy Trinity + code (pre-commit requires requirements + design + planning in same commit when code is staged).
