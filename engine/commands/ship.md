# UTILITY: SHIP STATE (Git Commit & Push)

**PRIME DIRECTIVE:** Automate git version control for the User safely.

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for approval phrases and recovery. Before proposing the commit, apply **context-preservation Rule 3 (Pre-Ship Handoff Reminder)**: if `/handoff` has not been run since the last approved task, remind the User and offer to generate the handoff doc first.

**Step 1:** Run `git status` and `git diff --stat` to see what changed. Before proposing the commit, consider whether the planning doc should be updated (e.g. task marked 🟢 Reviewed/Tested) so the commit reflects current state. Use `docs/ai/planning/feature-{name}.md` if it exists for the active feature (determine active feature per execute-micro-task.md Step 0), else `docs/ai/planning/README.md`.
**Step 2:** Generate a concise, standard commit message (e.g., `feat(auth): add login UI` or `fix(db): resolve connection drop`).
**Step 3:** Present the proposed commit message and the list of files to the User.
**🛑 WAITING FOR USER APPROVAL:** *"Do you approve this commit? Reply 'Yes' to execute git add, commit, and push."*
**Step 4:** ONLY upon explicit **"Yes"** (canonical phrase for /ship — see Manifesto), run the terminal commands to push to the current branch.
