---
description: Trigger the Dev Lifecycle Skill → State B (Execute One Micro-Task).
---

Trigger the Dev Lifecycle Skill **State B: Execute One Micro-Task**.

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for approval phrases and recovery. **Iteration boundary:** When the next 🔴 To Do is in a higher iteration than the last 🟢 Reviewed/Tested, you must stop and present the iteration transition gate (see execute-micro-task.md Step 1). The User may run `/review` to audit evidence before replying "Proceed to Iteration N+1". See `.cursor/rules/anti-patterns.mdc` rule 5.

**First, determine the active project/feature:** Follow **Step 0** in `.cursor/skills/dev-lifecycle/references/execute-micro-task.md` (canonical; excludes `docs/ai/archive/`). Then read and update the **feature docs** when they exist, else the README templates.

Load and follow the instructions in `.cursor/skills/dev-lifecycle/references/execute-micro-task.md`. Execute exactly one task marked 🔴 To Do; do not pick 🟠 Stuck until the User unblocks. Present evidence, mark the task 🔵 Draft Completed (by the Agent), then hard-stop. Do not proceed until the User replies **"Approved"** (then mark 🟢 Reviewed/Tested) or gives feedback.
