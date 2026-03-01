---
phase: design
title: Automated Test Verification — Design
feature: automated-test-verification
esd_reference: docs/ai/frameworks/effective-system-design.md
---

# Design — automated-test-verification

> **Goal:** Machine-verified evidence (CI); learning loop (trace test result → requirement/design, record outcome); optional fast-iteration build.

---

# 0. DOCUMENT CONTROL (Design Doc)

| Field            | Value                       |
| :--------------- | :-------------------------- |
| **Feature**      | automated-test-verification |
| **Version**      | 0.1                         |
| **Status**       | Draft                       |
| **Last updated** | [Date]                      |

---

# 1. THE SYSTEM DESIGN (Context & Bridge)

| Element                 | Content                                                                                                                                                                                                                                                                   |
| :---------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Principles (Why)**    | P2(S)—binary test immediately after build; P5(Sc)—Measure step (outcome recorded). Learning loop closes the gap between test result and requirement/design. Fast-iteration optional and only when tests are machine-verified.                                             |
| **Environment (Where)** | Repo (Git); CI (e.g. GitHub Actions); `docs/ai/` (requirements, design, planning); `tests/` (run-tests.sh, AC-TEST-MAP).                                                                                                                                                  |
| **Desirable Wrapper**   | User-facing commands/flows: standard /state-b (one task → evidence → approve) and optional iteration-mode (one shot one iteration → test → one approval).                                                                                                                 |
| **Effective Core**      | CI workflow; learning-loop recorder (trace test → A.C. → requirement/design, write outcome); execute-micro-task logic extended for optional iteration-mode.                                                                                                               |
| **EOP (How)**           | User runs /state-a → Holy Trinity approved → /test-write → /state-b. CI runs on push. On test run (CI or /test), agent or script traces result to A.C./requirement/design and appends a concise record. User may invoke iteration-mode when machine-verified tests exist. |

---

# 2. TECHNICAL ARCHITECTURE (The Noun)

**Feature Noun:** Automated test verification (CI + learning loop + optional fast-iteration flow).

## 2.1 Visual Map (Mermaid)

```mermaid
graph TD
    USER[User] --> CMD[Commands: /state-b or optional iteration-mode]
    CMD --> TASK[Execute tasks]
    TASK --> CI[CI runs tests on push]
    TASK --> TEST[/test at boundary]
    CI --> RESULT[Pass/Fail]
    TEST --> RESULT
    RESULT --> TRACE[Trace to A.C. / Req / Design]
    TRACE --> RECORD[Learning-loop record]
    RECORD --> DOCS[docs/ai/ or designated location]
    RESULT --> APPROVE[User approval: one per task or one per iteration]
```

## 2.2 Component Mapping

| Component                    | A.C. IDs delivered                                                          | Implementation summary                                                                                                                                                        |
| :--------------------------- | :-------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CI workflow                  | Noun-AC1, Verb-AC1, SustainAdv-AC1, EffAdv-AC1                              | Runs `tests/run-tests.sh` on every push; exit code = pass/fail.                                                                                                               |
| Learning-loop recorder       | Verb-AC2, Noun-AC2, SustainAdv-AC2, SustainAdj-AC1, EffAdj-AC1, ScalAdj-AC1 | Input: test result + AC-TEST-MAP. Output: concise record (decision/outcome) linked to A.C. ID and requirement/design. Written to Design §5 (this doc) or designated location. |
| Optional fast-iteration flow | Verb-AC3, Noun-AC3, SustainAdj-AC2, EffAdv-AC2, EffAdj-AC2                  | Command or mode (e.g. `/state-b --iteration`). Agent runs all tasks in current iteration, then tests, then one approval gate. Only when machine-verified tests exist.         |

## 2.3 Data Models & APIs

| Entity / artifact    | Key fields or behavior                                                                                                            | Notes                                            |
| :------------------- | :-------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------- |
| CI workflow          | Trigger: push. Input: repo state. Output: exit 0 (pass) or non-zero (fail).                                                       | File-based; no API.                              |
| Learning-loop record | timestamp, test result (pass/fail), A.C. ID(s) or scope, requirement/design ref, outcome summary (one-two sentences)              | Markdown or frontmatter+body for future tooling. |
| Iteration-mode       | Input: current feature, iteration index, planning doc. Output: batch of tasks executed; single test result; single approval gate. | Agent/command logic.                             |

---

# 3. EFFECTIVENESS ATTRIBUTES (The Adjectives)

| Pillar             | Attribute                | Implementation strategy                                                                                          | A.C. IDs                                                       | Iter |
| :----------------- | :----------------------- | :--------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------- | :--- |
| **Sustainability** | Deterministic, traceable | Deterministic test result; learning record from test output + AC-TEST-MAP only; fast-iteration gated on test run | SustainAdv-AC1, SustainAdv-AC2, SustainAdj-AC1, SustainAdj-AC2 | 1    |
| **Efficiency**     | Automated, lightweight   | CI and learning record automatic; fast-iteration opt-in, one approval per iteration when chosen                  | EffAdv-AC1, EffAdv-AC2, EffAdj-AC1, EffAdj-AC2                 | 1–2  |
| **Scalability**    | Modular                  | Learning-loop format documented for future tooling (metrics, meta-review)                                        | ScalAdj-AC1, ScalAdv-AC1                                       | 1, 3 |

---

# 4. RESOURCE IMPACT (The "Price Tag")

| Metric                    | Value                                                                                                        | Hard limit | Status  |
| :------------------------ | :----------------------------------------------------------------------------------------------------------- | :--------- | :------ |
| **Financial Cost (OpEx)** | $0 (GitHub Actions free tier)                                                                                | N/A        | 🟢 Safe |
| **Build Complexity**      | Low–medium                                                                                                   | —          | —       |
| **ROI sanity check**      | Machine-verified evidence reduces manual review; learning loop compounds; fast-iteration optional when safe. | —          | —       |

---

# 5. LEARNING LOOP LOG

_Append-only. When a test fails or succeeds, trace to A.C. and requirement/design; record decision and outcome concisely. Source: test output + AC-TEST-MAP. Filled automatically or by agent after each test run._

**Trace:** Test result → AC-TEST-MAP (which A.C. this test validates) → Requirements Phase 3 (A.C. text) and Design §2/§3 (component/attribute).  
**Template per entry:** `[Date] [A.C. ID] [Pass/Fail]: [one-line outcome]. Req/Design: [doc ref].`

| Date       | A.C. / Scope | Result | Outcome (one line)                               | Req/Design ref                                                     |
| :--------- | :----------- | :----- | :----------------------------------------------- | :----------------------------------------------------------------- |
| 2026-02-24 | suite (I1)   | Pass   | run-tests.sh ran; no project test stack; exit 0. | Req Verb-AC1, Noun-AC1; Design §2.2                                |
| 2026-02-24 | I1 gate      | Pass   | run-tests.sh ran; no tests defined; exit 0.      | Req Verb-AC1; Design §2.2                                          |
| 2026-02-24 | I2 gate      | Pass   | run-tests.sh ran; no tests defined; exit 0.      | Req EffAdv-AC2; Design §2.2                                        |
| 2026-02-24 | I3 (suite)   | Pass   | run-tests.sh ran; no tests defined; exit 0.      | Req ScalAdv-AC1, ScalAdj-AC1; Design §5; tests/README §For tooling |
| 2026-02-24 | I4 (suite)   | Pass   | run-tests.sh ran; no tests defined; exit 0.      | I4 closure: no spawned A.C.s; T-401 confirmed                      |

_Do not remove or edit prior rows; append only._

**Backlog (before T-301):** Before locking the learning-loop format for tooling, review `tests/append-learning-loop.sh`: confirm table column order is locked; decide escape of `OUTCOME` (pipes/newlines) or document "no pipes/newlines" in script and test.md; test a real CI run to verify the row appends correctly.

**For tooling:** Format and location are documented in `tests/README.md` under "Learning-loop record → For tooling (metrics, meta-review)" so future features can discover and parse the log (discovery path, table schema, consumption notes).

---

_For methodology, see `docs/ai/frameworks/effective-system-design.md` §2._
