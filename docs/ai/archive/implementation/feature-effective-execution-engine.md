---
phase: implementation
title: Implementation Guide
description: Technical implementation notes, patterns, and code guidelines
---

# Implementation Guide

## Development Setup
**How do we get started?**

- No extra prerequisites: Cursor, existing `.cursor/skills/dev-lifecycle/` and ai-devkit (CLI + MCP Memory) already in place.
- Work in `feature-effective-execution-engine` branch/worktree; changes are under `.cursor/skills/dev-lifecycle/references/` and workspace docs.

## Code Structure
**How is the code organized?**

- `.cursor/skills/dev-lifecycle/SKILL.md` — routing brain (points only to strategy-mapping.md and execute-micro-task.md).
- `.cursor/skills/dev-lifecycle/references/strategy-mapping.md` — State A (UDO/UDS/UBS discovery loop).
- `.cursor/skills/dev-lifecycle/references/execute-micro-task.md` — State B (1-to-1 task, Stop and Validate).
- Legacy reference files archived per T-101 (e.g. `references/archive/`).

## Implementation Notes
**Key technical details to remember:**

### Core Features
- **Iteration 1:** Archive legacy files; create blank State A/B; update SKILL.md.
- **Iteration 2:** Write Stop-and-Validate logic in execute-micro-task.md; run dummy task with ai-devkit CLI + MCP Memory.
- **Iteration 3:** Write full UDO/UDS/UBS prompt logic in strategy-mapping.md.
- **Iteration 4:** Lock files; update workspace documentation (e.g. project_handoff_status.md, implementation doc).

### Patterns & Best Practices
- All prompts must enforce 1-to-1 task-to-Acceptance-Criteria mapping; hard stop for Founder approval.
- Align strategy-mapping.md to `docs/ai/frameworks/effective-system-design.md` Phase 1 and Phase 2.

## Integration Points
**How do pieces connect?**

- ai-devkit CLI: skill add, init, memory store/search — used where needed; must not crash when Agent stops mid-flow.
- MCP Memory: governance rules; Agent may read/store knowledge; Stop-and-Validate must not break MCP connection.

## Error Handling
**How do we handle failures?**

- If dummy task (T-202) shows CLI or MCP crash on stop: document failure mode and adjust execute-micro-task.md (e.g. explicit "pause and wait for user message" wording).

## Security Notes
**What security measures are in place?**

- No new secrets. Skill files are markdown prompts; Founder retains Accountable role for all validation.
