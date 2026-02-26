# Implementation docs: what changed and where they live now

## What engine-hardening did

The **template** (this repo) used to follow an ai-devkit-style layout with extra phases under `docs/ai/`:

- `docs/ai/implementation/`
- `docs/ai/deployment/`
- `docs/ai/monitoring/`

During engine-hardening we **removed those from the active tree** (T-103). So in the template:

- The **canonical** doc set is the **Holy Trinity only:** `requirements/`, `design/`, `planning/` (plus `frameworks/`, `examples/`).
- `implementation/`, `deployment/`, and `monitoring/` are no longer prescribed folders. Anything that was in them in the template was either archived or dropped when we reduced the archive to a single README (T-102).

So we did **not** delete your **project-specific** implementation files. We changed what the **engine template** considers canonical. If you had important implementation notes in a **product repo** that used this engine, those files are only “gone” if that repo was updated to match the template and those folders were removed there too.

## Why we removed them from the template

1. **Single mental model** — The engine is a **2-State** model (State A: strategy and planning; State B: execute one task). The ai-devkit **7-phase** model (requirements → design → planning → implementation → deployment → monitoring → …) was a different lifecycle. Keeping both made the AI and humans reference two conflicting flows. We kept one: requirements, design, planning (the Holy Trinity), and execution (State B).
2. **Implementation is execution, not a phase** — In this engine, “implementation” is what State B does when it performs tasks from the planning doc. The **planning** doc already says *what* to build and in what order; the **design** doc says *how* it fits together. A separate “implementation” **phase** doc was redundant with “we’re doing the tasks in the Execution Matrix.”
3. **Less clutter, fewer merge conflicts** — Fewer canonical folders means less drift between devices and clearer expectations: everything that describes the product lives in the Holy Trinity; everything that happens is “run State B from the planning doc.”

So we didn’t remove the *idea* of implementation. We removed the **extra phase folders** so the only prescribed structure is the Holy Trinity + frameworks + examples.

## What happens to your workflow

- **If your important “implementation” content was “how we built X” or “decisions we made while coding”:**  
  Put it in the **design** doc (e.g. `docs/ai/design/feature-{name}.md`) as an **Implementation notes** or **Build log** section. Design is the right place for “how the system is built and why.”
- **If it was “step-by-step runbook” or “what we actually did”:**  
  Put it in **examples** (e.g. `docs/ai/examples/implementation-notes-{feature}.md` or similar). Examples are for concrete walkthroughs and references.
- **If you really want a dedicated implementation folder in a product repo:**  
  The engine doesn’t **forbid** it. The contract is: the **template** only prescribes requirements, design, planning, frameworks, examples. In a **product** repo you can add `docs/ai/implementation/` (or any folder) for your own notes. The pre-commit hook and `check-engine.sh` don’t require or validate that folder; they only enforce the Holy Trinity when **code** is committed and the presence of the canonical template structure. So you can keep implementation docs in your product without breaking the engine — they’re just “your” structure, not the template’s.

**Summary:** Implementation wasn’t removed from the workflow; it’s **what State B does**. Implementation **docs** that you found valuable belong in **design** (how/why we built it) or **examples** (concrete runbooks), or in your own `docs/ai/implementation/` in a product repo if you prefer. The engine simply no longer *prescribes* that folder so the template stays one clear lifecycle: Holy Trinity + execute from the plan.
