# Sub-agent portability — Evidence (Verb-AC9)

A specialist sub-agent can operate from **`engine/SKILL.md`** plus **one feature's planning doc**, executing tasks from its assigned iteration independently.

## Simulation

**Setup:** An agent was given (1) `engine/SKILL.md` and (2) `docs/ai/planning/feature-engine-hardening.md` as the assigned feature. No other context (no other planning docs, no handoff file, no chat history).

**Result:** The agent was able to:
- Infer the active feature from the single planning doc (engine-hardening).
- Read the Execution Matrix and identify the first 🔴 To Do or ⚪ Pending task.
- Resolve A.C. from `docs/ai/requirements/feature-engine-hardening.md` and implementation from `docs/ai/design/feature-engine-hardening.md`.
- Follow `engine/skills/dev-lifecycle/references/execute-micro-task.md` (Step 0: single feature → no ambiguity; Step 1: read planning, find task, iteration gate if applicable; Step 2: build; Step 3: evidence, hard exit).

**Conclusion:** A sub-agent assigned to one feature needs only the engine entry point and that feature's Holy Trinity. It does not need the full product context or other features' planning docs. Swarm-readiness (Verb-AC9) is satisfied: a second agent can run State B for an assigned feature from `engine/SKILL.md` + one planning doc.

## Reference

- **Entry point:** `engine/SKILL.md` — Section "Sub-agent portability (Verb-AC9)".
- **Procedure:** `engine/skills/dev-lifecycle/references/execute-micro-task.md` (Step 0–3). When only one `feature-*.md` exists (or the sub-agent is explicitly assigned one), Step 0 resolves to that feature; the rest of the loop is unchanged.
