# UTILITY: HELP (What Do I Run?)

**PRIME DIRECTIVE:** Print the decision tree below. Do not modify any files or execute tasks.

## Output the following to the User:

**What do you want to do?**

| I want to… | Run | What happens |
| :--- | :--- | :--- |
| Start a new feature or enablement | `/state-a` | AI guides you through problem mapping → requirements → design → planning. No code. |
| Execute the next task | `/state-b` | AI builds one task, proves it works, waits for your "Approved." |
| See where I am | `/status` | Read-only snapshot: feature, iteration, next task, progress counts. |
| Save my progress (git) | `/ship` | AI drafts a commit message, you say "Yes" to push. |
| Something broke | `/debug` | AI finds the root cause (UBS) before touching any code. |
| Capture a principle or rule | `/remember` | Saves to persistent AI memory for future sessions. |
| Prepare to resume later | `/handoff` | Generates `project_handoff_status.md` with everything the next session needs. |
| Review a completed iteration | `/review` | Shows all evidence from the iteration; asks if UDO still holds before advancing. |
| Heavy analysis (big codebase/review) | `/heavy` | Delegates analysis to PTC MCP; IDE gets a summary (saves context and cost). |
| Look up a term (UDO, Verb, etc.) | Open `docs/ai/frameworks/effective-system-design.md` | Glossary at the top defines every term in plain English. |

**Approval phrases (what the agent expects you to type):**
- After State A sub-step → **"Approved"**
- After State B evidence → **"Approved"** (or type feedback to revise)
- At iteration gate → **"Proceed to Iteration N+1"** or **"Re-plan"**
- At /ship → **"Yes"**
- At /debug fix → **"Yes"**

**First time?** Clone → Open in Cursor → `/state-a` (give feature name) → `/state-b` to build. See README.md; approval phrases and recovery: `docs/ai/Effective_Execution_Manifesto.md`. Glossary: `docs/ai/frameworks/effective-system-design.md`.
