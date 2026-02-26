# T-208 Evidence — setup.sh installs hook and validates check-engine.sh

Date: 2026-02-20

## Goal

Single copy-paste command activates guardrails: pre-commit hook installed, check-engine.sh executable, plain-English confirmation.

## Test run

Command (from repo root):

```bash
./setup.sh
```

Output:

```
Pre-commit hook installed: .git/hooks/pre-commit (blocks code without Holy Trinity, blocks .env/secrets).
check-engine.sh is executable.

Running check-engine.sh to confirm engine structure...

[A] Canonical files/folders present
PASS: Canonical files/folders are present.
[B] No legacy artifact paths
PASS: No legacy artifact paths found.
[C] No broken See: cross-references in .cursor/commands
PASS: All .cursor/commands See: pointers resolve.
[D] No IDE-specific paths in engine/
PASS: engine/ has no IDE-specific path references.

check-engine.sh PASSED

Setup complete. Guardrails are active: pre-commit hook and check-engine.sh ready.
```

Exit code: 0.

## Verification

- `.git/hooks/pre-commit` exists and is executable after setup.
- `check-engine.sh` is executable; setup runs it and reports pass/fail.
- Plain-English confirmation printed at end.
