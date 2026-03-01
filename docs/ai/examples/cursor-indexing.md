# Cursor indexing and .cursorignore

This repo uses a **`.cursorignore`** at the repo root to keep Cursor indexing lean: faster and more relevant **SemanticSearch** and **Grep**, and less noise from generated or vendored content.

---

## Purpose

- **Faster indexing** — Exclude large or generated directories and files.
- **Better relevance** — Search and semantic results focus on source and docs, not `node_modules` or lock files.
- **Cleaner Grep** — Avoid matches inside build artifacts and lock files.

---

## Location and policy

| Item       | Value                                              |
| :--------- | :------------------------------------------------- |
| **File**   | `.cursorignore` at repo root                       |
| **Syntax** | Same as `.gitignore` (glob patterns, one per line) |

**Recommended exclusions:** Generated dirs (`node_modules/`, `dist/`, `build/`, `target/`, `__pycache__/`, `.pytest_cache/`), virtual envs (`venv/`, `.venv/`), lock files (`package-lock.json`, `yarn.lock`, `Cargo.lock`, `*.lock`), minified/bundled (`*.min.js`, `*.bundle.js`), `.git/`, `.DS_Store`.

**Guardrail:** Do **not** ignore source code, `docs/ai/`, `engine/`, or `.cursor/`. Those must remain indexed so the agent can read requirements, design, planning, and rules.

---

## Reference

- Rule reference: `.cursor/rules/path-of-least-effort.mdc` (§4 Context discipline / §6 Extended Reference) — keep indexing lean; scope Grep/SemanticSearch to source when needed.
