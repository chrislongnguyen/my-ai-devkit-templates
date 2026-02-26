# The Orchestrator Roadmap

> *"The endgame is not to use AI. It is to direct AI systems — where you set the direction, and the system executes, verifies, and learns without requiring your technical skill."*

This document defines the path from **User of one AI agent** to **Orchestrator of AI Systems** — and the 7 milestones that mark the journey.

---

## The Two Paths (And Why This One Is Different)

Most of the AI industry is racing toward **maximum autonomy**: AI that needs the human less and less, until the human is out of the loop entirely. That race is crowded, and it is built for people who have the technical depth to audit what the AI produces.

This template takes the opposite direction: **maximum AI accountability with minimum human overhead.**

The distinction is not how much the AI does — in both cases the AI does nearly everything. The distinction is *who catches mistakes, and when.*

| | Maximum Autonomy | AI Accountability |
| :--- | :--- | :--- |
| **Who sets direction?** | AI infers it | You confirm it |
| **When are mistakes caught?** | At the end (expensive) | At each gate (cheap) |
| **What does the human do?** | Review the finished product | Confirm direction at each checkpoint |
| **Cost of being wrong** | Weeks of wasted work | One task |
| **Required technical skill** | High (to audit output) | None (to confirm intent) |

**The Orchestrator path is the accountability path taken to its logical conclusion:** a solo non-tech operator directing a system of AI agents — each one accountable, each one gated — where your role is purely directional judgment, not technical execution.

---

## The 7 Milestones

Each milestone below is a gap between where this template is today and where an Orchestrator-grade system lives. They are sequenced by impact — close them in order.

---

### Milestone 1: Machine-Verified Evidence
*Current state:* You manually review the agent's claim that a task works. The "Evidence of Truth" is text and file paths — human-reviewed.

*Orchestrator state:* A test suite runs automatically on every `/ship`. The evidence is a green CI build — machine-verified, not agent-claimed. You only review if CI fails.

*What closing it gives you:* Your 2-minute task approval becomes a 30-second scan. The agent cannot pass a broken task. Evidence becomes objective.

*Action:* Run `/state-a` with feature name `automated-test-verification`.
UDO: *"Evidence of task completion is machine-verified by a test suite, not dependent on my manual review."*

---

### Milestone 2: Ambient Project Memory
*Current state:* Memory is intentional — you `/remember` a principle and the agent retrieves it. Past decisions from previous features are not automatically available.

*Orchestrator state:* After each feature ships, the agent writes a structured summary (decisions made, UBS discovered, patterns that led to revisions) to a searchable memory store. At the start of every State A, this history is surfaced automatically — not because you asked, but because it is relevant.

*What closing it gives you:* The agent learns from your enablement's history. The more you build, the smarter the starting point for each new feature.

*Action:* Run `/state-a` with feature name `ambient-project-memory`.
UDO: *"At the start of every new feature, the agent automatically surfaces relevant decisions and patterns from all past features, without me having to remember to /remember them."*

---

### Milestone 3: Observability (Know What's Working)
*Current state:* There are no metrics. You don't know which task types fail most, which iterations produce the most re-plans, or where your time is actually going.

*Orchestrator state:* A `/metrics` command reads your planning docs and produces a simple dashboard: tasks completed, revision rate (how often a task goes from 🔵 back to 🔴), iteration completion rate, stuck frequency by task type.

*What closing it gives you:* After 2–3 features, the data tells you where your State A scoping is consistently wrong. You fix the map, not the territory.

*Action:* Run `/state-a` with feature name `execution-observability`.
UDO: *"After each feature, I can see a simple report of where tasks needed revision and which task types were consistently underestimated, so I can improve future State A scoping."*

---

### Milestone 4: Task Confidence Scoring
*Current state:* All tasks in the Execution Matrix are treated equally. A task with vague A.C. and a task with crystal-clear A.C. both start at 🔴 To Do.

*Orchestrator state:* Each task row has a Confidence Score (1–5) populated by the agent at State A time, based on A.C. clarity, design completeness, and dependency complexity. Low-confidence tasks trigger a scope clarification before execution.

*What closing it gives you:* You know before you build which tasks are likely to need revision. You clarify the A.C. then, not after. Revision rate drops.

*Action:* Run `/state-a` with feature name `task-confidence-scoring`.
UDO: *"Before executing a task, I want to know how confident the agent is that the A.C. is clear enough to pass first time — so I can improve the spec before wasting a build cycle."*

---

### Milestone 5: Self-Improving Rules (/meta-review)
*Current state:* The rules in `.cursor/rules/` and the skill files are static. If a certain type of task consistently needs two revision cycles, the system does not learn that.

*Orchestrator state:* After each feature ships, a `/meta-review` command runs. The agent reads the full revision history — every task that went from 🔵 back to 🔴, every piece of feedback — and proposes specific updates to `anti-patterns.mdc`, `execute-micro-task.md`, or the requirements template. You approve or reject each proposed rule change.

*What closing it gives you:* The system gets better with every feature you ship. The agent's rules are co-authored by the agent's own failure patterns.

*Action:* Run `/state-a` with feature name `meta-review-self-improvement`.
UDO: *"After each feature, the agent analyses what kept going wrong and proposes specific rule changes to prevent the same failures next time. I approve each change."*

---

### Milestone 6: Parallel Specialist Agents
*Current state:* One agent, one task, one thread. Sequential by design.

*Orchestrator state:* For tasks with no dependency on each other (e.g., "write tests for T-101" and "write documentation for T-102"), two background agent sessions run in parallel. You review two outputs instead of waiting twice. The planning doc remains the single source of truth — each agent writes to its own section, no conflicts.

*What closing it gives you:* Clock time per feature drops without reducing control. You are still the single approval gate — but two agents bring work to that gate simultaneously.

*Action:* Only close this milestone after Milestones 1–3 are complete. Parallelization amplifies whatever verification system is already in place. Without automated testing (Milestone 1), parallel agents double the manual review burden.

Run `/state-a` with feature name `parallel-agent-execution`.
UDO: *"Tasks with no dependencies on each other can be executed by two agents simultaneously, cutting feature delivery time without reducing my approval control."*

---

### Milestone 7: Structured State (For Scale Beyond Solo)
*Current state:* All project state lives in markdown files. This is correct for one person, one agent.

*Orchestrator state:* Task state is stored in a machine-readable format (JSON/YAML) with schema validation. The agent cannot write an invalid status. Multiple agents or contributors cannot create conflicting updates.

*What closing it gives you:* The template becomes deployable for a small team or as a product for other users. This milestone is not about your personal velocity — it is about whether this system can scale beyond you.

*Action:* Only relevant if you are building this template into a product for others, or adding team members. If solo, skip for now.

---

## The Sequencing (What To Do First)

```
NOW          →  Milestone 1: Automated Testing
             →  Milestone 3: Observability
             →  Milestone 2: Ambient Memory

NEXT         →  Milestone 4: Confidence Scoring
             →  Milestone 5: Self-Improving Rules

WHEN SCALING →  Milestone 6: Parallel Agents
             →  Milestone 7: Structured State (only if building for others)
```

Close Milestones 1, 3, and 2 together — they compound each other. Observability tells you where to improve; memory carries those improvements forward; automated testing removes the manual verification bottleneck.

---

## What an Orchestrator Actually Does

When all 7 milestones are closed, your workflow looks like this:

1. **State A:** Answer 3–4 questions. The agent searches memory for relevant past decisions automatically. You approve direction. (~30 minutes, once per feature)
2. **State B:** Agent executes one task. CI runs tests automatically. You see green/red. If green: "Approved." If red: the agent already knows why and proposes a fix. (~2 minutes per task)
3. **End of feature:** `/meta-review` proposes rule improvements. `/metrics` shows revision rate. Memory is updated automatically. (~15 minutes)

You make zero technical decisions. You make every directional decision.

That is what an Orchestrator is: not someone who uses AI, but someone who directs AI systems — accountably, with the minimum overhead required to stay in control.

---

*This roadmap is a companion to the [Effective Execution Manifesto](Effective_Execution_Manifesto.md) and the [Effective System Design Framework](frameworks/effective-system-design.md). Each milestone is a feature — close it using `/state-a` with the provided UDO, then `/state-b` to execute.*
