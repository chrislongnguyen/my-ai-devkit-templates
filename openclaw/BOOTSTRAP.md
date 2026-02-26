# BOOTSTRAP.md - First Run for OpenClaw Agent Build

Complete this once when creating a fresh OpenClaw workspace for this repo.

## 1. Workspace

- Set the OpenClaw Build agent workspace to this repository root.
- Confirm `engine/SKILL.md` is readable from the workspace.

## 2. Adapter docs in place

- `openclaw/AGENTS.md`
- `openclaw/TOOLS.md`
- `openclaw/README.md`

Use `openclaw/AGENTS.md` as the injected instruction source for Agent Build.

## 3. Runtime contract check

Validate the Build agent can:

1. Load `engine/commands/state-a.md` when asked to run State A.
2. Load `engine/commands/state-b.md` when asked to run State B.
3. Execute exactly one task and stop for approval in State B.

## 4. Approval phrase check

Validate these replies are respected:

- `Approved`
- `Proceed to Iteration N+1`
- `Re-plan`
- `Yes`

Full policy: `docs/ai/Effective_Execution_Manifesto.md`.

## 5. Optional swarm setup

If using orchestrator + sub-agents:

- Spawn Agent Build with task: execute one State B micro-task only.
- Require evidence announce back to orchestrator.
- Require approval phrase before next spawn.
