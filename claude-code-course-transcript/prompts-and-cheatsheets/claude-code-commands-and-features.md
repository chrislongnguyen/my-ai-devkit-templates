# Claude Code — Commands & features (from course)

Extracted from *Prompts & Summaries of Lessons* (Lesson 12). Use when working with Claude Code or when aligning Cursor/agent workflows.

## Commands

| Command | Description |
|--------|-------------|
| `/clear` | Clears current conversation history |
| `/compact` | Summarizes current conversation history |
| `ESC` | Interrupt Claude to redirect or correct it |
| `ESC ESC` | Rewind the conversation to an earlier point in time |
| `@` | Mention files with `@` to include their content in your request |
| `/mcp` | Manage MCP connection & check available MCP servers and tools |
| `!` | Run bash: prefix command with `!` (e.g. `!pwd`). Type `exit` to quit Claude Code |
| `/init` | Claude Code scans your codebase and creates `CLAUDE.md` in the project directory |
| `#` | Quick add a memory (e.g. `#use uv to run python files`) |

## Shortcuts

| Shortcut | Description |
|----------|-------------|
| `shift+tab` | Switch between planning and auto-accept mode |
| Screenshot (Mac) | `Cmd+Shift+Ctrl+4` |
| Screenshot (Windows) | `Win+Shift+S` |
| Paste screenshot | `Ctrl+V` (may not work on Windows) |

## Managing project memory (CLAUDE.md)

- `/init` creates `CLAUDE.md` with codebase documentation (important commands, architecture, coding style).
- `CLAUDE.md` is automatically included in context each time you launch Claude Code.
- Use `#` to add one-off memories (e.g. tooling, schema) so Claude doesn’t repeat the same mistake.

## Extended thinking mode

For complex tasks (e.g. architectural changes, hard debugging), use: **think** < **think hard** < **think harder** < **ultrathink**. Each level gives more thinking budget.

## Subagents

- **Task tool** — Claude can launch subagents for multi-step tasks.
- Ask explicitly for subagents to brainstorm or investigate multiple aspects of a problem.
- Custom subagents: own context window, custom system prompt, specific tools (see Claude Code docs).

## Relation to this template

- **Context control:** `/clear`, `/compact`, `ESC` → use when sessions get long; we also use `/handoff` and new chats.
- **Plan first:** “Planning mode” (shift+tab) ≈ our State A + “plan steps” in State B for hard tasks.
- **Memory:** `CLAUDE.md` ≈ our `docs/ai/` + handoff; consider adding a short `CLAUDE.md` or `AGENT_CONTEXT.md` in the repo root that points to the planning doc and rules.
