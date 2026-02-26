# Effective Execution Manifesto

This document summarizes the logic and process of the **LTC Effective Execution Engine** (2-State Engine) and our rollout strategy.

---

## The 2-State Engine

We operate a **2-State Effective Execution Engine** instead of a multi-phase waterfall. The Agent (e.g. Cursor) has exactly two modes, both under User validation.

### State A: Strategy & Planning (The Discovery Engine)
- **Purpose:** Map the causal reality of a problem and define the Execution Grammar.
- **No code.** The Agent helps the User discover UDO (Ultimate Desired Outcome), UDS (Drivers), UBS (Blockers), then derives Principles, Environment, Tools, SOP, and the 4-Iteration Roadmap.
- **Output:** Requirements, Design, and Planning docs written into `docs/ai/` using workspace templates. User approves each sub-step before the Agent continues.
- **Entry:** Use `/state-a` or trigger the Dev Lifecycle Skill → State A.

### State B: Execute One Micro-Task (The Execution Loop)
- **Purpose:** Execute exactly ONE task from the planning document, then hard-stop for User validation.
- **One task per run.** The Agent reads the planning doc (`docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md`), picks the first `🔴 To Do` task (skips `🟠 Stuck` until the User unblocks), builds the minimal deliverable, presents evidence, marks the task **🔵 Draft Completed (by the Agent)**, then stops. No next task until the User replies "Approved" (then mark **🟢 Reviewed/Tested (by the User)**) or gives feedback.
- **Task flow (solo User):** ⚪ Pending → 🔴 To Do → 🔵 Draft Completed → 🟢 Reviewed/Tested. 🟠 Stuck = off-ramp when blocked.
- **Entry:** Use `/state-b` or trigger the Dev Lifecycle Skill → State B.

**Document flow (Holy Trinity):** Requirements Phase 3 → A.C. with stable IDs; Design → architecture & attributes (maps to those A.C. and Planning iterations); Planning Master Scope Mapping → which A.C. in which iteration + deterministic evidence; Execution Matrix → tasks. All tasks require User review and approval before marking 🟢 Reviewed/Tested (last node for solo User projects).

**Utility Belt:** `/state-a` (plan), `/state-b` (execute one task), `/status` (where am I), `/review` (iteration retrospective), `/handoff` (resume later), `/ship` (commit & push), `/debug` (root-cause before fix), `/remember` (persist principles to memory), `/help` (decision tree).

**When to use which:**
- **/state-a** — New feature, change of scope, or re-planning. No code. Offers guided mode for beginners.
- **/state-b** — Execute the next task from the plan. One task, then stop.
- **/status** — "Where am I?" Snapshot of feature, iteration, tasks. Multi-feature dashboard if multiple features exist.
- **/review** — Iteration retrospective: evidence audit before advancing to the next iteration.
- **/handoff** — Prepare to resume on another device or session. Writes `project_handoff_status.md`.
- **/debug** — Something broke; root-cause (UBS) before any fix.
- **/ship** — Ready to commit; sync planning status first if needed.
- **/remember** — Capture a principle or rule for future runs (memory).
- **/help** — Not sure what to run? Prints the decision tree with all commands.

For freeform feature/add-on requests (no command invoked), the Agent follows `.cursor/rules/ambient-flow.mdc`: nudge to /state-a, help populate requirements/design/planning from the request, get approval before any execution. If scope or direction changes materially, re-run /state-a to update requirements, design, and planning before continuing with /state-b.

**User approval phrases (what to type):**

| Situation | What to type | What it does |
| :--- | :--- | :--- |
| State A sub-step approval | **"Approved"** | Agent continues to the next sub-step |
| State B task evidence | **"Approved"** | Marks task 🟢 Reviewed/Tested; agent picks next task on next /state-b |
| State B task evidence | *(type your feedback)* | Agent revises the task based on your feedback |
| Iteration transition gate | **"Proceed to Iteration N+1"** | Agent starts the next iteration |
| Iteration transition gate | **"Re-plan"** | Agent runs /state-a to reassess UDO/UDS/UBS |
| /ship commit | **"Yes"** | Agent executes git add, commit, push |
| /debug fix proposal | **"Yes"** | Agent executes the approved fix |

*Synonyms like "ok", "sure", "looks good" may work, but the canonical phrases above are guaranteed to trigger the correct agent behaviour.*

---

## Recovery Protocol (What To Do When Things Go Wrong)

*Commands (`.cursor/commands/`) and rules (`.cursor/rules/`) reference this section and the approval table above for deterministic recovery and approval phrases.*

| Situation | Recovery Steps |
| :--- | :--- |
| **I approved a task I shouldn't have** | 1. Open the planning doc and change the task status from 🟢 back to 🔴 To Do. 2. If you already ran `/ship`, use `git revert HEAD` to undo the commit. 3. Run `/state-b` — the agent will re-execute that task. |
| **The agent wrote bad code** | 1. Do NOT type "Approved." Instead, describe what's wrong in your reply. 2. The agent will revise. If the code is already approved and shipped, revert the commit (`git revert HEAD`) and re-run `/state-b`. |
| **State A generated a plan I don't like** | Run `/state-a` again with the same feature name. The agent will re-do the 4 sub-steps; you can steer it differently this time. The old docs are overwritten upon your approval. |
| **I'm stuck and confused** | Run `/status` to see where you are. Run `/help` to see all commands. If the plan itself is wrong, run `/state-a` to re-plan. |
| **The agent went off the rails mid-generation** | Stop the generation (Cmd+Backspace in Cursor or click Stop). Describe what went wrong. The anti-pattern rules will re-anchor the agent. |
| **I want to undo an entire iteration** | Change all tasks in that iteration back to 🔴 To Do in the planning doc. Revert the corresponding commits with `git revert`. Run `/state-b` to restart. |
| **The agent keeps asking me the same question** | You may have hit a context window limit. Run `/handoff` to snapshot progress, start a **new chat session**, then run `/status` or `/state-b` to continue. |

*Principle: Every action in this engine is reversible. The planning doc is your single source of truth — change the status there, and the agent follows.*

---

## Approach 2: Success = Efficient and Scalable Management of Failure Risks

We allocate resources under **Approach 2**: most effort goes to **de-risking first**, then driving output. Success is defined as the efficient and scalable management of failure risks—not as raw delivery speed. We validate the Verb and Wrapper (Concept), then the Core and Sustainability (Working Prototype), then Efficiency (MVE), then Scalability (Leadership). We do not build Scalability before proving Desirability.

---

## SCALABILITY LOG

### Path A: Master Template (Current Rollout)
**Status:** Active.

We use this repository as the **Master Template**. For every new enablement, we **clone this clean repo**. The 2-State Engine, Effective System Design framework, governance headers, and `docs/ai/` structure are already wired. No global install; each enablement is self-contained.

### Path B: Global CLI (Iceboxed / Future Scalability)
**Status:** Iceboxed.

A future option is to ship the Effective Execution Engine as a **Global CLI** (e.g. installable via npm or similar) so that any project can run State A / State B without cloning this repo. This path is **not** in scope until we have dedicated platform engineers to maintain and version the CLI.

---

*This manifesto is part of the LTC Effective Execution Engine. The canonical skill logic lives in `.cursor/skills/dev-lifecycle/` (SKILL.md, strategy-mapping.md, execute-micro-task.md).*

*For the long-term direction — the 7 milestones from "user of one AI agent" to "Orchestrator of AI Systems" — read the [Orchestrator Roadmap](Orchestrator_Roadmap.md).*
