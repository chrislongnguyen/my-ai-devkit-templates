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

