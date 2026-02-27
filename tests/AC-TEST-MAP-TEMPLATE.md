# AC-TEST-MAP (Template)

Link every test to exactly one Acceptance Criterion. MECE: no gap (every in-scope A.C. has at least one test row), no overlap (each test row ties to one A.C.).

**When created:** `/test-write` runs **once after State A** produces the approved Holy Trinity. The Test Agent copies this template to `tests/AC-TEST-MAP.md` (or `tests/AC-TEST-MAP-{feature}.md`) and populates the table for **all** iterations and **all** A.C. in one coherent map.

**Frozen baseline:** The AC-TEST-MAP is immutable during `/state-b` execution. If a pivot changes what any A.C. means, the flow is: State A re-plan → Holy Trinity updated and approved → `/test-write` re-runs → new AC-TEST-MAP → execution resumes.

**Scope enforcement:** The AC-TEST-MAP mirrors the Holy Trinity. Anything built during `/state-b` that has no corresponding row in this map is scope creep. At the iteration boundary, the agent should verify: "Did I build anything not covered by a row in the AC-TEST-MAP?"

**Source of truth for A.C. IDs:** `docs/ai/requirements/feature-{name}.md` Phase 3 and `docs/ai/planning/feature-{name}.md` Table B.

---

## How to use

1. **Copy** this file to `tests/AC-TEST-MAP.md` (or `tests/AC-TEST-MAP-{feature}.md`) when `/test-write` runs.
2. **Populate** one row per in-scope A.C. across all iterations. Order: by iteration, then by A.C. ID.
3. **Fill** the Test(s) and Pass condition columns. For non-automated checks, use "Manual: [description]" or "`check-engine.sh` category [X]".
4. **Freeze.** Do not modify during `/state-b` execution without State A re-plan.
5. **Run** `/test` at each iteration boundary. Prior iterations' tests must still pass (regression).

---

## AC-TEST-MAP Table

| A.C. ID | Requirement (one-line from Req Phase 3) | Test(s) / file or suite | Pass condition |
| :--- | :--- | :--- | :--- |
| | | | |

*Group by iteration for causal readability:*

### Iteration 1 — [Name]
| A.C. ID | Requirement | Test(s) | Pass condition |
| :--- | :--- | :--- | :--- |
| | | | |

### Iteration 2 — [Name]
| A.C. ID | Requirement | Test(s) | Pass condition |
| :--- | :--- | :--- | :--- |
| | | | |

*(Continue for all iterations…)*

---

## Notes

- **Failure-path tests:** Include both happy-path and failure-path tests where the A.C. implies them (e.g. "blocks commit without Holy Trinity" → test that commit fails).
- **Ambiguous A.C.:** Do not invent a test. Hard-stop and ask the User to clarify (per `/test-write` spec-first policy).
- **Not every test is automated.** The Test(s) column can say "Manual: file-tree audit" or "`check-engine.sh` category B" — the map is about traceability, not automation.
