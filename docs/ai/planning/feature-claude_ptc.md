---
phase: planning
title: Effective Planning & Execution Matrix — claude_ptc
description: Master Scope Mapping and Execution Matrix so every A.C. is covered by exactly one task.
---

# 1. MASTER SCOPE MAPPING (Table A)
*Goal: Assign every A.C. to exactly one iteration so nothing is orphaned.*

| Iteration | A.C. IDs assigned to this iteration |
| :--- | :--- |
| **I1 — Wrapper (Verb & Trigger)** | Verb-AC1, Verb-AC2, Verb-AC3, ScalAdj-AC2 |
| **I2 — Core & Sustainability** | SustainAdv-AC1, SustainAdv-AC2, SustainAdj-AC1, SustainAdj-AC2 |
| **I3 — Efficiency** | EffAdv-AC1, EffAdv-AC2, EffAdv-AC3, EffAdj-AC1, EffAdj-AC2 |
| **I4 — Scalability** | ScalAdv-AC1, ScalAdv-AC2, ScalAdj-AC1 |

---

# 2. A.C. COVERAGE (Table B)
*Goal: One row per A.C.; every row has an iteration and an evidence placeholder.*

| A.C. ID | Requirement text (summary) | Iter | Evidence | Status |
| :--- | :--- | :--- | :--- | :--- |
| Verb-AC1 | User can trigger heavy analysis by running a defined command (e.g. /heavy or /ptc). | I1 | Command file + rule | 🔴 To Do |
| Verb-AC2 | Agent, when command is run, calls MCP tool with prompt and scope; does not read many files. | I1 | Command text + rule | 🔴 To Do |
| Verb-AC3 | Same trigger contract works in any IDE that supports MCP and a command. | I1 | Doc / contract | 🔴 To Do |
| SustainAdv-AC1 | When MCP tool missing critical param, it uses MCP Elicitation; does not guess. | I2 | Server code + Elicitation flow | 🔴 To Do |
| SustainAdv-AC2 | After elicited input, tool continues and returns result or clear error. | I2 | Server code + flow | 🔴 To Do |
| EffAdv-AC1 | MCP server sends saved cacheable static block with each API request. | I3 | Server code + API call | 🔴 To Do |
| EffAdv-AC2 | API response to IDE is concise summary, not full file contents. | I3 | Tool result shape | 🔴 To Do |
| EffAdv-AC3 | For heavy tasks, one MCP call completes work; agent does not do many file-read calls. | I3 | Command + rule | 🔴 To Do |
| ScalAdv-AC1 | Feature can be invoked repeatedly without degradation. | I4 | Doc + behavior | 🔴 To Do |
| ScalAdv-AC2 | Context Compaction documented for when long-session API use is added. | I4 | Design/requirements | 🔴 To Do |
| Noun-AC1 | MCP server exposes one tool (e.g. run_heavy_analysis_ptc) with prompt and optional scope. | I2 | Tool schema | 🔴 To Do |
| Noun-AC2 | Server calls Anthropic API with code execution (PTC); only summary returned to IDE. | I2 | API call + response handling | 🔴 To Do |
| Noun-AC3 | Server can read workspace files or receive paths and pass to API as designed. | I2 | Server code | 🔴 To Do |
| SustainAdj-AC1 | For critical params, server uses MCP Elicitation before proceeding. | I2 | Elicitation logic | 🔴 To Do |
| SustainAdj-AC2 | Server does not guess or substitute defaults for critical parameters. | I2 | Server code | 🔴 To Do |
| EffAdj-AC1 | Server maintains saved cacheable static block and sends with each request. | I3 | Config/code | 🔴 To Do |
| EffAdj-AC2 | Tool result to IDE is summary or structured output, not raw bulk content. | I3 | Response shape | 🔴 To Do |
| ScalAdj-AC1 | Design/requirements state Context Compaction when long-session API use is implemented. | I4 | Design/requirements | 🔴 To Do |
| ScalAdj-AC2 | Trigger and MCP contract defined so any compatible IDE can invoke same tool. | I1 | Doc / contract | 🔴 To Do |

---

# 3. EXECUTION MATRIX (Tasks)
*Goal: One task per micro-delivery; every A.C. is covered by at least one task.*

| Task ID | Task name | Active A.C. | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-101** | Define dedicated command (e.g. /heavy or /ptc) and Cursor rule so the agent calls the MCP tool. | Verb-AC1, Verb-AC2, Verb-AC3, ScalAdj-AC2 | — | 🔴 To Do |
| **T-102** | Implement MCP server skeleton: one tool (run_heavy_analysis_ptc), input schema (prompt, optional scope). | Noun-AC1 | — | 🔴 To Do |
| **T-103** | Implement Elicitation: when critical param missing, use MCP Elicitation; after input, continue or return error. | SustainAdv-AC1, SustainAdv-AC2, SustainAdj-AC1, SustainAdj-AC2 | T-102 | 🔴 To Do |
| **T-201** | Implement Anthropic API call with code execution (PTC); server reads workspace or receives paths; return only summary to IDE. | Noun-AC2, Noun-AC3, SustainAdj-AC2 | T-102, T-103 | 🔴 To Do |
| **T-202** | Add saved cacheable static block; send with each API request; ensure tool result is summary/structured only. | EffAdv-AC1, EffAdv-AC2, EffAdv-AC3, EffAdj-AC1, EffAdj-AC2 | T-201 | 🔴 To Do |
| **T-301** | Document repeated-use behavior and that Context Compaction will be used when long-session API use is added. | ScalAdv-AC1, ScalAdv-AC2, ScalAdj-AC1 | T-202 | 🔴 To Do |
| **T-302** | (Reserved for future: Context Compaction implementation when long-session design exists.) | — | — | 🔴 To Do |
| **T-401** | Final verification: all A.C. have evidence; handoff-ready. | All | T-301 | 🔴 To Do |

*Note: T-302 is a placeholder for when long-session API use is designed; T-401 is final verification.*

---

# 4. RESOURCE & BUDGET TRACKER
*Goal: Track financial cost, build complexity, and ROI sanity check.*

| Item | Type | Notes |
| :--- | :--- | :--- |
| Anthropic API | OpEx (pay-per-use) | No fixed subscription required. |
| MCP server | Local | No hosting cost. |
| Build complexity | Medium | MCP server + API + command + Elicitation. |
| ROI | Yes | Reduces Cursor context; Prompt Caching reduces API cost for repeated use. |

*Requesting Resources / Budget:* If Anthropic API usage or a paid tier is needed, ask the User before committing; specify ceiling and purpose; do not spend until User approves.
