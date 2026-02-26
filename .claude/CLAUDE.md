# LTC 2-State Execution Engine — Claude Cowork Adapter

**Project:** LTC 2-State Execution Engine (Effective Execution build platform).

**Engine entry point:** Read `engine/SKILL.md` for full command set, rules, and doc paths. All logic lives under `engine/`; this file is the thin adapter so you can run the engine by name in Claude Cowork.

## How to Invoke State A and State B by Name

- **State A (Strategy & Planning):** Load and follow `engine/commands/state-a.md`. In discovery mode only: map UDO/UDS/UBS, System Design, Requirements, and the 4-Iteration Roadmap. Do not propose technical Nouns or write code. Stop and wait for User approval at the end of each sub-step. The canonical procedure is in `engine/skills/dev-lifecycle/references/strategy-mapping.md`.

- **State B (Execute One Micro-Task):** Load and follow `engine/commands/state-b.md`. Determine the active feature from `docs/ai/planning/feature-*.md` (Step 0 in `engine/skills/dev-lifecycle/references/execute-micro-task.md`), then execute exactly one task marked 🔴 To Do from the planning doc. Present evidence, mark the task 🔵 Draft Completed, then hard-stop. Do not proceed until the User replies **"Approved"** or gives feedback. The full procedure is in `engine/skills/dev-lifecycle/references/execute-micro-task.md`.

## Approval Phrases

| When | Reply |
| :--- | :--- |
| After State A sub-step or State B evidence | **"Approved"** |
| At iteration boundary (before next iteration) | **"Proceed to Iteration N+1"** or **"Re-plan"** |
| At /ship (commit & push) | **"Yes"** |
| At /debug fix | **"Yes"** |

Full approval table and recovery protocol: `docs/ai/Effective_Execution_Manifesto.md`.

---

*To run State A in Cowork: ask "Run State A" or "Execute State A"; the AI should load `engine/commands/state-a.md` and follow it. To run State B: ask "Run State B" or "Execute one micro-task"; the AI should load `engine/commands/state-b.md` and follow it.*
