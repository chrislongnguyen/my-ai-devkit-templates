# Effective Execution Manifesto

This document summarizes the logic and process of the **LTC Effective Execution Engine** (2-State Engine) and our rollout strategy.

---

## The 2-State Engine

We operate a **2-State Effective Execution Engine** instead of a multi-phase waterfall. The Agent (e.g. Cursor) has exactly two modes, both under Founder validation.

### State A: Strategy & Planning (The Discovery Engine)
- **Purpose:** Map the causal reality of a problem and define the Execution Grammar.
- **No code.** The Agent helps the Founder discover UDO (Ultimate Desired Outcome), UDS (Drivers), UBS (Blockers), then derives Principles, Environment, Tools, SOP, and the 4-Iteration Roadmap.
- **Output:** Requirements, Design, and Planning docs written into `docs/ai/` using workspace templates. Founder approves each sub-step before the Agent continues.
- **Entry:** Use `/state-a` or trigger the Dev Lifecycle Skill → State A.

### State B: Execute One Micro-Task (The Execution Loop)
- **Purpose:** Execute exactly ONE task from the planning document, then hard-stop for Founder validation.
- **One task per run.** The Agent reads `docs/ai/planning/README.md`, picks the first `🔴 To Do` task (skips `🟠 Stuck` until the Founder unblocks), builds the minimal deliverable, presents evidence, marks the task **🔵 Draft Completed (by the Agent)**, then stops. No next task until the Founder replies "Approved" (then mark **🟢 Reviewed/Tested (by the User)**) or gives feedback.
- **Task flow (solo Founder):** ⚪ Pending → 🔴 To Do → 🔵 Draft Completed → 🟢 Reviewed/Tested. 🟠 Stuck = off-ramp when blocked.
- **Entry:** Use `/state-b` or trigger the Dev Lifecycle Skill → State B.

**Document flow (Holy Trinity):** Requirements Phase 3 → A.C. with stable IDs; Design → architecture & attributes (maps to those A.C. and Planning iterations); Planning Master Scope Mapping → which A.C. in which iteration + deterministic evidence; Execution Matrix → tasks. All tasks require User review and approval before marking 🟢 Reviewed/Tested (last node for solo Founder projects).

**Utility Belt:** `/state-a` (plan), `/state-b` (execute one task), `/ship` (commit & push), `/debug` (root-cause before fix), `/remember` (persist principles to memory).

**When to use which:**
- **/state-a** — New feature, change of scope, or re-planning. No code.
- **/state-b** — Execute the next task from the plan. One task, then stop.
- **/debug** — Something broke; root-cause (UBS) before any fix.
- **/ship** — Ready to commit; sync planning status first if needed.
- **/remember** — Capture a principle or rule for future runs (memory).

For freeform feature/add-on requests (no command invoked), the Agent follows `.cursor/rules/ambient-flow.mdc`: nudge to /state-a, help populate requirements/design/planning from the request, get approval before any execution. If scope or direction changes materially, re-run /state-a to update requirements, design, and planning before continuing with /state-b.

---

## Approach 2: Success = Efficient and Scalable Management of Failure Risks

We allocate resources under **Approach 2**: most effort goes to **de-risking first**, then driving output. Success is defined as the efficient and scalable management of failure risks—not as raw delivery speed. We validate the Verb and Wrapper (Concept), then the Core and Sustainability (Working Prototype), then Efficiency (MVE), then Scalability (Leadership). We do not build Scalability before proving Desirability.

---

## SCALABILITY LOG

### Path A: Master Template (Current Rollout)
**Status:** Active.

We use this repository as the **Master Template**. For every new venture, we **clone this clean repo**. The 2-State Engine, Effective System Design framework, governance headers, and `docs/ai/` structure are already wired. No global install; each venture is self-contained.

### Path B: Global CLI (Iceboxed / Future Scalability)
**Status:** Iceboxed.

A future option is to ship the Effective Execution Engine as a **Global CLI** (e.g. installable via npm or similar) so that any project can run State A / State B without cloning this repo. This path is **not** in scope until we have dedicated platform engineers to maintain and version the CLI.

---

*This manifesto is part of the LTC Effective Execution Engine. The canonical skill logic lives in `.cursor/skills/dev-lifecycle/` (SKILL.md, strategy-mapping.md, execute-micro-task.md).*
