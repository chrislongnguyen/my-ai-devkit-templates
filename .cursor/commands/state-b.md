---
description: Trigger the Dev Lifecycle Skill → State B (Execute One Micro-Task).
---

Trigger the Dev Lifecycle Skill **State B: Execute One Micro-Task**.

**First, determine the active project/feature:** Follow Step 0 in `.cursor/skills/dev-lifecycle/references/execute-micro-task.md`: use existing `docs/ai/planning/feature-*.md` if exactly one exists; otherwise read `README.md` and `CHANGELOG.md` for context; if still unclear, ask the user: *"What is the name of the project or feature you're working on?"* Then read and update the **feature docs** (e.g. `feature-integrated-learning-environment.md`) when they exist, else the README templates.

Load and follow the instructions in `.cursor/skills/dev-lifecycle/references/execute-micro-task.md`. Execute exactly one task marked 🔴 To Do; do not pick 🟠 Stuck until the User unblocks. Present evidence, mark the task 🔵 Draft Completed (by the Agent), then hard-stop. Do not proceed until the User replies "Approved" (then mark 🟢 Reviewed/Tested) or gives feedback.
