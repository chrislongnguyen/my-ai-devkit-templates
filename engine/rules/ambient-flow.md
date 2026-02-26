# Ambient Flow — New Feature / Add-on Without Command

This workspace uses the LTC 2-State Engine. Execution happens only after Strategy & Planning (State A) and one task at a time (State B).

## When This Applies

If the user requests a **new feature**, **add-on**, or **build/implement/add X** in freeform chat (i.e. they did **not** explicitly run `/state-a` or `/state-b`), treat this as a broken flow. Do **not** start writing code or executing tasks yet.

## What You Must Do

1. **Nudge to the proper flow.**  
   Briefly state that new scope should go through `/state-a` first for scoping, then `/state-b` for execution. Example: *"To add this properly, we should run `/state-a` first to scope it into requirements, design, and planning—then execute one task at a time with `/state-b`. I can help you do that here."*

2. **Help populate the Holy Trinity from their request.**  
   **Ask for the project/feature name** if not already known (e.g. integrated-learning-environment). Use that name for doc paths: when `docs/ai/requirements/feature-{name}.md` (or design/planning) exists, propose updates there; otherwise use the README templates. Using what they asked for (feature/add-on description):
   - Propose **additions or updates** to the requirements doc (e.g. `docs/ai/requirements/feature-{name}.md` if it exists, else `docs/ai/requirements/README.md`): new or refined Verb, Adverb, Noun, Adjective and A.C. with stable IDs.
   - Propose **additions or updates** to the design doc (`docs/ai/design/feature-{name}.md` if it exists, else `docs/ai/design/README.md`): how this fits the architecture, Effectiveness Attributes.
   - Propose **additions or updates** to the planning doc (`docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md`): new rows in Master Scope Mapping, new tasks in the Execution Matrix for the relevant iteration.
   - Use the existing templates and A.C. ID convention (Verb-ACn, SustainAdv-ACn, etc.). Do not invent A.C. that conflict with existing ones.

3. **Get explicit approval before any execution.**  
   Present the proposed doc changes (or a clear summary). Then say something like: *"Do you approve these updates to the requirements/design/planning docs? Reply 'Approved' to apply them. After that, run `/state-b` to execute the first task, or ask me to apply the edits and then you can /state-b."*  
   Only after they approve: apply the doc edits (or the subset they confirm). Do **not** proceed to build code or run implementation tasks in this same flow unless they explicitly ask you to run `/state-b`-style execution (one task, evidence, then stop).

## When This Does Not Apply

- The user **did** run `/state-a` or `/state-b` (they are in an invoked flow). Follow the command/skill logic.
- The user is asking a **question** (e.g. "what does this do?", "explain the flow", "how do I..."). Answer normally.
- The user is asking for **edits to existing docs** without adding new scope (e.g. "fix this typo in planning"). Proceed with the edit.
- The user explicitly says **"run /state-b"** or **"execute the next task"** after docs are in place. Proceed with one task, evidence, then stop.

## Summary

**New feature/add-on in freeform → Nudge to /state-a → Help populate requirements/design/planning from their request → Get approval → Then they /state-b (or you apply edits and they /state-b). No execution before approval.**
