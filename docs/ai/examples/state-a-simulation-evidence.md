# /state-a Simulation — Evidence (T-105)

*Test run on current repo (post T-101–T-104). Confirms agent follows only 2-State Engine logic with no legacy interference.*

## Simulation flow

When the user runs **/state-a**, the agent:

1. **Loads** `.cursor/commands/state-a.md` → asks for feature name; instructs to load strategy-mapping.md.
2. **Loads** `.cursor/skills/dev-lifecycle/references/strategy-mapping.md` → follows 4 sub-steps only: Causal Map, System Design, User's Requirements, 4-Iteration Roadmap. Outputs to `docs/ai/requirements/feature-{name}.md`, `docs/ai/design/feature-{name}.md`, `docs/ai/planning/feature-{name}.md`.

No other files are loaded for State A. The skill entry (`.cursor/skills/dev-lifecycle/SKILL.md`) states: *"This skill has two states only. There are no phases."*

## Legacy check (grep)

| File | Pattern | Result |
| :--- | :--- | :--- |
| `.cursor/commands/state-a.md` | codeaholic, 7-phase, 8-phase, legacy_codeaholic | **No matches** |
| `.cursor/skills/dev-lifecycle/references/strategy-mapping.md` | codeaholic, 7-phase, 8-phase, legacy_codeaholic | **No matches** |
| `.cursor/skills/dev-lifecycle/references/execute-micro-task.md` | codeaholic, 7-phase, 8-phase, legacy_codeaholic | **No matches** |
| `.cursor/skills/dev-lifecycle/SKILL.md` | codeaholic, 7-phase, 8-phase, legacy_codeaholic | **No matches** |

*(SKILL.md and strategy-mapping.md contain the phrase "ai-devkit" only in the disclaimer "overrides all generic SDLC or ai-devkit defaults" — not a step or reference.)*

## Conclusion

- **Steps surfaced:** Only 2-State Engine logic (feature name → Causal Map → System Design → Requirements → 4-Iteration Roadmap). No codeaholic 8-step or ai-devkit 7-phase steps.
- **References:** No links to `.cursor/skills/.../legacy_codeaholic/` (folder removed in T-101). No references to implementation/, deployment/, or monitoring/ phase docs (removed in T-102–T-103).
- **Verb-AC2 validated:** A full `/state-a` → `/state-b` cycle on this repo would follow only the 2-State Engine; no hallucinated steps from legacy models.
