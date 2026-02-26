# T-206 Evidence — `check-engine.sh` validation categories

Date: 2026-02-20

## Goal

Validate the engine structure with a single script that checks all required categories:

1. Canonical files/folders present
2. No legacy artifact paths
3. No broken `See:` cross-references in `.cursor/commands/`
4. No IDE-specific paths in `engine/`

## Test run (current repo)

Command:

`./check-engine.sh`

Output:

```
[A] Canonical files/folders present
PASS: Canonical files/folders are present.

[B] No legacy artifact paths
PASS: No legacy artifact paths found.

[C] No broken See: cross-references in .cursor/commands
PASS: All .cursor/commands See: pointers resolve.

[D] No IDE-specific paths in engine/
PASS: engine/ has no IDE-specific path references.

check-engine.sh PASSED
```

## Notes

- Script exits `0` when all categories pass.
- On any category failure, script prints plain-English violations and exits non-zero.
