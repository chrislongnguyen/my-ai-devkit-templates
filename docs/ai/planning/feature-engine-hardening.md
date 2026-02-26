---
phase: planning
title: Effective Execution Matrix — engine-hardening
description: 4-iteration risk-sequenced roadmap for hardening the LTC 2-State Engine into a clean, enforced, portable, and indefinitely-scalable build platform.
---

# 1. THE ITERATIVE ROADMAP (Macro Prioritization)
*Sequence engineering effort to neutralize failure risks in order of impact. Never build Scalability before proving Desirability.*

* **Iteration 1 — Concept:** Neutralize the desirability risk. Does the engine work cleanly for its primary user action (Build) without legacy interference? Prove the active tree is clean and the 2-State Engine is the only model an agent will encounter.
* **Iteration 2 — Working Prototype:** Neutralize the technical feasibility risk. Does the portable core exist, do the IDE adapters work, and do the programmatic guardrails actually enforce the rules?
* **Iteration 3 — MVE (Minimum Viable Enablement):** Neutralize the usability risk. Can the user read, act, and ship without friction? Vocabulary rationalized, command files lean, testing and deployment skeletons in place, new-venture checklist ready.
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
| Verb-AC1 | Clone repo → run `/state-a` with zero legacy files or competing terminology in active tree | 1 | File-tree audit: zero files outside canonical structure | 🔴 |
| Verb-AC2 | Full `/state-a` → `/state-b` cycle follows only 2-State Engine logic — no legacy model steps | 1 | Test run of `/state-a` on fresh clone: no codeaholic/ai-devkit steps surfaced | 🔴 |
| Verb-AC3 | Any engine concept reachable in ≤ 2 navigation steps from repo root | 1 | Navigation map showing all commands/rules/skills reachable in ≤ 2 steps | 🔴 |
| EffAdj-AC2 | `legacy_codeaholic/` deleted; `docs/ai/archive/` cleaned to read-only label or deleted | 1 | `git rm` output confirming deletions; directory listing confirms absence | 🔴 |
| EffAdj-AC3 | `docs/ai/` limited to: `requirements/`, `design/`, `planning/`, `frameworks/`, `examples/` | 1 | Directory listing confirming only canonical folders remain | 🔴 |
| Verb-AC4 | State A and State B invokable by name in Claude Cowork without pasting instructions | 2 | `CLAUDE.md` exists at repo root; test invocation in Cowork follows engine logic correctly | ⚪ |
| Verb-AC5 | State A and State B in Cursor unchanged from current workflow | 2 | `.cursor/commands/` pointer files verified; existing `/state-a` test run passes | ⚪ |
| Verb-AC6 | State A and State B in AntiGravity via README adapter — zero `engine/` changes | 2 | README adapter section exists; `engine/` git diff shows zero changes during adapter add | ⚪ |
| SustainAdv-AC1 | Pre-commit hook blocks code commit without corresponding design doc | 2 | Hook fires on test commit of code file with no design doc; plain-English error printed | ⚪ |
| SustainAdv-AC2 | Pre-commit hook blocks `.env` / secrets-pattern file commits | 2 | Hook fires on test commit of `.env` file; blocked before reaching git history | ⚪ |
| SustainAdv-AC3 | `check-engine.sh` returns pass/fail on engine structural integrity | 2 | Script runs; exit 0 on clean repo; non-zero with plain-English violation list on broken repo | ⚪ |
| SustainAdj-AC1 | `check-engine.sh` validates: canonical files, no legacy paths, no broken `See:` refs, no IDE paths in `engine/` | 2 | Script output shows all 4 validation categories checked; each reports pass/fail independently | ⚪ |
| SustainAdj-AC2 | `setup.sh` installs hook + validates `check-engine.sh` via single copy-paste command | 2 | `setup.sh` runs end-to-end; hook confirmed active via `ls .git/hooks/pre-commit`; plain-English confirmation printed | ⚪ |
| Noun-AC1 | Repo top-level matches canonical structure exactly — no extra top-level folders | 2 | Directory listing confirming exact structure; `check-engine.sh` exit 0 | ⚪ |
| Noun-AC2 | `engine/SKILL.md` alone sufficient for any AI agent to understand and operate both States | 2 | Fresh agent test: agent reads only `engine/SKILL.md` and correctly describes State A, State B, all commands, and approval phrases | ⚪ |
| ScalAdj-AC2 | `engine/` contains zero hardcoded IDE-specific paths | 2 | `grep -r ".cursor\|CLAUDE.md\|antigravity" engine/` returns zero matches | ⚪ |
| EffAdv-AC1 | README ≤ 60 lines of prose; user understands next action in < 3 min | 3 | Line count confirmed ≤ 60; timed read by user confirms clarity | ⚪ |
| EffAdv-AC2 | Glossary maps ≥ 5 heavy terms to plain-English equivalents | 3 | Glossary diff showing before/after for ≥ 5 terms with plain-English mapped alongside proprietary names | ⚪ |
| EffAdv-AC3 | Every command file ≤ 30 lines; zero inline duplication of logic in `engine/` | 3 | Line count on all `engine/commands/` files ≤ 30; grep for duplicated logic patterns returns zero | ⚪ |
| EffAdj-AC1 | `.cursor/commands/*.md` = one-line description + `See:` pointer only; all logic in `engine/commands/` | 3 | Diff of all `.cursor/commands/` files confirms pointer-only content | ⚪ |
| Noun-AC3 | `tests/run-tests.sh` exists; called by `/ship`; exits 0 with "no tests defined" message on first use | 3 | Script exists at `tests/run-tests.sh`; `engine/commands/ship.md` updated with test call; first-run output confirmed | ⚪ |
| Noun-AC4 | `deploy/README.md` with Vercel/Railway/CF Workers patterns ≤ 10 lines each | 3 | File exists; line count per stack entry ≤ 10; "what you do" and "what the AI does" sections present for each | ⚪ |
| ScalAdv-AC1 | `new-venture-checklist.md` enables new product init in ≤ 15 min including MCP setup | 3 | Checklist exists; timed walkthrough on fresh clone completes in ≤ 15 min | ⚪ |
| Verb-AC7 | Planning file grows unbounded; agent handles 50+ A.C. and 60+ tasks without truncation | 4 | Planning template updated with explicit "no cap" note; test planning doc with 50+ A.C. rows created; agent reads without truncation | ⚪ |
| Verb-AC8 | New capabilities added as new `feature-{name}` sets with independent I1→I4 cycles | 4 | `new-venture-checklist.md` and README document multi-feature-set pattern; example in `docs/ai/examples/` shows two features coexisting in one product repo | ⚪ |
| Verb-AC9 | Second AI agent operates from `engine/SKILL.md` + one feature's planning doc independently | 4 | Sub-agent portability documented in `engine/SKILL.md`; simulated fresh agent reads entry point + planning doc and executes one task correctly | ⚪ |
| ScalAdv-AC2 | `check-engine.sh` returns exit 0 on fresh clone after all tasks complete | 4 | Fresh clone test: `setup.sh` run; `check-engine.sh` returns exit 0; output documented as evidence | ⚪ |
| ScalAdv-AC3 | `CHANGELOG.md` complete from v1.0 to v2.0.0; version history readable in < 2 min | 4 | `CHANGELOG.md` updated with complete v2.0.0 entry; timed read confirms < 2 min | ⚪ |
| ScalAdj-AC1 | New IDE adapter = repo root file/folder + one README paragraph; zero `engine/` changes | 4 | `.antigravity/` adapter added as live test; `engine/` git diff shows zero changes; README paragraph added | ⚪ |
| ScalAdj-AC3 | Planning template explicitly states unbounded tasks per iteration | 4 | Template note "add task rows as the feature requires; there is no maximum" present in Execution Matrix section | ⚪ |

---

# 2. EXECUTION MATRIX (Micro Sequencing)

*Tasks derived from Master Scope Mapping above. Implementation details from Design §2 (Component Mapping). Add task rows as the feature requires; there is no maximum.*

---

### ITERATION 1 — CONCEPT
*Risk neutralized: Is the engine clean and usable from first clone? If legacy artifacts remain, every subsequent build is polluted.*

**Active A.C. in Scope:** Verb-AC1, Verb-AC2, Verb-AC3, EffAdj-AC2, EffAdj-AC3

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-101** | Delete `references/legacy_codeaholic/` folder and all contents | Dead legacy model eliminated — agent cannot hallucinate codeaholic steps | None | 🔴 To Do |
| **T-102** | Clean `docs/ai/archive/` — delete entirely or reduce to single `README.md` with read-only historical label | Competing mental model removed from active tree | T-101 | 🔴 To Do |
| **T-103** | Remove `implementation/`, `deployment/`, `monitoring/` ai-devkit vestige folders from `docs/ai/` active tree | Active doc tree is canonical-only (requirements, design, planning, frameworks, examples) | T-102 | 🔴 To Do |
| **T-104** | Audit entire repo file tree; confirm zero files outside canonical structure; produce a navigation map showing every engine concept reachable in ≤ 2 steps from repo root | Desirability proven: clean engine is immediately usable on first clone | T-103 | 🔴 To Do |
| **T-105** | Simulate `/state-a` on the current repo and confirm the agent follows only 2-State Engine logic with no legacy interference; document the test run output as evidence | Core Verb-AC2 validated: Build works without legacy contamination | T-104 | 🔴 To Do |

---

### ITERATION 2 — WORKING PROTOTYPE
*Risk neutralized: Does the portable core work reliably, do all three IDE adapters function, and do the guardrails actually block bad behavior?*

**Active A.C. in Scope:** Verb-AC4, Verb-AC5, Verb-AC6, SustainAdv-AC1, SustainAdv-AC2, SustainAdv-AC3, SustainAdj-AC1, SustainAdj-AC2, Noun-AC1, Noun-AC2, ScalAdj-AC2

*Add task rows as the feature requires; there is no maximum.*

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-201** | Create `engine/` folder structure; migrate all skill references, commands, and rules from `.cursor/skills/` and `.cursor/rules/` into `engine/` as the portable canonical core; write `engine/SKILL.md` as single AI entry point | Portable core exists; Noun-AC2 fulfilled | T-105 | ⚪ Pending |
| **T-202** | Rewrite all `.cursor/commands/*.md` files to one-line description + `See: engine/commands/{name}.md` pointer only; run `grep -r ".cursor\|CLAUDE.md\|antigravity" engine/` and confirm zero matches | Cursor adapter is thin pointer; `engine/` is fully IDE-agnostic (ScalAdj-AC2) | T-201 | ⚪ Pending |
| **T-203** | Create `CLAUDE.md` at repo root with: project name, engine entry point (`engine/SKILL.md`), how to invoke State A and State B by name, approval phrases table; test by invoking State A in Claude Cowork using only `CLAUDE.md` context | Cowork/Claude adapter works (Verb-AC4) | T-201 | ⚪ Pending |
| **T-204** | Write AntiGravity adapter section in README ("Using this engine in AntiGravity" — one paragraph with exact steps); create stub `.antigravity/` folder with pointer file if needed; verify zero `engine/` changes required | Any-IDE portability proven (Verb-AC6) | T-201 | ⚪ Pending |
| **T-205** | Verify Cursor workflow unchanged: run existing `/state-a` command and confirm it routes correctly through `engine/commands/state-a.md`; document test run | Cursor adapter backward-compatible (Verb-AC5) | T-202 | ⚪ Pending |
| **T-206** | Write `check-engine.sh` with 4 validation categories: (a) canonical files/folders present, (b) no legacy artifact paths, (c) no broken `See:` cross-references in `.cursor/commands/`, (d) no IDE-specific paths in `engine/`; test on current repo | Self-validation works (SustainAdv-AC3, SustainAdj-AC1) | T-202 | ⚪ Pending |
| **T-207** | Write `.git/hooks/pre-commit` blocking: (a) code file staged without `docs/ai/design/` doc, (b) `.env` / secrets-pattern files staged; test both trigger conditions | Hard rules enforced programmatically (SustainAdv-AC1, SustainAdv-AC2) | T-206 | ⚪ Pending |
| **T-208** | Write `setup.sh` that installs the pre-commit hook and makes `check-engine.sh` executable; test end-to-end on clean state | Zero-friction guardrail activation (SustainAdj-AC2) | T-207 | ⚪ Pending |
| **T-209** | Run full canonical structure verification: directory listing confirms Noun-AC1 top-level exactly; run `check-engine.sh` and confirm exit 0; document as Working Prototype evidence | Working Prototype structurally sound (Noun-AC1) | T-208 | ⚪ Pending |

---

### ITERATION 3 — MVE (MINIMUM VIABLE ENABLEMENT)
*Risk neutralized: Can the user read, understand, act, and ship without friction? Engine is usable — not just functional.*

**Active A.C. in Scope:** EffAdv-AC1, EffAdv-AC2, EffAdv-AC3, EffAdj-AC1, Noun-AC3, Noun-AC4, ScalAdv-AC1

*Add task rows as the feature requires; there is no maximum.*

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-301** | Rewrite README to ≤ 60 lines of prose (excluding tables and code blocks); every sentence is "what to do" or "why" — no decorative framing; count lines and confirm | User reads and acts in < 3 min (EffAdv-AC1) | T-209 | ⚪ Pending |
| **T-302** | Rationalize Glossary: identify ≥ 5 heavy proprietary terms with plain-English equivalents; update Glossary with before/after mapping; Glossary remains single reference point | Cognitive load reduced (EffAdv-AC2) | T-301 | ⚪ Pending |
| **T-303** | Trim all `engine/commands/` files to ≤ 30 lines each; remove all inline duplication (any logic that appears in two files gets moved to one canonical location with a `See:` pointer in the other); line-count all files and confirm | Every command readable in < 60 sec (EffAdv-AC3) | T-302 | ⚪ Pending |
| **T-304** | Create `tests/` folder with `tests/run-tests.sh`; update `engine/commands/ship.md` to call `tests/run-tests.sh` before proposing commit; run script and confirm "no tests defined" + exit 0 output | Testing skeleton active; `/ship` is complete (Noun-AC3) | T-303 | ⚪ Pending |
| **T-305** | Create `deploy/README.md` with Vercel, Railway, and Cloudflare Workers patterns; each ≤ 10 lines with "what you do" and "what the AI does for you" sections; count lines per entry and confirm | Deployment path visible to User (Noun-AC4) | T-304 | ⚪ Pending |
| **T-306** | Write `new-venture-checklist.md` covering: clone, MCP setup, `setup.sh` run, `CLAUDE.md` verification, first `/state-a` run; time a walkthrough on fresh clone and confirm ≤ 15 min | New product initialization is frictionless (ScalAdv-AC1) | T-305 | ⚪ Pending |

---

### ITERATION 4 — ENABLEMENT LEADERSHIP
*Risk neutralized: Does the engine scale indefinitely — across years of work, unlimited feature sets, and eventual sub-agent operation — without structural breakdown?*

**Active A.C. in Scope:** Verb-AC7, Verb-AC8, Verb-AC9, ScalAdv-AC2, ScalAdv-AC3, ScalAdj-AC1, ScalAdj-AC3

*Add task rows as the feature requires; there is no maximum.*

| ID | Task | Risk Validated | Deps | Status |
| :--- | :--- | :--- | :--- | :--- |
| **T-401** | Update planning doc template (`docs/ai/planning/README.md`) to add explicit note in Execution Matrix section: "Add task rows as the feature requires; there is no maximum." Create a test planning doc with 50+ A.C. rows and 60+ task rows; confirm agent reads without truncation or self-limiting | No artificial task ceiling (Verb-AC7, ScalAdj-AC3) | T-306 | ⚪ Pending |
| **T-402** | Document multi-feature-set pattern in README and `new-venture-checklist.md`: when a live (I4) product needs new capabilities, start a new `feature-{name}` set with its own I1→I4 cycle; add worked example to `docs/ai/examples/` showing two features coexisting in one product repo | Multi-product scale proven (Verb-AC8) | T-401 | ⚪ Pending |
| **T-403** | Add sub-agent portability section to `engine/SKILL.md`: explains how a specialist sub-agent reads `engine/SKILL.md` + one feature's planning doc and executes tasks from its assigned iteration independently; simulate with a fresh agent and document result | Swarm-readiness validated (Verb-AC9) | T-402 | ⚪ Pending |
| **T-404** | Add `.antigravity/` adapter as live end-to-end test of modular adapter pattern: create adapter file, add README paragraph, confirm zero `engine/` changes in git diff; document as evidence | Modular adapter pattern proven (ScalAdj-AC1) | T-403 | ⚪ Pending |
| **T-405** | Update `CHANGELOG.md` with complete v2.0.0 entry (summary of all changes from v1.x); update `.template-version` file to `2.0.0` | Version history complete and readable in < 2 min (ScalAdv-AC3) | T-404 | ⚪ Pending |
| **T-406** | Run `check-engine.sh` on a fresh clone after all tasks complete; confirm exit 0; document full output as final evidence of Enablement Leadership | Full engine integrity confirmed at scale (ScalAdv-AC2) | T-405 | ⚪ Pending |

---

# 3. RESOURCE & BUDGET TRACKER

*Monitor constraints mapped to Efficiency Adjectives. Update Hard Limit after User approval per Design §4.*

| Metric | Current Usage | Hard Limit | Status |
| :--- | :--- | :--- | :--- |
| **Financial Cost (OpEx)** | $0.00 | $0 (no new paid services) | 🟢 Safe |
| **API/Token/Compute** | Existing Cursor/Cowork sessions | Existing plan | 🟢 Safe |

*This feature is pure engine work — no new APIs, no new infrastructure, no new paid dependencies.*
