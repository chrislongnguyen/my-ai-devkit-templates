---
phase: planning
title: Effective Execution Matrix (The 4-Iteration Roadmap)
description: Strict prioritization and sequencing of tasks to manage failure risks scalably, moving from Concept to Leadership.
---

# 1. THE ITERATIVE ROADMAP (Macro Prioritization)
*Goal: Sequence the engineering effort to manage risk. Do not build Scalability (Iteration 4) before proving Desirability (Iteration 1).*

* **Iteration 1: Concept (Housekeeping):** Archive the legacy 7 steps. Create the blank strategy-mapping and execute-micro-task files. Update SKILL.md to point to them.
* **Iteration 2: Working Prototype (Sandbox Test):** Write the "Stop and Validate" logic inside execute-micro-task.md. Run a dummy task to prove the ai-devkit CLI and MCP Memory do not crash when the AI is forced to stop.
* **Iteration 3: MVE:** Write the full prompt logic for strategy-mapping.md to enforce the UDO/UDS/UBS discovery loop.
* **Iteration 4: Leadership:** Lock the files and update the overarching workspace documentation.

---

# 2. EXECUTION MATRIX (Micro Sequencing)
*Pull the specific Nouns, Verbs, Adverbs, and Adjectives directly from the Requirements and Design docs. Do not invent new features here.*

## ITERATION 1: CONCEPT (Housekeeping)
*Focus: Archive legacy steps; create blank State A/B files; update SKILL.md routing.*
| ID | Task (Verb) | Target Grammar (From Requirements) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **T-101** | **Archive** legacy 8-step reference files (e.g. to `references/archive/` or equivalent) | **Noun:** 2-State Engine; **AC-N1** | Desirability / Clean slate | None | 🔴 To Do |
| **T-102** | **Create** blank `strategy-mapping.md` and `execute-micro-task.md` in `references/` | **Noun:** State A, State B | Structure in place | T-101 | 🔴 To Do |
| **T-103** | **Update** SKILL.md to route only to strategy-mapping.md and execute-micro-task.md | **Noun:** SKILL.md routing; **AC-N2** | Routing correctness | T-102 | 🔴 To Do |

## ITERATION 2: WORKING PROTOTYPE (Sandbox Test)
*Focus: "Stop and Validate" logic; prove ai-devkit CLI and MCP Memory do not crash when Agent stops.*
| ID | Task (Verb) | Target Grammar (From Requirements) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **T-201** | **Write** "Stop and Validate" prompt logic in execute-micro-task.md (1 task, evidence, wait for approval) | **Verb:** Restrict; **AC-V2, AC-S1** | Determinism / Sustainability | T-103 | 🔴 To Do |
| **T-202** | **Run** a dummy micro-task with Stop-and-Validate; confirm ai-devkit CLI and MCP Memory do not crash | **Efficiency Adverb:** Deterministically; **AC-E2, AC-NE2** | Technical feasibility | T-201 | 🔴 To Do |

## ITERATION 3: MINIMUM VIABLE ENABLEMENT (MVE)
*Focus: Full UDO/UDS/UBS discovery loop in strategy-mapping.md.*
| ID | Task (Verb) | Target Grammar (From Requirements) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **T-301** | **Write** full prompt logic in strategy-mapping.md to enforce UDO/UDS/UBS discovery loop (aligned to effective-system-design.md) | **Noun:** State A; **AC-N3** | Strategy Engine completeness | T-202 | 🟢 Done |

## ITERATION 4: ENABLEMENT LEADERSHIP
*Focus: Lock files; update workspace documentation.*
| ID | Task (Verb) | Target Grammar (From Requirements) | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **T-401** | **Lock** the skill reference files (document as canonical; optional: permissions or branch protection) | **Scalability Adjective:** Modular; **AC-NX1** | Governance | T-301 | 🟢 Done |
| **T-402** | **Update** overarching workspace documentation to describe the 2-State Engine as canonical | **AC-NX2** | Repeatability / Handoff | T-401 | 🟢 Done |
| **T-403** | **Replace** legacy 8-phase slash commands with /state-a and /state-b only | **AC-NX2** | Command surface | T-402 | 🟢 Done |

---

# 3. RESOURCE & BUDGET TRACKER
*Monitor constraints mapped to the Efficiency Adjectives.*
| Metric | Current Usage | Hard Limit | Status |
| :--- | :--- | :--- | :--- |
| **Financial Cost (OpEx)** | $0.00 | $0 | 🟢 Safe |
| **API/Token/Compute Usage** | 0 | N/A | 🟢 Safe |

---
