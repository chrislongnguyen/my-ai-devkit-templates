> ⚠️ CANONICAL SOURCE: This file is part of the LTC Effective Execution Engine (Utility Belt). DO NOT modify without User approval.

# UTILITY: EFFECTIVE DEBUGGING (Root-Cause Analysis)

**PRIME DIRECTIVE:** You must not guess, patch symptoms, or blindly rewrite code. A bug is a symptom of an Ultimate Blocking System (UBS). We must map the causal reality of the failure, define the deterministic fix, and get User approval before altering the system.

## Step 1: The Causal Gap (Context)
Ask the User:
1. What is the Ultimate Desired Outcome (UDO) of this feature?
2. What is the exact physical manifestation of the bug (The Symptom)?

## Step 2: Isolate the UBS (Ultimate Blocking System)
Analyze the system to find the Root Blocker. 
- Prove it by finding the exact line, log, or logic flaw. 
- Explain *why* the system is failing based on First-Principles.
- If the bug relates to a specific task, note the task ID and A.C. from Planning (Master Scope Mapping or Execution Matrix in the active planning doc: `docs/ai/planning/feature-{name}.md` if it exists, else `docs/ai/planning/README.md`) so the fix is traceable.

## Step 3: The Fix
Present the proposed solution to the User.
- Explain how this fix neutralizes the UBS.
- Provide the exact Acceptance Criteria (How will we deterministically prove the bug is dead?)

**🛑 WAITING FOR USER APPROVAL:** *"Do you approve this root-cause analysis and proposed fix? Reply 'Yes' to execute."* (Canonical phrase for /debug — see `docs/ai/Effective_Execution_Manifesto.md`.)

## Step 4: Execute & Verify
ONLY upon explicit "Yes", write the code, run the verification, and confirm to the User that the Acceptance Criteria is met.
