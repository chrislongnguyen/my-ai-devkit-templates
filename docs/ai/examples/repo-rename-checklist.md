# Repo rename checklist

Use this when renaming the GitHub repository (e.g. from `my-ai-devkit-templates` to `effective-build-agent`). Do in order to avoid broken remotes or lost references.

---

## 1. New name

This repo uses **effective-build-agent** as the canonical name. In-repo path placeholders are set to this name.

---

## 2. Rename on GitHub

1. Open the repo on GitHub: `https://github.com/chrislongnguyen/my-ai-devkit-templates`
2. **Settings** → **General** → **Repository name**
3. Enter **effective-build-agent** → **Rename**
4. (Optional) Update **Description** from "Effective Founder's AI Devkit Templates" to e.g. "LTC Effective Execution Engine — 2-State Master Template"

GitHub will redirect the old URL to the new one; existing clones keep working until you change the remote.

---

## 3. Update local remote (every clone)

On each machine where you have the repo cloned:

```bash
git remote set-url origin https://github.com/chrislongnguyen/effective-build-agent.git
git remote -v   # confirm
```

If you use SSH:

```bash
git remote set-url origin git@github.com:chrislongnguyen/effective-build-agent.git
```

---

## 4. In-repo references (already done for effective-build-agent)

These files contained the old repo/workspace name and have been updated:

| File                                | What was updated           |
| :---------------------------------- | :------------------------- |
| `openclaw/openclaw.json.example`    | Workspace path placeholder |
| `tools/claude-ptc-mcp/.env.example` | `WORKSPACE_ROOT` comment   |

**Do not** globally replace "ai-devkit" in the repo — that string refers to the external `@ai-devkit/memory` package and framework in many places (e.g. `tools/ai-devkit-memory/`, canonical source disclaimers, archive docs).

---

## 5. Optional: rename local folder

If your local folder is still named `my-ai-devkit-templates` and you want it to match:

```bash
cd /path/to/parent
mv my-ai-devkit-templates effective-build-agent
cd effective-build-agent
```

Then reopen the project in Cursor from the new path.

---

**Summary:** Rename on GitHub to **effective-build-agent** → update `origin` on each clone → (optional) rename local folder. In-repo placeholders are set to **effective-build-agent**.
