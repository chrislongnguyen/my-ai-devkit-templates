# Changelog — LTC Master Template

All notable changes to the Master Template (this repo) are documented here. Ventures clone a snapshot; this log helps you see what changed in the template over time. **When you update the Master Template, add an entry with date and change.**

---

## [1.3.0] — 2026-02-24

### Added
- **Glossary** in `docs/ai/frameworks/effective-system-design.md`: 20+ terms (UDO, UBS, Verb, Noun, A.C., MECE, Holy Trinity, etc.) with plain-English definitions. Referenced from README.
- **Approval language guide** in Manifesto: table mapping every approval situation to the exact phrase the User should type.
- **`/help` command:** Decision tree — "What do I run?" with all commands, approval phrases, and first-time instructions.
- **Worked example walkthrough** (`docs/ai/examples/walkthrough.md`): End-to-end habit tracker example showing /state-a (4 sub-steps with sample output) through first /state-b task execution and approval.
- **Recovery Protocol** in Manifesto: table covering undo approval, revert bad code, redo State A, agent gone off rails, undo entire iteration, context window issues.
- **Context Preservation rule** (`.cursor/rules/context-preservation.mdc`, `alwaysApply: true`): Session start re-hydration (agent reads planning doc + handoff doc); periodic checkpoint nudge (after 3 approved tasks); pre-ship handoff reminder; cross-device continuity protocol; planning doc as single source of truth over chat memory.
- **Multi-feature dashboard** in `/status`: when multiple `feature-*.md` files exist, outputs a summary table of all features before the detailed report.
- **`/review` command:** Iteration retrospective — gathers all evidence from a completed iteration, lists validated A.C., gaps/risks, and prompts the User to confirm UDO still holds before advancing. Usable at iteration boundaries, mid-iteration, or before handoff.
- **Guided mode for State A:** strategy-mapping now asks "Are you familiar with the framework, or would you like guided mode with examples?" before the Causal Map. Lowers the entry barrier for beginners.

### Changed
- README: added `/help`, `/review`, guided mode mention, context preservation, approval phrases quick reference, walkthrough link, and updated new venture checklist.
- strategy-mapping Sub-Step 1: added guided mode check (step 2), renumbered subsequent steps.
- Manifesto: added Recovery Protocol and User approval phrases sections.

---

## [1.2.0] — 2026-02-20

### Added
- **`/status` command:** Read-only "where am I?" snapshot — active feature, planning doc, template version, current iteration, next task, last approved task and evidence, task counts (🟢/🔵/🔴/🟠/⚪), next actions. Use when resuming (e.g. new computer).
- **Iteration transition gate (State B):** Before executing a task in a *new* iteration (e.g. first task of Iteration 2), the agent HARD STOPS and asks the User to confirm "Proceed to Iteration N+1" or "Re-plan". Ensures current iteration is validated before advancing.
- **Memory search at start of State A:** In strategy-mapping Sub-Step 1, after feature name is confirmed, the agent searches `@ai-devkit/memory` for principles/rules/learnings relevant to the feature or domain and presents findings to the User before the Causal Map.
- **Anti-pattern rule** (`.cursor/rules/anti-patterns.mdc`, `alwaysApply: true`): Hard rules — no code before design; no new dependencies without Resource Impact (Design §4); no optimize/refactor outside A.C.; no skip of evidence step in State B; no iteration jump without gate.
- **`/handoff` command:** Generates `project_handoff_status.md` in repo root with active feature, current iteration, next task ID, last approved task, modified/uncommitted files (from `git status`), and next actions for resuming.
- **Template version tracking:** `.template-version` file (e.g. 1.2.0). `/status` reports this version; use with CHANGELOG for "what changed" when syncing from master template.

### Changed
- execute-micro-task Step 1: renumbered steps; step 3 is the iteration transition gate (HARD STOP when next 🔴 is in a higher iteration than last 🟢).
- strategy-mapping Sub-Step 1: added memory search step after feature name; renumbered subsequent steps.

---

## [1.1.0] — 2026-02-21

### Added
- **Master Scope Mapping** (Planning): Single source of truth for which A.C. is tackled in which iteration; MECE, no redundant Deferred lists.
- **Standardized A.C. IDs** (Holy Trinity): Naming convention across Requirements, Design, Planning (Verb-ACn, SustainAdv-ACn, EffAdv-ACn, ScalAdv-ACn, Noun-ACn, SustainAdj-ACn, EffAdj-ACn, ScalAdj-ACn).
- **Status flow (solo User):** ⚪ Pending → 🔴 To Do → 🔵 Draft Completed (by the Agent) → 🟢 Reviewed/Tested (by the User); 🟠 Stuck = off-ramp.
- **Design §4:** Optional guidance on requesting Resources/Budget from the User (when to ask, what to specify, approval gate).
- **Document flow:** Explicit chain Req → Design → Planning → Execution Matrix in README and Manifesto.
- **Utility Belt & When to use which:** Manifesto lists /state-a, /state-b, /ship, /debug, /remember and when to use each.
- **New venture checklist:** README: clone → open in Cursor → /state-a → /state-b.
- **Archive clarification:** README states docs/ai/archive/ is historical only; live docs are requirements/, design/, planning/.
- **Company board sync:** Planning README maps template statuses to Scrumban (TODO, READY TO DO, DRAFT COMPLETED, REVIEWED/TESTED, STUCK).
- **Ship ↔ Planning:** Ship command considers updating planning doc (e.g. task 🟢 Reviewed/Tested) before proposing commit.
- **Debug ↔ Holy Trinity:** Debug command notes task ID and A.C. from Planning when relevant for traceability.
- **.gitignore:** .DS_Store ignored.
- **Ambient flow rule** (`.cursor/rules/ambient-flow.mdc`): When user requests a new feature/add-on without /state-a or /state-b, nudge to /state-a, help populate requirements/design/planning from their request, get approval before any execution.

### Changed
- State B and execute-micro-task use `docs/ai/planning/README.md` (Execution Matrix, Iteration Sequencing); A.C. resolved from Master Scope Mapping.
- State A (strategy-mapping) Sub-Step 4: populate Master Scope Mapping from Requirements Phase 3 A.C. IDs.
- Planning §3 (Resource & Budget Tracker): note to update Hard Limit after User approval per Design §4.

---

## [1.0.0] — Initial

- 2-State Engine (State A: Strategy & Planning; State B: Execute One Micro-Task).
- Holy Trinity: requirements, design, planning templates in docs/ai/.
- Utility Belt: /state-a, /state-b, /ship, /debug, /remember.
- Effective Execution Manifesto; dev-lifecycle skill and references.
