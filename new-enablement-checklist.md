# New Enablement Checklist

Initialize this engine for a new product in **≤ 15 minutes**. Follow in order; time estimates assume a fresh clone.

---

## 1. Clone and open (≈ 1 min)

- Clone the repo (or duplicate the folder).
- Open the repo in **Cursor** (or your IDE: see README for AntiGravity / OpenClaw / Claude).

---

## 2. MCP setup — optional (≈ 3–5 min)

Required only if you use **`/heavy`** (PTC MCP).

- Ensure `tools/claude-ptc-mcp/` exists.
- Run: `cd tools/claude-ptc-mcp && npm install`
- Copy `.env.example` to `.env` and set `ANTHROPIC_API_KEY`.
- Restart Cursor so it picks up `.cursor/mcp.json` and the MCP server.

If you skip this, `/state-a` and `/state-b` still work; `/heavy` will not.

---

## 3. Run guardrails (≈ 1 min)

From repo root:

```bash
./setup.sh
```

This installs the pre-commit hook and makes `check-engine.sh` executable. If `check-engine.sh` reports issues, fix the reported violations and run it again.

---

## 4. Verify adapter for your environment (≈ 1 min)

- **Cursor:** No extra step; commands are in `.cursor/commands/`.
- **Claude (Cowork, etc.):** Confirm root `CLAUDE.md` points to `.claude/CLAUDE.md`. Open `.claude/CLAUDE.md` and confirm it has the project name, engine entry point (`engine/SKILL.md`), and State A / State B invocation.
- **AntiGravity / OpenClaw:** See README section "Other environments"; point the AI entry to `engine/SKILL.md`.

---

## 5. First State A run (≈ 5–8 min)

- Run **`/help`** to see all commands.
- Run **`/state-a`** and give your **feature or product name** (e.g. `my-new-product`).
- Complete the four sub-steps: the agent will produce requirements, design, and planning. Reply **"Approved"** after each sub-step.
- When State A is done, you have a Holy Trinity under `docs/ai/requirements/`, `docs/ai/design/`, `docs/ai/planning/` (or the agent will have proposed updates to the README templates).

---

## 6. Optional: first State B run

- Run **`/state-b`** to execute the first task. The agent will show evidence and stop; reply **"Approved"** to mark the task done and continue.
- Use **`/status`** anytime to see active feature, iteration, and next task.

---

## Time check

Total for steps 1–5 (without optional MCP): **≈ 9–12 min**. With MCP: **≈ 12–15 min**. If you exceed 15 minutes, note which step was slow so we can tighten the checklist or docs.

---

## Multi-feature pattern

When a **live product** (e.g. already at Iteration 4) needs **new capabilities**, start a new **feature set** with its own full **I1→I4 cycle**: add `docs/ai/requirements/feature-{name}.md`, `docs/ai/design/feature-{name}.md`, `docs/ai/planning/feature-{name}.md`, run State A for that feature, then execute with `/state-b`. The engine supports **multiple feature sets in one repo**; each has independent Holy Trinity docs and task flow. Worked example: [Two features coexisting in one repo](docs/ai/examples/multi-feature-coexisting.md). See also README section "Adding more capabilities (multi-feature)".
