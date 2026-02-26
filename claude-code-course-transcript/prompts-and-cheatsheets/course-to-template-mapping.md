# Course lessons → Master Template mapping

How each course lesson supports or improves this project (LTC AI DevKit / Master Template).

| Lesson | Course content | Template today | Action / improvement |
|--------|----------------|----------------|----------------------|
| **1–2** | Intro; what Claude Code is, architecture, memory | We use Cursor + rules/skills; no CLAUDE.md | Consider adding `CLAUDE.md` or `AGENT_CONTEXT.md` in repo root (see `CLAUDE-md-example-from-course.md`). |
| **3** | Course notes, install, links to RAG/e‑commerce/Figma repos | We have Cursor, `/heavy` MCP | Keep `references/official-links.md` updated; pull course codebase links from platform when needed. |
| **4** | Setup & codebase understanding; CLAUDE.md, exploring codebase | State B Step 1: read planning + requirements + design | Reinforce “read before build.” Optional: one-session “overview” step for large codebases (like course’s “overview of codebase”). |
| **5** | Adding features: plan first, thinking mode, subagents | State A = plan; State B = one task | For complex State B tasks, prompt: “Plan steps first” or “Use thinking mode.” Subagents = future (Milestone 6). |
| **6** | Testing, debugging, refactoring | No automated tests yet (Milestone 1) | Use lesson 6 patterns when we add automated-test-verification feature. |
| **7** | Multiple features simultaneously (git worktrees) | Milestone 6: Parallel Specialist Agents | Use transcript 7 + community notes when implementing Milestone 6 (worktrees + parallel sessions). |
| **8** | GitHub integration & hooks | We have `/ship` (commit & push) | Optional: GitHub-as-workflow (issues, PRs) and hooks; see `references/official-links.md` for docs. |
| **9–10** | Jupyter → dashboard; Figma → web app | Template is process-only; no project types | Use as reference when we do data or UI features; optional Figma/Playwright MCP. |
| **11** | Conclusion | — | Recap: point to relevant files, keep CLAUDE.md (or equivalent) updated. |
| **12** | Prompts & summaries, commands, CLAUDE.md examples | — | Use `claude-code-commands-and-features.md` and `CLAUDE-md-example-from-course.md` in this folder. |

## High-impact adoptions

1. **CLAUDE.md / AGENT_CONTEXT.md** — One file in repo root describing this template and where to find planning doc + rules. Low effort, reduces agent drift.
2. **Plan-first inside a task** — For hard State B tasks, ask the agent to output a short plan or use “thinking” before implementing.
3. **Context hygiene** — Course: `/clear`, `/compact`, ESC. We: `/handoff`, new chat, re-read planning. Document both in rules or README so operators know when to reset context.
4. **Parallel work (Milestone 6)** — Follow course’s git-worktree pattern when we implement parallel agents; keep planning doc as single source of truth and merge work back with clear evidence.

## Where the template already aligns

- Plan-first at feature level (State A).
- One task at a time with evidence (State B).
- Cross-session memory (handoff + planning doc).
- MCP usage (`/heavy`); add Figma/Playwright only if we do UI/design work.
