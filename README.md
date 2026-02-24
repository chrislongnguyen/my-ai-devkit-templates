# 🏭 LTC The Effective Execution Engine

> *"Success is not the maximization of output. It is the efficient and scalable management of failure risks."* — Approach 2

Welcome to the **Long Term Capital (LTC) Venture Factory Master Template**. 

This is not a standard software engineering boilerplate. It is a proprietary, AI-first venture building environment designed specifically for Solo Users. It strips away the administrative bloat of traditional Software Development Life Cycles (SDLC) and replaces it with a relentless, mathematically verified execution loop.

## 📖 The Philosophy: Why This Exists

Most startups fail because they operate on **Approach 1**: They optimize for direct value creation (writing a lot of code, building a lot of features) under the assumption that their idea is always correct. This leads to the ultimate startup killer: *Building in Isolation*. 

This workspace is strictly engineered on **Approach 2 (The 90/10 Rule)**: 90% of our resources are spent identifying and neutralizing failure risks; 10% on output delivery. We apply the **Chinese Venture Playbook**—where execution speed and extreme founder proximity beat idea quality—fused with the **High-frequency Hypothesis-Driven Learning Loop (HFVLL)**.

We do not write code until the psychological reality of the User is mapped. We do not advance to the next task until the current task is mathematically proven.

---

## ⚙️ The Engine: How It Works

We have destroyed the traditional 8-step Waterfall engineering methodology. This workspace operates on a hyper-agile **2-State Engine**, driven by the User (Accountable) and the AI Agent (Responsible).

### State A: Strategy & Planning (The Discovery Engine)
Before any Noun (code/feature) is built, the AI acts as a Venture Architect to map the causal reality:
1. **The System Map:** Discover the User's Ultimate Desired Outcome (**UDO**), the forces driving them (**UDS**), and the forces blocking them (**UBS**).
2. **The System Design:** Define the Principles, Environment, Tools, and SOP.
3. **The User's Requirements:** Strict translation of psychology into technology using Verbs (Action), Adverbs (Effective Outcomes: Sustainability, Efficiency, Scalability),  Nouns (Tools/Solution/Enablement) , and Adjectives (Attributes of Noun).
4. **The 4-Iteration Roadmap:** Tasks are sequenced strictly by iteration: Concept ➔ Prototype ➔ MVE ➔ Leadership.

### State B: The Micro-Execution Loop (The User Gate)
The AI executes exactly **ONE** micro-task from the Planning Matrix at a time. It builds the minimal viable code, presents the exact Evidence of Truth to prove the Acceptance Criteria is met, and then **HARD STOPS**. The AI cannot proceed until the User explicitly approves.

---

## 🚀 Quick Start Guide

To start building a new feature, database, or venture, open your AI IDE (Cursor) and use your custom Utility Belt:

* **`/state-a`** — Start here. Tell the AI what you want to build. It will guide you through the psychological mapping and generate your pristine `requirements`, `design`, and `planning` docs. *First-time users: the agent will ask if you want guided mode with examples or expert mode.* Searches `@ai-devkit/memory` for relevant principles before the Causal Map.
* **`/state-b`** — Run this to execute the plan. The AI will do one task, prove it works, and wait for your approval. Before starting a new iteration, the agent will ask you to confirm "Proceed to Iteration N+1" or "Re-plan" (iteration transition gate).
* **`/status`** — "Where am I?" Quick snapshot: active feature, current iteration, next task, last approved task and evidence, task counts. If multiple features exist, shows a **Feature Dashboard** first. Reports template version (see `.template-version` and `CHANGELOG.md`).
* **`/review`** — Iteration retrospective: shows all evidence from a completed iteration, which A.C. are validated, open risks, and asks if the UDO still holds before you advance. Run before deciding "Proceed" or "Re-plan."
* **`/handoff`** — Generate `project_handoff_status.md` with active feature, next task, modified files, and next actions so the next session can resume with minimal context loss.
* **`/ship`** — Ready to save your progress? Run this. The AI will read the git status, draft a clean commit message, and safely push your code after you say "Yes."
* **`/debug`** — Hit a bug? Do not guess. Run this to force the AI into a Root-Cause Analysis to identify the Ultimate Blocking System (UBS) before changing any code.
* **`/remember`** — Push new First-Principles or venture rules into the persistent AI memory server (`@ai-devkit/memory`).
* **`/help`** — Not sure what to run? This prints a simple decision tree of all commands with when to use each one.

**Guard rails:**
- **Anti-pattern rule** (`.cursor/rules/anti-patterns.mdc`): no code before design, no new dependencies without Design §4, no scope creep outside A.C., no skip of evidence in State B, no iteration jump without the gate.
- **Context preservation** (`.cursor/rules/context-preservation.mdc`): agent re-reads planning docs at every session start, nudges `/handoff` after 3 approved tasks, reminds before `/ship` if no handoff exists. Ensures you never lose progress across sessions or devices.

**Approval phrases:** The agent waits for specific words at each gate. See the [Manifesto](docs/ai/Effective_Execution_Manifesto.md) for the full table. Quick reference: **"Approved"** (State A/B), **"Proceed to Iteration N+1"** or **"Re-plan"** (iteration gate), **"Yes"** (/ship, /debug).

**New venture checklist:** 1. Clone this repo (or duplicate the folder). 2. Open in Cursor. 3. Run **/help** to see all commands. 4. Run **/state-a** and give the feature/venture name; complete the four sub-steps. 5. Run **/state-b** to execute the first task; approve and repeat. *See [docs/ai/examples/walkthrough.md](docs/ai/examples/walkthrough.md) for a complete end-to-end example.*

---

## 📂 The Holy Trinity (Documentation)

You will notice there are no folders for testing, implementation, deployment, or monitoring. Those are *Actions*, not *Documents*. The `docs/ai/archive/` folder is historical only; do not edit. Live docs are `docs/ai/requirements/`, `docs/ai/design/`, and `docs/ai/planning/`.

Our state is managed entirely within `docs/ai/` via three canonical templates:
1.  **`requirements-README.md`**: The System Map & Grammar (Phase 3: A.C. with stable IDs — Verb-AC1, SustainAdv-AC1, etc.).
2.  **`design-README.md`**: The Architecture & Adjectives (maps to Requirements A.C. and Planning iterations; defines how to build).
3.  **`planning-README.md`**: The 4-Iteration Execution Matrix (Master Scope Mapping = which A.C. in which iteration + evidence; tasks per iteration).

*Document flow:* Requirements Phase 3 → A.C.; Design → architecture & attributes; Planning Master Scope → which A.C. in which iteration + deterministic evidence; Execution Matrix → tasks. *For full operational details, read the [Effective Execution Manifesto](docs/ai/Effective_Execution_Manifesto.md).*

**New to the terminology?** The [Effective System Design Framework](docs/ai/frameworks/effective-system-design.md) contains a **Glossary** of every term used in this workspace (UDO, UBS, Verb, Noun, A.C., MECE, etc.) with plain-English definitions, plus the full 3-Phase framework the engine is built on.

**Where does this template lead?** The [Orchestrator Roadmap](docs/ai/Orchestrator_Roadmap.md) defines the path from using one AI agent to directing an AI system — the 7 milestones, in sequence, with a `/state-a` action plan for each. This is the AI Accountability path: maximum control, minimum human overhead.

---
**⚠️ CANONICAL SOURCE:** This repository is the LTC Master Template. To start a new venture, clone or duplicate this folder. Do not overwrite the underlying `.cursor/skills/` logic without explicit User approval.
