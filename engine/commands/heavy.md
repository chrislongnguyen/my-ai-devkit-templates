# COMMAND: /heavy (Heavy Analysis via PTC)

**Process:** Listed in `/help`. For approval phrases and recovery, see `docs/ai/Effective_Execution_Manifesto.md`.

**When the user runs this command:** You must delegate the work to the MCP tool instead of reading many files yourself.

## Rule (Agent must follow)
1. **Call the MCP tool** `run_heavy_analysis_ptc` with:
   - **prompt:** The user's question or task (required).
   - **scope:** Optional; directory or paths the user wants in scope (e.g. `docs/`, or a list of paths). If the user specified scope in their message, pass it; otherwise omit or ask only if the tool requires it.
2. **Do not read many files yourself** for this request. One MCP call completes the heavy analysis; the tool returns a summary. Use that summary as the result.
3. **Present the tool's result** (summary or structured output) to the user. Do not re-read full file contents into context.

## Contract (IDE-agnostic)
Any IDE that supports MCP and a command (e.g. Cursor, AntiGravity) can invoke the same tool the same way: run this command (e.g. `/heavy` or `/ptc`), pass the user's prompt and optional scope to the tool `run_heavy_analysis_ptc`. The MCP server returns only a summary to the IDE.
