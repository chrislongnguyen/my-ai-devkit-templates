---
phase: requirements
title: Effective Requirements & System Map
description: The causal mapping of the User's reality and the deterministic constraints for the solution.
---

# PHASE 1: PROBLEM DISCOVERY (The System Map)
*Goal: Understand the human reality before introducing technology.*

* **User Persona & Anti-Persona:** **Responsible:** AI Agent (e.g. Cursor). **Accountable (Reviewer):** User. Anti-Persona: Anyone who expects open-ended AI output without User validation.
* **Ultimate Desired Outcome (UDO):** A deterministic, risk-managed development loop where Cursor executes precisely (Responsible) and the User mathematically verifies (Accountable) without needing to understand code.
* **User's Action:** Restrict the AI to a 1-to-1 task execution loop with a hard stop for User validation.

## The Drivers (UDS - Ultimate Driving System)
* **UDS:** The demand for high-leverage, low-risk venture building using AI.
* **UDS.UD (Driver of the Driver):** Complete proprietary control over the execution grammar (Verbs/Nouns/Adverbs).
* **UDS.UB (Blocker of the Driver):** Inheriting unvalidated third-party processes (the legacy 8-step lifecycle) that optimize for conventional coding volume rather than Effective Execution.

## The Blockers (UBS - Ultimate Blocking System)
* **UBS:** The natural tendency of LLMs (Cursor) to hallucinate, bloat code, and build "Zombie features" when given open-ended technical commands.
* **UBS.UD (Driver of the Blocker):** Vague execution prompts and AI self-review loops that cause hallucinations and administrative bloat.
* **UBS.UB (Blocker of the Blocker):** A strict, phase-gated Interactive SOP enforcing a 1-to-1 mapping of tasks to specific Acceptance Criteria before moving forward.

---

# PHASE 2: THE SYSTEM DESIGN (Context & Bridge)
*Goal: Define the conceptual solution space based ONLY on what we understand about the User in Phase 1.*

* **Principles (Why):** Deterministic verification (User validates against Acceptance Criteria); no AI advancement without explicit approval; grammar-owned execution (Verbs/Adverbs/Nouns/Adjectives under User control).
* **Environment (Where):** `.cursor/skills/dev-lifecycle/` (the skill directory that routes the Agent).
* **Tools (What):** 
  * *State A — Strategy Engine:* `strategy-mapping.md` (discovery and mapping of UDO/UDS/UBS).
  * *State B — Execution Loop:* `execute-micro-task.md` (1-to-1 task execution with hard stop for User validation).
  * *Routing:* `SKILL.md` updated to point only to these two states.
* **SOP (How):** Destroy the 8-step Waterfall; implement the 2-State Engine. Agent uses State A for strategy/causal map; State B for executing one micro-task at a time with validation gate.

---

# PHASE 3: THE FORMALIZATION (The Output)
*Goal: Translate the System Design into strict, deterministic engineering requirements.*

## 1. USER(S)
* **Primary User Persona:** User (Accountable). Validates task completion against Acceptance Criteria without needing to read code. AI Agent (Cursor) is Responsible for execution.
* **Anti-Persona:** Teams that rely on AI self-review or open-ended prompts without human validation gates.

## 2. DESIRED USER ACTION(S)

**Verb:** Restrict the AI to a 1-to-1 task execution loop with a hard stop for User validation.

| Acceptance Criteria |
| --- |
| AC-V1: Each run of the execution loop processes exactly one task from the planning doc. |
| AC-V2: The Agent MUST stop and present evidence that the task's Acceptance Criteria are met before the User approves. |
| AC-V3: No next task is started until the User explicitly approves (or rejects and recycles). |

**Adverbs (Effectiveness Outcomes):**

* **Sustainability Adverb:** Deterministically.
| Acceptance Criteria |
| --- |
| AC-S1: The Agent must prove the Acceptance Criteria for the current task are met before continuing. |
| AC-S2: Validation is repeatable (same task + same outcome = same pass/fail). |

* **Efficiency Adverb:** Deterministically (same as primary constraint).
| Acceptance Criteria |
| --- |
| AC-E1: No speculative or "helpful" work beyond the single task scope. |
| AC-E2: ai-devkit CLI and MCP Memory integrate without crash when the Agent is forced to stop. |

* **Scalability Adverb:** Repeatedly.
| Acceptance Criteria |
| --- |
| AC-X1: The 2-State Engine can be invoked for any feature that has a strategy map and a planning doc. |
| AC-X2: Execution grammar (Verbs/Nouns/Adverbs) is defined in one place and reused. |

## 3. FEATURE

**Noun:** The 2-State Engine — `strategy-mapping.md` (State A) + `execute-micro-task.md` (State B) + `SKILL.md` (routing brain), living in `.cursor/skills/dev-lifecycle/`.

| Acceptance Criteria |
| --- |
| AC-N1: Legacy 8-step reference files are archived; only State A and State B references are active. |
| AC-N2: SKILL.md routes the Agent only to strategy-mapping.md and execute-micro-task.md. |
| AC-N3: strategy-mapping.md enforces the UDO/UDS/UBS discovery loop. |
| AC-N4: execute-micro-task.md enforces "Stop and Validate" logic (1 task, evidence, User approval). |

**Adjectives:**

* **Sustainability Adjective:** Phase-gated, validation-gated.
| Acceptance Criteria |
| --- |
| AC-NS1: Every micro-task has explicit Acceptance Criteria in the planning doc. |
| AC-NS2: No code or doc change is committed as "done" without User sign-off on criteria. |

* **Efficiency Adjective:** Minimal, deterministic.
| Acceptance Criteria |
| --- |
| AC-NE1: No administrative or ceremonial steps; only strategy (State A) and execution (State B). |
| AC-NE2: Dummy/sandbox task proves Stop-and-Validate works with ai-devkit CLI and MCP Memory. |

* **Scalability Adjective:** Modular, grammar-driven.
| Acceptance Criteria |
| --- |
| AC-NX1: New features use the same 2-State flow (strategy map → execution loop). |
| AC-NX2: Workspace documentation updated to describe the 2-State Engine as canonical. |

---
