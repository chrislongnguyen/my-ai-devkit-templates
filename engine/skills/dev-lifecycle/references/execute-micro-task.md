> ⚠️ CANONICAL SOURCE: This file is part of the LTC Effective Execution Engine. DO NOT modify, overwrite, or 'optimize' this file without explicit User approval. This logic overrides all generic SDLC or ai-devkit defaults.

# STATE B: EXECUTE MICRO-TASK (The Execution Loop)

**PRIME DIRECTIVE:** You are operating in a strict, validation-gated environment. You must execute exactly ONE task from the planning document and then HARD STOP. You are strictly forbidden from executing the next task or automatically updating the planning document without explicit User approval.

## THE 3-STEP EXECUTION SOP

### Step 0: DETERMINE ACTIVE FEATURE (Project / Feature Name) — CANONICAL
*This logic is the single source of truth for "active feature" across /status, /handoff, /state-b, /review, and context-preservation. All commands that need an active feature MUST use this logic and MUST exclude `docs/ai/archive/`.*

You must know which project or feature you are executing for, so you read and update the correct docs.
1. **Check for feature docs:** List files matching `docs/ai/planning/feature-*.md` **only under `docs/ai/planning/`** — do **not** include any file under `docs/ai/archive/`. If **exactly one** exists, use its name (e.g. `feature-integrated-learning-environment.md` → name = `integrated-learning-environment`) as the active feature. Skip to Step 1.
2. **If multiple feature docs exist:** Use the **most recently modified** `docs/ai/planning/feature-*.md` (by file mtime) as the active feature, unless the User has just specified a feature name in this run.
3. **If none exist:** Read `README.md` and `CHANGELOG.md` in the repo root for project or feature context. If you can infer a single feature name that matches an existing `docs/ai/requirements/feature-{name}.md`, use it for doc paths.
4. **If still ambiguous or no feature docs exist:** Ask the user: **"What is the name of the project or feature you're working on? I'll use it to load the right requirements, design, and planning docs (e.g. integrated-learning-environment)."** Normalize their answer to kebab-case for file paths.
5. **Doc path rule:** For the rest of this run, use `docs/ai/planning/feature-{name}.md`, `docs/ai/requirements/feature-{name}.md`, and `docs/ai/design/feature-{name}.md` when they exist; otherwise fall back to `docs/ai/planning/README.md`, `docs/ai/requirements/README.md`, and `docs/ai/design/README.md`.

### Step 1: INITIALIZE (Read the Context)
1. Read the **planning doc** for the active feature: `docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md` (Master Scope Mapping and Execution Matrix, Iteration Sequencing).
2. Identify the very first task marked as `🔴 To Do`. If **none** exists, identify the first `⚪ Pending` task in the **next** iteration (the iteration after the last `🟢 Reviewed/Tested` task); that task is the one that will be activated at the iteration gate. Do not pick a task marked `🟠 Stuck` until the User unblocks it.
3. **Iteration transition gate:** If the next task to run (either the first `🔴 To Do` or the first `⚪ Pending` in the next iteration) belongs to an **iteration number higher** than the iteration of the last task marked `🟢 Reviewed/Tested` (e.g. last 🟢 was in Iteration 1, next is in Iteration 2), you MUST HARD STOP before building. **AC-TEST-MAP gate (Noun-AC3):** Before presenting the gate, check whether an AC-TEST-MAP exists for the active feature: `tests/AC-TEST-MAP.md` or `tests/AC-TEST-MAP-{name}.md` (use the active feature name from Step 0). If **neither** exists, present: *"No AC-TEST-MAP found for this feature. Run `/test-write` to create the frozen baseline from the Holy Trinity, or reply 'Waive' to proceed without it."* Do not present "Proceed to Iteration N+1" until the User has run `/test-write` or replied 'Waive'. **Iteration-boundary test run:** Run `/test` (execute `./tests/run-tests.sh` from repo root) and report the result. If exit code is non-zero, include: *"Tests failed. Address failures or reply 'Proceed to Iteration N+1' to continue anyway."* Then present: *"All tasks in Iteration N are complete. Before starting Iteration N+1: [brief summary of evidence from Iteration N]. [Test result: pass/fail.] Does the UDO/UDS/UBS mapping still hold? Reply 'Proceed to Iteration N+1' to continue, or 'Re-plan' to run /state-a."* Do not execute the task until the User replies. **When the User replies "Proceed to Iteration N+1":**
1. Update the planning doc so the **first task in Iteration N+1** that is `⚪ Pending` is set to `🔴 To Do` (if it isn’t already).
2. **System Wiki update:** Open `docs/ai/wiki/system-{name}.md` — create it from `docs/ai/frameworks/system-wiki-template.md` if it doesn’t exist yet. Fill the sections for the iteration just completed:
   - **After Iteration 1 → 2:** §0.1 (Document Control: SOP ID, System Name, Owner, Version 0.1, Status: Draft), §0.2 (Purpose — from UDO), §0.3 (Scope — from User Persona + Anti-Persona), §0.4 (Data Governance — initial classification), §2 (Users & Roles RACI: Responsible = `[AI AGENT]_{FeatureName}`, Accountable = human owner — ask User if not yet named).
   - **After Iteration 2 → 3:** §3.1 (UBS — confirmed after sustainability testing), §3.2 (UDS), §3.3 (EPS Principles, labeled by S/E/Sc), §4 (Operating Environment — Physical/Digital/Cultural), §5 (Operating Tools — all 3 UES layers now confirmed), §0.6 (Risk Management — UBS elements → risks with mitigations).
   - **After Iteration 3 → 4:** §1 (Desired Outcomes — Sustainability + Efficiency rows with confirmed targets from SustainAdv/EffAdv evidence), §0.5 (KPIs — S + E metrics with thresholds).
3. Then continue to step 4.

If no 🟢 task exists yet, or the next task is in the same iteration as the last 🟢, skip this gate.
4. Resolve the A.C. IDs for that task from the "Active A.C. in Scope" for its iteration; read the corresponding Acceptance Criteria from **Requirements** (`docs/ai/requirements/feature-{name}.md` if it exists, else `docs/ai/requirements/README.md`, Phase 3) and implementation details from **Design** (`docs/ai/design/feature-{name}.md` if it exists, else `docs/ai/design/README.md`, Component Mapping, Data Models).
5. If you cannot find deterministic Acceptance Criteria for this task, STOP and ask the User to define them.

### Step 2: BUILD (Create the Noun)
1. Write the minimal amount of code/markdown required to complete the task.
2. Adhere strictly to the @docs/ai/frameworks/effective-system-design.md principles.
3. Do NOT optimize for 100% test coverage or speculative future features. Only build what is required to pass the Acceptance Criteria.
4. **Resource Impact:** Before adding any new dependency, library, or service, check the design doc **Resource Impact** section (Design §4 or equivalent). If the resource is not allowed or not mentioned, ask the User before adding. See `engine/rules/anti-patterns.md` rule 2.

### Step 3: VALIDATE & HARD EXIT (The User Gate)
Once the task is built, you must prove to the User that it works. Output your response in the following strict format, then update the planning doc: set this task's Status to **🔵 Draft Completed (by the Agent)**. Cease generation immediately.

**[TASK ID] Execution Complete**
* **The Action:** [What you did]
* **The Evidence of Truth:** [List the exact file paths, CLI output, or code snippets that prove the Acceptance Criteria is mathematically met]

**🛑 WAITING FOR USER APPROVAL**
*Please review the evidence above. Reply with 'Approved' to mark this task 🟢 Reviewed/Tested (by the User) and proceed to the next task, or provide feedback for revision. I will not proceed until you answer.*

**When the User approves a task (mark 🟢 in Execution Matrix):** Also update **Table B** (Master Scope Mapping) in the **same planning doc you read in Step 1** (i.e. `docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md`) for every A.C. that task delivers or evidences: set that A.C. row's **Status** to 🟢 and **Deterministic Evidence** to the task's deliverables (e.g. doc refs, `T-XXX approved`). See the task row for which A.C. it addresses (e.g. T-201 → Noun-AC2, Verb-AC4; T-202 → Verb-AC5, SustainAdv-AC2, SustainAdv-AC3, Noun-AC4; T-203 → Verb-AC3, Noun-AC3). Each task row may list multiple A.C. IDs in "Active A.C. in Scope" or in the task description; update Table B for each of those A.C. rows.

**Iteration 4 final completion:** When the last task of Iteration 4 is marked 🟢 (no remaining `⚪ Pending` or `🔴 To Do` tasks in the planning doc), complete the System Wiki `docs/ai/wiki/system-{name}.md`:
- §6 (EOP — full step-by-step operating procedure derived from Design doc EOP; for each step: Responsible = `[AI AGENT]_{FeatureName}`, Accountable = human owner named in §2, with Dos/Don'ts/KPIs/Gate from Design)
- §1 — add Scalability row (with confirmed ScalAdv/ScalAdj evidence)
- §3.4 (Core Values — map UDS drivers to the 5 LTC principles or equivalent organizational values)
- §0.5 — add Scalability KPI targets
- §0.8 (Version History: version 1.0, date today, author = Agent, summary = "Initial Release", approved by = Accountable human named in §2)
- §0.1 — update Status to `Approved`

Inform the User: *"System Wiki complete at `docs/ai/wiki/system-{name}.md`. This is the definitive operational record. Archive the feature planning doc to `docs/ai/archive/` if desired."*
