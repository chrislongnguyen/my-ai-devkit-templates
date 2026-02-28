---
phase: requirements
title: Effective Requirements & User's System Map — engine-hardening
description: Causal mapping and deterministic requirements for hardening the LTC 2-State Engine into a clean, enforced, portable, and indefinitely-scalable build platform.
---

# PHASE 1: PROBLEM DISCOVERY (The User's System Map)
*Goal: Understand the human reality before introducing technology.*

* **Primary platform:** Cursor IDE is the main development environment now and for the foreseeable future. The engine is **Cursor-first**; Claude Cowork, AntiGravity, and other IDEs or CLIs are supported via thin adapters so the same engine runs everywhere. Products are built in Cursor (or another supported environment), not in any specific course or CLI.
* **Learning archive:** The `claude-code-course-transcript/` folder is a **benchmark for development best practices** (plan-first, context hygiene, MCP, etc.). It is not the platform on which products are built; it informs how the engine is designed and documented.
* **User Persona & Anti-Persona:** See Phase 3 §1 below.
* **Ultimate Desired Outcome (UDO):** Every product built through this engine ships to real users with confidence — the engine is clean enough to understand in 3 months, enforced enough that the AI cannot silently break its rules, portable enough to run in Cursor (primary), Claude Cowork, AntiGravity, and any future MCP-capable environment, and complete enough to go from idea to live deployment.
* **User's Action:** Harden the Master Template engine so it is clean (no dead artifacts), enforced (programmatic guardrails, not just markdown suggestions), portable (Cursor-first with Cowork/AntiGravity/other adapters), and complete (testing + deployment pathways exist and the Holy Trinity docs scale indefinitely).

## The Drivers (UDS — Ultimate Driving System)
* **UDS:** A working 2-State Engine with a proven track record — the `claude_ptc` feature shipped through it successfully (22/22 A.C. green). The engine's philosophy (Approach 2, risk-first, user-gated) is sound. The command structure is intuitive. The context-preservation protocol solves a real problem.
* **UDS.UD (Driver of the Driver):** The core insight that "90% of resources go to de-risking, 10% to output" maps directly to how high-reliability organizations operate. The User has already internalized this and built it into the engine.
* **UDS.UB (Blocker of the Driver):** Three competing mental models live in the same repo (ai-devkit 7-phase skeleton, legacy codeaholic 8-phase references, the actual 2-State Engine). This causes the AI agent to reference dead models and causes confusion for any future reader.

## The Blockers (UBS — Ultimate Blocking System)
* **UBS:** The engine is a set of markdown instructions the AI is *asked* to follow — not a set of constraints it is *forced* to follow. There is no automated testing, no deployment pipeline, and legacy artifacts create noise. The engine has never been used to ship a product to real users.
* **UBS.UD (Driver of the Blocker):** The engine was built iteratively (learning as you go), so dead layers accumulated naturally. The ai-devkit scaffolding gave structure to start but is now a vestigial organ. Heavy proprietary vocabulary adds cognitive load without adding capability.
* **UBS.UB (Blocker of the Blocker):** All problems are fixable with one focused feature pass: remove dead artifacts, add programmatic guardrails, streamline vocabulary, add testing + deployment skeletons, and extract a portable `engine/` core with thin IDE adapters.

---

# PHASE 2: THE SYSTEM DESIGN (Context & Bridge)
*Goal: Define the conceptual solution space based ONLY on what we understand about the User in Phase 1.*

* **Principles (Why):**
  * **P1 — Single Source of Truth:** Every concept has exactly one canonical definition in exactly one place. Dead layers must be removed, not hidden.
  * **P2 — Defense in Depth:** Every rule that matters has at least two layers — a markdown instruction the AI reads AND a programmatic check (shell script or git hook) that blocks the wrong action.
  * **P3 — Cognitive Economy:** Use custom terminology only when it captures a concept with no existing name. Otherwise use the industry-standard term and define it once in the Glossary.
  * **P4 — Ship-to-Learn:** Every engine feature must serve the path to shipping a real product. If it doesn't help something ship, it is premature.
  * **P5 — Environment Portability:** The engine's logic must be expressed in a format any AI agent can consume, regardless of IDE. Cursor-specific mechanisms are thin adapters pointing to a portable `engine/` core.

* **Environment (Where):** Digital — **Cursor IDE (primary)**; Claude Cowork, AntiGravity, and any future MCP-capable IDE or CLI as secondary via adapters. Git for version control. Local filesystem for docs. Bash for programmatic enforcement scripts and **git** hooks (not IDE-specific tool hooks). Cultural — solo non-technical operator across devices and tools; all enforcement must work without the user understanding the underlying code.

* **Tools (What):**
  * *Desirable Wrapper:* The same Utility Belt the user already knows in Cursor (`/state-a`, `/state-b`, `/status`, etc.) — no new commands to learn. The improvements happen underneath, invisibly. In Cowork/other environments, the same workflow is invoked by name (State A, State B) via their adapters.
  * *Effective Core:* Five mechanisms — (1) The Cleanup Pass: delete all legacy artifacts (including ai-devkit vestiges); (2) The Portable Core: `engine/` folder with all logic, `.cursor/` as **Cursor adapter** (thin pointer + MCP config), `CLAUDE.md` for Cowork; (3) The Guardrail Layer: **git** pre-commit hook + `check-engine.sh` + `setup.sh` (git hooks run in any IDE); (4) The Vocabulary Pass: rationalize Glossary, trim all command/skill files; (5) The Test and Deploy Skeletons: a **Test Agent** workflow with separate commands — `/test-write` runs once after State A to write the full AC-TEST-MAP (frozen baseline covering all iterations and all A.C.), `/test` runs at each iteration boundary to validate that iteration's A.C. pass (+ regression), `/ship` remains git commit and push only; plus `deploy/README.md` + optional `deploy/run-deploy.sh`.

* **EOP (How):**
  1. User runs `/state-b` — each task is one atomic action (delete, create, rewrite, validate).
  2. For cleanup tasks: agent removes/moves files, presents file-tree diff as evidence.
  3. For guardrail tasks: agent writes script/hook, runs it, presents output as evidence.
  4. For rewrite tasks: agent rewrites the doc, presents before/after diff as evidence.
  5. For skeleton tasks: agent creates folder/files, explains what goes where.
  6. User approves each task. At the end the engine is clean, enforced, portable, and ship-ready.

---

# PHASE 3: THE FORMALIZATION (The Output)
*Goal: Translate the System Design into strict, deterministic engineering requirements.*

**A.C. ID naming convention:** Verb-ACn, SustainAdv-ACn, EffAdv-ACn, ScalAdv-ACn, Noun-ACn, SustainAdj-ACn, EffAdj-ACn, ScalAdj-ACn. Do not rename once used in Planning.

---

## 1. USER(S)

* **Primary User Persona:** Long N. — solo non-technical operator who vibe-codes with AI agents across Cursor, Claude Cowork, and AntiGravity. Builds AI-powered products ranging from small tools to institutional-grade systems (e.g., multi-strategy investment platforms). Plans to evolve from single-agent operation to directing a swarm of specialist AI agents. Needs the engine to scale from a one-week prototype to a multi-year, multi-agent enterprise build — without changing how it fundamentally works.
* **Anti-Persona:** A developer who writes code directly. A team using shared Jira/Jenkins infrastructure. Any user who expects the AI to operate without approval gates.

---

## 2. DESIRED USER ACTION(S)

**Verb 1: Build** — The User starts a new product or feature inside the engine without encountering legacy artifacts, competing mental models, or IDE-specific confusion.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Verb-AC1 | User can clone the repo and immediately run `/state-a` without encountering any legacy files, dead references, or competing framework terminology (zero ai-devkit 7-phase or codeaholic 8-phase artefacts in the active tree). |
| Verb-AC2 | User can complete a full `/state-a` → `/state-b` cycle for any new feature and the agent follows only the 2-State Engine logic — no hallucinated steps from legacy models. |
| Verb-AC3 | User can find any engine concept (command, rule, skill reference) in ≤ 2 navigation steps from the repo root. |

**Verb 2: Direct** — The User runs the 2-State Engine from any supported AI environment without re-explaining engine rules or manually reloading context.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Verb-AC4 | User can invoke State A and State B by name in Claude Cowork and the agent correctly follows engine logic without the user pasting any instructions. |
| Verb-AC5 | User can invoke State A and State B in Cursor using existing `/state-a` and `/state-b` commands with no change to current workflow. |
| Verb-AC6 | User can invoke State A and State B in AntiGravity (or any future MCP-capable environment) using the documented adapter section in the README — without modifying any file inside `engine/`. |

**Verb 3: Scale** — The User continues building the same product across months or years — adding requirements, tasks, and eventually parallel agents — without the engine imposing any structural ceiling.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Verb-AC7 | User can add new A.C. and tasks to any active feature's Holy Trinity docs without hitting an artificial limit — the planning file grows with the project. A feature with 50+ A.C. and 60+ tasks is structurally valid and the agent handles it without truncation or self-imposed caps. |
| Verb-AC8 | User can add new capabilities to a live (I4) product by starting a new `feature-{name}` set with its own full I1→I4 cycle. The engine supports unlimited feature sets within one product repo, each with independent Holy Trinity docs. |
| Verb-AC9 | User can point a second AI agent (specialist sub-agent) at `engine/SKILL.md` and a specific feature's planning doc, and that agent can execute tasks from its assigned iteration independently — with no engine restructuring required. |

---

## Adverbs (Effectiveness Outcomes)

**Sustainability Adverb: Confidently** — The User approves tasks knowing the engine's hard rules were enforced before evidence reached them, not after.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdv-AC1 | User is blocked from committing code without the full Holy Trinity in the same commit — the **git** pre-commit hook (`.git/hooks/pre-commit`, bash) requires at least one staged file in each of `docs/ai/requirements/`, `docs/ai/design/`, and `docs/ai/planning/` when code is staged, stops the commit otherwise, and prints a plain-English explanation (including which of the three is missing). Same enforcement in any IDE that uses git. Keeps requirements, design, and planning in sync across devices and avoids merge drift. |
| SustainAdv-AC2 | User is blocked from committing secrets (`.env`, API keys matching common patterns) — the **git** pre-commit hook catches them before they reach git history. |
| SustainAdv-AC3 | User can run `check-engine.sh` at any time and receive a pass/fail report confirming engine structural integrity — no legacy artifacts, all canonical files present. |

**Efficiency Adverb: Quickly** — The User reads, understands, and acts on engine files without heavy vocabulary or redundant content slowing them down.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdv-AC1 | User can read the entire README and know what to do next in under 3 minutes — enforced by ≤ 60 lines of prose (excluding tables and code blocks). |
| EffAdv-AC2 | User can look up any engine term in the Glossary in under 30 seconds — minimum 5 previously heavy terms now mapped to plain-English equivalents alongside their proprietary names. |
| EffAdv-AC3 | User can read any single command file end-to-end in under 60 seconds — each command file ≤ 30 lines, zero inline duplication of logic that lives in `engine/`. |

**Scalability Adverb: Repeatedly and indefinitely** — The User clones this engine for any new product and builds that product for as long as it takes, with no structural ceiling imposed by the engine itself.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdv-AC1 | User can follow `new-enablement-checklist.md` to initialize a clean engine for a new product in ≤ 15 minutes, including MCP setup and first `/state-a` run. |
| ScalAdv-AC2 | User can verify a fresh clone is engine-complete by running `check-engine.sh` and receiving exit code 0 — no manual inspection required. |
| ScalAdv-AC3 | User can read `CHANGELOG.md` and identify what changed between any two engine versions in under 2 minutes — version history is complete from v1.0 to current. |

---

## 3. FEATURE

**Noun:** The hardened, portable, indefinitely-scalable LTC 2-State Execution Engine — a single git repository with an `engine/` portable core, thin IDE adapters (`.cursor/`, `CLAUDE.md`), programmatic guardrails (`setup.sh`, pre-commit hook, `check-engine.sh`), and testing + deployment skeletons (`tests/`, `deploy/`).

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Noun-AC1 | Repo top-level contains exactly: `engine/`, `.cursor/` (Cursor adapter — pointers only; includes `.cursor/mcp.json` for MCP servers), `CLAUDE.md` (Cowork adapter), `docs/ai/`, `tools/`, `tests/`, `deploy/`, `claude-code-course-transcript/` (learning archive). No other top-level folders. Root-level ai-devkit files (`.ai-devkit.json`, `ai-devkit-init-merge.yaml`) are removed as vestiges; `check-engine.sh` validates their absence. |
| Noun-AC2 | `engine/SKILL.md` is the single entry point for any AI agent — reading it alone is sufficient to understand and operate the full 2-State Engine including all commands, rules, and skill references. |
| Noun-AC3 | **Test skeleton (robust, stack-agnostic, no moving goalposts):** two commands exist and are intentionally separate. **`/test-write`** (Test Agent) runs **once after State A** produces the approved Holy Trinity; it writes the full **AC-TEST-MAP** (`tests/AC-TEST-MAP.md` or `tests/AC-TEST-MAP-{feature}.md`) covering **all** iterations and **all** A.C. in one coherent map — one row per A.C., MECE, ordered by iteration then A.C. ID. The AC-TEST-MAP is a **frozen baseline and scope enforcement mechanism**: it mirrors the Holy Trinity, and anything built during `/state-b` that has no corresponding row is scope creep. Test authoring rule: derive tests from spec/AC and user behavior contracts (not implementation internals), include negative/failure cases, and raise ambiguity when requirements are underspecified instead of inventing behavior. AC-TEST-MAP changes during execution require explicit re-plan via State A → Holy Trinity updated → `/test-write` re-runs. **`/test`** executes tests via `tests/run-tests.sh` at each **iteration boundary** (after the last task in that iteration is approved, before "Proceed to Iteration N+1"); prior iterations' tests must still pass (regression). `tests/run-tests.sh` discovers and runs the project's test runner when present (e.g. `package.json` → `npm test`, `pytest`/`pyproject.toml` → `pytest`, `Cargo.toml` → `cargo test`, `go.mod` → `go test ./...`); if none detected, prints "No tests defined yet — add a test runner or script for your stack" and exits 0. Non-zero exit = test failure. `/ship` is git commit/push only and never runs tests. `tests/README.md` documents this contract, the AC-TEST-MAP template, and role separation. |
| Noun-AC4 | **Deploy skeleton (robust, stack-agnostic):** `deploy/README.md` exists with deployment patterns including: Vercel (frontend), Railway (backend), Cloudflare Workers (edge), and Google Cloud — GCP (Cloud Run, App Engine), GCS (static hosting / storage), Google Colab (notebooks / run environment). Each entry is actionable and includes: when to use, exact commands, where secrets go (e.g. `.env` gitignored or platform dashboard), explicit environment targeting (staging/preview vs production), post-deploy verification steps (how to confirm success), and one-line rollback where applicable; "what you do" and "what the AI does for you" included. Optionally `deploy/run-deploy.sh` exists as a single entrypoint that accepts target (vercel \| railway \| workers \| gcp \| gcs) and environment (e.g. staging \| prod) and invokes the corresponding platform CLI (no project-specific config in template). |

**Sustainability Adjective: Self-validating** — The engine checks and enforces its own structural integrity without the user needing to inspect files manually.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdj-AC1 | `check-engine.sh` validates: (a) all canonical files present, (b) no known legacy artifact paths exist, (c) no broken `See:` cross-references in command files, (d) `engine/` free of IDE-specific paths. Returns exit code 0 (pass) or non-zero with plain-English violation list. |
| SustainAdj-AC2 | `setup.sh` installs the pre-commit hook and validates `check-engine.sh` is executable via a single copy-paste terminal command — zero technical knowledge required. |

**Efficiency Adjective: Lean** — Every file has exactly one job; zero content is duplicated between `engine/` and any IDE adapter.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdj-AC1 | `.cursor/commands/*.md` files contain only a one-line description and a `See: engine/commands/{name}.md` pointer. All command logic lives exclusively in `engine/commands/`. |
| EffAdj-AC2 | `.cursor/skills/dev-lifecycle/references/legacy_codeaholic/` is deleted (and any top-level `references/legacy_codeaholic/` if present). `docs/ai/archive/` either deleted or contains only a single `README.md` marked read-only historical record. |
| EffAdj-AC3 | `docs/ai/` active folders limited to: `requirements/`, `design/`, `planning/`, `frameworks/`, `examples/`. The `implementation/`, `deployment/`, `monitoring/` ai-devkit vestige folders are removed from the active tree. |

**Scalability Adjective: Modular and swarm-ready** — New IDE adapters bolt on at the repo root without touching `engine/`; specialist sub-agents can operate from `engine/SKILL.md` independently.

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdj-AC1 | Adding a new IDE adapter requires only creating an adapter file/folder at repo root and adding one paragraph to the README adapter section. Zero changes to `engine/`. |
| ScalAdj-AC2 | `engine/` contains zero hardcoded references to any IDE-specific path (`.cursor/`, `CLAUDE.md`, etc.). Fully self-contained and environment-agnostic. |
| ScalAdj-AC3 | The planning doc template explicitly states that tasks within each iteration are unbounded — no fixed cap. The Execution Matrix section includes a note: "Add task rows as the feature requires; there is no maximum." |

---

*Total A.C.: 31 — Verb (9), SustainAdv (3), EffAdv (3), ScalAdv (3), Noun (4), SustainAdj (2), EffAdj (3), ScalAdj (3). All MECE.*
