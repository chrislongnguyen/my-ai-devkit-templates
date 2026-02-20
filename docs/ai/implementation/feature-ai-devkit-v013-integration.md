---
phase: implementation
title: Implementation Guide
description: Technical implementation notes, patterns, and code guidelines
---

# Implementation Guide

## Runbook & planning reference

- **Task list and order:** See `docs/ai/planning/feature-ai-devkit-v013-integration.md` §2 (Execution Matrix) and §6 (Current Status & Next Steps).
- **Non-tech founder guide:** Same planning doc, **§5 – Implementation & upgrade guide**. Use it to add ai-devkit to new projects, to “merge” into projects with custom docs without overwriting, and to upgrade the kit safely in the future.

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

