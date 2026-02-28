---
phase: requirements
title: Effective Requirements & User's System Map — claude_ptc
description: The causal mapping of the User's reality and the deterministic constraints for the PTC bridge (MCP + Anthropic API).
---

# PHASE 1: PROBLEM DISCOVERY (The User's System Map)
*Goal: Understand the human reality before introducing technology.*

* **User Persona & Anti-Persona:** Solo operator (or small team) using Cursor or a compatible IDE (e.g. AntiGravity) who wants heavy, multi-file analysis to be accurate, cost-effective, and fast without blowing context. Anti-Persona: Users who expect the agent to infer "heavy" without an explicit trigger; or IDEs that cannot invoke a command and call an MCP tool.
* **Ultimate Desired Outcome (UDO):** All coding sessions in Cursor (and compatible IDEs) are more accurate, more cost-effective in total cost, and—for heavy tasks—faster.
* **User's Action:** Run a dedicated command to delegate heavy analysis to the MCP tool so the IDE receives only a summary.

**Trigger and cost:** The user explicitly triggers heavy analysis by running a **dedicated command** (e.g. `/heavy` or `/ptc`). "Heavy" is defined by "user ran this command," not by the agent guessing. The solution uses a **saved, cacheable static block** (like top developers) sent with each API request so repeated use is cheaper.

## The Drivers (UDS - Ultimate Driving System)
* **UDS:** Cursor context limit.
* **UDS.UD (Driver of the Driver):** Need to do more in one session without hitting the limit.
* **UDS.UB (Blocker of the Driver):** The limit is fixed; the workaround is to delegate heavy work so Cursor never sees full content.

## The Blockers (UBS - Ultimate Blocking System)
* **UBS:** Cursor doesn't use PTC natively.
* **UBS.UD (Driver of the Blocker):** Cursor controls the agent; by default every tool result goes into context.
* **UBS.UB (Blocker of the Blocker):** Route heavy work via an MCP bridge that uses PTC and returns only a summary.

---

# PHASE 2: THE SYSTEM DESIGN (Context & Bridge)
*Goal: Define the conceptual solution space based ONLY on what we understand about the User in Phase 1.*

* **Principles (Why):** Accuracy (no guessing—Elicitation for missing critical params); Cost (delegate heavy work, cacheable static block); Speed (one MCP call per heavy task; Context Compaction documented for long-session use).
* **Environment (Where):** Cursor or other IDE (e.g. AntiGravity) on the user's machine; a local MCP server; Anthropic API (cloud). Cultural: Solo operator; LTC 2-State Engine (State B = stop for User approval).
* **Tools (What):** 
  * *Desirable Wrapper:* One MCP tool (e.g. `run_heavy_analysis_ptc`) invoked by a **dedicated command** (e.g. `/heavy` or `/ptc`). Same contract works in any IDE that supports MCP and a command (Cursor, AntiGravity).
  * *Effective Core:* MCP server uses Elicitation when a critical param is missing; calls Anthropic API with code execution (PTC) so the model never sees full file contents; sends a saved, cacheable static block (Prompt Caching); Context Compaction documented for when long-session API use is designed.
* **EOP (How):** User runs the dedicated command and provides a prompt → Agent calls MCP tool with prompt and scope → If critical input missing, MCP Elicitation prompts user → MCP server calls Anthropic API (cacheable block + user message) → Claude runs code (PTC), returns only summary → MCP server returns summary to IDE.

---
# Phase 3: THE FORMALIZATION (The Output)
*Goal: Translate the System Design into strict, deterministic engineering requirements.*

**A.C. ID naming convention:** Verb-ACn, SustainAdv-ACn, EffAdv-ACn, ScalAdv-ACn, Noun-ACn, SustainAdj-ACn, EffAdj-ACn, ScalAdj-ACn. Do not rename once used in Planning.

---

1. **USER(S):**
* **Primary User Persona:** Solo operator (or small team) using Cursor or a compatible IDE (e.g. AntiGravity) who wants heavy, multi-file analysis to be accurate, cost-effective, and fast without blowing context.
* **Anti-Persona:** Users who expect the agent to infer "heavy" without an explicit trigger; or IDEs that cannot invoke a command and call an MCP tool.

2. **DESIRED USER ACTION(S):**

**Verb:** Run a dedicated command to delegate heavy analysis to the MCP tool so the IDE receives only a summary.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Verb-AC1 | User can trigger heavy analysis by running a defined command (e.g. `/heavy` or `/ptc`) in the IDE. |
| Verb-AC2 | The agent, when that command is run, calls the MCP tool with the user's prompt and scope (e.g. directory/paths) and does not read many files itself. |
| Verb-AC3 | The same trigger contract works in any IDE that supports MCP and a command (e.g. Cursor, AntiGravity). |

**Sustainability Adverb:** Deterministically (no guesswork on critical inputs).

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdv-AC1 | When the MCP tool is missing a critical parameter (e.g. scope, confirm before run), it uses MCP Elicitation to prompt the user and does not guess or fail silently. |
| SustainAdv-AC2 | After the user provides the elicited input, the tool continues and returns a result or a clear error. |

**Efficiency Adverb:** Frugally (low cost, small context).

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdv-AC1 | The MCP server sends a saved, cacheable static block (e.g. summarizer instructions) with each Anthropic API request so Prompt Caching applies. |
| EffAdv-AC2 | The API response returned to the IDE is a concise summary (or structured result), not full file contents, so the IDE's context stays small. |
| EffAdv-AC3 | For heavy tasks (e.g. many files), one MCP call completes the work; the agent does not perform many separate file-read tool calls for the same task. |

**Scalability Adverb:** Repeatedly, and ready for long sessions.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdv-AC1 | The feature can be invoked repeatedly (same command, same MCP tool) without degradation. |
| ScalAdv-AC2 | Context Compaction is documented as the intended approach when long-session API use (e.g. multi-turn project chat) is added; implementation is deferred until that design exists. |

**Repeated-use behavior:** Each `/heavy` invocation is stateless; the same command and MCP tool can be run any number of times without degradation. Prompt Caching (same cacheable system block per request) reduces API cost on repeated use.

**Context Compaction (long sessions):** When long-session API use (e.g. multi-turn project chat with the Anthropic API) is added in a future design, Context Compaction will be used to manage context growth. Implementation is deferred until that design exists. See Design §2.4.

3. **FEATURE:**

**Noun:** An MCP server that exposes one tool (e.g. `run_heavy_analysis_ptc`), invoked by a dedicated IDE command, and that calls the Anthropic API with code execution (PTC), optional Elicitation, and a cacheable static block.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Noun-AC1 | The MCP server exposes exactly one tool (e.g. `run_heavy_analysis_ptc`) that accepts at least a prompt and optional scope (paths/directory). |
| Noun-AC2 | The server calls the Anthropic API with code execution (PTC) so the model does not receive full file contents in context; only a summary (or equivalent) is returned to the IDE. |
| Noun-AC3 | The server can read workspace files (or receive paths from the client) and pass content or paths to the API as designed (e.g. in the user message or via a tool the model calls in code). |

**Sustainability Adjective:** Elicitation-gated (no critical guesswork).

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdj-AC1 | For any parameter defined as critical (e.g. scope, confirmation), the server uses MCP Elicitation to request it from the user before proceeding. |
| SustainAdj-AC2 | The server does not guess or substitute defaults for critical parameters; it either has them or elicits them. |

**Efficiency Adjective:** Cacheable, summary-only.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdj-AC1 | The server maintains at least one saved, cacheable static block (in code or config) and sends it with each API request so Prompt Caching can apply. |
| EffAdj-AC2 | The tool result returned to the IDE is a summary or structured output, not raw bulk content (e.g. not 50 full file bodies). |

**Scalability Adjective:** Extensible for long sessions.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdj-AC1 | The design or requirements document states that Context Compaction will be used when long-session API use is implemented. |
| ScalAdj-AC2 | The trigger (dedicated command) and MCP contract are defined so any compatible IDE (e.g. Cursor, AntiGravity) can invoke the same tool the same way. |

**Context Compaction:** Design §2.4 and the Scalability section above state that Context Compaction will be the intended approach when long-session API use is implemented.

---
