# T-205 Evidence — Cursor `/state-a` routing unchanged

Date: 2026-02-20

## Goal

Verify Cursor workflow remains unchanged and `/state-a` routes to the canonical engine command.

## Evidence of truth

1. Cursor command file exists and is pointer-only:
   - File: `.cursor/commands/state-a.md`
   - Pointer line: `See: engine/commands/state-a.md`

2. Target engine command exists and contains State A execution logic:
   - File: `engine/commands/state-a.md`
   - Contains State A contract and instruction to load `engine/skills/dev-lifecycle/references/strategy-mapping.md`

3. Direct pattern check confirms pointer path:
   - Command: `rg "See:\\s*engine/commands/state-a\\.md" .cursor/commands/state-a.md`
   - Result: one match at `.cursor/commands/state-a.md`

## Conclusion

Cursor `/state-a` adapter still routes to `engine/commands/state-a.md`. Workflow remains backward-compatible after adapter restructuring.
