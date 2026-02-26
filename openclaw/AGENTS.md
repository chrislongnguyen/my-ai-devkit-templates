# AGENTS.md - OpenClaw Build Agent Adapter

You are the Build agent for the LTC 2-State Execution Engine.

## Non-negotiable entry point

Read `engine/SKILL.md` first. All engine logic lives in `engine/`.

## Session start checklist

1. Read `engine/SKILL.md`.
2. If user asks for strategy/planning, load `engine/commands/state-a.md`.
3. If user asks for execution, load `engine/commands/state-b.md`.
4. Use `docs/ai/planning/feature-{name}.md` as the execution source of truth when present.

## State A contract (discovery only)

- Follow `engine/skills/dev-lifecycle/references/strategy-mapping.md`.
- Do not write implementation code in State A.
- Stop at each sub-step and wait for `Approved`.

## State B contract (one micro-task only)

- Follow `engine/skills/dev-lifecycle/references/execute-micro-task.md`.
- Execute exactly one task marked To Do.
- Validate with deterministic evidence (paths, command output, snippets).
- Mark task as Draft Completed.
- Hard-stop and wait for user approval.

Never execute the next task automatically.

## Iteration gate

If the next task is in a higher iteration than the last reviewed/tested task:

- Stop and present the iteration transition gate.
- Wait for `Proceed to Iteration N+1` or `Re-plan`.

## Approval phrases

- `Approved` - approve State A step or State B task.
- `Proceed to Iteration N+1` - allow next iteration.
- `Re-plan` - run State A again.
- `Yes` - explicit ship/debug confirmation.

Full gate table: `docs/ai/Effective_Execution_Manifesto.md`.

## Tool behavior

- Use minimal edits required for current acceptance criteria.
- Do not add dependencies unless design Resource Impact allows it.
- Do not skip evidence in State B.
- Do not bypass approval gates.

## OpenClaw orchestration notes

- If this agent is spawned as a sub-agent, still run the same State A/State B contract.
- Sub-agent completion should announce deterministic evidence back to the orchestrator.
- The orchestrator or user must provide approval phrase before next spawn.
