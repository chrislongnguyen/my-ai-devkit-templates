# T-207 Evidence — Pre-commit hook blocks (a) code without Holy Trinity docs, (b) .env/secrets

Date: 2026-02-20

## Deliverables

- **Canonical hook source:** `scripts/pre-commit` (bash). Installed to `.git/hooks/pre-commit` for use; `setup.sh` (T-208) will copy from `scripts/pre-commit`.
- **Block (a):** Code files (by extension) staged without the full **Holy Trinity** in the same commit → commit blocked. The hook requires at least one staged file in each of `docs/ai/requirements/`, `docs/ai/design/`, and `docs/ai/planning/` when code is staged, so requirements, design, and planning stay in sync across devices and merges.
- **Block (b):** Staged paths matching `.env`, `.env.*`, `.pem`, `secrets?.json|yaml|yml`, `.key` → commit blocked, plain-English message.

## Test (a) — Code without full Holy Trinity

- Initial test used only design; hook was later expanded to require **requirements + design + planning** when committing code (to avoid cross-device merge mismatches).
- Staging only a code file (no staged files under `docs/ai/requirements/`, `docs/ai/design/`, or `docs/ai/planning/`) → commit blocked, message lists which of the three are missing.
- Staging code with only one or two of the three doc folders → commit blocked until all three are represented in the commit.

## Test (b) — .env / secrets-pattern file

- Staged `.env.test-block` (matches secrets pattern).
- Ran: `git commit -m "test: env file"`.
- Result: Commit blocked. Output:
  ```
  pre-commit hook: Commit blocked: a staged file looks like a secret or .env file. Remove it from the commit (e.g. git reset HEAD -- <file>) and add it to .gitignore if needed.
  ```
- Exit code: 1.

## Conclusion

Both trigger conditions fire; hook prints plain-English errors and blocks the commit before it reaches history.
