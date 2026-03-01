# Path of Least Effort (Think Before Do)

Before executing any task that can be done in more than one way, consider alternatives and choose the **path of least effort** that still **guarantees complete success**. Do not default to the first approach that comes to mind if a simpler or lower-cost one exists.

## When This Applies

- **File operations:** Move, copy, rename, or bulk file operations. Prefer shell commands (`cp`, `mv`, `mkdir`, etc.) or a short script over read-every-file → write-every-file → delete. Use read/write/delete only when content must be transformed or no shell/script is available.
- **Discovery:** Prefer **Grep**, **Glob**, or a single targeted **SemanticSearch** over reading many files to find something.
- **Repetitive edits:** Prefer **StrReplace** with replace_all or **Shell** (sed/script) over multiple manual edits when the change is uniform.
- **Any multi-step task:** Before starting, ask: "Is there a single command, script, or fewer-tool-invocation path that achieves the same outcome?" If yes, use it.

## Constraints

- Do not break **anti-patterns** (no code before design, no new deps without Resource Impact, no skip of evidence, no iteration jump without gate). Efficiency applies within those guardrails.
- Do not sacrifice correctness or completeness. "Least effort" means the minimal sufficient effort, not skipping verification or evidence.
- When unsure whether a shorter path is correct (e.g. edge cases, encoding, permissions), the safer path wins; otherwise choose the efficient one.

## Persisting Globally (Memory)

To store this principle in persistent AI memory for use across projects or sessions, run **`/remember`** and provide:

- **Title:** Path of least effort before execution (think before do)
- **Core Truth:** Before executing a task that has multiple possible approaches, consider alternatives (e.g. shell cp/mv for move/copy instead of read+write+delete). Choose the path of least effort that still guarantees complete task success. Do not default to doc-editing or read-every-file workflows when a single command or script achieves the same outcome.
- **Tags:** principle, efficiency, execution, agent-behaviour

Reference: `engine/commands/remember.md`; MCP memory is used at State A start and when searching for relevant principles.

---

## Additional Scenarios (Cursor Tool Names: Grep, Read, StrReplace, Write, Shell, Glob, SemanticSearch)

- **Debugging / investigate a failure:** Reproduce first with **Shell** (run failing test or script). Inspect logs with **Grep** for error/file:line, then **Read** with line range; use **Shell** (`tail`, `grep -n`) to narrow. Trace with **Grep** + **SemanticSearch**; add logging via **StrReplace**, re-run with **Shell**. Anti-pattern: reading many files before running the failing command.
- **Code review (PR / changed files):** **Shell** (`git diff --name-only main`) for changed files; **Grep** for TODO/FIXME/risk patterns in those paths; **Read** with ranges only on high-signal hunks; **SemanticSearch** scoped to changed dirs for context. Anti-pattern: reading every changed file top-to-bottom.
- **Long-running or background:** **Shell** for dev server/watcher; use `&` or `nohup` or separate terminal for background. **Shell** (`pgrep`, `lsof -i :port`) to check if already running. Anti-pattern: blocking the flow with a foreground long-run when you only need to start it.
- **Merge conflicts:** **Grep** for `<<<<<<<`, `=======`, `>>>>>>>` (or **Shell** `git diff --check`); **Read** with ranges around each block; **StrReplace** per block to resolve; **Shell** (git diff, build/test) to verify. Anti-pattern: reading whole file before resolving.
- **Apply diff or patch:** **Shell** (`git apply`, `patch -p1`) when you have a patch file. When generating changes, **StrReplace** (targeted) over **Read** + **Write**; **Shell** (patch/script) for many files. **Shell** (linter/test) after apply. Anti-pattern: reading and rewriting entire files to apply a patch.
