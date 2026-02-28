# The Orchestrator Roadmap

> *"The endgame is not to use AI. It is to direct AI systems — where you set the direction, and the system executes, verifies, and learns without requiring your technical skill."*

The path from **User of one AI agent** to **Orchestrator of AI Systems** — 7 milestones, sequenced by impact.

---

## The Two Paths

| | Maximum Autonomy | **AI Accountability (This Template)** |
| :--- | :--- | :--- |
| **Who sets direction?** | AI infers it | You confirm it |
| **When are mistakes caught?** | At the end (expensive) | At each gate (cheap) |
| **What does the human do?** | Review the finished product | Confirm direction at each checkpoint |
| **Cost of being wrong** | Weeks of wasted work | One task |
| **Required technical skill** | High (to audit output) | None (to confirm intent) |

---

## Your Vision: Autonomous Agent Pipeline

```
Director → Learning → Build → Test → Deploy → Monitor
    ↑_________________________________________|
              (Continuous Improvement)
```

**Current State:** Human-in-the-loop at every stage. Build/Test/Deploy work; human gates remain. No Monitor agent; no autonomous Director.

**Target State:** Machine-verified evidence, ambient memory, observability, self-improving rules, parallel agents.

---

## The 7 Milestones

### Phase 1: Foundation (NOW → 2 months)
Close these together — they compound. Observability tells you where to improve; memory carries improvements forward; automated testing removes manual verification.

#### Milestone 1: Machine-Verified Evidence ⭐ **START HERE**
*Current:* You manually review evidence block (file paths, CLI output).  
*Target:* CI runs tests automatically on `/ship`. Green build = objective evidence. You only review if CI fails.

| Item | Detail |
| :--- | :--- |
| **Action** | `/state-a` with feature `automated-test-verification` |
| **UDO** | Evidence of task completion is machine-verified, not dependent on my manual review |
| **Deliverable** | `/.github/workflows/ci.yml` or equivalent; runs `tests/run-tests.sh` on every push |
| **Impact** | 2-min task approval → 30-sec scan; agent cannot pass broken task |

---

#### Milestone 3: Observability
*Current:* No metrics. You don't know which task types fail most.  
*Target:* `/metrics` command produces dashboard: tasks completed, revision rate, stuck frequency.

| Item | Detail |
| :--- | :--- |
| **Action** | `/state-a` with feature `execution-observability` |
| **UDO** | I can see where tasks needed revision and which types were underestimated |
| **Deliverable** | `engine/commands/metrics.md` — parses planning docs, outputs markdown report |
| **Impact** | Data-driven State A scoping; fix the map, not the territory |

---

#### Milestone 2: Ambient Project Memory
*Current:* Memory is intentional — you `/remember` principles. Past decisions not auto-surfaced.  
*Target:* After each feature ships, agent writes structured summary to memory. At State A start, relevant history auto-surfaces.

| Item | Detail |
| :--- | :--- |
| **Action** | `/state-a` with feature `ambient-project-memory` |
| **UDO** | Agent auto-surfaces relevant decisions from past features without me asking |
| **Deliverable** | MCP memory integration; `memory-store/project-lessons.md` auto-populated |
| **Impact** | The more you build, the smarter the starting point |

---

### Phase 2: Intelligence (2 → 4 months)

#### Milestone 4: Task Confidence Scoring
*Current:* All tasks treated equally.  
*Target:* Confidence Score (1–5) per task at State A time. Low confidence triggers scope clarification before execution.

| Item | Detail |
| :--- | :--- |
| **Action** | `/state-a` with feature `task-confidence-scoring` |
| **UDO** | I know which tasks are likely to need revision before building |
| **Deliverable** | Planning template adds "Confidence" column; agent populates from A.C. clarity |
| **Impact** | Revision rate drops; clarify spec then, not after |

---

#### Milestone 5: Self-Improving Rules (/meta-review)
*Current:* Rules in `.cursor/rules/` are static.  
*Target:* After each feature, `/meta-review` analyzes revision history and proposes rule updates. You approve/reject each.

| Item | Detail |
| :--- | :--- |
| **Action** | `/state-a` with feature `meta-review-self-improvement` |
| **UDO** | Agent proposes specific rule changes based on failure patterns; I approve each |
| **Deliverable** | `engine/commands/meta-review.md`; updates `anti-patterns.mdc`, `execute-micro-task.md` |
| **Impact** | System learns from its own failures; rules co-authored by failure patterns |

---

### Phase 3: Scale (4 → 6+ months)

#### Milestone 6: Parallel Specialist Agents ⚠️ **DEPENDENCY: M1-M3**
*Current:* One agent, one task, one thread.  
*Target:* Tasks with no dependencies run in parallel. You review two outputs simultaneously.

| Item | Detail |
| :--- | :--- |
| **Action** | Only after M1-M3 complete. `/state-a` with feature `parallel-agent-execution` |
| **UDO** | Independent tasks execute in parallel without reducing my approval control |
| **Deliverable** | Dependency graph in planning docs; agent dispatcher for parallel execution |
| **Warning** | Without automated testing (M1), parallel agents double manual review burden |

---

#### Milestone 7: Structured State
*Current:* All state in markdown files. Correct for solo.  
*Target:* Machine-readable state (JSON/YAML) with schema validation.

| Item | Detail |
| :--- | :--- |
| **Action** | Only if building for team or as product for others |
| **UDO** | Multiple agents/contributors without conflicting updates |
| **Deliverable** | JSON schema for planning docs; validation layer |
| **Note** | Skip if solo. Only for scale beyond you. |

---

## Custom: Monitor Agent (Not in Milestones)

**Critical gap for your vision:** No Monitor agent exists. This is the feedback loop from Deploy → Director.

| Item | Detail |
| :--- | :--- |
| **What it does** | Post-deploy: captures logs, errors, metrics, uptime; feeds structured summary to Director for re-planning |
| **Trigger** | After every `/ship` or on schedule; creates `docs/ai/monitoring/feature-{name}-live.md` |
| **UDO** | I know what's working in production without checking logs manually; failures auto-trigger re-plan |
| **Action** | `/state-a` with feature `production-monitor-agent` |

---

## The Sequencing

```
NOW (Month 1-2)    →  M1: Automated Testing ⭐
                   →  M3: Observability
                   →  M2: Ambient Memory

NEXT (Month 3-4)   →  M4: Confidence Scoring
                   →  M5: Self-Improving Rules
                   →  Custom: Monitor Agent

SCALE (Month 5+)   →  M6: Parallel Agents
                   →  M7: Structured State (if team/product)
```

**Start with M1.** It unlocks everything else.

---

## Endgame: What an Orchestrator Does

When all milestones + Monitor agent are complete:

1. **State A:** Answer 3–4 questions. Memory auto-surfaces past decisions. You approve direction. (~30 min once)
2. **State B:** Agent executes. CI runs tests. Green = auto-approval for routine tasks. Red = agent proposes fix. (~2 min per task)
3. **Monitor:** Production data auto-summarized. Issues trigger re-plan. (~0 min — passive)
4. **End of feature:** `/meta-review` proposes rule improvements. `/metrics` shows revision rate. Memory updated. (~15 min)

You make zero technical decisions. You make every directional decision.

---

## Status Log

| Date | Event |
| :--- | :--- |
| 2026-02-28 | engine-hardening v2.0.0 complete; all milestones remain open; Build agent proven via T-403 |

---

*Each milestone is a feature. Close using `/state-a` with the provided UDO, then `/state-b` to execute.*
