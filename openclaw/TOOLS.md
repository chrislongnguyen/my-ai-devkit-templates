# TOOLS.md - OpenClaw Tool Policy for Engine Execution

This file defines practical tool usage guidance for OpenClaw Agent Build.

## Required capabilities

Use a tool profile that supports:

- file reads/writes/edits (`group:fs`)
- command execution for validation (`group:runtime`)
- optional session tooling for orchestration (`group:sessions`)

In OpenClaw terms, `tools.profile: "coding"` is a suitable baseline.

## State A tool policy

- Prefer reading docs and planning files.
- Avoid code edits except docs needed by State A outputs.
- No speculative implementation work.

## State B tool policy

- Execute one task only.
- Run only the checks needed to prove the active acceptance criteria.
- Present exact evidence, then stop for approval.

## Guardrail policy

- Never skip deterministic evidence output.
- Never jump iterations without explicit gate approval.
- Never run destructive git commands without explicit user request.

## Sub-agent policy

When orchestrated via `sessions_spawn`:

1. Sub-agent runs one State B task.
2. Sub-agent announces evidence summary and status.
3. Parent waits for user approval phrase.
4. Parent spawns next run only after approval.
