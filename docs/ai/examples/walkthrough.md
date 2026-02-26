# Worked Example: Personal Habit Tracker

> This walkthrough shows a complete flow from `/state-a` through the first `/state-b` task. Use it as a reference for what "doing it right" looks like. All outputs below are illustrative — your enablement will have different content.

---

## 1. Run `/state-a` — The AI asks for the feature name

**You type:** `/state-a`

**Agent responds:**
> *"What is the name of the project or feature you are building?"*

**You type:** `habit-tracker`

The agent now uses `habit-tracker` as the feature name. All docs will be written to `feature-habit-tracker.md`.

---

## 2. Sub-Step 1: The Causal Map

The agent searches `@ai-devkit/memory` (finds nothing relevant) and then asks:

> *"To map the causal reality, I need to understand the User. A few questions:*
> 1. *Who is the person trying to build habits, and what does their daily routine look like?*
> 2. *What has stopped them from sticking to habits in the past?*
> 3. *What does success look like for them — not a feature, but a life outcome?"*

**You answer:**
> "It's for me. I forget to do small daily habits (exercise, journaling). I start strong but lose motivation after a week. Success = I do my 3 core habits every day for 30 days without thinking about it."

**Agent presents the Causal Map:**

> - **UDO:** Effortless daily habit execution (3 core habits, 30+ consecutive days)
> - **User's Action:** Perform and record daily habits
> - **UDS (Driver):** Desire for self-improvement and health
>   - UDS.UD: Visible streak creates psychological momentum (endowed progress effect)
>   - UDS.UB: Decision fatigue erodes willpower by evening
> - **UBS (Blocker):** Forgetting + loss of motivation after initial enthusiasm
>   - UBS.UD: No external accountability; habits are invisible to others
>   - UBS.UB: A timely reminder at the right moment could interrupt the forgetting loop
>
> *🛑 "Does this accurately map the causal reality?"*

**You type:** `Approved`

---

## 3. Sub-Step 2: The System Design

> - **Principles:** Endowed Progress Effect (visible streaks); Implementation Intentions (time-bound cues reduce decision fatigue); Social Accountability (even minimal)
> - **Environment:** Digital (mobile-first — always in pocket at habit time)
> - **Tools:**
>   - *Desirable Wrapper:* Streak counter with visual calendar — the hook that makes checking in feel rewarding
>   - *Effective Core:* Time-based smart reminders + streak-break alerts that interrupt the forgetting loop at the exact moment the UBS activates
> - **SOP:** (1) Open app at reminder time → (2) Tap to confirm habit done → (3) See streak update → (4) Receive next reminder or end-of-day summary
>
> *🛑 "Do you approve this System Design?"*

**You type:** `Approved`

---

## 4. Sub-Step 3: User's Requirements (Phase 3)

The agent produces the Execution Grammar with A.C. IDs:

> **Verb:** Record daily habit completion
>
> | A.C. ID | Acceptance Criteria |
> | :--- | :--- |
> | Verb-AC1 | User can mark each of 3 habits as "done" for today in ≤2 taps |
> | Verb-AC2 | System records the completion with date-time stamp |
>
> **Sustainability Adverb:** Consistently (streak never lost to system error)
>
> | A.C. ID | Acceptance Criteria |
> | :--- | :--- |
> | SustainAdv-AC1 | Data persists across app restarts and device changes |
> | SustainAdv-AC2 | Streak count is mathematically correct (no off-by-one) |
>
> **Noun:** Habit Tracker App
>
> | A.C. ID | Acceptance Criteria |
> | :--- | :--- |
> | Noun-AC1 | App loads in <2 seconds on mobile |
> | Noun-AC2 | Visual calendar shows streak with colour-coded days |
>
> *(…more A.C. for Efficiency and Scalability adverbs/adjectives…)*
>
> *🛑 "Do you approve this User's Requirements?"*

**You type:** `Approved`

---

## 5. Sub-Step 4: The 4-Iteration Roadmap

The agent populates the Master Scope Mapping and Execution Matrix:

> **Master Scope Mapping (Table A):**
>
> | Iteration | A.C. IDs |
> | :--- | :--- |
> | 1 (Concept) | Verb-AC1, Verb-AC2, Noun-AC2 |
> | 2 (Prototype) | SustainAdv-AC1, SustainAdv-AC2, Noun-AC1 |
> | 3 (MVE) | EffAdv-AC1, EffAdj-AC1 |
> | 4 (Leadership) | ScalAdv-AC1, ScalAdj-AC1 |
>
> **Iteration 1 Tasks:**
>
> | Task | Title | Active A.C. | Status |
> | :--- | :--- | :--- | :--- |
> | T-101 | Create habit list UI with tap-to-complete | Verb-AC1 | 🔴 To Do |
> | T-102 | Store completion with timestamp | Verb-AC2 | 🔴 To Do |
> | T-103 | Visual streak calendar | Noun-AC2 | 🔴 To Do |
>
> *🛑 "Do you approve this Roadmap?"*

**You type:** `Approved`

**Agent writes** `docs/ai/requirements/feature-habit-tracker.md`, `docs/ai/design/feature-habit-tracker.md`, and `docs/ai/planning/feature-habit-tracker.md`. State A is complete.

> *"You can now run /state-b to execute the first 🔴 To Do task (T-101)."*

---

## 6. Run `/state-b` — Execute the first task

**You type:** `/state-b`

The agent determines the active feature (`habit-tracker`), reads the planning doc, picks T-101.

**Agent builds T-101** (creates the habit list UI), then outputs:

> **[T-101] Execution Complete**
> - **The Action:** Created `src/components/HabitList.tsx` with 3 hardcoded habits and tap-to-complete toggle.
> - **The Evidence of Truth:**
>   - `src/components/HabitList.tsx` — renders 3 habit rows, each toggleable in 1 tap (2 taps from app open = Verb-AC1).
>   - Screenshot: habit list renders with checkmarks.
>
> **🛑 WAITING FOR FOUNDER APPROVAL**
> *Reply "Approved" to mark T-101 🟢 Reviewed/Tested, or provide feedback.*

**You type:** `Approved`

The agent marks T-101 as 🟢, updates Table B for Verb-AC1. Next `/state-b` will pick T-102.

---

## Key Takeaways

- **You never write code yourself.** The AI does. You approve or give feedback.
- **Every sub-step waits for "Approved."** You are always in control.
- **One task at a time.** The agent never runs ahead.
- **If confused, run `/help`** to see all commands, or open the [Glossary](../frameworks/effective-system-design.md).
