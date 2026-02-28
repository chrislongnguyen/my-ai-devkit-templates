---
phase: design
title: Effective System Design & Architecture — engine-hardening
description: Translates the approved System Design into technical architecture for the hardened, portable, indefinitely-scalable LTC 2-State Execution Engine.
---

# 1. THE SYSTEM DESIGN (Context & Bridge)
*Maps the approved Phase 2 from the Requirements document into the physical/digital space.*

* **Principles (Why):**
  * P1 — Single Source of Truth: one canonical definition per concept, one canonical location per file.
  * P2 — Defense in Depth: every hard rule has both a markdown layer (AI reads) and a programmatic layer (shell enforces).
  * P3 — Cognitive Economy: proprietary terms only where no industry equivalent exists; Glossary is the single reference.
  * P4 — Ship-to-Learn: every engine element must serve the path from idea to live product.
  * P5 — Environment Portability: all logic lives in `engine/`; IDE-specific folders are thin adapters pointing inward.

* **Environment (Where):** Digital — **Cursor IDE (primary)**; Claude Cowork, AntiGravity, any future MCP-capable IDE or CLI as secondary via adapters. Git (version control), local filesystem (docs), bash (guardrails). **Git hooks** are used for commit-time enforcement so the same rules apply in any IDE that uses git. Cultural — solo non-technical operator; all enforcement must work without the user understanding the code.

* **Tools (What):**
  * *Desirable Wrapper:* In **Cursor**, the Utility Belt: `/state-a`, `/state-b`, `/status`, `/test-write`, `/test`, `/ship`, `/debug`, `/handoff`, `/review`, `/remember`, `/help`, `/heavy`. **`/test-write`** is owned by the Test Agent and runs once after State A to write the full AC-TEST-MAP (frozen baseline). **`/test`** runs at each iteration boundary to validate that iteration's A.C. pass. **`/ship`** is for git commit and push only (no test run) so committing does not conflict with testing. In Cowork/other environments, the same workflow is invoked by name (State A, State B, Test Write, Test, Ship) via their adapters. The engine improves underneath, invisibly to the user's workflow.
  * *Effective Core:* Five mechanisms operating together — Cleanup Pass, Portable Core extraction, Guardrail Layer, Vocabulary Pass, Ship Skeleton. Cleanup includes removal of ai-devkit root files (`.ai-devkit.json`, `ai-devkit-init-merge.yaml`) so the canonical top-level is engine-defined only.

* **EOP (How):**
  1. User runs `/state-b` — agent executes one atomic task, presents evidence, hard-stops.
  2. Cleanup tasks: agent deletes/moves files → presents `git rm` output and directory listing.
  3. Portable core tasks: agent creates/migrates files → presents file tree and content diff.
  4. Guardrail tasks: agent writes script/hook → runs it → presents terminal output.
  5. Vocabulary tasks: agent rewrites doc → presents before/after term diff.
  6. Skeleton tasks: agent creates folder/files → presents structure and explains what goes where.
  7. User approves each. At completion: clean engine, enforced rules, portable across IDEs, ship-ready.

---

# 2. TECHNICAL ARCHITECTURE (The Noun)

* **Feature Noun:** The hardened, portable, indefinitely-scalable LTC 2-State Execution Engine.

## 2.1 Visual Map (Mermaid)

```mermaid
graph TD
    ROOT[Repo Root] --> ENGINE[engine/ — Portable Core]
    ROOT --> CURSOR[.cursor/ — Cursor Adapter]
    ROOT --> CLAUDE[CLAUDE.md — Cowork Adapter]
    ROOT --> DOCS[docs/ai/ — Holy Trinity]
    ROOT --> TOOLS[tools/ — MCP Servers]
    ROOT --> TESTS[tests/ — Test Skeleton]
    ROOT --> DEPLOY[deploy/ — Deploy Skeleton]
    ROOT --> ARCHIVE[claude-code-course-transcript/ — Learning Archive]
    ROOT --> SETUP[setup.sh — One-command guardrail install]
    ROOT --> CHECK[check-engine.sh — Structural validator]
    ROOT --> CHECKLIST[new-enablement-checklist.md]

    ENGINE --> ESKILL[engine/SKILL.md — Single AI Entry Point]
    ENGINE --> ECMDS[engine/commands/ — All command logic]
    ENGINE --> ERULES[engine/rules/ — All hard rules]
    ENGINE --> EREFS[engine/skills/dev-lifecycle/references/ — State A & B logic]

    CURSOR --> CPTR[.cursor/commands/*.md — One-liner + See: pointer only]
    CURSOR --> CMCP[.cursor/mcp.json — MCP server config]

    DOCS --> REQ[requirements/]
    DOCS --> DES[design/]
    DOCS --> PLAN[planning/]
    DOCS --> FW[frameworks/]
    DOCS --> EX[examples/]

    TESTS --> TWRITE[/test-write — Test Agent writes tests from planning]
    TESTS --> RUNNER[tests/run-tests.sh — Discover & run; invoked by /test]
    TESTS --> TREAD[tests/README.md — Contract doc]
    DEPLOY --> DREAD[deploy/README.md — Actionable patterns]
    DEPLOY --> DRUN[deploy/run-deploy.sh — Optional CLI entrypoint]

    subgraph IDE_ADAPTERS [IDE Adapters — thin, bolt-on]
        CURSOR
        CLAUDE
    end

    subgraph GUARDRAILS [Programmatic Guardrails]
        SETUP
        CHECK
        HOOK[.git/hooks/pre-commit — Blocks bad commits]
    end
```

## 2.2 Component Mapping

**Portable Core (`engine/`):**
The single source of truth for all engine logic. Any AI agent — in any environment — reads `engine/SKILL.md` as its entry point and navigates to the relevant sub-file from there. No IDE knowledge required. The folder is entirely self-contained: no imports, no hardcoded references to `.cursor/`, `CLAUDE.md`, or any other IDE-specific path.

Structure:
```
engine/
  SKILL.md                          ← single AI entry point
  commands/                         ← all command logic (state-a, state-b, status, test-write, test, ship, debug, handoff, review, remember, help, heavy)
  rules/                            ← anti-patterns.md, ambient-flow.md, context-preservation.md
  skills/
    dev-lifecycle/
      references/                   ← strategy-mapping.md, execute-micro-task.md, worktree-setup.md
      scripts/                      ← check-status.sh, check-docs.sh
  README.md                         ← how to add a new IDE adapter (one paragraph per IDE)
```

**Cursor Adapter (`.cursor/`):**
Thin pointer layer only — Cursor-first. Each `.cursor/commands/{name}.md` file contains exactly: one-line description + `See: engine/commands/{name}.md`. Each `.cursor/rules/*.mdc` contains one-line description + `See: engine/rules/{name}.md` (agent resolves pointer to load full rule). `.cursor/skills/` points to engine content: e.g. `.cursor/skills/dev-lifecycle/SKILL.md` is minimal entry + `See: engine/skills/dev-lifecycle/SKILL.md` so Cursor discovers the skill but all logic lives in `engine/`. The `.cursor/mcp.json` stays here (Cursor-specific MCP server config; e.g. ai-devkit-memory, claude-ptc-mcp). No command/rule/skill logic lives in `.cursor/`; only pointers and IDE-specific config.

**Claude Cowork / Claude Agent Adapter (`CLAUDE.md`):**
A single file at repo root that loads engine context for any Claude-based agent (Cowork, Claude Code, Claude API agents). Contains: project name, engine entry point path (`engine/SKILL.md`), how to invoke State A and State B by name, and the approval phrases table. Any Claude agent that reads `CLAUDE.md` on session start knows exactly how to operate the engine.

**AntiGravity Adapter (`.antigravity/` or README section):**
A README adapter section (and optional stub folder) documenting how to point AntiGravity at `engine/SKILL.md`. Adding this adapter requires zero changes to `engine/`.

**Guardrail Layer:**
- `setup.sh` — Single copy-paste command that installs the pre-commit hook and makes `check-engine.sh` executable. Plain-English output confirms what was installed.
- `check-engine.sh` — Validates: (a) all canonical files/folders present, (b) no legacy artifact paths (hardcoded list: e.g. `.cursor/skills/.../legacy_codeaholic/`, root `.ai-devkit.json`, `ai-devkit-init-merge.yaml`, `docs/ai/implementation/`, `docs/ai/deployment/`, `docs/ai/monitoring/`), (c) no broken `See:` cross-references in `.cursor/commands/` (and `.cursor/rules/` if pointer-only), (d) `engine/` free of IDE-specific path strings. Exit 0 = pass. Non-zero = plain-English violation list.
- `.git/hooks/pre-commit` — **Git** pre-commit hook (bash script), installed by `setup.sh`. Runs on `git commit` in any IDE. Blocks: (a) code file commit without the full Holy Trinity in the same commit (at least one staged file in each of `docs/ai/requirements/`, `docs/ai/design/`, `docs/ai/planning/`), (b) `.env` / common secrets-pattern file commits. Prints plain-English error on block (lists which of requirements, design, or planning is missing). Runs in < 3 seconds. Keeps the Holy Trinity in sync across devices and merges. (This is a git hook, not an IDE tool-lifecycle hook; chosen for P5 portability.)

**Ship Skeleton (`tests/`) — robust, stack-agnostic, and role-separated:**
- `/test-write` command (`engine/commands/test-write.md` with `.cursor/commands/test-write.md` pointer) — owned by the **Test Agent**. Runs **once after State A** produces the approved Holy Trinity. Writes the full **AC-TEST-MAP** (`tests/AC-TEST-MAP.md` or `tests/AC-TEST-MAP-{feature}.md` from `tests/AC-TEST-MAP-TEMPLATE.md`) covering **all** iterations and **all** A.C. — one row per A.C., MECE, ordered by iteration then A.C. ID. The AC-TEST-MAP is both a test plan and a **scope enforcement mechanism**: it mirrors the Holy Trinity, and anything built during `/state-b` that has no corresponding row is scope creep. Authoring policy: derive tests from specification (AC + behavior contract), not implementation internals; include both happy-path and failure-path coverage; if AC is ambiguous, hard-stop and ask for clarification. The AC-TEST-MAP is **frozen** during execution — changes require explicit re-plan via State A → Holy Trinity updated → `/test-write` re-runs.
- `tests/run-tests.sh` — Invoked by **`/test`** (see `engine/commands/test.md`) at each **iteration boundary** (after the last task in that iteration is approved, before "Proceed to Iteration N+1"). Prior iterations' tests must still pass (regression). Testing is separate from commit: **`/ship`** is for git commit and push only and does not run tests. **Discovery:** script detects common test runners in a fixed order (e.g. `package.json` → `npm test`, pytest/pyproject → `pytest`, `Cargo.toml` → `cargo test`, `go.mod` → `go test ./...`). If none detected: prints "No tests defined yet — add a test runner or script for your stack" and exits 0 (non-blocking). If a runner is detected: runs it; non-zero exit = failure (agent reports to user). Exit 0 = pass or no tests; non-zero = failure. No stack is chosen by the template — the script adapts to the project.
- `tests/AC-TEST-MAP-TEMPLATE.md` — Template for the AC-TEST-MAP. One row per A.C., grouped by iteration. Columns: A.C. ID, Requirement (one-line), Test(s) / file or suite, Pass condition. Copied and populated by `/test-write`.
- `tests/README.md` — Documents the contract: `/test-write` runs once after State A to produce the AC-TEST-MAP (frozen baseline); `/test` runs at each iteration boundary; `/ship` remains commit-only. Scope enforcement: AC-TEST-MAP is a mirror of the Holy Trinity; pivot requires State A re-plan → `/test-write` re-run.

**Deployment Skeleton (`deploy/`) — robust, stack-agnostic:**
- `deploy/README.md` — Deployment patterns: Vercel (frontend), Railway (backend), Cloudflare Workers (edge), and Google Cloud (GCP Cloud Run/App Engine, GCS static/storage, Google Colab for notebooks). Each entry is **actionable:** when to use it, exact commands, where secrets go (e.g. `.env` gitignored or platform dashboard; never commit), explicit environment targeting (staging/preview vs production), post-deploy verification steps (how to confirm success), and one-line rollback where applicable. Each has "what you do" and "what the AI does for you." Concise but complete — no strict line cap; clarity and actionability take precedence.
- `deploy/run-deploy.sh` (optional) — Single entrypoint: accepts target (vercel | railway | workers | gcp | gcs) and environment (staging | prod) via env or arguments; invokes the corresponding platform CLI (`npx vercel --prod`, `railway up`, `npx wrangler deploy`, `gcloud run deploy`, `gsutil rsync`, etc.) or prints a short "Install and configure" message if the CLI is missing. The script should require explicit confirmation for production deployment (no implicit prod default). No project-specific config in the template; the script only delegates to standard CLIs. Contract: run from repo root; script delegates to the user's platform.

## 2.3 Data Models & APIs

This feature is pure engine infrastructure — no database, no external API beyond existing MCP servers (already in `tools/`). The "data model" is the document schema:

**Holy Trinity Document Schema (unbounded):**
- `docs/ai/requirements/feature-{name}.md` — Phase 1 (System Map) + Phase 2 (System Design) + Phase 3 (Formalization with A.C. table). No row cap on A.C. tables.
- `docs/ai/design/feature-{name}.md` — Architecture, Component Mapping, Data Models, Effectiveness Attributes, Resource Impact.
- `docs/ai/planning/feature-{name}.md` — Iterative Roadmap, Master Scope Mapping (Table A + Table B, no row cap), Execution Matrix (4 iterations minimum, tasks unbounded per iteration with explicit "add rows as needed" note), Resource & Budget Tracker.

**Planning Doc Scalability Note (enforced in template):**
The Execution Matrix must include this note at the top of each iteration block: *"Add task rows as the feature requires; there is no maximum."* This prevents the agent from self-limiting at ~25 tasks. A feature with 50+ A.C. and 60+ tasks across 4 iterations is structurally valid and expected for complex products.

**Multi-Feature-Set Pattern:**
When a live (I4) product needs new capabilities, a new `feature-{name}` set is started with its own independent I1→I4 cycle. The engine supports unlimited concurrent and sequential feature sets within one product repo. Each feature set has its own Holy Trinity docs. The `new-enablement-checklist.md` documents this pattern explicitly.

---

# 3. EFFECTIVENESS ATTRIBUTES (The Adjectives)

*Maps each attribute to Requirements A.C. IDs and Planning iterations.*

**Sustainability (Risk/Safety) — SustainAdj-AC1, SustainAdj-AC2 → Iteration 2:**
- Self-validating via `check-engine.sh` (4-category structural check, machine-readable exit code, human-readable violation list).
- Zero-friction activation via `setup.sh` (single copy-paste command, plain-English confirmation output).
- Implementation: bash scripts; no external dependencies; runs on any Unix-like system (macOS, Linux, WSL).

**Efficiency (Speed/Utility) — EffAdj-AC1, EffAdj-AC2, EffAdj-AC3 → Iterations 1 & 3:**
- Lean via pointer-only `.cursor/commands/` (one-liner + `See:` path; all logic in `engine/commands/`).
- Lean via legacy deletion (`legacy_codeaholic/` removed, `docs/ai/archive/` cleaned, ai-devkit vestige folders removed).
- Lean via command file size constraint (≤ 30 lines per command file; zero inline duplication).
- Implementation: file deletions in I1; file migrations and rewrites in I3.

**Scalability (Growth) — ScalAdj-AC1, ScalAdj-AC2, ScalAdj-AC3 → Iteration 4:**
- Modular adapters: new IDE = new root file/folder + one README paragraph; zero `engine/` changes.
- Environment-agnostic core: `engine/` grep for IDE-specific strings returns zero matches.
- Unbounded planning: template explicitly states no task cap; validated with 50+ A.C. test doc.

---

# 4. RESOURCE IMPACT (The "Price Tag")

* **Financial Cost (OpEx):** $0. This feature is pure engine work — no new APIs, no new infrastructure, no new paid dependencies. Uses existing Cursor/Cowork sessions.
* **Build Complexity:** Medium. The work is mechanical (delete, migrate, rewrite, create scripts) but there are many files to touch across 25 tasks. Risk of broken cross-references if migration order is wrong — mitigated by sequencing cleanup (I1) before migration (I2).
* **ROI Sanity Check:** High. A clean, enforced, portable engine is the prerequisite for every product that ships through it. Every hour invested here saves multiples in every future feature build.

*Ongoing tracking:* See Planning §4 (Resource & Budget Tracker) for current usage vs limits.
