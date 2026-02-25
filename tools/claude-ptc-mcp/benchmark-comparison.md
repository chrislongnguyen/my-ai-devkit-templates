# PTC Benchmark: Run 1 vs Run 2 Comparison

Two full runs of the 3-test benchmark (T1 Simple, T2 Medium, T3 Complex). Same prompts and scope each time.

**What Run 1 and Run 2 measure:** The benchmark runs **outside Cursor** (PTC server → Claude API only). We measure input/output tokens to Claude, cost, and latency. We do **not** measure Cursor’s context or any Cursor-generated output. For a **complete comparison** with the manual Cursor-normal runs (T1–T3), run /heavy **inside Cursor** (Step 2 of [test-protocol.md](test-protocol.md)) and record Cursor’s context % for that turn (“full journey”); then you have apples-to-apples: tokens in Cursor’s context for one turn, for both paths.

## Per-test comparison

| Test | Metric | Run 1 | Run 2 |
|------|--------|-------|-------|
| **T1** (Simple) | Input tokens | 3 | 3 |
| | Output tokens | 327 | 305 |
| | Cache create | 3,490 | 0 |
| | Cache read | 0 | 3,490 |
| | Est. cost | $0.0154 | $0.0056 |
| | Latency | 9,551 ms | 9,416 ms |
| **T2** (Medium) | Input tokens | 187 | 190 |
| | Output tokens | 936 | 1,429 |
| | Cache create | 5,849 | 7,145 |
| | Cache read | 11,160 | 33,815 |
| | Est. cost | $0.0355 | $0.0536 |
| | Latency | 24,164 ms | 47,534 ms |
| **T3** (Complex) | Input tokens | 20 | 21 |
| | Output tokens | 2,152 | 1,703 |
| | Cache create | 13,048 | 2,226 |
| | Cache read | 40,012 | 48,790 |
| | Est. cost | $0.0835 | $0.0469 |
| | Latency | 55,345 ms | 54,838 ms |

## Totals

| | Run 1 | Run 2 |
|---|-------|-------|
| **Total input tokens** | 210 | 214 |
| **Total output tokens** | 3,415 | 3,437 |
| **Total est. cost** | **$0.134** | **$0.106** |
| **Total latency** | ~89 s | ~112 s |

## Takeaways

- **Run 2 was cheaper** overall ($0.106 vs $0.134) because T1 and T3 hit cache read (Run 1 had already warmed the cache).
- **Output length varied** (e.g. T2: 936 vs 1,429 output tokens) — same prompt, different response length.
- **Cache read dominates** after the first run: Run 2’s T1 had 0 cache create and 3,490 cache read (reused Run 1’s cache).
- Use this table alongside [test-protocol.md](test-protocol.md) when you compare **Cursor normal** vs **/heavy** for the same 3 prompts (quality scores and context impact).

---

## Cursor normal vs /heavy (T1 logged)

One T1 run was done in **Cursor normal** (Auto Mode, new chat, no /heavy). Result:

| Path | Tokens in context (approx) | Files read | API cost |
|------|----------------------------|------------|----------|
| **Cursor normal** | **~20,200** (10.1% of 200k context) | 2 (README.md, Effective_Execution_Manifesto.md) | $0 (subscription) |
| **/heavy PTC** (Run 1) | **~330** (summary only) | same scope, read server-side | $0.015 (Claude API) |

**T1 context comparison:** Cursor normal used ~20,200 tokens in the chat context; /heavy returned only ~330 tokens to the chat. That’s about **61× fewer tokens in Cursor’s context** for the same prompt and scope — the 80–90%+ context reduction is on the Cursor side. (Claude API still saw the full scope; only the summary came back to the IDE.)

**T1 /heavy in Cursor (full turn):** One run with `/heavy` in Cursor (true PTC): **9.5%** → **~19,000 tokens** in Cursor context. Claude-PTC **~3,798 tokens** (Feb 25 06:12 UTC). Cursor normal (10.1%) vs /heavy (9.5%) is comparable; /heavy keeps Cursor context lower by not loading files into the IDE.

---

## Cursor normal vs /heavy (T2 logged)

One T2 run was done in **Cursor normal** (Auto Mode, new chat, no /heavy). Result:

| Path | Tokens in context (approx) | Files read | API cost |
|------|----------------------------|------------|----------|
| **Cursor normal** | **~29,600** (14.8% of 200k context) | 4 (docs/ai/planning/README.md, docs/ai/requirements/README.md, execute-micro-task.md, strategy-mapping.md) | $0 (subscription) |
| **/heavy PTC** (Run 1) | **~940** (summary only) | same scope, read server-side | $0.036 (Claude API) |

**T2 context comparison:** Cursor normal used ~29,600 tokens in the chat context; /heavy returned only ~940 tokens to the chat. That’s about **31× fewer tokens in Cursor’s context** for the same prompt — again, the big reduction is on the Cursor side. (Claude API still saw the full scope; only the summary came back to the IDE.)

**T2 /heavy in Cursor (full turn):** One run with `/heavy` in Cursor (true PTC): **9.0%** → **~18,000 tokens** in Cursor context. Claude-PTC dashboard **~26,894 tokens** (Feb 25 06:18 UTC). In-reply "PTC usage" showed ~174 input / ~870 output (message-level); dashboard total includes cache creation — see test-protocol.md "Why PTC usage vs dashboard differs."

---

## Cursor normal vs /heavy (T3 logged)

One T3 run was done in **Cursor normal** (Auto Mode, new chat, no /heavy). Result:

| Path | Tokens in context (approx) | Files read | API cost |
|------|----------------------------|------------|----------|
| **Cursor normal** | **~36,200** (18.1% of 200k context) | 15 (10 commands, 3 rules, execute-micro-task.md, Effective_Execution_Manifesto.md) | $0 (subscription) |
| **/heavy PTC** (Run 1) | **~2,150** (summary only) | same scope, read server-side | $0.083 (Claude API) |

**T3 context comparison:** Cursor normal used ~36,200 tokens in the chat context; /heavy returned only ~2,150 tokens to the chat. That's about **17× fewer tokens in Cursor's context** for the same prompt — the reduction is largest in absolute terms for this complex review. (Claude API still saw the full scope; only the summary came back to the IDE.)

**T3 /heavy in Cursor (full turn):** One run with `/heavy` in Cursor (true PTC): **9.2%** → **~18,400 tokens** in Cursor context. Claude-PTC dashboard **76,411 + 29,307** tokens (Feb 25 06:27–06:28 UTC). In-reply _usage: 285 input / 2424 output / 88487 cache_read / 14522 cache_create; est_cost_usd ~0.107; latency ~72.8s.
