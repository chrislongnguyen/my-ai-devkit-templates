# Navigation Map — Engine Concepts in ≤ 2 Steps from Repo Root

*Evidence for T-104 (engine-hardening). Audit date: post T-101–T-103.*

## 1. File-tree audit: canonical structure

**Top-level (repo root):** `.cursor/`, `docs/`, `tools/`, `claude-code-course-transcript/`, `README.md`, `CHANGELOG.md`, `.gitignore`, `.template-version`, `project_handoff_status.md`. No `.ai-devkit.json`, no `ai-devkit-init-merge.yaml` (removed in T-101).

**docs/ai/:** `requirements/`, `design/`, `planning/`, `frameworks/`, `examples/`, `archive/` (single README only), plus root files `Effective_Execution_Manifesto.md`, `Orchestrator_Roadmap.md`. No `implementation/`, `deployment/`, or `monitoring/` in active tree (T-103).

**Conclusion:** Zero files outside canonical structure. No legacy codeaholic or ai-devkit 7-phase artefacts in the active tree.

---

## 2. Navigation map (≤ 2 steps from root)

Every engine concept (command, rule, skill reference) is reachable in at most 2 navigation steps from the repo root.

| Engine concept | Step 1 | Step 2 |
| :--- | :--- | :--- |
| **Commands** (state-a, state-b, status, ship, debug, handoff, review, remember, help, heavy) | `.cursor/` | `.cursor/commands/{name}.md` |
| **Rules** (anti-patterns, context-preservation, ambient-flow) | `.cursor/` | `.cursor/rules/{name}.mdc` |
| **Dev-lifecycle skill** (State A/B entry) | `.cursor/` | `.cursor/skills/dev-lifecycle/SKILL.md` |
| **Skill references** (strategy-mapping, execute-micro-task, worktree-setup) | `.cursor/` | `.cursor/skills/dev-lifecycle/references/{name}.md` |
| **MCP config** | `.cursor/` | `.cursor/mcp.json` |
| **Holy Trinity — requirements** | `docs/ai/` | `docs/ai/requirements/` (README or feature-{name}.md) |
| **Holy Trinity — design** | `docs/ai/` | `docs/ai/design/` (README or feature-{name}.md) |
| **Holy Trinity — planning** | `docs/ai/` | `docs/ai/planning/` (README or feature-{name}.md) |
| **Frameworks / glossary** | `docs/ai/` | `docs/ai/frameworks/effective-system-design.md` |
| **Examples / walkthrough** | `docs/ai/` | `docs/ai/examples/walkthrough.md` |
| **Manifesto (approval phrases, recovery)** | `docs/ai/` | `docs/ai/Effective_Execution_Manifesto.md` |
| **Quick start** | (root) | `README.md` |

**Step count:** From root (0) → open `.cursor/` or `docs/ai/` or `README.md` (1) → open any file in the table (2). So every engine concept is at most 2 steps from root.
