# Changelog — LTC Master Template

All notable changes to the Master Template (this repo) are documented here. Ventures clone a snapshot; this log helps you see what changed in the template over time. **When you update the Master Template, add an entry with date and change.**

---

## [1.1.0] — 2026-02-21

### Added
- **Master Scope Mapping** (Planning): Single source of truth for which A.C. is tackled in which iteration; MECE, no redundant Deferred lists.
- **Standardized A.C. IDs** (Holy Trinity): Naming convention across Requirements, Design, Planning (Verb-ACn, SustainAdv-ACn, EffAdv-ACn, ScalAdv-ACn, Noun-ACn, SustainAdj-ACn, EffAdj-ACn, ScalAdj-ACn).
- **Status flow (solo Founder):** ⚪ Pending → 🔴 To Do → 🔵 Draft Completed (by the Agent) → 🟢 Reviewed/Tested (by the User); 🟠 Stuck = off-ramp.
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
