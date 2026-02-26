# UTILITY: TEST (Run Test Skeleton)

**Purpose:** Run the project's tests via the engine test skeleton. Use this when you want to validate before committing; `/ship` is for git commit only and does not run tests.

**Process:** See `docs/ai/Effective_Execution_Manifesto.md` for approval phrases and recovery.

**Step 1:** From the repo root, run `./tests/run-tests.sh` (or `bash tests/run-tests.sh`). The script discovers and runs the project's test runner (e.g. npm test, pytest, cargo test, go test); if none is detected, it prints "No tests defined yet" and exits 0.
**Step 2:** Report the script output and exit code to the User. Exit 0 = pass or no tests; non-zero = at least one test failed.
**Step 3:** If tests failed, do not propose `/ship` until the User has addressed failures or explicitly chooses to commit anyway.
