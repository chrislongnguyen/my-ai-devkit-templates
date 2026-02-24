---
phase: requirements
title: Requirements & Problem Understanding
description: Clarify the problem space, gather requirements, and define success criteria
---

# 1. EFFECTIVE REQUIREMENTS (User Actions)

## 1.1 The Problem Space
**What problem are we solving?**
- **Core Pain Point:** The workspace uses ai-devkit with custom phase templates (Requirements, Design, Planning) and a handoff protocol. Upgrading to or adopting ai-devkit v0.13.0 features (Persistent Memory via MCP, Skills system) must not overwrite or reset those custom assets; we need to merge new capabilities while preserving existing logic.
- **Current Workaround:** Staying on older tooling or manually re-applying customisations after any init/upgrade risks drift and rework.

## 1.2 The Actor
- **User(s):** Developer/maintainer of this workspace (human) and AI agents (Cursor, etc.) that consume `docs/ai/` and `docs/project_handoff.md`.

## 1.3 Desired User Action (The Goal)
* **Verb (The Core Action):** **Integrate** ai-devkit v0.13.0 features (Persistent Memory via MCP, Skills system) into this existing workspace.
    * *Acceptance Criteria 1:* Persistent Memory (MCP) is available and usable by agents in this workspace.
    * *Acceptance Criteria 2:* Skills system is configured and usable (e.g. skills discoverable and applicable where intended).
    * *Acceptance Criteria 3:* All existing custom markdown templates in `docs/ai/` (Requirements, Design, Planning) and `docs/project_handoff.md` are unchanged unless explicitly edited by the user.
    * *Acceptance Criteria 4:* "Approach 2" resource allocation (90% minimising failure risks, 10% driving output) is preserved in process and documentation.

### Effectiveness Constraints (The "How")
* **Sustainability Adverbs (Safety/Risk):** Do this **Securely** and without regressing existing behaviour.
    * *Constraint/Adverb:* Securely (no overwrite of user-owned templates or handoff protocol).
    * *Acceptance Criteria:* No automated init/upgrade step overwrites `docs/ai/requirements/README.md`, `docs/ai/design/README.md`, `docs/ai/planning/README.md`, or `docs/project_handoff.md`; any merge uses explicit, reviewable steps.
    * *Constraint/Adverb:* Correctly (preserve Approach 2).
    * *Acceptance Criteria:* Success definition remains: Efficient and Scalable managing of failure risks = 90% resources on minimising failure risks, 10% driving output; reflected in docs and workflow.

* **Efficiency Adverbs (Utility/Speed):** Integrate without unnecessary rework.
    * *Adverb:* Efficiently.
    * *Acceptance Criteria:* Use ai-devkit v0.13.0 "template mode for init with YAML/JSON support" (or equivalent) to merge new capabilities without manual re-copying of custom template content.

* **Scalability Adverbs (Growth):** Integration should be repeatable and maintainable.
    * *Adverb:* Repeatably.
    * *Acceptance Criteria:* Future ai-devkit updates can be evaluated with the same preservation rules (templates + Approach 2).

## 1.4 Non-Goals
- **Out of Scope:** Rewriting or replacing the custom phase templates with upstream defaults; changing the definition of "Approach 2" (90/10); introducing init flows that overwrite `docs/project_handoff.md` or `docs/ai/` README templates.

## 1.5 Approach 2 (Invariant to Preserve)
- **Definition:** Success = Efficient and Scalable managing of failure risks = **90% resources spent on minimising failure risks**, **10% driving output**.
- **Requirement:** This logic must remain 100% preserved in process, documentation, and any new ai-devkit integration (e.g. Skills, Memory, or init/template behaviour).

## 1.6 Open Questions / Investigation
- **Template mode for init (YAML/JSON):** **Resolved.** See `docs/ai/design/feature-ai-devkit-v013-integration.md` §1.2. Use `ai-devkit init -t <path>` with a template that omits `phases` or sets `phases: []` so that only environments and skills are applied; phase files in `docs/ai/` are never copied and existing templates are preserved.
- **Persistent Memory (MCP):** Addressed in design: Cursor connects to @ai-devkit/memory via `.cursor/mcp.json` (stdio); no change to `docs/ai/` or handoff unless user edits.
- **Skills system:** How Skills are registered and used in this workspace; whether any Skill content should encode or reference Approach 2.
