# AC-TEST-MAP — automated-test-verification

Link every test to exactly one Acceptance Criterion. MECE: no gap (every in-scope A.C. has at least one test row), no overlap (each test row ties to one A.C.).

**When created:** `/test-write` run once after State A (Holy Trinity approved). Covers all iterations and all A.C. for feature `automated-test-verification`.

**Frozen baseline:** This map is immutable during `/state-b` execution. If a pivot changes any A.C., the flow is: State A re-plan → Holy Trinity updated and approved → `/test-write` re-runs → new AC-TEST-MAP → execution resumes.

**Scope enforcement:** The AC-TEST-MAP mirrors the Holy Trinity. Anything built during `/state-b` that has no corresponding row here is scope creep. At the iteration boundary, verify: nothing was built outside this map.

**Source of truth for A.C. IDs:** `docs/ai/requirements/feature-automated-test-verification.md` Phase 3 and `docs/ai/planning/feature-automated-test-verification.md` Table B.

---

## How to use

1. **Populate** one row per in-scope A.C. across all iterations. Order: by iteration, then by A.C. ID. ✓ Done below.
2. **Run** `/test` at each iteration boundary. Prior iterations' tests must still pass (regression).
3. **Freeze.** Do not modify during `/state-b` execution without State A re-plan.

---

## AC-TEST-MAP Table

### Iteration 1 — Concept (Desirable Wrapper)


| A.C. ID        | Requirement (one-line from Req Phase 3)                                                                                             | Test(s) / file or suite                                                                                            | Pass condition                                                                                                  |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| Verb-AC1       | CI runs the project test suite on every push; pass/fail is machine-determined.                                                      | Trigger: push to repo. CI workflow runs.                                                                           | Workflow runs `tests/run-tests.sh`; exit 0 = pass, non-zero = fail.                                             |
| Verb-AC2       | When a test fails or succeeds, trace to requirement/design and record decision/outcome automatically and concisely (learning loop). | After CI or /test: check learning-loop record exists and references A.C. / req/design.                             | Record present; contains test result, A.C. ID or scope, requirement/design ref; concise.                        |
| Verb-AC3       | User can choose optional flow: one shot one iteration → test → one approval; only when machine-verified tests exist.                | Manual: command or flow doc exists; agent offers option only when CI (or run-tests.sh) exists.                     | Doc or command describes iteration-mode; gate: machine-verified tests exist; default remains one-task approval. |
| SustainAdv-AC1 | Test result (pass/fail) is deterministic and reproducible.                                                                          | Run `tests/run-tests.sh` twice with same repo state.                                                               | Same exit code both runs.                                                                                       |
| SustainAdv-AC2 | Learning-loop record is traceable: test result → A.C. ID → requirement/design reference; concise and clear.                         | Manual: inspect learning-loop record format.                                                                       | Record has fields: result, A.C. ID(s) or scope, requirement/design ref; one-two sentences.                      |
| Noun-AC1       | CI workflow runs `tests/run-tests.sh` on every push; exit code determines pass/fail.                                                | Presence of `.github/workflows/ci.yml` (or equivalent); workflow triggers on push; step runs `tests/run-tests.sh`. | File exists; on push, workflow runs and executes run-tests.sh; pass/fail from exit code.                        |
| Noun-AC2       | Defined mechanism or doc location records per test run (or per A.C.): decision/outcome and link to requirement/design.              | Manual: designated location (e.g. `docs/ai/lessons/` or design section) and mechanism exist.                       | Location documented; mechanism or step writes record from test output + AC-TEST-MAP.                            |
| Noun-AC3       | Separate flow or command allows "run full iteration N then test then one approval"; only when machine-verified tests exist.         | Manual: command or flow exists; agent logic checks for CI/run-tests before offering.                               | Command or flow documented; agent does not offer iteration-mode when no machine-verified tests.                 |
| SustainAdj-AC1 | Learning-loop entries are machine- or agent-written from test output and AC-TEST-MAP; no fabricated content.                        | Manual: recorder implementation uses test output and AC-TEST-MAP as input.                                         | No free-form invention; fields derived from run result and map.                                                 |
| SustainAdj-AC2 | Fast-iteration flow does not skip the test run; approval is gated on test result.                                                   | Manual: iteration-mode flow description or code path.                                                              | Flow always runs tests before presenting approval; approval step shows test result.                             |
| EffAdj-AC1     | Learning-loop recording is automatic (triggered by test run or agent step), not a separate manual doc step.                         | Manual (I1): design specifies trigger. Automated (I2): CI or agent step triggers recorder.                         | No "please manually write the learning record" in EOP.                                                          |
| EffAdj-AC2     | Fast-iteration flow is opt-in; default remains one task → evidence → approve.                                                       | Manual: default /state-b behavior and docs.                                                                        | Standard /state-b is one task → evidence → approve; iteration-mode is explicit choice.                          |
| ScalAdj-AC1    | Learning-loop format and location are documented so future features can consume them.                                               | Manual (I3): design doc or README section.                                                                         | Doc describes format (fields, example) and location; future tooling can parse.                                  |


### Iteration 2 — Prototype (Desirable Wrapper)


| A.C. ID    | Requirement (one-line from Req Phase 3)                                                      | Test(s) / file or suite                       | Pass condition                                                                       |
| ---------- | -------------------------------------------------------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------ |
| EffAdv-AC1 | Running tests does not require manual steps beyond triggering the flow (e.g. push or /test). | Push triggers CI; /test runs run-tests.sh.    | No manual "run this script then paste output"; push or /test suffices.               |
| EffAdv-AC2 | Optional fast-iteration flow reduces approval steps to one per iteration when chosen.        | Manual: use iteration-mode for one iteration. | Single approval gate for the iteration after tests run; not N approvals for N tasks. |


### Iteration 3 — MVE (Effective Core)


| A.C. ID     | Requirement (one-line from Req Phase 3)                                                        | Test(s) / file or suite                              | Pass condition                                                                  |
| ----------- | ---------------------------------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------- |
| ScalAdv-AC1 | Learning-loop records accumulate without manual consolidation; format supports future tooling. | Manual: multiple records exist; format doc complete. | Records append over time; format doc allows consumption by metrics/meta-review. |


### Iteration 4 — Leadership (Spawned A.C.s)


| A.C. ID     | Requirement (one-line from Req Phase 3)        | Test(s) / file or suite                   | Pass condition       |
| ----------- | ---------------------------------------------- | ----------------------------------------- | -------------------- |
| *(Spawned)* | *(Any new A.C. from MVE testing added at I4.)* | *(Defined when spawned A.C. is written.)* | *(Per spawned A.C.)* |


---

## Notes

- **Failure-path:** CI workflow: test that a failing test run produces non-zero exit and (if implemented) that learning-loop record reflects failure. Fast-iteration: test that approval is not offered when tests fail.
- **Not every test is automated.** Rows marked "Manual" are traceability/audit; automation can be added later (e.g. script that checks CI file presence, or recorder integration test).

