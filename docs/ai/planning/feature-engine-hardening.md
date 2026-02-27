---
phase: planning
title: Effective Execution Matrix — engine-hardening
description: 4-iteration risk-sequenced roadmap for hardening the LTC 2-State Engine into a clean, enforced, portable, and indefinitely-scalable build platform.
---

# 1. THE ITERATIVE ROADMAP (Macro Prioritization)
*Sequence engineering effort to neutralize failure risks in order of impact. Never build Scalability before proving Desirability.*

* **Iteration 1 — Concept:** Neutralize the desirability risk. Does the engine work cleanly for its primary user action (Build) without legacy interference? Prove the active tree is clean and the 2-State Engine is the only model an agent will encounter.
* **Iteration 2 — Working Prototype:** Neutralize the technical feasibility risk. Does the portable core exist, do the IDE adapters work, and do the programmatic guardrails actually enforce the rules?
* **Iteration 3 — MVE (Minimum Viable Enablement):** Neutralize the usability risk. Can the user read, act, and ship without friction? Vocabulary rationalized, command files lean, testing and deployment skeletons in place, new-enablement checklist ready.
* **Iteration 4 — Enablement Leadership:** Neutralize the scale risk. Does the engine handle indefinite growth — unbounded docs, unlimited feature sets, sub-agent portability, and verified modular adapter pattern?

---

## 1.2 Master Scope Mapping

*Single source of truth for which A.C. is tackled in which iteration. MECE — each A.C. appears exactly once.*

**Status legend:** ⚪ Pending · 🔴 To Do · 🔵 Draft Completed (by Agent) · 🟢 Reviewed/Tested (by User) · 🟠 Stuck

### Table A — By Iteration

| Iteration | A.C. IDs in Scope |
| :--- | :--- |
| **1 — Concept** | Verb-AC1, Verb-AC2, Verb-AC3, EffAdj-AC2, EffAdj-AC3 |
| **2 — Working Prototype** | Verb-AC4, Verb-AC5, Verb-AC6, SustainAdv-AC1, SustainAdv-AC2, SustainAdv-AC3, SustainAdj-AC1, SustainAdj-AC2, Noun-AC1, Noun-AC2, ScalAdj-AC2 |
| **3 — MVE** | EffAdv-AC1, EffAdv-AC2, EffAdv-AC3, EffAdj-AC1, Noun-AC3, Noun-AC4, ScalAdv-AC1 |
| **4 — Enablement Leadership** | Verb-AC7, Verb-AC8, Verb-AC9, ScalAdv-AC2, ScalAdv-AC3, ScalAdj-AC1, ScalAdj-AC3 |

### Table B — By A.C. (Detail)

*One row per A.C. ID. Traceability: A.C. IDs match `docs/ai/requirements/feature-engine-hardening.md` Phase 3.*

| A.C. ID | Requirement (from Req Phase 3) | Iter | Deterministic Evidence | Status |
| :--- | :--- | :--- | :--- | :--- |
| Verb-AC1 | Clone repo → run `/state-a` with zero legacy files or competing terminology in active tree | 1 | T-104 approved; file-tree audit in docs/ai/examples/navigation-map.md: zero files outside canonical structure | 🟢 |
| Verb-AC2 | Full `/state-a` → `/state-b` cycle follows only 2-State Engine logic — no legacy model steps | 1 | T-105 approved; docs/ai/examples/state-a-simulation-evidence.md: /state-a flow and grep confirm no codeaholic/ai-devkit steps | 🟢 |
| Verb-AC3 | Any engine concept reachable in ≤ 2 navigation steps from repo root | 1 | T-104 approved; docs/ai/examples/navigation-map.md shows all commands, rules, skills in ≤ 2 steps | 🟢 |
| EffAdj-AC2 | `.cursor/skills/.../legacy_codeaholic/` and root ai-devkit files deleted; `docs/ai/archive/` cleaned to read-only label or deleted | 1 | T-101, T-102 approved; legacy_codeaholic + ai-devkit removed; archive reduced to single README.md (read-only historical) | 🟢 |
| EffAdj-AC3 | `docs/ai/` limited to: `requirements/`, `design/`, `planning/`, `frameworks/`, `examples/` | 1 | T-103 approved; directory listing confirms no implementation/deployment/monitoring in docs/ai/; only canonical folders remain | 🟢 |
| Verb-AC4 | State A and State B invokable by name in Claude Cowork without pasting instructions | 2 | T-203 approved; canonical Claude adapter moved to `.claude/CLAUDE.md` with project name, engine entry point, State A/B by name, approval phrases; root `CLAUDE.md` is a thin pointer for auto-load compatibility | 🟢 |
| Verb-AC5 | State A and State B in Cursor unchanged from current workflow | 2 | T-205 approved; `.cursor/commands/state-a.md` routes to `engine/commands/state-a.md`; evidence documented in `docs/ai/examples/state-a-routing-evidence.md` | 🟢 |
| Verb-AC6 | State A and State B in AntiGravity via README adapter — zero `engine/` changes | 2 | T-204 approved; README AntiGravity adapter section + `.antigravity/README.md` stub in place; `engine/` unchanged. Adapter structure aligned with dedicated `.claude/` and `openclaw/` folders | 🟢 |
| SustainAdv-AC1 | **Git** pre-commit hook blocks code commit without full Holy Trinity (requirements + design + planning) in same commit | 2 | T-207 approved; hook requires staged file in each of docs/ai/requirements/, design/, planning/ when code staged; plain-English error lists missing pillar(s) | 🟢 |
| SustainAdv-AC2 | **Git** pre-commit hook blocks `.env` / secrets-pattern file commits | 2 | T-207 approved; hook blocks .env/secrets-pattern files; evidence in docs/ai/examples/pre-commit-hook-evidence.md | 🟢 |
| SustainAdv-AC3 | `check-engine.sh` returns pass/fail on engine structural integrity | 2 | T-206 approved; script runs; exit 0 on clean repo; non-zero with plain-English violation list on failure | 🟢 |
| SustainAdj-AC1 | `check-engine.sh` validates: canonical files, no legacy paths, no broken `See:` refs, no IDE paths in `engine/` | 2 | T-206 approved; all 4 categories (A–D) checked; evidence in docs/ai/examples/check-engine-validation-evidence.md | 🟢 |
| SustainAdj-AC2 | `setup.sh` installs hook + validates `check-engine.sh` via single copy-paste command | 2 | T-208 approved; ./setup.sh runs end-to-end; hook and check-engine.sh executable; plain-English confirmation; evidence in docs/ai/examples/setup-sh-evidence.md | 🟢 |
| Noun-AC1 | Repo top-level matches canonical structure exactly — no extra top-level folders | 2 | T-209 approved; directory listing in docs/ai/examples/working-prototype-structure-evidence.md; check-engine.sh exit 0 | 🟢 |
| Noun-AC2 | `engine/SKILL.md` alone sufficient for any AI agent to understand and operate both States | 2 | T-201 approved; engine/ created with SKILL.md as single entry point; 21 files; grep confirms zero IDE paths in engine/ | 🟢 |
| ScalAdj-AC2 | `engine/` contains zero hardcoded IDE-specific paths | 2 | T-202 approved; `grep -r ".cursor\|CLAUDE.md\|antigravity" engine/` returns zero matches | 🟢 |
| EffAdv-AC1 | README ≤ 60 lines of prose; user understands next action in < 3 min | 3 | T-301 approved; README prose ≤ 60 lines; timed read confirms < 3 min | 🟢 |
| EffAdv-AC2 | Glossary maps ≥ 5 heavy terms to plain-English equivalents | 3 | Glossary diff showing before/after for ≥ 5 terms with plain-English mapped alongside proprietary names | ⚪ |
| EffAdv-AC3 | Every command file ≤ 30 lines; zero inline duplication of logic in `engine/` | 3 | T-303 approved; all engine/commands/*.md ≤ 30 lines; active-feature logic canonical in execute-micro-task Step 0, handoff/status/review use See: | 🟢 |
| EffAdj-AC1 | `.cursor/commands/*.md` = one-line description + `See:` pointer only; all logic in `engine/commands/` | 3 | T-202 approved; all `.cursor/commands/*.md` pointer-only; logic in engine/commands/ | 🟢 |
| Noun-AC3 | Test skeleton: `/test-write` runs once after State A → frozen AC-TEST-MAP (all iterations, all A.C., MECE, scope enforcement); `/test` runs at iteration boundary (+ regression); `/ship` commit-only | 3 | T-304 approved; T-304a approved; iteration gate in execute-micro-task Step 1.3 (AC-TEST-MAP check + run /test at boundary); `/test-write` + `/test` commands, tests/run-tests.sh, AC-TEST-MAP-TEMPLATE.md, README.md; /ship does not run tests | 🟢 |
| Noun-AC4 | Deploy skeleton: `deploy/README.md` actionable (when/commands/secrets/environment-targeting/verification/rollback) for Vercel, Railway, CF Workers; optional `deploy/run-deploy.sh` entrypoint | 3 | T-305 approved; deploy/README.md with Vercel, Railway, CF Workers, GCP, GCS, Colab; run-deploy.sh with vercel|railway|workers|gcp|gcs; "what you do" and "what the AI does" present | 🟢 |
| ScalAdv-AC1 | `new-enablement-checklist.md` enables new product init in ≤ 15 min including MCP setup | 3 | T-306 approved; new-enablement-checklist.md at repo root: clone, MCP, setup.sh, CLAUDE.md verification, first /state-a; time guidance 9–15 min | 🟢 |
| Verb-AC7 | Planning file grows unbounded; agent handles 50+ A.C. and 60+ tasks without truncation | 4 | T-401 approved; docs/ai/planning/README.md "no maximum" note; docs/ai/examples/planning-scale-test.md 52 A.C. + 65 tasks; agent read without truncation | 🟢 |
| Verb-AC8 | New capabilities added as new `feature-{name}` sets with independent I1→I4 cycles | 4 | T-402 approved; README "Adding more capabilities (multi-feature)"; new-enablement-checklist Multi-feature pattern; docs/ai/examples/multi-feature-coexisting.md | 🟢 |
| Verb-AC9 | Second AI agent operates from `engine/SKILL.md` + one feature's planning doc independently | 4 | T-403 approved; engine/SKILL.md "Sub-agent portability (Verb-AC9)"; docs/ai/examples/sub-agent-portability-evidence.md; sub-agent-patterns.md for future feature | 🟢 |
| ScalAdv-AC2 | `check-engine.sh` returns exit 0 on fresh clone after all tasks complete | 4 | Fresh clone test: `setup.sh` run; `check-engine.sh` returns exit 0; output documented as evidence | ⚪ |
| ScalAdv-AC3 | `CHANGELOG.md` complete from v1.0 to v2.0.0; version history readable in < 2 min | 4 | `CHANGELOG.md` updated with complete v2.0.0 entry; timed read confirms < 2 min | ⚪ |
| ScalAdj-AC1 | New IDE adapter = repo root file/folder + one README paragraph; zero `engine/` changes | 4 | `.antigravity/` adapter added as live test; `engine/` git diff shows zero changes; README paragraph added | ⚪ |
| ScalAdj-AC3 | Planning template explicitly states unbounded tasks per iteration | 4 | T-401 approved; docs/ai/planning/README.md Execution Matrix and each iteration: "Add task rows as the feature requires; there is no maximum" | 🟢 |

---

# 2. EXECUTION MATRIX (Micro Sequencing)

*Tasks derived from Master Scope Mapping above. Implementation details from Design §2 (Component Mapping). Add task rows as the feature requires; there is no maximum.*

---

### ITERATION 1 — CONCEPT
*Risk neutralized: Is the engine clean and usable from first clone? If legacy artifacts remain, every subsequent build is polluted.*

**Active A.C. in Scope:** Verb-AC1, Verb-AC2, Verb-AC3, EffAdj-AC2, EffAdj-AC3

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-101** | Delete `.cursor/skills/dev-lifecycle/references/legacy_codeaholic/` folder and all contents; delete root-level `.ai-devkit.json` and `ai-devkit-init-merge.yaml` (ai-devkit vestiges) | Dead legacy model and ai-devkit scaffolding eliminated — agent cannot hallucinate codeaholic or 7-phase steps; top-level is engine-canonical only | None | 🟢 Reviewed/Tested |
| **T-102** | Clean `docs/ai/archive/` — delete entirely or reduce to single `README.md` with read-only historical label | Competing mental model removed from active tree | T-101 | 🟢 Reviewed/Tested |
| **T-103** | Remove `implementation/`, `deployment/`, `monitoring/` ai-devkit vestige folders from `docs/ai/` active tree (if present) | Active doc tree is canonical-only (requirements, design, planning, frameworks, examples) | T-102 | 🟢 Reviewed/Tested |
| **T-104** | Audit entire repo file tree; confirm zero files outside canonical structure; produce a navigation map showing every engine concept reachable in ≤ 2 steps from repo root | Desirability proven: clean engine is immediately usable on first clone | T-103 | 🟢 Reviewed/Tested |
| **T-105** | Simulate `/state-a` on the current repo and confirm the agent follows only 2-State Engine logic with no legacy interference; document the test run output as evidence | Core Verb-AC2 validated: Build works without legacy contamination | T-104 | 🟢 Reviewed/Tested |

---

### ITERATION 2 — WORKING PROTOTYPE
*Risk neutralized: Does the portable core work reliably, do all three IDE adapters function, and do the guardrails actually block bad behavior?*

**Active A.C. in Scope:** Verb-AC4, Verb-AC5, Verb-AC6, SustainAdv-AC1, SustainAdv-AC2, SustainAdv-AC3, SustainAdj-AC1, SustainAdj-AC2, Noun-AC1, Noun-AC2, ScalAdj-AC2

*Add task rows as the feature requires; there is no maximum.*

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-201** | Create `engine/` folder structure; migrate all skill references, commands, and rules from `.cursor/skills/` and `.cursor/rules/` into `engine/` as the portable canonical core; write `engine/SKILL.md` as single AI entry point | Portable core exists; Noun-AC2 fulfilled | T-105 | 🟢 Reviewed/Tested |
| **T-202** | Rewrite all `.cursor/commands/*.md` files to one-line description + `See: engine/commands/{name}.md` pointer only; run `grep -r ".cursor\|CLAUDE.md\|antigravity" engine/` and confirm zero matches | Cursor adapter is thin pointer; `engine/` is fully IDE-agnostic (ScalAdj-AC2) | T-201 | 🟢 Reviewed/Tested |
| **T-203** | Create Claude adapter with canonical `.claude/CLAUDE.md` (project name, engine entry point `engine/SKILL.md`, State A/B invocation by name, approval phrases table); keep root `CLAUDE.md` as thin pointer for compatibility; test by invoking State A in Claude Cowork using only Claude adapter context | Cowork/Claude adapter works (Verb-AC4) | T-201 | 🟢 Reviewed/Tested |
| **T-204** | Write AntiGravity adapter section in README ("Using this engine in AntiGravity" — one paragraph with exact steps); create stub `.antigravity/` folder with pointer file if needed; verify zero `engine/` changes required; align adapter structure documentation with dedicated `.claude/` and `openclaw/` folders | Any-IDE portability proven (Verb-AC6) | T-201 | 🟢 Reviewed/Tested |
| **T-205** | Verify Cursor workflow unchanged: run existing `/state-a` command and confirm it routes correctly through `engine/commands/state-a.md`; document test run | Cursor adapter backward-compatible (Verb-AC5) | T-202 | 🟢 Reviewed/Tested |
| **T-206** | Write `check-engine.sh` with 4 validation categories: (a) canonical files/folders present, (b) no legacy artifact paths, (c) no broken `See:` cross-references in `.cursor/commands/`, (d) no IDE-specific paths in `engine/`; test on current repo | Self-validation works (SustainAdv-AC3, SustainAdj-AC1) | T-202 | 🟢 Reviewed/Tested |
| **T-207** | Write **git** pre-commit hook (`.git/hooks/pre-commit`, bash) blocking: (a) code file staged without full Holy Trinity (requirements + design + planning), (b) `.env` / secrets-pattern files staged; test both trigger conditions | Hard rules enforced programmatically in any IDE that uses git (SustainAdv-AC1, SustainAdv-AC2) | T-206 | 🟢 Reviewed/Tested |
| **T-208** | Write `setup.sh` that installs the pre-commit hook and makes `check-engine.sh` executable; test end-to-end on clean state | Zero-friction guardrail activation (SustainAdj-AC2) | T-207 | 🟢 Reviewed/Tested |
| **T-209** | Run full canonical structure verification: directory listing confirms Noun-AC1 top-level exactly; run `check-engine.sh` and confirm exit 0; document as Working Prototype evidence | Working Prototype structurally sound (Noun-AC1) | T-208 | 🟢 Reviewed/Tested |

---

### ITERATION 3 — MVE (MINIMUM VIABLE ENABLEMENT)
*Risk neutralized: Can the user read, understand, act, and ship without friction? Engine is usable — not just functional.*

**Active A.C. in Scope:** EffAdv-AC1, EffAdv-AC2, EffAdv-AC3, EffAdj-AC1, Noun-AC3, Noun-AC4, ScalAdv-AC1

*Add task rows as the feature requires; there is no maximum.*

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-301** | Rewrite README to ≤ 60 lines of prose (excluding tables and code blocks); every sentence is "what to do" or "why" — no decorative framing; count lines and confirm | User reads and acts in < 3 min (EffAdv-AC1) | T-209 | 🟢 Reviewed/Tested |
| **T-302** | Rationalize Glossary: identify ≥ 5 heavy proprietary terms with plain-English equivalents; update Glossary with before/after mapping; Glossary remains single reference point | Cognitive load reduced (EffAdv-AC2) | T-301 | ⚪ Pending (dropped by User) |
| **T-303** | Trim all `engine/commands/` files to ≤ 30 lines each; remove all inline duplication (any logic that appears in two files gets moved to one canonical location with a `See:` pointer in the other); line-count all files and confirm | Every command readable in < 60 sec (EffAdv-AC3) | T-301 | 🟢 Reviewed/Tested |
| **T-304** | Create `tests/` with: (1) `tests/run-tests.sh` — discovers and runs the project's test runner (npm test, pytest, cargo test, go test); when none detected, prints "No tests defined yet — add a test runner or script for your stack" and exits 0. (2) `tests/AC-TEST-MAP-TEMPLATE.md` — template for linking tests to A.C. MECE: one row per A.C., grouped by iteration, columns: A.C. ID / Requirement / Test(s) / Pass condition. (3) `tests/README.md` — documents the full contract: `/test-write` runs once after State A to produce the frozen AC-TEST-MAP covering all iterations/A.C.; `/test` runs at each iteration boundary (+ regression); AC-TEST-MAP is scope enforcement (no map row = scope creep); pivot requires State A re-plan → `/test-write` re-run; `/ship` commit-only. (4) `/test-write` command (`engine/commands/test-write.md` + `.cursor/commands/test-write.md`) — Test Agent writes full AC-TEST-MAP from approved Holy Trinity; spec-first policy (derive from AC, include failure-path, hard-stop on ambiguous AC). (5) Update `/test` (`engine/commands/test.md`) to reference iteration-boundary usage. **Do not** wire tests into `/ship`. Verify: no-runner case exits 0 with message; AC-TEST-MAP-TEMPLATE exists; test-write command exists; README documents contract. | Robust test skeleton with frozen AC-TEST-MAP as scope enforcement, iteration-boundary validation, role separation (Noun-AC3) | T-303 | 🟢 Reviewed/Tested |
| **T-304a** | Add execution gate in `engine/skills/dev-lifecycle/references/execute-micro-task.md`: at the iteration transition gate (Step 1.3), if no AC-TEST-MAP exists for the active feature (`tests/AC-TEST-MAP.md` or `tests/AC-TEST-MAP-{feature}.md`), hard-stop and prompt User to run `/test-write` (or explicitly waive). Also add: at the iteration boundary, run `/test` and confirm that iteration's A.C. tests pass before allowing "Proceed to Iteration N+1". | Enforces test baseline existence and iteration-boundary validation before advancing | T-304 | 🟢 Reviewed/Tested |
| **T-305** | Create `deploy/README.md` with three actionable patterns (Vercel, Railway, Cloudflare Workers): when to use, exact commands, secrets placement, explicit environment targeting (staging/preview vs prod), post-deploy verification steps, and one-line rollback; "what you do" and "what the AI does for you" for each. Optionally add `deploy/run-deploy.sh` that accepts target (vercel \| railway \| workers) plus environment (staging \| prod), invokes corresponding platform CLI, and requires explicit intent for prod. Confirm deployment path is visible and actionable (Noun-AC4). | Robust deploy skeleton with safety principles; deployment path visible and usable (Noun-AC4) | T-304 | 🟢 Reviewed/Tested |
| **T-306** | Write `new-enablement-checklist.md` covering: clone, MCP setup, `setup.sh` run, `CLAUDE.md` verification, first `/state-a` run; time a walkthrough on fresh clone and confirm ≤ 15 min | New product initialization is frictionless (ScalAdv-AC1) | T-305 | 🟢 Reviewed/Tested |

---

### ITERATION 4 — ENABLEMENT LEADERSHIP
*Risk neutralized: Does the engine scale indefinitely — across years of work, unlimited feature sets, and eventual sub-agent operation — without structural breakdown?*

**Active A.C. in Scope:** Verb-AC7, Verb-AC8, Verb-AC9, ScalAdv-AC2, ScalAdv-AC3, ScalAdj-AC1, ScalAdj-AC3

*Add task rows as the feature requires; there is no maximum.*

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-401** | Update planning doc template (`docs/ai/planning/README.md`) to add explicit note in Execution Matrix section: "Add task rows as the feature requires; there is no maximum." Create a test planning doc with 50+ A.C. rows and 60+ task rows; confirm agent reads without truncation or self-limiting | No artificial task ceiling (Verb-AC7, ScalAdj-AC3) | T-306 | 🟢 Reviewed/Tested |
| **T-402** | Document multi-feature-set pattern in README and `new-enablement-checklist.md`: when a live (I4) product needs new capabilities, start a new `feature-{name}` set with its own I1→I4 cycle; add worked example to `docs/ai/examples/` showing two features coexisting in one product repo | Multi-product scale proven (Verb-AC8) | T-401 | 🟢 Reviewed/Tested |
| **T-403** | Add sub-agent portability section to `engine/SKILL.md`: explains how a specialist sub-agent reads `engine/SKILL.md` + one feature's planning doc and executes tasks from its assigned iteration independently; simulate with a fresh agent and document result | Swarm-readiness validated (Verb-AC9) | T-402 | 🟢 Reviewed/Tested |
| **T-404** | Add `.antigravity/` adapter as live end-to-end test of modular adapter pattern: create adapter file, add README paragraph, confirm zero `engine/` changes in git diff; document as evidence | Modular adapter pattern proven (ScalAdj-AC1) | T-403 | ⚪ Pending |
| **T-405** | Update `CHANGELOG.md` with complete v2.0.0 entry (summary of all changes from v1.x); update `.template-version` file to `2.0.0` | Version history complete and readable in < 2 min (ScalAdv-AC3) | T-404 | ⚪ Pending |
| **T-406** | Run `check-engine.sh` on a fresh clone after all tasks complete; confirm exit 0; document full output as final evidence of Enablement Leadership | Full engine integrity confirmed at scale (ScalAdv-AC2) | T-405 | ⚪ Pending |

---

# 3. CURRENT REPO ALIGNMENT (No Conflicts)

*Before executing engine-hardening, this section documents how current config and structure map to the hardened state. No conflicts if tasks are executed in order.*

| Current item | Hardened state | Conflict? | Resolved by |
| :--- | :--- | :--- | :--- |
| **`.cursor/commands/*.md`** (12 files: state-a, state-b, status, test-write, test, ship, debug, handoff, review, remember, help, heavy) | Pointer-only: one-line + `See: engine/commands/{name}.md`. Same 12 files. `/test-write` is Test Agent test authoring; `/test` runs test skeleton; `/ship` is commit-only. | No | T-202: rewrite to pointers; T-304: add `/test-write` and `/test`; logic in `engine/commands/`. |
| **`.cursor/rules/*.mdc`** (anti-patterns, context-preservation, ambient-flow) | Pointer-only: one-line + `See: engine/rules/{name}.md`. Content in `engine/rules/`. | No | T-201: migrate content to `engine/rules/`; T-202 or I3: `.cursor/rules/` become pointers. |
| **`.cursor/skills/dev-lifecycle/`** (SKILL.md, references/, scripts/) | Content in `engine/skills/dev-lifecycle/`; `.cursor/skills/` minimal entry + `See: engine/...`. | No | T-201: create `engine/` and migrate; pointer layer in Cursor adapter. |
| **`.claude/`** (`.claude/CLAUDE.md`, `.claude/README.md`) | Dedicated Claude adapter folder; canonical Claude instructions live in `.claude/CLAUDE.md`; root `CLAUDE.md` is pointer-only for compatibility. | No | T-203: establish canonical Claude adapter + root pointer. |
| **`openclaw/`** (`AGENTS.md`, `TOOLS.md`, `BOOTSTRAP.md`, `openclaw.json.example`, `README.md`) | Dedicated OpenClaw adapter pack; engine entry remains `engine/SKILL.md`; OpenClaw-specific orchestration docs live outside `engine/`. | No | Alignment update: adapter structure documented; no `engine/` logic changes. |
| **`.cursor/mcp.json`** (ai-devkit-memory, claude-ptc-mcp) | Unchanged — Cursor-specific MCP config stays in `.cursor/`. | No | No task removes it; Noun-AC1 explicitly allows `.cursor/` with MCP config. |
| **`.ai-devkit.json`**, **`ai-devkit-init-merge.yaml`** | Removed as ai-devkit vestiges; not in canonical top-level. | Yes (if left in place) | T-101: delete both; `check-engine.sh` validates absence. |
| **`docs/ai/implementation/`, `deployment/`, `monitoring/`** | Removed from active tree (ai-devkit vestiges). Only requirements, design, planning, frameworks, examples remain. | No | T-103: remove if present. (Currently only in `archive/`; confirm no active copies.) |
| **`legacy_codeaholic`** (under `.cursor/skills/.../references/`) | Deleted. | No | T-101: delete folder and contents. |

*Execution order preserves Cursor workflow: I1 removes legacy; I2 creates `engine/` and pointer layer so Cursor continues to discover commands/rules/skills via `.cursor/` while logic lives in `engine/`.*

---

# 4. RESOURCE & BUDGET TRACKER

*Monitor constraints mapped to Efficiency Adjectives. Update Hard Limit after User approval per Design §4.*

| Metric | Current Usage | Hard Limit | Status |
| :--- | :--- | :--- | :--- |
| **Financial Cost (OpEx)** | $0.00 | $0 (no new paid services) | 🟢 Safe |
| **API/Token/Compute** | Existing Cursor/Cowork sessions | Existing plan | 🟢 Safe |

*This feature is pure engine work — no new APIs, no new infrastructure, no new paid dependencies.*
