# OpenClaw adapter

This folder contains the OpenClaw-specific adapter for the LTC 2-State Execution Engine.

The canonical engine logic remains in `engine/`. OpenClaw adapter files only tell OpenClaw agents how to load and execute that logic correctly.

## Files

- `AGENTS.md` - primary runtime instructions for an OpenClaw Build agent.
- `TOOLS.md` - tool policy guidance for reliable State A/State B execution.
- `BOOTSTRAP.md` - first-run setup checklist for a fresh OpenClaw workspace.
- `openclaw.json.example` - minimal agent + tool configuration example.

## Entry point

For OpenClaw Agent Build sessions, the entry point is `engine/SKILL.md`.

## Operating contract

1. State A: load `engine/commands/state-a.md` and run discovery only.
2. State B: load `engine/commands/state-b.md` and execute exactly one task.
3. Present deterministic evidence.
4. Hard-stop and wait for approval phrases:
   - `Approved`
   - `Proceed to Iteration N+1` or `Re-plan`
   - `Yes` (ship/debug gates)

See `docs/ai/Effective_Execution_Manifesto.md` for the full gate table.
