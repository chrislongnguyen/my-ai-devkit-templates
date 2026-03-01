---
phase: requirements
title: Automated Test Verification — User's Requirements
feature: automated-test-verification
esd_reference: docs/ai/frameworks/effective-system-design.md
---

# User's Requirements — automated-test-verification

> **Scope:** Machine-verified evidence (CI runs tests); learning loop (trace test result → requirement/design, record decision/outcome); optional fast-iteration build (one shot one iteration → test → one approval).

---

# PHASE 1: PROBLEM DISCOVERY (The User's System Map)

- **User Persona & Anti-Persona:** Solo operator or small team using the 2-State Engine (State A / State B). Anti-persona: team requiring heavy process or external QA.
- **Ultimate Desired Outcome (UDO):** Evidence of task completion is machine-verified; when a test fails or succeeds, we trace to the relevant requirement/design and record the decision and outcome automatically and concisely (learning loop); optionally, I can run one full iteration then test once and give one approval for that iteration.
- **User's Action:** Run tests in CI; approve tasks with confidence that green/red is objective; optionally choose fast-iteration flow when machine-verified tests exist.

## The Drivers (UDS)

- **UDS:** Clean causal signal from tests (pass/fail per A.C. or suite) so approval is not dependent on manual review of file paths/snippets.
- **UDS.UD:** Binary test results compound into traceable learning (why/how something failed or succeeded) linked to requirements/design.
- **UDS.UB:** Vague or untraceable test results; no record of which requirement/design decision was validated or invalidated.

## The Blockers (UBS)

- **UBS:** Manual-only evidence review; no machine-verified gate; no learning loop back to requirements/design; no option to run a full iteration then test once.
- **UBS.UD:** Activation barrier (too much per-task overhead); scope creep when iteration is slow.
- **UBS.UB:** Machine-verified tests + learning loop + optional fast-iteration flow reduce manual load and make iteration integrity visible.

---

# PHASE 2: THE SYSTEM DESIGN (Context & Bridge)

- **Principles (Why):** P2(S)—every phase produces a testable artefact; A.C. written before building, binary test immediately after. P5(Sc)—each cycle can close with a Measure step (outcome recorded, traceable to requirement/design). Minimum scope preserved; fast-iteration is optional and only when tests are machine-verified.
- **Environment (Where):** Digital; repo + CI (e.g. GitHub Actions); `docs/ai/` (requirements, design, planning); test runner and AC-TEST-MAP.
- **Tools (What):** Desirable Wrapper = commands/flows User chooses (/state-b one-task vs optional iteration-mode). Effective Core = CI workflow running tests on push; learning-loop recorder (trace test result → A.C. → requirement/design, write outcome concisely); optional iteration-mode execution.
- **EOP (How):** User runs /state-a for this feature → Holy Trinity approved → /test-write → /state-b tasks. When tests run (CI or /test), on pass/fail the system traces to A.C./requirement/design and records outcome. User may choose standard (one task → evidence → approve) or, when machine-verified tests exist, optional flow: one shot one iteration → run tests → one approval for that iteration.

---

# Phase 3: User's Requirements (The Output)

**A.C. ID convention:** Verb-ACn, SustainAdv-ACn, EffAdv-ACn, ScalAdv-ACn, Noun-ACn, SustainAdj-ACn, EffAdj-ACn, ScalAdj-ACn.

## 1. USER(S)

- **Primary User Persona:** Operator using the 2-State Engine who wants machine-verified evidence and optional fast-iteration build.
- **Anti-Persona:** User who does not use the planning doc or A.C. as source of truth.

## 2. DESIRED USER ACTION(S)

**Verb:** Verify task completion via machine-run tests and optionally run one full iteration then approve once.

| A.C. ID  | Acceptance Criteria                                                                                                                                                                                          |
| :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Verb-AC1 | CI (or equivalent) runs the project test suite on every push; pass/fail is machine-determined.                                                                                                               |
| Verb-AC2 | When a test fails or succeeds, the system traces to the relevant requirement/design and records the decision and outcome automatically and concisely (learning loop).                                        |
| Verb-AC3 | User can choose an optional flow: one shot one iteration (all tasks in that iteration), then run tests, then one approval for that iteration; this flow is only available when machine-verified tests exist. |

### Adverbs

**Sustainability Adverb:** Correctly, deterministically.

| A.C. ID        | Acceptance Criteria                                                                                                   |
| :------------- | :-------------------------------------------------------------------------------------------------------------------- |
| SustainAdv-AC1 | Test result (pass/fail) is deterministic and reproducible.                                                            |
| SustainAdv-AC2 | Learning-loop record is traceable: test result → A.C. ID → requirement/design reference; record is concise and clear. |

**Efficiency Adverb:** Incrementally, frugally.

| A.C. ID    | Acceptance Criteria                                                                          |
| :--------- | :------------------------------------------------------------------------------------------- |
| EffAdv-AC1 | Running tests does not require manual steps beyond triggering the flow (e.g. push or /test). |
| EffAdv-AC2 | Optional fast-iteration flow reduces approval steps to one per iteration when chosen.        |

**Scalability Adverb:** Repeatedly.

| A.C. ID     | Acceptance Criteria                                                                                                        |
| :---------- | :------------------------------------------------------------------------------------------------------------------------- |
| ScalAdv-AC1 | Learning-loop records accumulate without manual consolidation; format supports future tooling (e.g. metrics, meta-review). |

## 3. FEATURE (Noun)

**Noun:** Automated test verification and learning-loop system integrated with the 2-State Engine.

| A.C. ID  | Acceptance Criteria                                                                                                                                                                          |
| :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Noun-AC1 | A CI workflow (e.g. `.github/workflows/ci.yml`) runs `tests/run-tests.sh` on every push; exit code determines pass/fail.                                                                     |
| Noun-AC2 | A defined mechanism or doc location records, per test run (or per A.C.): decision/outcome and link to requirement/design (learning loop).                                                    |
| Noun-AC3 | A separate flow or command allows User to request "run full iteration N then test then one approval"; agent executes only when machine-verified tests exist and explains the option to User. |

### Adjectives

**Sustainability Adjective:** Deterministic, traceable.

| A.C. ID        | Acceptance Criteria                                                                                          |
| :------------- | :----------------------------------------------------------------------------------------------------------- |
| SustainAdj-AC1 | Learning-loop entries are machine- or agent-written from test output and AC-TEST-MAP; no fabricated content. |
| SustainAdj-AC2 | Fast-iteration flow does not skip the test run; approval is gated on test result.                            |

**Efficiency Adjective:** Automated, lightweight.

| A.C. ID    | Acceptance Criteria                                                                                         |
| :--------- | :---------------------------------------------------------------------------------------------------------- |
| EffAdj-AC1 | Learning-loop recording is automatic (triggered by test run or agent step), not a separate manual doc step. |
| EffAdj-AC2 | Fast-iteration flow is opt-in; default remains one task → evidence → approve.                               |

**Scalability Adjective:** Modular.

| A.C. ID     | Acceptance Criteria                                                                                               |
| :---------- | :---------------------------------------------------------------------------------------------------------------- |
| ScalAdj-AC1 | Learning-loop format and location are documented so future features (e.g. metrics, meta-review) can consume them. |

---

_For methodology, see `docs/ai/frameworks/effective-system-design.md`._
