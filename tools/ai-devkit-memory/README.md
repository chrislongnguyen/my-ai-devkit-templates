# AI DevKit Memory MCP Runner

This folder runs the **@ai-devkit/memory** MCP server locally so Cursor can use `/remember` and memory search without relying on `npx` at startup.

## One-time setup

From the **repository root**:

```bash
npm install --prefix tools/ai-devkit-memory
```

Or from this directory:

```bash
cd tools/ai-devkit-memory && npm install
```

## Why this exists

- **Avoids npx at startup:** Cursor starts the server by running `node tools/ai-devkit-memory/node_modules/@ai-devkit/memory/dist/index.js` instead of `npx -y @ai-devkit/memory`, so there’s no fetch delay or network timeout.
- **Stable native build:** The server uses `better-sqlite3`. Installing here builds it once; Cursor then reuses that build.
- **Requirements:** Node.js 18+. Memory is stored in `~/.ai-devkit/memory.db` (local only).

## If the MCP server still shows "errored"

1. Ensure you ran `npm install` in `tools/ai-devkit-memory` (see above).
2. Check Node version: `node -v` (must be 18+).
3. Run the server manually to see the error:
   ```bash
   node tools/ai-devkit-memory/node_modules/@ai-devkit/memory/dist/index.js
   ```
   (It will wait for stdin; press Ctrl+C to stop.)
4. Ensure `~/.ai-devkit` exists or is writable (the server creates it and `memory.db` on first use).

## References

- [AI DevKit Memory docs](https://ai-devkit.com/docs/6-memory/)
- Project: `/remember` → `engine/commands/remember.md`
