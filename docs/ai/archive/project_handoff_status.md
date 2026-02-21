# Project Handoff Status

*Generated for handoff to different computer. See `docs/project_handoff.md` for full protocol.*

---

## 1. Feature Status

- **Feature:** ai-devkit v0.13.0 integration (`feature-ai-devkit-v013-integration`)
- **Status:** ✅ **100% Complete — Closed**
- **Branch:** `main`

---

## 2. The Goal (from docs/ai/requirements/)

**Feature requirements** (see `docs/ai/requirements/feature-ai-devkit-v013-integration.md`):

- **Verb:** Integrate ai-devkit v0.13.0 (Persistent Memory via MCP, Skills system) into this workspace.
- **Constraints:** Securely; do NOT overwrite custom `docs/ai/` templates or `docs/project_handoff.md`.
- **Approach 2:** 90% resources on minimising failure risks, 10% driving output.
- **Acceptance criteria:** Memory MCP and Skills usable; custom phase READMEs preserved; Approach 2 preserved.

---

## 3. Architectural Changes (Effective Product Manager Rewiring)

The following changes were implemented to align the dev-lifecycle with the Effective System Design / User Enablement philosophy:

1. **Created the global Constitution** — `docs/ai/frameworks/effective-system-design.md` defines the Prime Directive and the three-phase structure (Problem Discovery, System Design, Formalization) that all AI agents must follow before proposing technical solutions.

2. **Injected the global Persistent Memory rule** — A rule (tagged `execution-governance`, `dev-lifecycle`, `effective-system-design`) forces the Agent to read the Constitution before Step 1 (Requirements) or Step 3 (Design) of the dev-lifecycle skill.

3. **Overwrote the Agent's internal SOP** — `.cursor/skills/dev-lifecycle/references/new-requirement.md` now enforces a 4-part Interactive Discovery loop (Discovery & Context → Causal Map → EPS Prescription → Workspace Setup & Formalization) with explicit gates and user approval at each sub-step.

4. **Rewired the three base templates** — `docs/ai/requirements/README.md`, `docs/ai/design/README.md`, and `docs/ai/planning/README.md` now physically enforce:
   - Understanding of the User's System (UDO, UDS, UBS causal map)
   - System Design (Principles, Environment, Tools, SOP)
   - Verb/Noun acceptance criteria (Phase 3 formalization)
   - The 4-Iteration Execution Roadmap (Concept → Working Prototype → MVE → Enablement Leadership)

---

## 4. The Solution & Cost (from docs/ai/design/)

**Feature design** (see `docs/ai/design/feature-ai-devkit-v013-integration.md`):

- **Init template mode:** Use `ai-devkit init -t ai-devkit-init-merge.yaml -e cursor`; template has `phases: []` so no phase files overwritten.
- **Architecture:** Cursor (client) ↔ stdio ↔ @ai-devkit/memory (MCP server) ↔ SQLite.
- **Config:** `.cursor/mcp.json` with `npx -y @ai-devkit/memory`.
- **Resource impact:** 90% risk management, 10% output; OpEx $0.

---

## 5. Sprint Board — All Phases Complete (from docs/ai/planning/)

**Feature planning** (see `docs/ai/planning/feature-ai-devkit-v013-integration.md`):

- **Phase 1 (T-001–T-006):** ✅ Done — backup, init template, runbook, rollback, test in branch.
- **Phase 2 (T-007–T-010):** ✅ Done — `.cursor/mcp.json`, init run, verification, MCP config in place.
- **Phase 3 (T-011–T-013):** ✅ Done — dev-lifecycle skill, implementation doc, non-tech founder guide.

---

## 6. Next Actions (When You Return)

1. **Pull on new computer:** `git pull` (after push from this machine).
2. **Restart Cursor** to load MCP and confirm `ai-devkit-memory` is active (Settings → Tools & MCP).
3. **For new features:** Use the dev-lifecycle skill; the Agent will read `docs/ai/frameworks/effective-system-design.md` and follow the 4-part Interactive Discovery loop before generating requirements.
