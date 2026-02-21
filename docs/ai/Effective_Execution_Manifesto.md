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
- **One task per run.** The Agent reads the first `🔴 To Do` task, builds the minimal deliverable, presents evidence that Acceptance Criteria are met, then stops. No next task until the Founder replies "Approved" (or gives feedback).
- **Entry:** Use `/state-b` or trigger the Dev Lifecycle Skill → State B.

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
