---
phase: implementation
title: Implementation Guide
description: Technical implementation notes, patterns, and code guidelines
---

# Implementation Guide

## Runbook & planning reference

- **Task list and order:** See `docs/ai/planning/feature-ai-devkit-v013-integration.md` §2 (Execution Matrix) and §6 (Current Status & Next Steps).
- **Non-tech founder guide:** Same planning doc, **§5 – Implementation & upgrade guide**. Use it to add ai-devkit to new projects, to “merge” into projects with custom docs without overwriting, and to upgrade the kit safely in the future.

### Validated init command (preserves docs/ai/)

- **Template:** `ai-devkit-init-merge.yaml` (repo root). Validated: `phases: []`, `environments: [cursor]` — no phase files will be copied.
- **Exact command:**  
  `npx ai-devkit init -t ai-devkit-init-merge.yaml -e cursor`
- **Never use:** `-a` (all phases) or `-p requirements,design,planning,...` — either would overwrite `docs/ai/<phase>/README.md`.

### Runbook (merge init without overwriting docs/ai/)

1. **Backup:** Ensure `docs/ai/` and `docs/project_handoff.md` are committed or on a branch you can restore from.
2. **Template:** Use `ai-devkit-init-merge.yaml` (or equivalent with `phases: []`). Do not add phase names.
3. **Run once:** `npx ai-devkit init -t ai-devkit-init-merge.yaml -e cursor`. Do **not** pass `-a` or `-p <phases>`.
4. **When prompted "Which phases do you want to initialize?":** Deselect all (e.g. press `i` to invert selection so none are checked, then Enter). This keeps `docs/ai/` untouched.
5. **Verify:** Check that `docs/ai/requirements/README.md`, `docs/ai/design/README.md`, `docs/ai/planning/README.md`, and `docs/project_handoff.md` are unchanged (e.g. `git diff docs/ai/ docs/project_handoff.md`).

### Memory MCP: how to confirm it’s active

- **Restart Cursor** so it loads `.cursor/mcp.json` (MCP servers are read at startup).
- In Cursor: **Settings → Tools & MCP** (or **Cursor Settings → MCP**). You should see **ai-devkit-memory** in the list and it should be connected/enabled.
- In chat, the AI can use the Memory tools: **memory.storeKnowledge**, **memory.searchKnowledge**, **memory.updateKnowledge** (e.g. “store this in memory” or “search memory for …”).

### dev-lifecycle skill and governance

- **dev-lifecycle skill:** The 8-step development workflow is installed via `npx ai-devkit skill add codeaholicguy/ai-devkit dev-lifecycle`. It is symlinked to `.cursor/skills/dev-lifecycle`.
- **Execution Governance:** The dev-lifecycle skill is governed dynamically by **Persistent Memory** and the **Effective System Design** framework. A global rule (tagged `execution-governance`, `dev-lifecycle`, `effective-system-design`) instructs AI agents to read `docs/ai/frameworks/effective-system-design.md` before Step 1 (Requirements) or Step 3 (Design), and to follow Phase 1 (Problem Discovery) and Phase 2 (The System Design) causal mapping before outputting formal requirements.
- **Effective System Design framework:** See `docs/ai/frameworks/effective-system-design.md`. It defines the Prime Directive and the three-phase structure (Problem Discovery, System Design, Formalization) that all AI agents should follow when executing requirements and design work.

### Implementation & upgrade guide (non-tech founder)

The full guide for adding AI DevKit to new projects, merging into projects with custom docs, and upgrading safely is in **`docs/ai/planning/feature-ai-devkit-v013-integration.md` §5**. Use it for: new projects from scratch, projects with existing custom `docs/ai/`, standard MCP setup, future upgrades, and the one-page checklist.

### Rollback (if init overwrote docs/ai/ or project_handoff.md)

- **From backup branch:**  
  `git checkout backup/pre-ai-devkit-v013-phase1 -- docs/ai/ docs/project_handoff.md`
- **From a specific commit (e.g. before init):**  
  `git checkout <commit-hash> -- docs/ai/ docs/project_handoff.md`
- **Discard local changes to those paths only:**  
  `git restore docs/ai/ docs/project_handoff.md`  
  (only if you have not committed the overwrite)

## Development Setup
**How do we get started?**

- **Prerequisites:** Node.js (for `npx`), Cursor (or supported environment). No need to install ai-devkit in package.json; `npx ai-devkit` and `npx @ai-devkit/memory` use the CLI and MCP from npm.
- **Environment:** This feature uses Cursor; config is project-level (`.cursor/mcp.json`, `.ai-devkit.json`).
- **Configuration:** Init template (YAML/JSON) with `phases: []` when preserving existing `docs/ai/`; see design doc §1.2.

## Code Structure
**How is the code organized?**

- Directory structure
- Module organization
- Naming conventions

## Implementation Notes
**Key technical details to remember:**

### Core Features
- Feature 1: Implementation approach
- Feature 2: Implementation approach
- Feature 3: Implementation approach

### Patterns & Best Practices
- Design patterns being used
- Code style guidelines
- Common utilities/helpers

## Integration Points
**How do pieces connect?**

- API integration details
- Database connections
- Third-party service setup

## Error Handling
**How do we handle failures?**

- Error handling strategy
- Logging approach
- Retry/fallback mechanisms

## Performance Considerations
**How do we keep it fast?**

- Optimization strategies
- Caching approach
- Query optimization
- Resource management

## Security Notes
**What security measures are in place?**

- Authentication/authorization
- Input validation
- Data encryption
- Secrets management

