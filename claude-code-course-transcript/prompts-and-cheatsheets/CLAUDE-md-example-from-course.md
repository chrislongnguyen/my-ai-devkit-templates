# CLAUDE.md example (from course — RAG chatbot)

From *Prompts & Summaries of Lessons*. Example of what `/init` can produce and what to add with `#`.

---

## Example 1: tooling

Since the project is a **uv** project, add to `CLAUDE.md` with `#`:

```
#use uv to run python files or add any dependencies
```

## Example 2: schema / data context

For a vector database, inform Claude about collections:

```
#The vector database has two collections:

course_catalog:
  - stores course titles for name resolution
  - metadata for each course: title, instructor, course_link, lesson_count, lessons_json (list of lessons: lesson_number, lesson_title, lesson_link)

course_content:
  - stores text chunks for semantic search
  - metadata for each chunk: course_title, lesson_number, chunk_index
```

---

## For this Master Template repo

A minimal `CLAUDE.md` or `AGENT_CONTEXT.md` in the repo root could include:

- This is the LTC AI DevKit / Master Template (2-State Engine).
- **State A:** strategy & planning only; no code. Outputs: `docs/ai/requirements/`, `docs/ai/design/`, `docs/ai/planning/`.
- **State B:** execute exactly one task from the planning doc; present evidence; stop for approval.
- Planning doc: `docs/ai/planning/feature-{name}.md` (or `README.md`). Single source of truth for task status.
- Rules: `.cursor/rules/` (anti-patterns, ambient-flow, context-preservation). Do not skip evidence or iterate without gate.
- Commands: `/state-a`, `/state-b`, `/status`, `/handoff`, `/ship`, `/help` — see `README.md` and Manifesto.

That gives any agent (Claude Code or Cursor) a stable briefing so it doesn’t drift from the process.
