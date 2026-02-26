# LTC 2-State Execution Engine — Single AI Entry Point

Read this file to understand and operate the full engine. All logic lives under `engine/`; no IDE-specific paths.

## What This Is

The **2-State Engine**: (1) **State A** — Strategy & Planning (UDO/UDS/UBS, requirements, design, 4-iteration roadmap); (2) **State B** — Execute exactly one micro-task from the plan, present evidence, hard-stop for User approval. No phases; two states only.

## Commands (Utility Belt)

| Command | Purpose |
| :--- | :--- |
| **State A** | `engine/commands/state-a.md` — Map problem, requirements, design, planning. No code. |
| **State B** | `engine/commands/state-b.md` — Execute one task, evidence, stop for approval. |
| **Status** | `engine/commands/status.md` — Where am I? Feature, iteration, next task. |
| **Ship** | `engine/commands/ship.md` — Propose commit; User says "Yes" to push. |
| **Debug** | `engine/commands/debug.md` — Root-cause (UBS) before touching code. |
| **Handoff** | `engine/commands/handoff.md` — Write handoff doc for next session. |
| **Review** | `engine/commands/review.md` — Iteration retrospective before "Proceed" or "Re-plan". |
| **Remember** | `engine/commands/remember.md` — Store principles in persistent memory. |
| **Help** | `engine/commands/help.md` — Decision tree of all commands. |
| **Heavy** | `engine/commands/heavy.md` — Delegate heavy analysis to PTC MCP; IDE gets summary. |

## Rules (Hard Constraints)

- **engine/rules/anti-patterns.md** — No code before design; no new deps without Resource Impact; no skip of evidence; no iteration jump without gate.
- **engine/rules/context-preservation.md** — Session re-hydration, handoff nudge, planning doc as single source of truth.
- **engine/rules/ambient-flow.md** — New feature/add-on in freeform → nudge to /state-a, populate docs, get approval before execution.

## State A & B Logic

- **State A:** `engine/skills/dev-lifecycle/references/strategy-mapping.md` — 4 sub-steps (Causal Map, System Design, Requirements, 4-Iteration Roadmap). Outputs: `docs/ai/requirements/feature-{name}.md`, `docs/ai/design/feature-{name}.md`, `docs/ai/planning/feature-{name}.md`.
- **State B:** `engine/skills/dev-lifecycle/references/execute-micro-task.md` — Step 0 (active feature), Step 1 (initialize, iteration gate), Step 2 (build), Step 3 (evidence, hard exit).

## Approval Phrases

- After State A sub-step or State B evidence → **"Approved"**
- At iteration boundary → **"Proceed to Iteration N+1"** or **"Re-plan"**
- At /ship → **"Yes"**
- At /debug fix → **"Yes"**

**Full table and recovery:** `docs/ai/Effective_Execution_Manifesto.md`.

## Holy Trinity (Docs)

- **Requirements:** `docs/ai/requirements/feature-{name}.md` (or README template)
- **Design:** `docs/ai/design/feature-{name}.md` (or README template)
- **Planning:** `docs/ai/planning/feature-{name}.md` (or README template) — Master Scope Mapping + Execution Matrix. Single source of truth for task state.

## Adding a New IDE Adapter

See `engine/README.md` for how to add Cursor, Claude Cowork, AntiGravity, or another environment. Adapters live at repo root; zero changes to `engine/` required.
