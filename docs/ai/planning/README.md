---
phase: planning
title: Effective Execution Matrix (The 4-Iteration Roadmap)
esd_reference: docs/ai/frameworks/effective-system-design.md
note: This template captures execution sequencing. Iteration framework is ESD §6 (and §1.8 summary). System Wiki created after I4.
---

# Planning — ESD §6 Iteration Framework

> **ESD §6:** 4-stage maturity model. Each iteration is cumulative — all prior A.C.s plus new ones. No A.C. from a prior iteration may be softened, removed, or deferred.
> 
> This document captures **when** to build **what**. For full methodology (Wrapper vs Core, gates, assignment rules), see `docs/ai/frameworks/effective-system-design.md` **§6 Iteration Framework** and §1.8 Iteration Stages.

---

## Quick Reference: ESD §6 Iteration Framework

| Iteration | ESD Name | Wrapper / Core | Focus | A.C.s added this iteration |
| :--- | :--- | :--- | :--- | :--- |
| **1** | Concept | Desirable Wrapper | Sustainability only | All Verb, SustainAdv, Noun, SustainAdj. *Not* EffAdv, ScalAdv, EffAdj, ScalAdj |
| **2** | Prototype | Desirable Wrapper | Begin Efficiency | Prior I1 + some EffAdv, some EffAdj. *Not* ScalAdv, ScalAdj |
| **3** | MVE (Minimum Viable Enablement) | Effective Core | Complete Efficiency, begin Scalability | Prior I1+I2 + remaining EffAdv + some ScalAdv, remaining EffAdj + some ScalAdj |
| **4** | Leadership | Effective Core | Complete Scalability + spawned | Prior I1+I2+I3 + remaining ScalAdv, ScalAdj + **spawned A.C.s from MVE testing** |

**User tests (ESD §6):**
- **I1:** "Does the User desire this outcome when it works sustainably?"
- **I2:** "Can this be built reliably and efficiently for regular use?"
- **I3:** "Does this solve the root cause at depth and begin to scale?"
- **I4:** "Does this solve all root causes, scale fully, and endure?"

**Assignment rules (ESD §6):** (1) Sustainability A.C.s always I1. (2) Efficiency A.C.s start I2, split I2/I3 by priority. (3) Scalability A.C.s start I3. (4) Leadership (spawned) A.C.s written only after I3 testing. (5) No A.C. softened/removed/deferred once in plan.

*For UBS/UDS recursive analysis that determines this sequence, see ESD §1.3.*

---

# 1. THE ITERATIVE ROADMAP (Macro Prioritization)
*ESD §6: Sequence the engineering effort to manage risk. Never build Scalability (I4) before proving Desirability (I1).*

* **Iteration 1 — Concept (Desirable Wrapper):** Sustainability only. All Verb, SustainAdv, Noun, SustainAdj pass. Gate: all I1 A.C.s pass before I2.
  * *ESD §6:* Validates "Does the User desire this outcome when it works sustainably?"
* **Iteration 2 — Prototype (Desirable Wrapper):** Begin Efficiency. All I1 A.C.s still pass; add some EffAdv, some EffAdj. Gate: all I1 + I2 A.C.s pass before I3.
  * *ESD §6:* Validates "Can this be built reliably and efficiently for regular use?"
* **Iteration 3 — MVE: Minimum Viable Enablement (Effective Core):** Complete Efficiency, begin Scalability. Remaining EffAdv/EffAdj + some ScalAdv/ScalAdj. Gate: all I1+I2+I3 pass; **I4 A.C.s (including spawned) are now written — informed by MVE testing.**
  * *ESD §6:* Validates "Does this solve the root cause at depth and begin to scale?"
* **Iteration 4 — Leadership (Effective Core):** Complete Scalability + all A.C.s spawned from MVE testing (edge cases, recursive failures, real-world conditions). Gate: all A.C.s from all iterations pass, including spawned.
  * *ESD §6:* Validates "Does this solve all root causes, scale fully, and endure?"

## 1.2 Master Scope Mapping
*ESD §6: One single source of truth for which A.C. is tackled in which Iteration. MECE — each A.C. exactly once.*

**Scope by iteration (ESD §6):** I1 = Verb + SustainAdv + Noun + SustainAdj. I2 = some EffAdv + some EffAdj. I3 = remaining EffAdv/EffAdj + some ScalAdv/ScalAdj. I4 = remaining ScalAdv/ScalAdj + **spawned A.C.s** (discovered during MVE testing, not anticipated in I1–I3).

**Status legend:** ⚪ Pending · 🔴 To Do / In Progress · 🔵 Draft Completed (by the Agent) · 🟢 Reviewed/Tested (by the User) · 🟠 Stuck (off-ramp when blocked). 

*Task flow: Pending → To Do → Draft Completed → Reviewed/Tested. All tasks must be reviewed and approved by the User before marking Reviewed/Tested (last node for solo User projects).* 

*When syncing to company board: map To Do → TODO/READY TO DO, Draft Completed → DRAFT COMPLETED, Reviewed/Tested → REVIEWED/TESTED, Stuck → STUCK. To unblock 🟠 Stuck: User resolves (decision, resource, or dependency), then move the task back to 🔴 To Do.*

### Table A — By iteration (what's in scope per iteration)

| Iteration | A.C. IDs in scope (ESD §6) |
| :--- | :--- |
| **1 — Concept** | All Verb-ACn, SustainAdv-ACn, Noun-ACn, SustainAdj-ACn |
| **2 — Prototype** | Prior I1 + some EffAdv-ACn, some EffAdj-ACn |
| **3 — MVE** | Prior I1+I2 + remaining EffAdv/EffAdj + some ScalAdv/ScalAdj-ACn |
| **4 — Leadership** | Prior I1+I2+I3 + remaining ScalAdv/ScalAdj-ACn + **spawned A.C.s from MVE testing** |

*Use this table to see at a glance which A.C. are tackled in each iteration. For requirement text, evidence, and status, use Table B.*

### Table B — By A.C. (detail: requirement, iteration, evidence, status)

*One row per A.C. ID. Traceability: A.C. ID matches Requirements Phase 3 (User's Requirements). Spawned A.C.s get new IDs when added at I4.*

| A.C. ID | Requirement (from Req Phase 3) | Iter | Deterministic Evidence | Status |
| :--- | :--- | :--- | :--- | :--- |
| Verb-AC1 | [Requirement text from Req Phase 3] | 1 | [e.g. doc ref; T-101 approved] | 🔴 |
| SustainAdv-AC1 | [Requirement text from Req Phase 3] | 1 | [e.g. audit log; T-102 approved] | 🔴 |
| EffAdv-AC1 | [Requirement text from Req Phase 3] | 2 | [e.g. T-201 approved] | ⚪ |

*Populate from Requirements Phase 3 (Verb, Adverb, Noun, Adjective A.C.). Do not invent A.C. here. When a task is approved (🟢 in Execution Matrix), update Table B for every A.C. that task delivers: set that row's Status to 🟢 and Evidence to the task's deliverables (e.g. doc refs, `T-XXX approved`). For I4, add rows for spawned A.C.s as they are discovered during MVE testing.*

---

# 2. EXECUTION MATRIX (Micro Sequencing)
*ESD §6: Tasks derived from Master Scope Mapping. Implementation details (how) from Design §2.*

**ESD Rule:** Do not invent new scope here. Tasks are the bridge between A.C. (what) and Design (how).

**Add task rows as the feature requires; there is no maximum.** Do not self-limit the number of tasks per iteration — the planning file grows with the project.

## 2.2 Iteration Sequencing

### ITERATION 1 — CONCEPT (Desirable Wrapper)
*ESD §6: Focus — Sustainability only. All Verb, SustainAdv, Noun, SustainAdj.*

**Active A.C. in Scope:** [All Verb-ACn, SustainAdv-ACn, Noun-ACn, SustainAdj-ACn from Master Scope Mapping]

| ID | Task (Verb) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-101** | [Task Name] | Desirability / Sustainability | None | 🔴 To Do |
| **T-102** | [Task Name] | UDO + safe operation | T-101 | 🔴 To Do |

### ITERATION 2 — PROTOTYPE (Desirable Wrapper)
*ESD §6: Focus — Begin Efficiency. All I1 A.C.s still pass; add some EffAdv, some EffAdj.*

**Active A.C. in Scope:** [Prior I1 + some EffAdv-ACn, some EffAdj-ACn]

| ID | Task (Verb) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-201** | [Task Name] | Reliable, efficient build | T-102 | ⚪ Pending |

### ITERATION 3 — MVE: MINIMUM VIABLE ENABLEMENT (Effective Core)
*ESD §6: Focus — Complete Efficiency, begin Scalability. I4 A.C.s (including spawned) written after I3 testing.*

**Active A.C. in Scope:** [Prior I1+I2 + remaining EffAdv/EffAdj + some ScalAdv/ScalAdj]

| ID | Task (Verb) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-301** | [Task Name] | Root cause at depth, begin scale | T-201 | ⚪ Pending |

### ITERATION 4 — LEADERSHIP (Effective Core)
*ESD §6: Focus — Complete Scalability + all spawned A.C.s from MVE testing.*

**Active A.C. in Scope:** [Prior I1+I2+I3 + remaining ScalAdv/ScalAdj + **spawned A.C.s**]

| ID | Task (Verb) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-401** | [Task Name] | Scale fully, endure; spawned A.C.s | T-301 | ⚪ Pending |

---

# 3. RESOURCE & BUDGET TRACKER
*ESD §4: Monitor constraints mapped to Efficiency Adjectives. Update Hard Limit after User approval per Design §4 (Requesting Resources/Budget).*

| Metric | Current Usage | Hard Limit | Status |
| :--- | :--- | :--- | :--- |
| **Financial Cost (OpEx)** | $0.00 | $[Limit] | 🟢 Safe |
| **API/Token/Compute Usage** | 0 | [Limit] | 🟢 Safe |

---

## Post-Iteration 4: System Wiki Creation

**When the last task of Iteration 4 is marked 🟢, the System Wiki is created per `execute-micro-task.md` §3:**

* **Source template:** `docs/ai/frameworks/system-wiki-template.md`
* **Output:** `docs/ai/wiki/system-{name}.md`
* **Filled by:** Agent at I4 completion
* **Contains:** Document Control (§0.1), Desired Outcomes (§1), Users & Roles RACI (§2), Effective Principles (§3), Environment (§4), Tools (§5), EOP with per-step RACI (§6), Version History (§0.8)

**This is the definitive operational record.** Archive the Holy Trinity (Requirements, Design, Planning) to `docs/ai/archive/` after System Wiki is complete.

*For methodology, see `docs/ai/frameworks/effective-system-design.md` **§6 Iteration Framework** and §1.8 Iteration Stages, and `docs/ai/frameworks/system-wiki-template.md`.*
