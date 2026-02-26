# Claude Code Course — Transcripts & Learning Materials

Transcripts and supporting materials from [Claude Code: A Highly Agentic Coding Assistant](https://www.deeplearning.ai/short-courses/claude-code-a-highly-agentic-coding-assistant/) (DeepLearning.AI × Anthropic, instructor Elie Schoppik). Used to improve this Master Template and align with Claude Code best practices.

## Folder structure

| Path | Contents |
|------|----------|
| **`*.md`** (root) | Lesson transcripts (1–12) — copy-pasted from the course. |
| **`references/`** | Official links (`official-links.md`). Optional: clone [community-notes](https://github.com/MarkShawn2020/DeepLearning.ai-Courses-ClaudeCode) into `references/community-notes/` for structured notes/chapters (see `references/README.md`). The clone is gitignored so it stays local. |
| **`prompts-and-cheatsheets/`** | Extracted prompts, CLAUDE.md examples, command reference, and course→template mapping. |

## Transcript files (root)

- `1. Intro.md` — Course intro and what you'll learn
- `2. whatisclaudecode.md` — Architecture, tools, memory
- `3. coursenotes.md` — Installation, links to course codebases (RAG chatbot, e-commerce, Figma)
- `4. setup&codebaseunderstanding.md` — CLAUDE.md, exploring codebase
- `5. addingnewfeatures.md` — Plan first, thinking mode, subagents
- `6. test&debug&refactor.md` — Tests, refactoring
- `7. addmultifeatures.md` — Git worktrees, parallel sessions
- `8. githubintegration&hooks.md` — GitHub app, PRs, hooks
- `9. refactorJupyter&Dashboard.md` — Notebook → dashboard
- `10. refactorJupyter&Dashboard.md` — (Lesson 10: Creating Web App from Figma Mockup — check filename)
- `11. conclusion.md` — Wrap-up
- `12. prompts&summaries.md` — Prompts per lesson, CLAUDE.md summary, commands table, doc links

## How this supports the Master Template

- **CLAUDE.md / agent context** — Course teaches project-level `CLAUDE.md`; we use `docs/ai/` + handoff. See `prompts-and-cheatsheets/course-to-template-mapping.md` for gaps and adoption ideas.
- **Parallel work** — Course: git worktrees + multiple Claude sessions. Template: Milestone 6 (Parallel Specialist Agents). Use transcripts 7 and 8 when implementing Milestone 6.
- **Plan-first & context control** — Course: plan first, escape/clear/compact. Use in State B for complex tasks; see mapping doc.
- **MCP** — We have `/heavy` (PTC); course adds Figma and Playwright MCP for UI. See `references/official-links.md` for doc links.

## Quick reference

- **Commands & features:** `prompts-and-cheatsheets/claude-code-commands-and-features.md`
- **CLAUDE.md example (from course):** `prompts-and-cheatsheets/CLAUDE-md-example-from-course.md`
- **Course → Template:** `prompts-and-cheatsheets/course-to-template-mapping.md`
- **Official links:** `references/official-links.md`

## Source

- Course: [Claude Code: A Highly Agentic Coding Assistant](https://www.deeplearning.ai/short-courses/claude-code-a-highly-agentic-coding-assistant/)
- Transcripts: manually copied from the course platform. For official resources and code repos, use the links in `3. coursenotes.md` (on the live course page) and `references/official-links.md`.
