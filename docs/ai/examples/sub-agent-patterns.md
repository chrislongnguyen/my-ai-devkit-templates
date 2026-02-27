# Sub-Agent Patterns — Reference for Future Features

Log of three sub-agent patterns and the pipeline model. Use this when scoping a future feature for swarm/orchestration.

---

## 1. Three sub-agent patterns

### Pattern 1 — Parallel (horizontal) agents
- **What:** Same level of work, different scope, running **concurrently**. Example: two Build agents each executing a different feature's tasks at the same time.
- **Relationship:** Independent; no dependency between agents. Speed play.
- **Engine today:** Not yet scoped. Would require multiple agents each with a distinct planning doc (or feature assignment).

### Pattern 2 — Sequential / causal (pipeline) agents
- **What:** Each agent owns **one stage** in a linear workflow. Output of Agent N becomes input of Agent N+1.
- **Example:** Brain → Build → Test → Deploy → Document → Monitor. Each agent is a specialist; handoff to the next stage.
- **Relationship:** Causal chain; fixed pipeline. Classic assembly line.
- **Engine today:** T-403 (Verb-AC9) proves **one** agent can operate from cold start. The full pipeline (Brain/Build/Test/Deploy/Document/Monitor) is not yet implemented as explicit agent roles.

### Pattern 3 — Hierarchical (orchestrator-worker) agents
- **What:** A Brain/Orchestrator agent decomposes work and **dispatches** sub-tasks to worker agents dynamically. Workers report back; orchestrator decides what to dispatch next.
- **Relationship:** Not a fixed pipeline; orchestrator routes based on results. More complex; orchestrator must maintain state.
- **Engine today:** Tracked in `docs/ai/Orchestrator_Roadmap.md`; not implemented in engine-hardening.

---

## 2. Pipeline model (Brain / Build / Test / Deploy / Document / Monitor)

| Agent   | Owns | Trigger |
| :---    | :--- | :--- |
| **Brain**   | State A: Requirements, Design, Planning, Holy Trinity | New feature or re-plan request |
| **Build**   | State B: execute one task, Evidence of Truth | Brain approves planning |
| **Test**    | `/test-write` (from approved spec), `/test` at iteration boundary | Build task 🔵 Draft Completed |
| **Deploy**  | `deploy/README.md`, `run-deploy.sh` | Iteration boundary tests pass |
| **Document**| Docs, walkthroughs, examples, CHANGELOG | Iteration or feature complete |
| **Monitor** | Post-deploy: logs, errors, metrics, uptime; feed back to Brain | After deploy; closes the loop (ship → learn → re-plan) |

**Monitor** is the agent that closes the loop in professional dev: without it, the pipeline is one-way; with it, you get a feedback loop into the Brain for the next iteration.

---

## 3. What engine-hardening implemented (T-403 / Verb-AC9)

**Sub-agent portability:** A single specialist execution agent (Build) can operate **independently** from `engine/SKILL.md` + one feature's planning doc, without a human manually handing it context. This is the **prerequisite** for all three patterns — proving the engine is portable enough to hand to a second agent. It is **not** yet the full pipeline (Pattern 2) or orchestration (Pattern 3); those are future feature scope.

---

*Reference: conversation 2026-02-27; use when scoping a feature for swarm/pipeline/orchestration.*
