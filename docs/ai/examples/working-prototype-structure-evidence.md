# T-209 Evidence — Working Prototype canonical structure verification

Date: 2026-02-20

## Goal

Confirm repo top-level structure and that `check-engine.sh` exits 0, documenting Working Prototype evidence for Noun-AC1.

## Directory listing (repo root)

Top-level items at verification time:

| Type | Name |
| :--- | :--- |
| dir | `.antigravity/` |
| dir | `.claude/` |
| dir | `.cursor/` |
| dir | `.git/` |
| file | `.gitignore` |
| file | `.template-version` |
| file | `CHANGELOG.md` |
| file | `CLAUDE.md` |
| file | `README.md` |
| file | `check-engine.sh` |
| dir | `claude-code-course-transcript/` |
| dir | `docs/` |
| dir | `engine/` |
| dir | `openclaw/` |
| file | `project_handoff_status.md` |
| dir | `scripts/` |
| file | `setup.sh` |
| dir | `tools/` |

Canonical per design: `engine/`, `.cursor/`, `CLAUDE.md`, `docs/ai/`, `tools/`, `.claude/`, `.antigravity/`, `openclaw/`, `scripts/`, `check-engine.sh`, `setup.sh`, `claude-code-course-transcript/`. Root-level vestiges (`.ai-devkit.json`, `ai-devkit-init-merge.yaml`) absent. Folders `tests/` and `deploy/` are added in Iteration 3 (T-304, T-305); not required for `check-engine.sh` pass at I2 close.

## check-engine.sh result

```bash
./check-engine.sh
```

Output: all four categories (A–D) PASS. Exit code: **0**.

## Conclusion

Working Prototype structure is verified: directory listing aligns with canonical design; `check-engine.sh` confirms structural integrity (exit 0).
