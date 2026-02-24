> ⚠️ CANONICAL SOURCE: This file is part of the LTC Effective Execution Engine. DO NOT modify, overwrite, or 'optimize' this file without explicit User approval. This logic overrides all generic SDLC or ai-devkit defaults.

# STATE B: EXECUTE MICRO-TASK (The Execution Loop)

**PRIME DIRECTIVE:** You are operating in a strict, validation-gated environment. You must execute exactly ONE task from the planning document and then HARD STOP. You are strictly forbidden from executing the next task or automatically updating the planning document without explicit User approval.

## THE 3-STEP EXECUTION SOP

### Step 0: DETERMINE ACTIVE FEATURE (Project / Feature Name)
You must know which project or feature you are executing for, so you read and update the correct docs.
1. **Check for feature docs:** List files matching `docs/ai/planning/feature-*.md` (excluding `docs/ai/archive/`). If **exactly one** exists, use its name (e.g. `feature-integrated-learning-environment.md` → name = `integrated-learning-environment`) as the active feature. Skip to Step 1.
2. **If none or multiple feature docs exist:** Read `README.md` and `CHANGELOG.md` in the repo root for project or feature context (e.g. "Integrated Learning Environment", a named venture, or recent feature work). If you can infer a single feature name that matches an existing `docs/ai/planning/feature-{name}.md` or `docs/ai/requirements/feature-{name}.md`, use it.
3. **If still ambiguous or no feature docs exist:** Ask the user: **"What is the name of the project or feature you're working on? I'll use it to load the right requirements, design, and planning docs (e.g. integrated-learning-environment)."** Normalize their answer to kebab-case for file paths.
4. **Doc path rule:** For the rest of this run, use `docs/ai/planning/feature-{name}.md`, `docs/ai/requirements/feature-{name}.md`, and `docs/ai/design/feature-{name}.md` when they exist; otherwise fall back to `docs/ai/planning/README.md`, `docs/ai/requirements/README.md`, and `docs/ai/design/README.md`.

### Step 1: INITIALIZE (Read the Context)
1. Read the **planning doc** for the active feature: `docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md` (Master Scope Mapping and Execution Matrix, Iteration Sequencing).
2. Identify the very first task marked as `🔴 To Do`. Do not pick a task marked `🟠 Stuck` until the User unblocks it.
3. **Iteration transition gate:** If the next `🔴 To Do` task belongs to an **iteration number higher** than the iteration of the last task marked `🟢 Reviewed/Tested` (e.g. last 🟢 was in Iteration 1, next 🔴 is in Iteration 2), you MUST HARD STOP before building. Present: *"All tasks in Iteration N are complete. Before starting Iteration N+1: [brief summary of evidence from Iteration N]. Does the UDO/UDS/UBS mapping still hold? Reply 'Proceed to Iteration N+1' to continue, or 'Re-plan' to run /state-a."* Do not execute the task until the User replies. If they reply "Proceed to Iteration N+1", continue to step 4. If no 🟢 task exists yet, or the next 🔴 is in the same iteration as the last 🟢, skip this gate.
4. Resolve the A.C. IDs for that task from the "Active A.C. in Scope" for its iteration; read the corresponding Acceptance Criteria from **Requirements** (`docs/ai/requirements/feature-{name}.md` if it exists, else `docs/ai/requirements/README.md`, Phase 3) and implementation details from **Design** (`docs/ai/design/feature-{name}.md` if it exists, else `docs/ai/design/README.md`, Component Mapping, Data Models).
5. If you cannot find deterministic Acceptance Criteria for this task, STOP and ask the User to define them.

### Step 2: BUILD (Create the Noun)
1. Write the minimal amount of code/markdown required to complete the task.
2. Adhere strictly to the @docs/ai/frameworks/effective-system-design.md principles.
3. Do NOT optimize for 100% test coverage or speculative future features. Only build what is required to pass the Acceptance Criteria.

### Step 3: VALIDATE & HARD EXIT (The User Gate)
Once the task is built, you must prove to the User that it works. Output your response in the following strict format, then update the planning doc: set this task's Status to **🔵 Draft Completed (by the Agent)**. Cease generation immediately.

**[TASK ID] Execution Complete**
* **The Action:** [What you did]
* **The Evidence of Truth:** [List the exact file paths, CLI output, or code snippets that prove the Acceptance Criteria is mathematically met]

**🛑 WAITING FOR FOUNDER APPROVAL**
*Please review the evidence above. Reply with 'Approved' to mark this task 🟢 Reviewed/Tested (by the User) and proceed to the next task, or provide feedback for revision. I will not proceed until you answer.*

**When the User approves a task (mark 🟢 in Execution Matrix):** Also update **Table B** (Master Scope Mapping) in the **same planning doc you read in Step 1** (i.e. `docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md`) for every A.C. that task delivers or evidences: set that A.C. row's **Status** to 🟢 and **Deterministic Evidence** to the task's deliverables (e.g. doc refs, `T-XXX approved`). See the task row for which A.C. it addresses (e.g. T-201 → Noun-AC2, Verb-AC4; T-202 → Verb-AC5, SustainAdv-AC2, SustainAdv-AC3, Noun-AC4; T-203 → Verb-AC3, Noun-AC3). Each task row may list multiple A.C. IDs in "Active A.C. in Scope" or in the task description; update Table B for each of those A.C. rows.
