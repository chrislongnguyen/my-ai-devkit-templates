# Two Features Coexisting in One Repo — Worked Example

This example shows how **two feature sets** live in the same product repo, each with its own Holy Trinity and I1→I4 cycle. The engine does not limit you to one feature; when a live product needs new capabilities, you add a new `feature-{name}` set.

---

## Scenario

- **Product:** My App (one git repo).
- **Feature A:** `auth` — user login and sessions (already at I4, shipped).
- **Feature B:** `billing` — subscriptions and payments (new capability; starting I1).

Both features coexist. Docs and tasks are namespaced by feature name.

---

## Doc layout

```
docs/ai/
  requirements/
    feature-auth.md      ← Holy Trinity for auth
    feature-billing.md   ← Holy Trinity for billing
  design/
    feature-auth.md
    feature-billing.md
  planning/
    feature-auth.md      ← Execution Matrix for auth (e.g. all tasks 🟢)
    feature-billing.md   ← Execution Matrix for billing (e.g. I1 in progress)
  examples/
    multi-feature-coexisting.md   ← this file
```

Each feature has its own **requirements**, **design**, and **planning** file. No shared planning doc across features — each feature has its own Master Scope Mapping and Execution Matrix.

---

## How the engine picks the active feature

When you run **`/state-b`** or **`/status`** or **`/handoff`**, the agent determines the **active feature** using canonical logic (see `engine/skills/dev-lifecycle/references/execute-micro-task.md` Step 0):

- If **exactly one** `docs/ai/planning/feature-*.md` exists → that feature is active.
- If **multiple** exist → the **most recently modified** `feature-*.md` in `docs/ai/planning/` is used, unless you specify a feature name in the run.

So: work on billing by touching `docs/ai/planning/feature-billing.md` (e.g. run State B for a billing task), or tell the agent “use feature billing.” Work on auth by touching `docs/ai/planning/feature-auth.md` or saying “use feature auth.”

---

## Adding the new feature (billing)

1. **State A for billing:** Run `/state-a` and give the feature name `billing`. Complete the four sub-steps; the agent creates or updates `docs/ai/requirements/feature-billing.md`, `docs/ai/design/feature-billing.md`, `docs/ai/planning/feature-billing.md`.
2. **Execute billing tasks:** Run `/state-b`. The agent reads `feature-billing.md` (if it’s the only or most recently modified planning doc) and executes the first 🔴 To Do task for billing.
3. **Switch context:** To work on auth again, run `/state-b` after touching `feature-auth.md`, or specify “feature auth” in chat. Each feature’s planning doc is independent.

---

## Summary

| Concept | Meaning |
| :--- | :--- |
| **One repo** | One product (e.g. My App); many features allowed. |
| **Feature set** | One Holy Trinity (req + design + planning) per `feature-{name}`. |
| **I1→I4 cycle** | Each feature has its own 4 iterations; complete one feature’s I4 then start another feature’s I1 if needed. |
| **Active feature** | Chosen by planning doc presence + recency (or user saying the name). |

This repo already contains multiple feature planning docs (e.g. `feature-engine-hardening.md`, `feature-claude_ptc.md` in archive). The same pattern applies: each is a separate feature set with its own tasks and A.C.
