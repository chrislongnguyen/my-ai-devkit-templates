# Dev Lifecycle — 2-State Execution Engine

This skill has **two states only**. There are no phases. Load only the reference file for the state the user is in.

## State A: Strategy & Planning
**Reference:** [references/strategy-mapping.md](references/strategy-mapping.md)

Use when the user needs to **map UDO/UDS/UBS** and produce or update **planning** (strategy, causal map, task breakdown). No code execution; discovery and doc production only.

## State B: Execute One Micro-Task
**Reference:** [references/execute-micro-task.md](references/execute-micro-task.md)

Use when the user needs to **execute a single micro-task** from the planning doc. The Agent runs exactly one task, presents evidence that its Acceptance Criteria are met, then **hard-stops** and waits for User validation. Do not proceed to the next task until the User explicitly approves.

## Worktree Setup (Shared)
For a new feature start, apply the shared worktree setup in [references/worktree-setup.md](references/worktree-setup.md) before strategy or execution work.

## Rules
- Read existing `docs/ai/` before changes. Keep diffs minimal.
- Use mermaid diagrams for architecture visuals.
- State B: one task per run; stop for User approval; no speculative next steps.
