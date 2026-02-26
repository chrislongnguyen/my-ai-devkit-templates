# PTC vs Cursor: Manual Quality Scoring Protocol

Use this protocol to compare **output quality** and **context impact** between Cursor's normal tool calling and the `/heavy` (PTC) path. Run the automated benchmark first to get PTC token/cost data, then follow these steps for each test.

---

## Prerequisites

- **PTC-side numbers** are from the logged runs and `benchmark-comparison.md` (and `logs/usage.jsonl`). The automated benchmark script has been removed; results are preserved in those files.
- **Cursor** open on this repo.

---

## What we're comparing (Run 1 vs full journey)

**Run 1 (automated benchmark)** runs **outside Cursor**: it calls the PTC server → Claude API directly. So we only measure the **PTC → Claude** leg: input tokens to Claude, output tokens (the summary), cost, latency. We do **not** measure Cursor’s context or any Cursor-generated output for that path.

**Manual Cursor normal (T1–T3)** is the **full journey** in Cursor: user prompt → Cursor reads files → Cursor’s model replies. We record Cursor’s context % (which includes that full turn).

**To make the comparison complete**, we need the **full journey for /heavy** too: user types `/heavy` + prompt in Cursor → Cursor sends to PTC → PTC calls Claude → PTC returns summary to Cursor → Cursor shows that as the reply. So in **Step 2** (Run with /heavy), also **record Cursor’s context %** after the /heavy reply (same way you did for Cursor normal). That gives us “tokens in Cursor’s context for one turn” for both paths and a fair comparison.

- **Cursor normal:** context = full turn (files + system + your prompt + Cursor’s reply).
- **/heavy in Cursor:** context = full turn (your prompt + PTC summary + any Cursor wrapper; no files in Cursor’s context for that turn).
- **Run 1 numbers** stay as the **PTC/API** view: Claude input/output, cost, latency. Use them for API cost; use the **Cursor context % from Step 2** for “tokens in Cursor” when using /heavy.

---

## Test prompts (same as benchmark)


| Test            | Prompt                                                                                                                                                          | Scope (for /heavy)                                             |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| **T1: Simple**  | Summarize what this project does and who it's for.                                                                                                              | `README.md`                                                    |
| **T2: Medium**  | Analyse the Execution Matrix template. Explain the task flow, status lifecycle, and how A.C. IDs trace from Requirements to Planning.                           | `docs/ai/planning/README.md`, `docs/ai/requirements/README.md` |
| **T3: Complex** | Review all commands and rules in .cursor/commands/ and .cursor/rules/. Identify any inconsistencies, missing cross-references, or gaps in the governance logic. | `.cursor/commands/`, `.cursor/rules/`                          |


---

## Steps (for each of T1, T2, T3)

### 1. Run normally in Cursor (no /heavy)

- Paste the **exact prompt** from the table above into Cursor chat.
- Let Cursor read files and respond. Do not use `/heavy`.
- **Save the full response** (e.g. copy to a doc or note).
- **Estimate context impact:** In the tool-call or activity log, note how many files Cursor read. Approximate total size (e.g. “~~8 files, ~15 KB”) so you can estimate tokens later (~~4 chars/token → rough token count).

### 2. Run with /heavy

- In a **new** chat (or after a clear turn), type `**/heavy`** followed by the same prompt. If scope matters, you can say e.g. “Scope: README.md” or “Scope: .cursor/commands/, .cursor/rules/” as in the table.
- Save the full response (including the `--- _usage ---` block at the end).
- **PTC token/cost:** Copy from the `_usage` line: `input_tokens`, `output_tokens`, `est_cost_usd`, `latency_ms`.
- **Cursor context (full journey):** After the /heavy reply, note Cursor’s **context %** for that turn (same UI as in Step 1). Convert to tokens (e.g. 0.2% of 200k ≈ 400 tokens) and record in the table under “/heavy in Cursor (full turn)” so we compare apples-to-apples with Cursor normal.

### 3. Score both responses (1–5)

For **Cursor normal** and **/heavy** separately, rate:


| Criterion         | 1 (low)                                     | 5 (high)                       |
| ----------------- | ------------------------------------------- | ------------------------------ |
| **Completeness**  | Missed major parts of the prompt            | Addressed every part           |
| **Accuracy**      | Factually wrong or vague about the codebase | Factually correct and specific |
| **Actionability** | Cannot decide or act from this alone        | Clear next steps or decisions  |
| **Conciseness**   | Long, repetitive, hard to scan              | Short, scannable, no noise     |


Record scores in the results table below.

**How and when to measure the four criteria**

- **When:** After you have **both** responses for that test (Cursor normal from Step 1, /heavy from Step 2). Score both while the prompt and the two replies are fresh—ideally in the same session. You can either (a) score Cursor normal right after Step 1 and /heavy right after Step 2, or (b) score both together after Step 2 (e.g. with the two responses side-by-side) for more consistent grading.
- **How:** Use the 1–5 scale and the rubric above. For each criterion:
  - **Completeness:** Check the prompt: did the response address every part? (e.g. T2: task flow, status lifecycle, A.C. trace—all three?)
  - **Accuracy:** Spot-check claims against the codebase (e.g. file paths, status names, doc structure). 1 = wrong or vague; 5 = correct and specific.
  - **Actionability:** Could you decide or act from this alone? (e.g. “what to fix”, “what’s consistent”, “next step”)
  - **Conciseness:** Length and scannability (headings, bullets, no repetition). 1 = long and noisy; 5 = short and scannable.
- **Tip:** For consistency across T1–T3, use the same standard: e.g. “5 = no obvious gaps, 3 = one clear gap, 1 = major gap.” You can note one-line justifications in the scratch pad if helpful.

### 4. Fill the comparison table for this test

Use the template row for T1, T2, T3 (and add a short note if needed).

---

## Results table (fill in as you go)

**Cursor normal column** you fill by running T1→T3 in Cursor without /heavy (see "How to fill Cursor normal" below). **/heavy PTC column:** "Tokens in context" = (1) Run 1: PTC→Claude summary size only; (2) Full journey: when you run /heavy in Cursor (Step 2), record Cursor's context % for that turn and fill *full turn* in the table for apples-to-apples comparison.  

### Logged Cursor normal results (for reference)


| Test   | Context used (Cursor UI)             | Interpretation                                                | Files read                                                                                                 |
| ------ | ------------------------------------ | ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **T1** | **10.1%** context window (Auto Mode) | If context = 200k tokens → **~20,200 tokens**. If 1M → ~101k. | 2 (README.md, Effective_Execution_Manifesto.md)                                                            |
| **T2** | **14.8%** context window (Auto Mode) | If context = 200k tokens → **~29,600 tokens**. If 1M → ~148k. | 4 (docs/ai/planning/README.md, docs/ai/requirements/README.md, execute-micro-task.md, strategy-mapping.md) |
| **T3** | **18.1%** context window (Auto Mode) | If context = 200k tokens → **~36,200 tokens**. If 1M → ~181k. | 15 (10 commands, 3 rules, execute-micro-task.md, Effective_Execution_Manifesto.md)                         |


**Converting "X% context" to tokens:** Cursor’s total context size is often 200k (standard) or 1M (extended). Then: **tokens ≈ (X ÷ 100) × context_size**. Example: 10.1% of 200k = 20,200 tokens. Check your plan/Settings for your context size.

**T1 inferred input vs output (assuming 200k context → 20,200 tokens total):**


| Component                        | Chars       | Tokens (÷4) | Notes                                                                                                |
| -------------------------------- | ----------- | ----------- | ---------------------------------------------------------------------------------------------------- |
| README.md                        | 8,960       | ~2,240      | Measured (`wc -c`)                                                                                   |
| Effective_Execution_Manifesto.md | 7,880       | ~1,970      | Measured                                                                                             |
| User prompt                      | ~45         | ~12         | "Summarize what this project does and who it's for."                                                 |
| **Subtotal (files + prompt)**    | **~16,885** | **~4,222**  | **Input we can measure**                                                                             |
| System / Cursor-injected context | —           | ~15,378     | Remainder of 20,200 − 4,222 − 600                                                                    |
| Assistant reply (output)         | —           | **~600**    | *Estimated* from typical "concise summary" length (title + 5 points + who it's for ≈ 400–800 tokens) |
| **Total**                        | —           | **20,200**  | 4,222 + 15,378 + 600                                                                                 |


So for T1 Cursor normal, a reasonable **inferred split** is: **input ~19,600 tokens** (4,222 from files+prompt + ~15,378 system/other), **output ~600 tokens**. The exact output length depends on the actual reply; if you paste the reply text here we can replace 600 with a char÷4 count.

**T2 inferred input vs output (assuming 200k context → 29,600 tokens total):**


| Component                        | Chars       | Tokens (÷4) | Notes                                                                                                |
| -------------------------------- | ----------- | ----------- | ---------------------------------------------------------------------------------------------------- |
| docs/ai/planning/README.md       | 5,656       | ~1,414      | Execution Matrix template                                                                            |
| docs/ai/requirements/README.md   | 5,806       | ~1,452      | A.C. ID convention                                                                                   |
| execute-micro-task.md            | 5,504       | ~1,376      | Status lifecycle                                                                                     |
| strategy-mapping.md              | 5,132       | ~1,283      | How matrix is populated                                                                              |
| User prompt                      | ~100        | ~25         | T2 prompt (task flow, status lifecycle, A.C. trace)                                                  |
| **Subtotal (files + prompt)**    | **~22,198** | **~5,550**  | **Input we can measure**                                                                             |
| System / Cursor-injected context | —           | ~22,550     | Remainder of 29,600 − 5,550 − 1,500                                                                  |
| Assistant reply (output)         | —           | **~1,500**  | *Estimated* from structured analysis (4 sections: template, task flow, status lifecycle, A.C. trace) |
| **Total**                        | —           | **29,600**  | 5,550 + 22,550 + 1,500                                                                               |


So for T2 Cursor normal, a reasonable **inferred split** is: **input ~28,100 tokens** (5,550 from files+prompt + ~22,550 system/other), **output ~1,500 tokens**. Paste the actual T2 reply to replace 1,500 with char÷4.

**T3 inferred input vs output (assuming 200k context → 36,200 tokens total):**


| Component                        | Chars       | Tokens (÷4) | Notes                                                                                                                   |
| -------------------------------- | ----------- | ----------- | ----------------------------------------------------------------------------------------------------------------------- |
| .cursor/commands/ (10 .md files) | 19,344      | ~4,836      | state-a, state-b, ship, review, status, remember, debug, help, heavy, handoff                                           |
| .cursor/rules/ (3 .mdc files)    | 8,018       | ~2,005      | ambient-flow, anti-patterns, context-preservation                                                                       |
| execute-micro-task.md            | 5,504       | ~1,376      | Skills reference                                                                                                        |
| Effective_Execution_Manifesto.md | 7,880       | ~1,970      | Per user rules (read before executing)                                                                                  |
| User prompt                      | ~120        | ~30         | T3 prompt (review commands/rules, inconsistencies, cross-refs, gaps)                                                    |
| **Subtotal (files + prompt)**    | **~37,871** | **~9,468**  | **Input we can measure** (37,751 file chars + 120 prompt)                                                               |
| System / Cursor-injected context | —           | ~23,532     | Remainder of 36,200 − 9,468 − 3,200                                                                                     |
| Assistant reply (output)         | —           | **~3,200**  | *Estimated* from long governance review (inconsistencies, missing cross-refs, gaps, summary table, "what's consistent") |
| **Total**                        | —           | **36,200**  | 9,468 + 23,532 + 3,200                                                                                                  |


So for T3 Cursor normal, a reasonable **inferred split** is: **input ~33,000 tokens** (9,468 from files+prompt + ~23,532 system/other), **output ~3,200 tokens**. Paste the actual T3 reply to replace 3,200 with char÷4.

### Logged /heavy in Cursor (for reference)


| Test   | Context used (Cursor UI)            | Interpretation               | Notes                                                                                                                                                                                                                                                                                                           |
| ------ | ----------------------------------- | ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **T1** | **9.5%** context window (Auto Mode) | If 200k → **~19,000 tokens** | **True PTC:** run_heavy_analysis_ptc called; scope README.md. Claude-PTC **~3,798 tokens** (Feb 25 06:12 UTC). Summary returned to Cursor.                                                                                                                                                                      |
| **T2** | **9.0%** context window (Auto Mode) | If 200k → **~18,000 tokens** | **True PTC:** scope 4 files (requirements/planning READMEs, execute-micro-task, strategy-mapping). Claude-PTC **~26,894 tokens** (Feb 25 06:18 UTC). In-reply "PTC usage" showed ~174 input / ~870 output (see note below on discrepancy).                                                                      |
| **T3** | **9.2%** context window (Auto Mode) | If 200k → **~18,400 tokens** | **True PTC:** scope .cursor/commands/, .cursor/rules/, execute-micro-task.md, Effective_Execution_Manifesto.md. Claude-PTC dashboard **76,411 + 29,307** tokens (Feb 25 06:27–06:28 UTC). In-reply _usage: 285 input / 2424 output / 88487 cache_read / 14522 cache_create; est_cost_usd 0.107; latency ~72.8s. |


**T1 /heavy (true PTC) output:** Project summary (LTC Effective Execution Engine, AI-first enablement-building); what it does (90/10 rule, 2-state engine, Strategy & planning + Micro-execution, reduces "building in isolation"); who it's for (solo founders, avoid heavy SDLC, AI-guided hypothesis-driven); core idea (Approach 2, no code until needs defined, custom commands). Scored below.

**T2 /heavy (true PTC) output:** Execution Matrix Analysis (PTC summary): task flow & status lifecycle (5 states, agent HARD STOPS, user gate, iteration gate); A.C. ID traceability (Requirements Phase 3 → Tables A & B → Execution Matrix); risk-based iteration sequencing (Concept, Working Prototype, MVE, Leadership); validation gates & evidence. In-reply line: "PTC usage: ~174 input / ~870 output tokens; latency ~24.7s." Scored below.

**T3 /heavy (true PTC) output:** Heavy analysis result (PTC): review scope .cursor/commands/, .cursor/rules/, execute-micro-task.md, Effective_Execution_Manifesto.md. **6 critical issues:** task status flow conflicts, planning document path logic conflicts, approval phrase inconsistencies, multi-feature workspace handling incomplete, error recovery under-specified, Resource Impact not enforced in execution. **3 governance gaps:** cross-references between commands missing/weak, multi-feature workspace rules not fully specified, approval phrase not standardized. **6 recommended priority fixes:** standardize document path resolution, unify approval phrase, add explicit cross-references, define multi-feature workspace governance, enforce Resource Impact in execution, specify error recovery. Next steps: draft edits to command/rule files; add "Governance consistency" to Manifesto. Scored below.

**Why "PTC usage" in Cursor (e.g. ~174 input / ~870 output) differs from Claude API dashboard (e.g. ~26,894):** The line in the reply shows **message-level** tokens from the API response: `input_tokens` (new input in this request) and `output_tokens` (the summary). The **dashboard** typically shows **total tokens consumed**, which includes **prompt cache creation** (`cache_creation_input_tokens`): the first time a request runs, the API writes the (large) prompt to cache (e.g. ~25k tokens); that write is counted on the dashboard but often not in the short "input/output" summary. So: 174 + 870 ≈ 1,044 (message); 26,894 ≈ 1,044 + ~25,850 (cache creation). The full `_usage` block in the reply includes `cache_read` and `cache_create`; the abbreviated "PTC usage" line usually shows only input/output. For cost, cache_create and input/output are all billed (at different rates); for "what Cursor shows," only input/output are shown in that line.

### Per-test comparison


| Test | Dimension                  | Cursor normal                                                                 | /heavy PTC                                                                                                       |
| ---- | -------------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| T1   | Tokens in context (approx) | ~20,200 (10.1% of 200k; 2 files read)                                         | ~~330 (PTC summary from Run 1); *full turn:* **9.5%** → **~~19,000** (true PTC; Claude-PTC ~3,798 tokens)        |
| T1   | API cost                   | $0 (subscription)                                                             | $0.015 (from _usage)                                                                                             |
| T1   | Completeness (1–5)         | **5** (addressed “what it does” + “who it’s for” from README + Manifesto)     | **5** (what it does + who it's for + core idea; 2-state, 90/10, Approach 2, commands)                            |
| T1   | Accuracy (1–5)             | **5** (aligned with README + Manifesto)                                       | **5** (aligned with README; LTC, 2-state engine, solo founders)                                                  |
| T1   | Actionability (1–5)        | **4** (clear picture of project and audience)                                 | **4** (clear who it's for and what it does; can decide if it fits)                                               |
| T1   | Conciseness (1–5)          | **5** (concise, scannable)                                                    | **5** (structured bullets, no fluff)                                                                             |
| T2   | Tokens in context (approx) | ~29,600 (14.8% of 200k; 4 files read)                                         | ~~940 (PTC summary from Run 1); *full turn:* **9.0%** → **~~18,000** (true PTC; Claude-PTC ~26,894 on dashboard) |
| T2   | API cost                   | $0 (subscription)                                                             | $0.036                                                                                                           |
| T2   | Completeness (1–5)         | **5** (task flow, status lifecycle, A.C. trace—all three)                     | **5** (task flow, status lifecycle, A.C. trace; 5 states, Tables A/B, 4 iterations, validation gates)            |
| T2   | Accuracy (1–5)             | **5** (matched planning/requirements/skills docs)                             | **5** (aligned with planning/requirements/skills; grammar A.C. IDs, evidence)                                    |
| T2   | Actionability (1–5)        | **4** (clear structure; next steps inferrable)                                | **4** (clear flow; can follow task lifecycle and trace A.C.)                                                     |
| T2   | Conciseness (1–5)          | **5** (structured, scannable)                                                 | **5** (structured sections, no fluff)                                                                            |
| T3   | Tokens in context (approx) | ~36,200 (18.1% of 200k; 15 files read)                                        | ~2,150 (PTC summary from Run 1); *full turn:* **9.2%** → **~18,400** (true PTC; Claude-PTC 76,411 + 29,307 on dashboard)                              |
| T3   | API cost                   | $0 (subscription)                                                             | $0.083 (Run 1); T3 /heavy _usage est_cost_usd ~0.107                                                             |
| T3   | Completeness (1–5)         | **5** (inconsistencies, cross-refs, gaps, summary table, “what’s consistent”) | **5** (6 critical issues, 3 governance gaps; inconsistencies, cross-refs, gaps all addressed)                     |
| T3   | Accuracy (1–5)             | **5** (specific refs to commands/rules/skills)                                | **5** (specific refs to commands, rules, execute-micro-task, Manifesto; concrete issues)                          |
| T3   | Actionability (1–5)        | **5** (concrete recommendations and table)                                    | **5** (6 recommended priority fixes with clear next steps; draft edits, Manifesto section)                          |
| T3   | Conciseness (1–5)          | **5** (structured, summary table)                                             | **5** (structured: critical issues, gaps, fixes; scannable)                                                       |


### How to fill “Cursor normal”

I can’t run Cursor or read its token counters from here. You do the **Cursor normal** side in Cursor and record the data as below, then copy it into the comparison table.

---

### How to record data when running Cursor manually

**1. Where Cursor may show token/usage**

- **Cursor Settings → Account / Usage:** Some plans show usage or token counts per day or per chat.
- **Composer/Chat UI:** After a reply, some versions show a small “token” or “context” indicator; check the bottom or the header of the assistant message.
- If you don’t see numbers, use the **estimation** below.

**2. For each test (T1, then T2, then T3), do this:**


| Step | What to do                                                                                                                                                                    |
| ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| A    | Open a **new** Cursor chat (so context is clean).                                                                                                                             |
| B    | Paste the **exact prompt** for that test (from the “Test prompts” table above).                                                                                               |
| C    | Let Cursor run (it will read files and reply). Don’t use `/heavy`.                                                                                                            |
| D    | **Record:** In the thread, see which files Cursor opened (click or hover on “read file” links if shown). Count files and note total size if you can (e.g. “3 files, ~12 KB”). |
| E    | **Estimate tokens:** Total chars ≈ total KB × 1000. Tokens ≈ chars ÷ 4. So “~~12 KB” → ~3,000 tokens. Write: `~~3,000 (3 files read)`.                                        |
| F    | **Optional:** If Cursor showed input/output token counts, use those instead and note the source (e.g. “Settings → Usage”).                                                    |
| G    | Score the **Cursor** reply 1–5 for Completeness, Accuracy, Actionability, Conciseness.                                                                                        |
| H    | In a **new** turn (or new chat), run **/heavy** with the same prompt and scope; copy `_usage` from the reply. Score the **/heavy** reply 1–5 on the same four criteria.       |


**3. Scratch pad (copy this, fill as you go, then transfer to the table)**

```
T1 - Cursor normal:  ~_____ tokens (_____ files).  Completeness __  Accuracy __  Actionability __  Conciseness __
T2 - Cursor normal:  ~_____ tokens (_____ files).  Completeness __  Accuracy __  Actionability __  Conciseness __
T3 - Cursor normal:  ~_____ tokens (_____ files).  Completeness __  Accuracy __  Actionability __  Conciseness __
```

Paste this into a Cursor note or a text file. After each test, fill the line. Then copy the numbers into the “Cursor normal” column of the **Per-test comparison** table above.

**4. Rule of thumb**

- **~4 characters per token.** So: (total size in KB × 1000) ÷ 4 = rough tokens.
- Example: Cursor read README (~~3 KB) + 2 other small files (~~4 KB) → 7 KB → ~~1,750 tokens. Put `~~1,750 (3 files read)` in the table.

### Verdict

#### Scores summary

| Test | Cursor normal (C/A/Ac/Co) | /heavy PTC (C/A/Ac/Co) | Cursor context | /heavy Cursor context | Quality winner |
|------|---------------------------|------------------------|----------------|-----------------------|----------------|
| T1   | 5 / 5 / 4 / 5             | 5 / 5 / 4 / 5          | ~20,200 tokens (10.1%) | ~19,000 tokens (9.5%) | **Tie** |
| T2   | 5 / 5 / 4 / 5             | 5 / 5 / 4 / 5          | ~29,600 tokens (14.8%) | ~18,000 tokens (9.0%) | **Tie; /heavy saves ~11,600 context tokens** |
| T3   | 5 / 5 / 5 / 5             | 5 / 5 / 5 / 5          | ~36,200 tokens (18.1%) | ~18,400 tokens (9.2%) | **Tie; /heavy saves ~17,800 context tokens** |

*C = Completeness, A = Accuracy, Ac = Actionability, Co = Conciseness.*

#### T1 (Simple — “Summarize what this project does and who it’s for”)

Both paths scored identically (5/5/4/5). Cursor normal read 2 files directly; /heavy ran PTC with README.md scope. Context was nearly the same (10.1% vs 9.5%). /heavy adds ~$0.015 API cost and ~10s latency with no quality gain.

**Verdict: Use Cursor normal.** Zero benefit from /heavy on simple, single-file prompts.

#### T2 (Medium — “Analyse the Execution Matrix template”)

Both paths scored identically (5/5/4/5). /heavy covered the same 4 files via PTC and returned the same depth. Context: 14.8% (Cursor normal) vs 9.0% (/heavy) — **~40% less context** for identical quality.

**Verdict: /heavy preferred in long sessions.** Quality is equal; /heavy saves ~11,600 Cursor context tokens per turn. In a fresh short chat, the gain is marginal. In a long session, the saving compounds.

#### T3 (Complex — “Review commands/rules for inconsistencies and gaps”)

Both scored 5/5/5/5. /heavy returned a more structured output (numbered critical issues, gaps, priority fixes). Context: 18.1% (Cursor normal) vs 9.2% (/heavy) — **~49% less context**. API cost ~$0.107.

**Verdict: Use /heavy.** Largest context saving (~17,800 tokens), structured output, same quality. The only trade-off is the ~$0.10 API cost and ~72s latency.

#### Total cost: T1 + T2 + T3 (one full session, $60/month Cursor Pro+)

**Exact Claude API figures from usage.jsonl (T1–T3 /heavy runs in Cursor):**

| | T1 | T2 | T3 | **Total** |
|--|--|--|--|--|
| input_tokens | 3 | 174 | 285 | 462 |
| output_tokens | 305 | 870 | 2,424 | 3,599 |
| cache_create_tokens | 3,490 | 8,804 | 14,522 | 26,816 |
| cache_read_tokens | 0 | 17,046 | 88,487 | 105,533 |
| **Total API tokens (all types)** | **3,798** | **26,894** | **105,718** | **136,410** |
| **Est. API cost (USD)** | **$0.015** | **$0.045** | **$0.107** | **$0.167** |
| Latency | 9s | 25s | 73s | ~107s |

**Cursor context tokens consumed (full turn):**

| | Cursor normal | /heavy | Saved |
|--|--|--|--|
| T1 | ~20,200 | ~19,000 | ~1,200 |
| T2 | ~29,600 | ~18,000 | **~11,600** |
| T3 | ~36,200 | ~18,400 | **~17,800** |
| **Total** | **~86,000** | **~55,400** | **~30,600 (36% less)** |

**Dollar cost side-by-side:**

| Cost component | Cursor normal T1–T3 | /heavy T1–T3 |
|----------------|---------------------|--------------|
| Cursor Pro+ subscription (sunk) | $60/month | $60/month |
| Amortized per turn (assume 400 req/mo) | 3 × $0.15 = **$0.45** | 3 × $0.15 = **$0.45** (wrapper turns) |
| Claude API cost | **$0** | **$0.167** |
| **Total marginal cost for T1–T3** | **$0.00** | **$0.167** |
| Cursor context tokens used | ~86,000 | ~55,400 |

**The subscription amortization is the same for both paths** (you're still making 3 Cursor turns either way). The only real difference is the **$0.167 API cost** — that's what /heavy actually costs you beyond the subscription.

**Monthly projection (solo developer, $60/month):**

| Usage pattern | Extra API cost/month | % of subscription |
|---------------|---------------------|-------------------|
| 5 complex (/heavy T3-type) tasks | ~$0.54 | 0.9% |
| 10 complex tasks | ~$1.07 | 1.8% |
| 20 complex tasks | ~$2.14 | 3.6% |
| 5 medium + 5 complex tasks | ~$0.76 | 1.3% |

**Bottom line: /heavy adds $0.54–$2.14/month for typical heavy-use scenarios — that's under 4% on top of your $60 subscription.** The question is whether ~30,600 Cursor context tokens saved per T1–T3 session is worth it. At T3 complexity it is; at T1 it isn't.

#### The only marginal benefit of /heavy: context headroom

Output quality is the same. So the **only** reason to pay for /heavy is: **you want to use fewer Cursor context tokens so you can have more turns in the same chat before hitting the context limit.**

- If you **rarely hit** the 200k limit (short sessions, or you're fine starting a new chat) → **there is no marginal benefit.** Don't pay. Use Cursor normal.
- If you **often hit** the limit (long sessions, many files, and you need the whole thread in context) → /heavy saves ~30k tokens per T1–T3–style session; that's roughly one extra "heavy" turn of headroom. Then the $0.17/session might be worth it.

**If the output is the same, you should not pay extra for Claude PTC unless you actually need that headroom.** Default: use Cursor normal.

#### Overall decision rule

| Situation | Recommended path | Reason |
|-----------|-----------------|--------|
| Default (any prompt) | **Cursor normal** | Same quality, $0 extra, lower latency. No reason to pay. |
| You're hitting context limit in long sessions | **/heavy** (for that turn only) | Saves ~30k tokens; only then is there marginal benefit. |
| Code edits / State B execution | **Cursor normal** | /heavy is read-only; Cursor handles edits. |

---

### Should a non-technical solo developer use claude-ptc-mcp?

**Short answer: Only if you actually run out of context in long chats. Otherwise: no — same output, no marginal benefit; paying extra buys you nothing.**

**Why you usually shouldn't:**

1. **Same output.** We scored both paths identically. You get nothing better for the money.
2. **Extra cost for no gain.** Every /heavy call is $0.015–$0.107 on top of your subscription. Cursor normal gives you the same result for $0.
3. **More latency.** /heavy adds 10–70 seconds per call.
4. **Setup and debugging.** MCP, .env, server errors — friction you can avoid by not using it.

**The only marginal benefit:** Using fewer Cursor context tokens so the same chat can have more turns before Cursor hits the 200k limit. If you don't experience that as a problem, there is no benefit.

**When it's rational to use it:** You're in a long session, you've already used a lot of context, and you're about to ask a T3-style question (many files). Using /heavy for that one turn saves ~18k tokens and can delay hitting the limit. That's the only scenario where paying has a marginal benefit.

**Objective recommendation:**

> **Default: don't use /heavy.** Use Cursor normal for everything. Same quality, no extra cost. Only use /heavy if you repeatedly hit the context limit and need the headroom — then use it just for the heavy turn that would otherwise burn 15–35k tokens.

---

### Why T3 /heavy used far more Claude API tokens than T3 Cursor normal (inferred)

**T3 Cursor normal context:** ~36,200 tokens in Cursor’s context window (files + system + reply). Cursor uses its own model and context; the file content is loaded in-place.

**T3 /heavy Claude API dashboard:** 76,411 + 29,307 ≈ **~105,718 tokens**. From the `_usage` block:

| Token type | Value | What it means |
|------------|-------|---------------|
| `cache_read_input_tokens` | 88,487 | Full scope served from prompt cache (dominant cost) |
| `cache_creation_input_tokens` | 14,522 | Portion written to cache this call |
| `input_tokens` | 285 | New input (user prompt + tool wrapper) |
| `output_tokens` | 2,424 | The summary Claude generated |

Three reasons why the numbers are large:

1. **The PTC call sends full file content *plus* a large system prompt and tool definitions.** The server’s `CACHEABLE_SYSTEM_BLOCK` (the instruction set for Claude) is large. On first run it is written to cache (cache_create); on repeat runs it is read from cache (cache_read). Cache tokens are counted at full volume on the dashboard even though they cost ~10× less than regular input.

2. **Prompt caching inflates the dashboard number.** The 88,487 cache_read tokens appear huge but cost only ~$0.0265 (at $0.0003/1k). If you charged them at normal input rates they would be ~$0.27. The actual cost was ~$0.107 — most of it is the cheap cache_read.

3. **The two numbers measure different things.** Cursor context % measures *what’s in the Cursor conversation window* (capped at 200k). Claude API tokens measure *what the API model processed*, including the server’s system prompt and caching infrastructure. They are not directly comparable. Cursor normal’s ~36,200 is Cursor’s internal view; the Claude API’s ~105,718 is the full PTC server call including all overhead.