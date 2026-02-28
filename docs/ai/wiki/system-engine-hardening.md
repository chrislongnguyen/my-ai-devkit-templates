# LTC System Wiki — engine-hardening (LTC 2-State Execution Engine)

> **Definitive operational record for the hardened, portable, indefinitely-scalable LTC 2-State Execution Engine.**

---

# 0. Overview of the System

## 0.1. DOCUMENT CONTROL

| FIELD | VALUE |
| :--- | :--- |
| **SOP ID** | OPS-DEV-001 |
| **FOCUS AREA** | FA 3 (User Enablement) |
| **CORE AREA** | CA PD 3.1 Developer Productivity & Tooling |
| **SYSTEM NAME** | LTC 2-State Execution Engine (engine-hardening) |
| **FUNCTION NAME** | [OPS DEV]_LTC AI Venture Architecture |
| **OWNER (ACCOUNTABLE)** | Long N. (solo operator / system owner) |
| **VERSION** | 2.0.0 |
| **STATUS** | Approved |
| **LEVEL OF ADHERENCE** | Mandatory (Must Follow) |
| **EFFECTIVE DATE** | 2026-02-28 |
| **LAST REVIEWED** | 2026-02-28 |
| **NEXT REVIEW DATE** | 2026-08-28 (6-month review cycle) |

## 0.2. PURPOSE

This system empowers the **Effective Doer** (solo non-technical operator working with AI agents) to ship AI-powered products with confidence. It provides a **clean** (no legacy artifacts), **enforced** (programmatic guardrails), **portable** (Cursor-first with Cowork/AntiGravity adapters), and **complete** (testing + deployment pathways) execution engine. The engine follows LTC's "Approach 2": 90% of effort goes to de-risking, 10% to output — ensuring every product ships with its failure risks systematically neutralized before launch.

## 0.3. SCOPE

**In Scope:**
- Users: Solo operators vibe-coding with AI across Cursor (primary), Claude Cowork, AntiGravity, and future MCP-capable environments.
- Trigger: Starting a new product or feature; continuing an existing one; verifying engine integrity.
- Outcome: Products ship from idea → live deployment with deterministic, user-gated, one-task-at-a-time execution.

**Out of Scope:**
- Direct code writing by humans (the user directs AI agents, not writes code).
- Shared team infrastructure (Jira/Jenkins) — this is for solo/small operator workflows.
- Un-gated AI operation — all execution requires explicit user approval per task.

## 0.4. DATA GOVERNANCE

- **Classification:** Internal
- **Handling:** All Holy Trinity docs (`docs/ai/requirements/`, `design/`, `planning/`) live in git and are version-controlled. No secrets in code (enforced by pre-commit hook). `.env` files are gitignored and blocked from commit.

## 0.5. METRICS FOR SUCCESS (KPIs)

| METRIC | TARGET |
| :--- | :--- |
| **Sustainability:** Engine integrity violations detected by `check-engine.sh` | 0 |
| **Sustainability:** Commits without Holy Trinity (blocked by pre-commit hook) | 0 |
| **Efficiency:** Time to understand README and take first action | < 3 min |
| **Efficiency:** Time to initialize new product via `new-enablement-checklist.md` | ≤ 15 min |
| **Scalability:** Maximum A.C. per feature (structural limit) | Unbounded (validated 50+) |
| **Scalability:** Maximum tasks per iteration (structural limit) | Unbounded (validated 60+) |
| **Scalability:** Time to read version history (v1.0 → v2.0.0) | < 2 min |

## 0.6. RISK MANAGEMENT

| POTENTIAL RISKS | SEVERITY | MITIGATION |
| :--- | :--- | :--- |
| Legacy artifacts pollute agent context, causing hallucinated steps | High | `check-engine.sh` validates zero legacy paths; I1 cleanup tasks removed all dead models |
| Agent executes without user approval (zombie code) | Catastrophic | Hard STOP after every task; 🔵 Draft → 🟢 Reviewed/Tested gate; approval phrases enforced |
| Secrets committed to git history | Catastrophic | Pre-commit hook blocks `.env`/secrets; no exceptions |
| Engine breaks on new IDE/environment | Medium | Portable `engine/` core; IDE adapters are thin pointers; zero IDE paths in `engine/` |
| Planning doc becomes unreadable at scale | Medium | Template explicitly states "no maximum" tasks; validated with 50+ A.C. test doc |
| Context loss across devices/sessions | High | `/handoff` generates `project_handoff_status.md`; `/status` re-hydrates; context-preservation rule |

## 0.7. COMPLIANCE & ENFORCEMENT

**Compliance Monitoring:**

| METHOD | DESCRIPTION & FREQUENCY | RESPONSIBLE |
| :--- | :--- | :--- |
| `check-engine.sh` | Run on every fresh clone and before major releases; validates structural integrity | [AI AGENT]_engine-hardening |
| Pre-commit hook | Runs on every `git commit`; blocks missing Holy Trinity or secrets | Git (automatic) |
| Task approval gate | Every 🔵 Draft Completed requires explicit "Approved" before 🟢 | User (Accountable) |
| 6-month review | Audit engine docs, update CHANGELOG, verify AC-TEST-MAPs exist for live features | [OPS DEV]_Admin |

**Corrective Measures:**

| LEVEL | DESCRIPTION | CORRECTIVE ACTION |
| :--- | :--- | :--- |
| 1: Minor | `check-engine.sh` warning (non-zero exit) | Fix violations; re-run until exit 0 |
| 2: Negligent | Repeated commits missing Holy Trinity after coaching | Review context-preservation protocol; run `/handoff` before `/ship` |
| 3: Severe | Secrets in git history; bypassing approval gates | Immediate repo audit; rotate secrets; re-clone from clean state |

## 0.8. VERSION HISTORY

| VERSION | DATE | AUTHOR | SUMMARY OF CHANGES | APPROVED BY | EFFECTIVE DATE |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 2.0.0 | 2026-02-28 | LTC AI Venture Architect (Agent) | Initial Release — hardened, portable, indefinitely-scalable 2-State Engine with test/deploy skeletons, multi-feature support, sub-agent portability | Long N. (Accountable) | 2026-02-28 |

---

# 1. Desired Outcomes

## 1.1. SUCCESS DEFINITION (THE "WHY")

| PILLARS | OBJECTIVE TYPE | SYSTEM OBJECTIVE | METRIC | TARGET | REPORTING SOURCE |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **SUSTAINABILITY** | Minimize Failure Risks | Prevent legacy artifact pollution and un-gated execution | Engine integrity violations | 0 | `check-engine.sh` exit 0 |
| | Produce Desired Outcomes | Every product ships with deterministic, user-gated task execution | Products shipped via engine | > 0 | CHANGELOG.md |
| **EFFICIENCY** | Maximize De-risking at Current Resources | Structural validation runs in < 3 seconds without manual inspection | `check-engine.sh` runtime | < 3 sec | Shell timing |
| | Maximize Outputs at Current Resources | User understands next action in < 3 min; new product init ≤ 15 min | README comprehension time; Enablement time | < 3 min; ≤ 15 min | Timed walkthrough |
| **SCALABILITY** | Maximize De-risking Gains at Resource Growth | Engine handles 50+ A.C. and 60+ tasks without truncation; unlimited feature sets | A.C. count; Task count | Unbounded | Planning docs |
| | Maximize Output Gains at Resource Growth | Specialist sub-agents operate from `engine/SKILL.md` independently | Sub-agent portability | Verified | T-403 evidence |

---

# 2. Users & Roles

## 2.1. ROLE ASSIGNMENTS (RACI)

| ROLE | PEOPLE IN CHARGE | SYSTEM ID | PRIMARY RESPONSIBILITIES |
| :--- | :--- | :--- | :--- |
| **RESPONSIBLE** (The Doer) | AI Agent executing tasks | [AI AGENT]_engine-hardening | Executes one micro-task at a time; presents evidence; hard-stops for approval |
| **ACCOUNTABLE** (The Owner) | Long N. (solo operator) | [OPS DEV]_LTC System Owner | Defines UDO/UDS/UBS; approves every 🟢 Reviewed/Tested task; runs `/state-a` and `/state-b` |
| **CONSULTED** (The Expert) | AI Agent (State A: Brain mode) | [AI AGENT]_Strategy Mode | Maps psychological reality; produces Holy Trinity; advises on re-plan |
| **INFORMED** (Stakeholder) | Future self / other devices | [OPS DEV]_Cross-Device Operator | Receives handoff docs; resumes via `/status` |

---

# 3. Effective Operating Principles

## 3.1. THE ULTIMATE BLOCKING SYSTEM (UBS)

**Diagnosis:** Three failure modes threaten every AI-assisted build:
1. **Context Pollution:** Legacy artifacts and competing mental models cause the AI to hallucinate steps from dead frameworks.
2. **Un-gated Execution:** AI proceeds without user approval, producing "zombie code" that doesn't match intent.
3. **Context Loss:** Device switches and session ends destroy progress unless explicitly preserved.

**Mitigation Strategy:**
- Cleanup Pass (I1): Surgical removal of all legacy artifacts; `check-engine.sh` validates absence.
- Approval Gates (All Iterations): HARD STOP after every task; 🔵 Draft → 🟢 Reviewed/Tested requires explicit "Approved."
- Context Preservation: `/handoff` + `project_handoff_status.md`; `/status` re-hydration; Rule 1 re-reads planning docs at session start.

| ASPECTS | COMPONENTS | KEY QUESTION | DESCRIPTION | UTILIZATION STRATEGY |
| :--- | :--- | :--- | :--- | :--- |
| **THE UBS** | UBS.Principles | What principles cause failure? | "Speed over Safety," "Assumption over Evidence," "Memory over Documentation" | Neutralize with programmatic guardrails and mandatory approval gates |
| UBS.Environment | What conditions enable failure? | Noisy active tree (legacy files); unenforced markdown "suggestions" | Clean tree via I1; Defense in Depth (markdown + programmatic) |
| UBS.Tools | What tools enable failure? | Outdated framework docs; manual enforcement | `check-engine.sh` + pre-commit hook replace manual checks |
| UBS.Actions | How does failure work? | AI reads wrong file → hallucinates step → user doesn't catch it | Canonical paths only; `engine/SKILL.md` single entry point |

## 3.2. THE ULTIMATE DRIVING SYSTEM (UDS)

**Diagnosis:** Success comes from:
1. **Truth-First Mapping:** Understanding psychological reality (UDO/UDS/UBS) before building.
2. **Deterministic Execution:** One task, one acceptance criteria, one evidence block at a time.
3. **Portable Portability:** Engine logic in `engine/`; IDE adapters are thin; any MCP-capable environment can operate it.

| ASPECTS | COMPONENTS | KEY QUESTION | DESCRIPTION | UTILIZATION STRATEGY |
| :--- | :--- | :--- | :--- | :--- |
| **THE UDS** | UDS.Principles | What principles drive success? | "Approach 2" (90/10 de-risking), "Evidence of Truth," "Ship-to-Learn" | Enforce via execute-micro-task.md SOP; every task requires evidence |
| UDS.Environment | What conditions enable success? | Clean engine; enforced guardrails; thin IDE adapters | I1–I4 delivered all three layers |
| UDS.Tools | What tools drive success? | `engine/SKILL.md`; `check-engine.sh`; Holy Trinity docs | Single entry point; self-validation; MECE A.C. |
| UDS.Actions | How does success work? | `/state-a` → Holy Trinity → `/state-b` → 🔵 → "Approved" → 🟢 | Repeatable 2-State cycle |

## 3.3. THE EFFECTIVE PRINCIPLES (S/E/Sc Labeled)

| PILLAR & LABEL | PURPOSE | PRINCIPLE NAME & DESCRIPTION | DISABLES/ENABLES |
| :--- | :--- | :--- | :--- |
| **SUSTAINABILITY** | Minimize failure risks | **P1(S): Single Source of Truth** — Every concept has exactly one canonical definition in exactly one place. Dead layers removed, not hidden. | Disables: UBS.Principles ("Assumption over Evidence") |
| | Produce desired outcomes | **P2(S): Defense in Depth** — Every hard rule has both markdown instruction (AI reads) AND programmatic check (shell enforces). | Disables: UBS.Tools (manual enforcement) |
| **EFFICIENCY** | De-risk at current resources | **P3(E): Cognitive Economy** — Proprietary terms only where no industry equivalent exists; Glossary is single reference. | Enables: UDS.Environment (clarity) |
| | Maximize outputs at resources | **P4(E): Ship-to-Learn** — Every engine element serves the path from idea to live product. No premature abstraction. | Enables: UDS.Actions (execution focus) |
| **SCALABILITY** | De-risk gains at growth | **P5(Sc): Systems over Heroes** — Portable `engine/` core survives IDE changes; adapters bolt on without touching core. | Enables: UDS.UD (portability at depth) |
| | Output gains at growth | **P6(Sc): Self-Service Enablement** — `new-enablement-checklist.md` lets any operator initialize in ≤ 15 min without expert help. | Enables: UDS (operator independence) |

## 3.4. CORE VALUES (LTC Five Principles)

- **Ethics Above All:** The pre-commit hook never allows secrets; approval gates never allow un-gated execution. Safety is non-negotiable.
- **Effectiveness Over Efficiency:** The engine prioritizes "building the right thing" (State A truth-mapping) over "building fast." A slow correct build beats a fast wrong one.
- **Transparency, Open Minds, Open Communication:** All docs are markdown in git; all A.C. are MECE and traceable; `/handoff` makes state explicit, not hidden in chat memory.
- **Collective Leadership:** Even as a solo operator, the system treats "future self on another device" as a stakeholder. `/handoff` + `/status` enable cross-device continuity.
- **Continuous Improvement:** Every 6-month review audits the engine; CHANGELOG captures evolution; post-mortems (via `/review`) feed back to the Brain (State A).

---

# 4. Effective Operating Environment

| PURPOSE | TYPE | SPECIFICATION | NOTES |
| :--- | :--- | :--- | :--- |
| **DERISK / MINIMIZE FAILURE RISKS** | Digital | Git repo with pre-commit hook enforcing Holy Trinity and no-secrets policy | Runs in any IDE that uses git |
| | Cultural | "Approval Required" culture — no 🔵 proceeds without explicit "Approved" | Psychological safety to say "not ready" |
| **OPTIMIZE OUTPUT** | Digital | Cursor IDE (primary) with `.cursor/` adapter pointing to `engine/` | Thin pointer; all logic in portable core |
| | Digital | Claude Cowork / Claude Code / AntiGravity via `CLAUDE.md` or README adapter | Same engine, different entry point |
| | Cultural | Deep Work Zone — one task at a time, evidence before proceeding | Headphones on = do not disturb |

---

# 5. Effective Operating Tools

| PURPOSE | TYPE | TOOLS & SPECIFICATION | MAIN USE | LOCATION | ACCESS | NOTES |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **DERISK** | Digital | `check-engine.sh` | Validates structural integrity | Repo root | All | Exit 0 = pass; non-zero = violation list |
| | Digital | `.git/hooks/pre-commit` | Blocks bad commits | `.git/hooks/` | Auto | Git hook (not IDE-specific) |
| | Digital | `setup.sh` | One-command guardrail install | Repo root | All | Plain-English confirmation |
| **OPTIMIZE** | Digital | `engine/SKILL.md` | Single AI entry point | `engine/` | AI agents | Self-contained; zero IDE paths |
| | Digital | Holy Trinity docs | Requirements, Design, Planning | `docs/ai/` | User + AI | Unbounded A.C. and tasks |
| | Digital | `/state-a`, `/state-b`, `/status`, `/test-write`, `/test`, `/ship`, `/handoff`, `/review`, `/help` | Utility Belt commands | Via IDE adapters | User | Same workflow across IDEs |
| | Digital | `tests/` skeleton | AC-TEST-MAP + test runner | `tests/` | Test Agent + User | Frozen baseline; scope enforcement |
| | Digital | `deploy/` skeleton | README + run-deploy.sh patterns | `deploy/` | User + AI | Vercel/Railway/Workers/GCP/GCS/Colab |
| | Digital | `new-enablement-checklist.md` | ≤ 15 min new product init | Repo root | User | Clone → MCP → setup.sh → first `/state-a` |

---

# 6. Effective Operating Procedures (EOP)

## 6.1. PROCEDURE & RESPONSIBILITIES

| STAGE | STEP # | STEP NAME | REQUIRED INPUT | DESIRED OUTPUT | OPERATING USERS | OPERATING TOOLS | TYPICAL BLOCKER | REFERENCES |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **DERISK / MINIMIZE FAILURE RISKS** | 1 | **Clone & Setup** | GitHub repo URL | Clean clone with guardrails active | [OPS DEV]_Owner | `git clone`, `setup.sh` | Hook not executable | `setup.sh` makes executable; plain-English confirmation |
| | 2 | **Engine Validation** | Fresh clone | Exit 0 from `check-engine.sh` | [AI AGENT]_engine-hardening | `check-engine.sh` | Legacy artifacts present | I1 cleanup removed all; validate via grep |
| | 3 | **Context Preservation** | Session end | `project_handoff_status.md` written | [OPS DEV]_Owner | `/handoff` | Forgot to run `/handoff` | Rule 3 nudge after 3 tasks |
| **OPTIMIZE OUTPUT** | 4 | **State A — Strategy** | Feature idea / pivot need | Approved Holy Trinity (Requirements, Design, Planning) | [AI AGENT]_Strategy Mode + [OPS DEV]_Owner | `/state-a`, memory search, causal map | Skipping truth-mapping | Sub-step SOP enforces 4 sub-steps |
| | 5 | **Test Baseline** | Approved Holy Trinity | Frozen AC-TEST-MAP written | [AI AGENT]_Test Agent | `/test-write` | No AC-TEST-MAP at iteration boundary | Gate in execute-micro-task Step 1.3 |
| | 6 | **State B — Execute** | 🔴 To Do task | 🔵 Draft Completed with evidence | [AI AGENT]_engine-hardening | `/state-b` | Agent proceeds without approval | HARD STOP after every task |
| | 7 | **User Approval** | 🔵 Draft Completed | 🟢 Reviewed/Tested | [OPS DEV]_Owner | Reply "Approved" | Unclear evidence | Evidence block must show file paths / CLI output / code |
| | 8 | **Iteration Boundary** | Last 🟢 in iteration N | Proceed to N+1 or re-plan | [OPS DEV]_Owner | `/test` + "Proceed to Iteration N+1" | Tests fail | Address failures or waive |
| | 9 | **Ship** | All 🟢 in iteration | Git commit + push | [OPS DEV]_Owner | `/ship` | No handoff before ship | Rule 3 reminder pre-ship |
| | 10 | **Deploy** | Approved build | Live product | [OPS DEV]_Owner + AI Agent | `deploy/run-deploy.sh` or README patterns | No env targeting | Script requires explicit staging/prod |

**RACI per Step:**

| STEP | RESPONSIBLE | ACCOUNTABLE | CONSULTED | INFORMED |
| :--- | :--- | :--- | :--- | :--- |
| 1 (Clone) | User | User | — | — |
| 2 (Validate) | AI Agent | User | — | — |
| 3 (Handoff) | AI Agent | User | — | Future self |
| 4 (State A) | AI Agent (Brain) | User | — | — |
| 5 (Test Write) | AI Agent (Test) | User | — | — |
| 6 (State B) | AI Agent (Build) | User | — | — |
| 7 (Approval) | User | User | — | AI Agent |
| 8 (Boundary) | AI Agent + User | User | — | — |
| 9 (Ship) | AI Agent | User | — | Git history |
| 10 (Deploy) | AI Agent | User | — | Live users |

## 6.2. EXCEPTION HANDLING & ESCALATION

- **Deadlock Resolution:** If User and Agent disagree on whether A.C. is met, User wins. Agent revises evidence or clarifies ambiguity. If unresolvable, escalate to fresh `/state-a` for re-plan.
- **Crisis Protocol:** If secrets are committed (despite hook), immediately: (1) rotate secrets, (2) `git filter-branch` or re-clone clean, (3) audit who/what bypassed the hook.
- **Context Loss Recovery:** Run `/status` — reads `project_handoff_status.md` + planning doc; identifies next 🔴 To Do; resumes from there.
- **Zombie Code Recovery:** If agent built without approval, revert via `git checkout` or `git reset` to last 🟢 commit; re-run `/state-b` with corrected instructions.

---

*System Wiki complete. This is the definitive operational record for the LTC 2-State Execution Engine (engine-hardening v2.0.0).*
