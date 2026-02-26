# Engine — Portable Core

This folder is the **single source of truth** for all 2-State Engine logic. Any AI agent (in any IDE or CLI) reads `engine/SKILL.md` as the entry point.

## Structure

- **SKILL.md** — Single AI entry point (commands, rules, approval phrases, doc paths).
- **commands/** — All command logic (state-a, state-b, status, ship, debug, handoff, review, remember, help, heavy).
- **rules/** — Hard rules (anti-patterns, context-preservation, ambient-flow).
- **skills/dev-lifecycle/** — State A/B references (strategy-mapping, execute-micro-task, worktree-setup) and scripts.

## Adding a New IDE Adapter

To support a new environment (e.g. Cursor, Claude Cowork, AntiGravity, OpenClaw, another CLI):

1. **Create an adapter at repo root** — e.g. a Cursor adapter folder, a Claude adapter folder, an AntiGravity adapter folder, or an OpenClaw adapter folder. The adapter is a thin layer: one-line description + pointer to `engine/SKILL.md` or to the specific `engine/commands/{name}.md` the user invoked.
2. **Add one paragraph to the repo README** — "Using this engine in [Environment]: [exact steps to point the environment at engine/SKILL.md or at the command files]."
3. **Zero changes to engine/** — This folder stays environment-agnostic. No hardcoded paths to any IDE.

No logic is duplicated; the adapter only points inward to `engine/`.
