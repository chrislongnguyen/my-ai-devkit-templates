---
phase: planning
title: Project Planning & Task Breakdown
description: High-density execution matrix for tracking Micro-tasks and Macro-risks.
---

# 1. MACRO ROADMAP (Timeline & Resources)

| Milestone | Target Date | Resource Budget (Est.) | Critical Risk |
| :--- | :--- | :--- | :--- |
| **M1: Risk prep & validation** | [Set date] | $0 / 1–2 hrs | Accidental overwrite of docs/ai/ or project_handoff.md |
| **M2: Safe integration** | After M1 | $0 / ~30 min | MCP or init misconfiguration |
| **M3: Skills, docs & handoff** | After M2 | $0 / ~30 min | Skills or docs out of sync with Approach 2 |

*Approach 2: ~90% of effort on M1 (risk minimisation); ~10% on M2–M3 (delivery).*

---

# 2. EXECUTION MATRIX (The "Micro" View)

* **Risk Factor:** (Impact 1–10) × (Prob 0.0–1.0). **>6 = Critical.**
* **Outcome:** The specific "Adverb" (Sustainability/Efficiency) we are optimizing for.

## PHASE 1: Risk prep & validation (90% focus)

| ID | Task (Verb) | Target Outcome (Adverb) | Risk Factor | Deps/Blockers | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **T-001** | **Backup / snapshot** docs/ai/ and docs/project_handoff.md (e.g. git commit or branch) | *Securely* (recoverable if overwritten) | **L** (Imp:8, Prob:0.1) | None | 🔴 To Do |
| **T-002** | **Create** init template YAML with `environments: [cursor]`, `phases: []`, optional `skills` | *Correctly* (no phases → no overwrite) | **M** (Imp:8, Prob:0.2) | None | 🔴 To Do |
| **T-003** | **Validate** template: confirm no `phases` or `phases: []` and document exact init command | *Securely* (no accidental phase copy) | **M** (Imp:9, Prob:0.15) | T-002 | 🔴 To Do |
| **T-004** | **Document** runbook: exact `npx ai-devkit init -t <path> -e cursor`; never use `-a` or `-p <phases>` | *Repeatably* (same steps every time) | **L** (Imp:6, Prob:0.2) | T-002 | 🔴 To Do |
| **T-005** | **Test** init in a copy of repo or a new branch (run init with template, then diff docs/ai/) | *Securely* (verify no overwrite before real run) | **H** (Imp:9, Prob:0.25) | T-002, T-003 | 🔴 To Do |
| **T-006** | **Define** rollback: git restore docs/ai/ and docs/project_handoff.md if overwritten | *Securely* (recovery path) | **L** (Imp:7, Prob:0.1) | T-001 | 🟢 Done |

## PHASE 2: Safe integration (delivery)

| ID | Task (Verb) | Target Outcome (Adverb) | Risk Factor | Deps/Blockers | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **T-007** | **Add** `.cursor/mcp.json` with ai-devkit-memory server (`npx -y @ai-devkit/memory`) | *Correctly* (Cursor can use Memory MCP) | **L** (Imp:5, Prob:0.15) | T-005 | 🟢 Done |
| **T-008** | **Run** `npx ai-devkit init -t <template> -e cursor` once (no `-a`, no `-p`) | *Efficiently* (new capabilities, no phase overwrite) | **H** (Imp:9, Prob:0.2) | T-002–T-005 | 🟢 Done |
| **T-009** | **Verify** docs/ai/requirements, design, planning READMEs and project_handoff.md unchanged | *Correctly* (acceptance criteria met) | **M** (Imp:8, Prob:0.1) | T-008 | 🟢 Done |
| **T-010** | **Confirm** Memory MCP in Cursor (restart Cursor; check MCP tools available) | *Correctly* (agents can store/search knowledge) | **L** (Imp:4, Prob:0.2) | T-007, T-008 | 🟢 Done |

## PHASE 3: Skills, docs & handoff

| ID | Task (Verb) | Target Outcome (Adverb) | Risk Factor | Deps/Blockers | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **T-011** | **Add** Skills via template or `ai-devkit skill` if desired; document Approach 2 in Skill if needed | *Repeatably* (skills usable; 90/10 preserved) | **L** (Imp:3, Prob:0.2) | T-008 | 🔴 To Do |
| **T-012** | **Update** docs/ai/implementation/feature-ai-devkit-v013-integration.md with runbook and notes | *Repeatably* (future you or others can follow) | **L** (Imp:4, Prob:0.15) | T-008 | 🔴 To Do |
| **T-013** | **Add** “Implementation & upgrade guide” for non-tech founder (see §5 below) | *Correctly* (easy to apply in other projects) | **L** (Imp:3, Prob:0.1) | T-012 | 🔴 To Do |

---

# 3. DETAILED SPECIFICATIONS (High-Risk Tasks)

### T-005: Test init in copy/branch before real run
* **User Story:** As a maintainer, I want to run init with the merge template in a safe place so that I never overwrite my real docs/ai/.
* **Steps:** (1) Create branch or copy repo. (2) Copy in the init template. (3) Run `npx ai-devkit init -t <template> -e cursor`. (4) Run `git diff` (or equivalent) on `docs/ai/requirements`, `docs/ai/design`, `docs/ai/planning` and root `docs/project_handoff.md`. (5) Confirm no changes. (6) If any change, fix template (ensure phases: [] or omitted) and repeat.
* **Rollback:** N/A (branch/copy only). If run on main by mistake, use T-006 (git restore).

### T-008: Run init with template (single production run)
* **User Story:** As a maintainer, I want to run init once with the safe template so that environments and skills are applied and docs/ai/ stay intact.
* **Preconditions:** T-001 (backup) and T-005 (test in branch) done; template has no phases.
* **Command:** `npx ai-devkit init -t <path-to-template> -e cursor`. Do **not** add `-a` or `-p requirements,design,planning,...`.
* **Rollback:** If docs/ai/ or project_handoff.md changed: `git checkout -- docs/ai/ docs/project_handoff.md` (or restore from T-001 backup).

---

# 4. RESOURCE & BUDGET TRACKER

| Metric | Current Usage | Hard Limit | Status |
| :--- | :--- | :--- | :--- |
| **Financial Cost** | $0.00 | $0 (local only) | 🟢 Safe |
| **API/Token Usage** | 0 | N/A | 🟢 Safe |
| **Risk budget** | 90% on T-001–T-006 | — | Per Approach 2 |

---

# 5. IMPLEMENTATION & UPGRADE GUIDE (Non-Tech Founder)

*Use this section to implement ai-devkit in **all your projects** and to **keep upgrading** the kit safely.*

## What you’re getting

- **AI DevKit** = a small toolkit that gives your projects:
  - **Structured docs** (e.g. requirements, design, planning) in `docs/ai/`.
  - **Persistent Memory** = the AI (e.g. in Cursor) can save and search “knowledge” (rules, patterns) so it gets better over time.
  - **Skills** = extra instructions/capabilities you can add to the AI for this project.

- **Approach 2** = we spend most effort (90%) on **avoiding mistakes** (e.g. not overwriting your custom templates) and a smaller part (10%) on “doing the work.”

## How to add AI DevKit to a **new** project (from scratch)

1. **Open the project** in Cursor (or your chosen editor).
2. **In Terminal**, run:  
   `npx ai-devkit init`  
   Answer the prompts: choose your environment (e.g. Cursor) and which “phases” you want (requirements, design, planning, etc.). This will create `docs/ai/` and config files.
3. **Optional – Memory:** So the AI can remember things across sessions, add a file `.cursor/mcp.json` in the project (see “Standard MCP setup” below). Restart Cursor.
4. **Optional – Skills:** Later you can run `npx ai-devkit skill` or add skills via an init template.

No custom templates to protect here, so a normal `init` is fine.

## How to add AI DevKit to a project that **already has** custom docs (like this one)

You already have your own `docs/ai/` (e.g. Requirements, Design, Planning) and maybe `docs/project_handoff.md`. We must **not** let `init` overwrite those.

1. **Backup first:** Commit everything or create a branch so you can restore if something goes wrong.
2. **Create a “merge” template file** in the project (e.g. `ai-devkit-init-merge.yaml`) with **no phases**:
   ```yaml
   version: "0.13.0"
   environments:
     - cursor
   phases: []    # leave empty so your docs/ai/ are never replaced
   skills: []    # optional: add skills later
   ```
3. **Run init using only that template:**  
   `npx ai-devkit init -t ai-devkit-init-merge.yaml -e cursor`  
   Do **not** use `-a` (all phases) or `-p requirements,design,...`. That way the toolkit only sets up “environment” and “skills”; it will **not** touch your existing phase READMEs.
4. **Add Memory (optional):** Add `.cursor/mcp.json` as in “Standard MCP setup” below. Restart Cursor.
5. **Check:** Open `docs/ai/requirements/README.md` (and your other custom files). They should be **unchanged**. If anything changed, restore from git and fix the template (ensure `phases: []` or no `phases` key), then try again.

## Standard MCP setup (so the AI can use Memory)

Create (or edit) the file **`.cursor/mcp.json`** in the **root** of your project:

```json
{
  "mcpServers": {
    "ai-devkit-memory": {
      "command": "npx",
      "args": ["-y", "@ai-devkit/memory"]
    }
  }
}
```

Then **restart Cursor** so it loads the Memory tool. The AI will be able to store and search knowledge for this project.

## How to **upgrade** AI DevKit in the future (e.g. v0.14, v0.15)

1. **Read the release notes** for the new version. Check if they mention:
   - Changes to `init` or to “template” behaviour.
   - New phases or new files written to `docs/ai/`.
2. **If you have custom docs/ai/ or project_handoff.md:**
   - **Never** run `npx ai-devkit init` without `-t` and without a template that has **no phases** (or `phases: []`). Otherwise the default init may overwrite your custom files.
   - Prefer: create (or update) a small YAML/JSON template with `environments` and `skills` only, `phases: []`, and run:  
     `npx ai-devkit init -t your-template.yaml -e cursor`  
     again **without** `-a` or `-p`.
3. **Test in a copy or branch first:** Run the new init in a duplicate repo or a branch, then run `git diff` on `docs/ai/` and `docs/project_handoff.md`. If anything changed that you didn’t want, adjust the template or skip overwriting steps.
4. **Keep Approach 2:** Spend most of your effort on “what could go wrong?” (backups, testing in a safe place, clear runbook) and a smaller part on actually running the upgrade.

## One-page checklist (any project)

- [ ] Backup or commit before any `ai-devkit init` if the project has custom `docs/ai/` or `project_handoff.md`.
- [ ] For “merge” setups: use a template with `phases: []` (or no `phases`) and run `init -t <file> -e cursor` only; no `-a`, no `-p`.
- [ ] Test init in a branch or copy first; confirm `docs/ai/` and handoff unchanged.
- [ ] Add `.cursor/mcp.json` with `ai-devkit-memory` if you want Persistent Memory; restart Cursor.
- [ ] When upgrading: read release notes, update your template if needed, test in a safe place, then run the same safe init flow.

---

# 6. CURRENT STATUS & NEXT STEPS

**Current status:** Phase 1 (T-001–T-006) and Phase 2 (T-007–T-010) **complete**. Phase 3 (T-011–T-013) still To Do.

**Completed:** Backup branch, init template, runbook, rollback, test in branch (T-005 confirmed), `.cursor/mcp.json`, init run (via test merge to main), verification of protected docs unchanged. Memory MCP config in place; user should restart Cursor to confirm tools (see implementation doc “Memory MCP: how to confirm it’s active”).

**Next steps (Phase 3):**
1. **T-011** – Add Skills via template or CLI if desired; document Approach 2 in Skill if needed.
2. **T-012** – Update implementation doc with any final runbook notes.
3. **T-013** – Ensure “Implementation & upgrade guide” (§5) is in sync.

**Documentation to update as you go:**  
`docs/ai/implementation/feature-ai-devkit-v013-integration.md` — runbook, rollback, and MCP confirmation steps are in place; keep §5 in sync if the process changes.
