> ⚠️ CANONICAL SOURCE: This file is part of the LTC Effective Execution Engine. DO NOT modify, overwrite, or 'optimize' this file without explicit Founder approval. This logic overrides all generic SDLC or ai-devkit defaults.

# STATE B: EXECUTE MICRO-TASK (The Execution Loop)

**PRIME DIRECTIVE:** You are operating in a strict, validation-gated environment. You must execute exactly ONE task from the planning document and then HARD STOP. You are strictly forbidden from executing the next task or automatically updating the planning document without explicit Founder approval.

## THE 3-STEP EXECUTION SOP

### Step 1: INITIALIZE (Read the Context)
1. Read `docs/ai/planning/README.md` (Master Scope Mapping and Execution Matrix, Iteration Sequencing).
2. Identify the very first task marked as `🔴 To Do`. Do not pick a task marked `🟠 Stuck` until the Founder unblocks it.
3. Resolve the A.C. IDs for that task from the "Active A.C. in Scope" for its iteration; read the corresponding Acceptance Criteria from Requirements (Phase 3) and implementation details from Design (Component Mapping, Data Models).
4. If you cannot find deterministic Acceptance Criteria for this task, STOP and ask the Founder to define them.

### Step 2: BUILD (Create the Noun)
1. Write the minimal amount of code/markdown required to complete the task.
2. Adhere strictly to the @docs/ai/frameworks/effective-system-design.md principles.
3. Do NOT optimize for 100% test coverage or speculative future features. Only build what is required to pass the Acceptance Criteria.

### Step 3: VALIDATE & HARD EXIT (The Founder Gate)
Once the task is built, you must prove to the Founder that it works. Output your response in the following strict format, then update the planning doc: set this task's Status to **🔵 Draft Completed (by the Agent)**. Cease generation immediately.

**[TASK ID] Execution Complete**
* **The Action:** [What you did]
* **The Evidence of Truth:** [List the exact file paths, CLI output, or code snippets that prove the Acceptance Criteria is mathematically met]

**🛑 WAITING FOR FOUNDER APPROVAL**
*Please review the evidence above. Reply with 'Approved' to mark this task 🟢 Reviewed/Tested (by the User) and proceed to the next task, or provide feedback for revision. I will not proceed until you answer.*

**When the User approves a task (mark 🟢 in Execution Matrix):** Also update **Table B** (Master Scope Mapping) in `docs/ai/planning/README.md` for every A.C. that task delivers or evidences: set that A.C. row's **Status** to 🟢 and **Deterministic Evidence** to the task's deliverables (e.g. doc refs, `T-XXX approved`). See the task row for which A.C. it addresses (e.g. T-201 → Noun-AC2, Verb-AC4; T-202 → Verb-AC5, SustainAdv-AC2, SustainAdv-AC3, Noun-AC4; T-203 → Verb-AC3, Noun-AC3). Each task row may list multiple A.C. IDs in "Active A.C. in Scope" or in the task description; update Table B for each of those A.C. rows.
