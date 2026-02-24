---
phase: testing
title: Testing Strategy
description: Define testing approach, test cases, and quality assurance
---

# Testing Strategy

## Test Coverage Goals
**What level of testing do we aim for?**

- No unit/integration code for this feature (skill is markdown prompts + routing). Validation is manual: run the 2-State Engine and verify behavior against Acceptance Criteria in the requirements doc.
- **Critical path:** (1) Strategy State A produces UDO/UDS/UBS map; (2) Execution State B runs one task, presents evidence, stops for Founder approval; (3) ai-devkit CLI and MCP Memory do not crash when Agent stops.

## Manual Test Cases (Acceptance-Criteria-Led)

### State A — strategy-mapping.md
- [ ] **AC-N3:** Running the strategy state enforces the UDO/UDS/UBS discovery loop (aligned to effective-system-design.md).
- [ ] Output feeds or aligns with planning doc structure.

### State B — execute-micro-task.md
- [ ] **AC-V1:** One run processes exactly one task from the planning doc.
- [ ] **AC-V2:** Agent stops and presents evidence that the task's Acceptance Criteria are met before any "next step."
- [ ] **AC-V3:** No next task is started until Founder explicitly approves (or rejects).
- [ ] **AC-E2 / AC-NE2 (T-202):** Run a dummy micro-task with Stop-and-Validate; ai-devkit CLI and MCP Memory do not crash.

### SKILL.md routing
- [ ] **AC-N2:** SKILL.md routes the Agent only to strategy-mapping.md and execute-micro-task.md (no legacy 8-step entry points).

### End-to-End
- [ ] **AC-NX1:** A new feature (e.g. dummy feature) can use the same 2-State flow: strategy map → execution loop with validation gates.
- [ ] **AC-NX2:** Workspace documentation correctly describes the 2-State Engine as canonical.

## Test Data
**What data do we use for testing?**

- One dummy planning doc with 1–2 tasks and explicit Acceptance Criteria (for T-202 and E2E).
- Existing ai-devkit Memory and CLI configuration in the project.

## Manual Testing
**What requires human validation?**

- Founder (Accountable) must perform approval step in State B and confirm no crash.
- Confirm archived legacy files are not referenced by SKILL.md.

## Bug Tracking
**How do we manage issues?**

- If T-202 fails (CLI/MCP crash on stop): capture error, adjust execute-micro-task.md prompt, re-run until AC-E2 is met.
