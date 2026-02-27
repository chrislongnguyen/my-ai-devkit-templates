# LTC Effective Execution Engine

This repo is the Master Template for AI-first enablement building. It uses a 2-State Engine: plan in State A, execute one task at a time in State B, with approval gates so you stay in control.

**Why:** Most failure comes from building before de-risking. This engine forces you to map the problem (State A), then execute in small, proven steps (State B), so you neutralize risks before scaling output.

---

## What to do first

1. Clone this repo (or duplicate the folder) and open it in Cursor.
2. Run **`/help`** to see all commands.
3. Run **`/state-a`** and give your feature or enablement name; complete the four sub-steps to produce requirements, design, and planning.
4. Run **`/state-b`** to execute the first task; the agent will stop for your **"Approved"** after each task. At iteration boundaries, reply **"Proceed to Iteration N+1"** or **"Re-plan"**.
5. Use **`/status`** anytime to see active feature, iteration, and next task. Use **`/handoff`** before leaving so the next session can resume from `project_handoff_status.md`. Use **`/ship`** when you are ready to commit and push (you say **"Yes"** to execute).

**Guardrails:** The agent follows anti-pattern rules (no code before design, no new deps without Design §4, no iteration jump without the gate) and context-preservation (re-reads planning at session start, nudges handoff before ship). Approval phrases: see [Effective Execution Manifesto](docs/ai/Effective_Execution_Manifesto.md) — **"Approved"** (State A/B), **"Proceed to Iteration N+1"** or **"Re-plan"** (gate), **"Yes"** (/ship, /debug).

| Command | What it does |
| :--- | :--- |
| `/state-a` | Map problem and scope; output requirements, design, planning. No code. |
| `/state-b` | Execute one task from the plan, show evidence, stop for your approval. |
| `/status` | Show active feature, iteration, next task, progress. |
| `/test-write` | Test Agent writes AC-TEST-MAP from approved Holy Trinity (run once after State A). |
| `/test` | Run tests via `tests/run-tests.sh` at each iteration boundary (+ regression). |
| `/ship` | Propose commit; you say "Yes" to push. Git only — does not run tests. |
| `/review` | Iteration retrospective; run before "Proceed to Iteration N+1". |
| `/handoff` | Write `project_handoff_status.md` for the next session. |
| `/debug` | Root-cause (UBS) before changing code. |
| `/remember` | Store principles in persistent memory. |
| `/help` | Decision tree of all commands. |
| `/heavy` | Delegate heavy analysis to PTC MCP (requires local MCP setup). |

---

## MCP setup (per device)

To use **`/heavy`**: ensure `tools/claude-ptc-mcp/` is present, run `cd tools/claude-ptc-mcp && npm install`, copy `.env.example` to `.env` and set `ANTHROPIC_API_KEY`, then restart Cursor. Server is pre-registered in `.cursor/mcp.json`.

---

## Other environments

**AntiGravity:** Open this repo and set the AI entry point to **`engine/SKILL.md`**. Invoke State A and State B by name; use the same approval phrases. No changes to `engine/` required.

**OpenClaw:** Use **`engine/SKILL.md`** as entry point and the adapter pack in `openclaw/`. Agent Build runs State B for one task then stops for approval. No changes to `engine/` required.

**Claude (Cowork, etc.):** Canonical adapter is `.claude/CLAUDE.md`; root `CLAUDE.md` is a pointer for auto-load.

---

## Docs and glossary

Live docs live in **`docs/ai/requirements/`**, **`docs/ai/design/`**, and **`docs/ai/planning/`** (the Holy Trinity). Archive is `docs/ai/archive/` — historical only. For terms (UDO, UBS, Verb, Noun, A.C., etc.) and the 3-Phase framework, see the [Effective System Design Framework](docs/ai/frameworks/effective-system-design.md) Glossary. For the full process and approval table, see [Effective Execution Manifesto](docs/ai/Effective_Execution_Manifesto.md). For the path from one agent to directing a system, see [Orchestrator Roadmap](docs/ai/Orchestrator_Roadmap.md).

**New enablement:** Clone → open in Cursor → `/help` → `/state-a` (give feature name) → `/state-b` (execute, approve, repeat). See `new-enablement-checklist.md`; see [walkthrough](docs/ai/examples/walkthrough.md) for an end-to-end example.

**Adding more capabilities (multi-feature):** When a live product (e.g. already at I4) needs new capabilities, start a new **feature set**: create `docs/ai/requirements/feature-{name}.md`, `docs/ai/design/feature-{name}.md`, `docs/ai/planning/feature-{name}.md` and run State A for that feature. Each feature has its own full I1→I4 cycle. Multiple feature sets coexist in one repo; the active feature is the one whose planning doc is used by `/state-b` (see execute-micro-task Step 0). Worked example: [Two features in one repo](docs/ai/examples/multi-feature-coexisting.md).
