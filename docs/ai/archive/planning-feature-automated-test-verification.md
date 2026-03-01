---
phase: planning
title: Automated Test Verification — Planning (4-Iteration Roadmap)
feature: automated-test-verification
esd_reference: docs/ai/frameworks/effective-system-design.md
---

# Planning — automated-test-verification (ESD §6)

> **Optional fast-iteration build (Planning & Execution):** A separate flow/command is available for the User to choose with the Agent: **one shot one iteration** (execute all tasks in that iteration), then **run tests**, then **one approval** for that iteration. This flow is only offered when **machine-verified tests exist** (CI or equivalent). Default remains: one task → evidence → approve.

---

## Quick Reference: ESD §6

| Iteration | Focus                        | A.C.s added this iteration                                                                 |
| :-------- | :--------------------------- | :----------------------------------------------------------------------------------------- |
| **1**     | Concept — Sustainability     | Verb-AC1..3, SustainAdv-AC1..2, Noun-AC1..3, SustainAdj-AC1..2, EffAdj-AC1..2, ScalAdj-AC1 |
| **2**     | Prototype — Begin Efficiency | EffAdv-AC1..2                                                                              |
| **3**     | MVE — Scalability            | ScalAdv-AC1                                                                                |
| **4**     | Leadership                   | Spawned A.C.s (if any)                                                                     |

---

# 1. THE ITERATIVE ROADMAP

- **Iteration 1 — Concept:** CI runs tests on push; learning loop (trace test → requirement/design, record outcome); optional fast-iteration flow/command defined and gated on machine-verified tests.
- **Iteration 2 — Prototype:** Automated recording; fast-iteration opt-in, default one-task approval preserved.
- **Iteration 3 — MVE:** Learning-loop format documented for future tooling.
- **Iteration 4 — Leadership:** Spawned A.C.s from MVE testing if any.

## 1.2 Master Scope Mapping

### Table A — By iteration

| Iteration          | A.C. IDs in scope (ESD §6)                                                                                                                                      |
| :----------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1 — Concept**    | Verb-AC1, Verb-AC2, Verb-AC3, SustainAdv-AC1, SustainAdv-AC2, Noun-AC1, Noun-AC2, Noun-AC3, SustainAdj-AC1, SustainAdj-AC2, EffAdj-AC1, EffAdj-AC2, ScalAdj-AC1 |
| **2 — Prototype**  | Prior I1 + EffAdv-AC1, EffAdv-AC2                                                                                                                               |
| **3 — MVE**        | Prior I1+I2 + ScalAdv-AC1                                                                                                                                       |
| **4 — Leadership** | Prior I1+I2+I3 + spawned A.C.s from MVE testing                                                                                                                 |

### Table B — By A.C. (detail)

| A.C. ID        | Requirement (from Req Phase 3)                                                                                                              | Iter | Deterministic Evidence                                                        | Status |
| :------------- | :------------------------------------------------------------------------------------------------------------------------------------------ | :--- | :---------------------------------------------------------------------------- | :----- |
| Verb-AC1       | CI runs the project test suite on every push; pass/fail is machine-determined.                                                              | 1    | T-101 approved; .github/workflows/ci.yml runs run-tests.sh on push            | 🟢     |
| Verb-AC2       | When a test fails or succeeds, trace to requirement/design and record decision/outcome automatically and concisely (learning loop).         | 1    | T-102 approved; tests/README.md + engine/commands/test.md Step 3; Design §5   | 🟢     |
| Verb-AC3       | User can choose optional flow: one shot one iteration → test → one approval; only when machine-verified tests exist.                        | 1    | T-103 approved; /state-b-iteration + Manifesto + README                       | 🟢     |
| SustainAdv-AC1 | Test result (pass/fail) is deterministic and reproducible.                                                                                  | 1    | T-101 approved; CI exit code; same runner locally                             | 🟢     |
| SustainAdv-AC2 | Learning-loop record is traceable: test result → A.C. ID → requirement/design reference; concise and clear.                                 | 1    | T-102 approved; Design §5 table + tests/README format                         | 🟢     |
| EffAdv-AC1     | Running tests does not require manual steps beyond triggering the flow (e.g. push or /test).                                                | 2    | T-201 approved; CI + /test; recording triggered by same flow                  | 🟢     |
| EffAdv-AC2     | Optional fast-iteration flow reduces approval steps to one per iteration when chosen.                                                       | 2    | T-202 approved; state-b-iteration.md Step 5–6; state-b.md + Manifesto: opt-in | 🟢     |
| ScalAdv-AC1    | Learning-loop records accumulate without manual consolidation; format supports future tooling.                                              | 3    | T-301 approved; tests/README §For tooling; Design §5                          | 🟢     |
| Noun-AC1       | CI workflow (e.g. .github/workflows/ci.yml) runs tests/run-tests.sh on every push; exit code determines pass/fail.                          | 1    | T-101 approved; .github/workflows/ci.yml present and triggered on push        | 🟢     |
| Noun-AC2       | Defined mechanism or doc location records per test run (or per A.C.): decision/outcome and link to requirement/design.                      | 1    | T-102 approved; Design §5; engine/commands/test.md Step 3                     | 🟢     |
| Noun-AC3       | Separate flow or command allows User to request "run full iteration N then test then one approval"; only when machine-verified tests exist. | 1    | T-103 approved; engine/commands/state-b-iteration.md; gate in command         | 🟢     |
| SustainAdj-AC1 | Learning-loop entries are machine- or agent-written from test output and AC-TEST-MAP; no fabricated content.                                | 1    | T-102 approved; test.md Step 3: derive only from output + AC-TEST-MAP         | 🟢     |
| SustainAdj-AC2 | Fast-iteration flow does not skip the test run; approval is gated on test result.                                                           | 1    | T-103 approved; state-b-iteration.md Step 4 + 5                               | 🟢     |
| EffAdj-AC1     | Learning-loop recording is automatic (triggered by test run or agent step), not a separate manual doc step.                                 | 2    | T-201 approved; test.md Step 3 (agent) + append-learning-loop.sh in CI        | 🟢     |
| EffAdj-AC2     | Fast-iteration flow is opt-in; default remains one task → evidence → approve.                                                               | 1    | T-103 approved; state-b.md + Manifesto: default one-task                      | 🟢     |
| ScalAdj-AC1    | Learning-loop format and location are documented so future features can consume them.                                                       | 3    | T-301 approved; tests/README §For tooling + Outcome constraint; Design §5       | 🟢     |

---

# 2. EXECUTION MATRIX (Micro Sequencing)

## ITERATION 1 — CONCEPT (Desirable Wrapper)

**Active A.C. in Scope:** Verb-AC1..3, SustainAdv-AC1..2, Noun-AC1..3, SustainAdj-AC1..2, EffAdj-AC1..2, ScalAdj-AC1.

| ID        | Task (Verb)                                                                                                                                                                                                                                                   | Risk Validated                                     | Deps  | Status             |
| :-------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------------------------- | :---- | :----------------- |
| **T-101** | Add CI workflow (e.g. `.github/workflows/ci.yml`) that runs `tests/run-tests.sh` on every push; exit code = pass/fail.                                                                                                                                        | Noun-AC1, Verb-AC1, SustainAdv-AC1                 | None  | 🟢 Reviewed/Tested |
| **T-102** | Define learning-loop record format and location (e.g. `docs/ai/lessons/` or design section); add mechanism or step to trace test result to A.C. and requirement/design and write concise record.                                                              | Verb-AC2, Noun-AC2, SustainAdv-AC2, SustainAdj-AC1 | T-101 | 🟢 Reviewed/Tested |
| **T-103** | Document optional fast-iteration flow; add command or mode (e.g. `/state-b --iteration` or new command) so User can choose "run full iteration then test then one approval"; gate: only when machine-verified tests exist; default remains one-task approval. | Verb-AC3, Noun-AC3, SustainAdj-AC2, EffAdj-AC2     | T-101 | 🟢 Reviewed/Tested |

## ITERATION 2 — PROTOTYPE (Desirable Wrapper)

**Active A.C. in Scope:** Prior I1 + EffAdv-AC1, EffAdv-AC2.

| ID        | Task (Verb)                                                                                                           | Risk Validated         | Deps  | Status             |
| :-------- | :-------------------------------------------------------------------------------------------------------------------- | :--------------------- | :---- | :----------------- |
| **T-201** | Ensure learning-loop recording is automatic (triggered by CI or agent step after /test); no separate manual doc step. | EffAdv-AC1, EffAdj-AC1 | T-102 | 🟢 Reviewed/Tested |
| **T-202** | Verify fast-iteration flow is opt-in and reduces approval to one per iteration when chosen.                           | EffAdv-AC2             | T-103 | 🟢 Reviewed/Tested |

## ITERATION 3 — MVE (Effective Core)

**Active A.C. in Scope:** Prior I1+I2 + ScalAdv-AC1.

| ID        | Task (Verb)                                                                                | Risk Validated           | Deps  | Status             |
| :-------- | :----------------------------------------------------------------------------------------- | :----------------------- | :---- | :----------------- |
| **T-301** | Document learning-loop format and location for future tooling (e.g. metrics, meta-review). | ScalAdv-AC1, ScalAdj-AC1 | T-201 | 🟢 Reviewed/Tested |

## ITERATION 4 — LEADERSHIP (Effective Core)

**Active A.C. in Scope:** Prior I1+I2+I3 + spawned A.C.s.

| ID        | Task (Verb)                                                             | Risk Validated | Deps  | Status             |
| :-------- | :---------------------------------------------------------------------- | :------------- | :---- | :----------------- |
| **T-401** | Address any spawned A.C.s from MVE testing (edge cases, format tweaks). | Spawned        | T-301 | 🟢 Reviewed/Tested |

**I4 closure:** MVE (I3) did not spawn new A.C.s. The only format refinement (Outcome must not contain `|` or newlines) was applied during T-301 review and is documented in tests/README. No further A.C.s to add; feature scope complete.

---

# 3. RESOURCE & BUDGET TRACKER

| Metric                      | Current Usage | Hard Limit                     | Status  |
| :-------------------------- | :------------ | :----------------------------- | :------ |
| **Financial Cost (OpEx)**   | $0            | N/A (GitHub Actions free tier) | 🟢 Safe |
| **API/Token/Compute Usage** | 0             | N/A                            | 🟢 Safe |

---

## Optional Fast-Iteration Build (Summary)

- **What:** A separate flow or command the User can choose with the Agent.
- **Flow:** One shot one iteration (execute all tasks in that iteration) → run tests → one approval for that iteration.
- **When available:** Only after machine-verified tests exist (CI or equivalent running `tests/run-tests.sh`).
- **Default:** Standard /state-b remains one task → evidence → approve. Fast-iteration is opt-in.

**T-202 verification (EffAdv-AC2):** Fast-iteration flow is opt-in and reduces approval to one per iteration when chosen. Evidence: (1) **Opt-in:** `engine/commands/state-b.md` — "Default remains one task per run"; `engine/commands/state-b-iteration.md` — "Default `/state-b` remains one task → evidence → approve; this command is opt-in"; Manifesto — "/state-b-iteration — Optional... Default remains one-task approval." (2) **One approval per iteration:** `engine/commands/state-b-iteration.md` Step 5 — "One approval gate" for entire iteration; Step 6 — "Mark every task in that iteration... 🟢" on single "Approved". No per-task approval in iteration mode.

---

_For methodology, see `docs/ai/frameworks/effective-system-design.md` §6._
