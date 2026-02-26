# Effective System Design Framework (Approach 2: Success = Efficient and Scalable management of failure risks)

The Prime Directive: Never propose a technical solution / user enablement (Noun) or write code until the causal reality of the User's system is fully mapped. Software is simply a tool to manipulate human workflows, drivers, and blockers.

---

## Glossary (Quick Reference)

| Term | Plain English |
| :--- | :--- |
| **UDO** (Ultimate Desired Outcome) | Goal — the outcome the user actually wants (life outcome, not a feature). |
| **UDS** (Ultimate Driving System) | What motivates the user (drivers pushing them toward the goal). |
| **UBS** (Ultimate Blocking System) | What's in the user's way (blockers stopping them from the goal). |
| **UDS.UD / UBS.UB** | Root *driver* of the driver / root *blocker* of the blocker (deepest "why"). |
| **UDS.UB / UBS.UD** | The root *blocker* of a driver / the root *driver* of a blocker — (deepest "why"). |
| **Verb** | The one core action the user takes to reach the UDO (e.g. "Track meals"). |
| **Adverb** | How the action should feel — effectiveness outcomes in 3 pillars: Sustainability, Efficiency, Scalability (e.g. "Securely", "Frugally", "Repeatedly"). |
| **Noun** | The tool/feature you build for the user to take the Verb (e.g. "Meal Logger"). |
| **Adjective** | Attributes of the Noun that enable the Adverbs (e.g. "Encrypted", "Lightweight", "Modular"). |
| **A.C.** (Acceptance Criteria) | A single, deterministic pass/fail test that proves a requirement is met. Identified by stable IDs (e.g. Verb-AC1, SustainAdv-AC2). |
| **MECE** | Mutually Exclusive, Collectively Exhaustive — no overlaps, no gaps. every item counted exactly once. |
| **Desirable Wrapper** | The hook that gets the user to *use* the tool — the attractive outer layer (UI, first impression). |
| **Effective Core** | The hidden mechanic that actually solves the root drivers/blockers — the real engine under the Wrapper. |
| **Principles** | General or scientific rules governing the drivers and blockers — the "why" behind the design. |
| **Environment** | Where the solution must live to be effective — Physical, Digital, or Cultural context. |
| **SOP** (Standard Operating Procedure) | The step-by-step action the user follows to leverage the Tools in the Environment. |
| **Holy Trinity** | The three canonical docs: Requirements, Design, Planning — the single source of truth. |
| **Iteration** | One phase of the 4-phase roadmap: 1 Concept → 2 Prototype → 3 MVE → 4 Leadership. |
| **Master Scope Mapping** | The table that assigns each A.C. to exactly one iteration — MECE, no gaps. |
| **Execution Matrix** | The task-level breakdown within each iteration — what gets built, in what order. |
| **User Gate** | The approval checkpoint: the agent stops and waits for the User to say "Approved" before proceeding. |

---

When executing the "Understanding Requirements" phase, you must sequentially complete the following three phases:

Phase 1: Problem Discovery (The System Map)
Goal: Understand the human reality before introducing technology.

Ultimate Desired Outcome (UDO): The fundamental, non-technical state the user is trying to achieve (e.g., "Effortless weight management", not "A calorie counting app").

User's Action: The action that the User is trying to take to reach that UDO

The Drivers (UDS - Ultimate Driving System): The conscious system of forces pushing the user toward the UDO.

UDS.UD (Driver of the Driver): The root driver that ultimately causes the UDS to succeed (it could be internal (biological/psychological if the user is human, or external))

UDS.UB (Blocker of the Driver): The root blocker that ultimately makes this driver fail (it could be internal (biological/psychological if the user is human, or external forces)).

The Blockers (UBS - Ultimate Blocking System): The conscious system of forces stopping the User from reaching the UDO.

UBS.UD (Driver of the Blocker): What ultimately causes the UBS to succeed in blocking the User? (it could be internal to the User or external to them).

UBS.UB (Blocker of the Blocker): What ultimately blocks the UBS from affecting the User? (it could be internal to the User or external to them).

Since each of the above is a system in itself (General System = User + Action + Action Desired Outcome + UBS + UDS + Principles + Environment + Tools + SOP), we must further understand the below

Phase 2: The System Design (The Context & Bridge)
Goal: Define the conceptual solution space based ONLY on what we understand about the User in Phase 1.

Principles (Why): What general, scientific Principles that each driver (UDS.UD / UBS.UB) is governed by? And what general, scientific Principles that each of the Blockers (UBS.UD / UDS.UB) is governed by? (One Principle for each)

Environment (Where): Based strictly on the Principles above, where MUST the solution / enablement live to be most effective, that amplifies the Drivers and disable the Blockers? (Physical, Digital or Cultural environments).

Tools (What): The conceptual mechanism of Tools that is based strictly on the Principles and Environment above. Tools must be Physical, Digital and Cultural to fit in the Environment.

Desirable Wrapper: The hook that gets them to use it.

Effective Core: The hidden mechanic that actually solves the root drivers and/or root blockers

SOP (How): The step-by-step action by the User that leverages the Tools and the Environment with strict respect to the Principles that promise highest confidence level in reaching their Ultimate Desired Outcome

Phase 3: The Formalization (The Output)
Goal: Translate the System Design into strict, deterministic engineering requirements.

1. USER(S): [Define detailed User Persona and Anti-Persona (Who is not the User)]
* **Primary User Persona:** [Detailed description]
* **Anti-Persona:** [Who is explicitly NOT the user]    

2. DESIRED USER ACTION(S): All Acceptance Criteria must be as MECE as possible

Verb: [The core action to achieve the UDO]

Acceptance Criteria 1: [Measurement of Acceptance for the Verb]
Acceptance Criteria 2: [Measurement of Acceptance for the Verb]
Acceptance Criteria N: [Measurement of Acceptance for the Verb]

Adverbs (The Effectiveness Outcomes - What the UDO comprises of):

Sustainability Adverb: [Risk/Safety outcomes, e.g., "Correctly", "Securely", "Deterministically"]

Acceptance Criteria 1: [Measurement of Acceptance for the Sustainability Adverb]
Acceptance Criteria 2: [Measurement of Acceptance for the Sustainability Adverb]
Acceptance Criteria N: [Measurement of Acceptance for the Sustainability Adverb]

Efficiency Adverb: [Speed/Utility outcomes, e.g., "Incrementally" "Frugally", "Surgically"]

Acceptance Criteria 1: [Measurement of Acceptance for the Efficiency Adverb]
Acceptance Criteria 2: [Measurement of Acceptance for the Efficiency Adverb]
Acceptance Criteria N: [Measurement of Acceptance for the Efficiency Adverb]

Scalability Adverb: [Growth outcomes, e.g., "Repeatedly", "Comparatively"]

Acceptance Criteria 1: [Measurement of Acceptance for the Efficiency Adverb]
Acceptance Criteria 2: [Measurement of Acceptance for the Efficiency Adverb]
Acceptance Criteria N: [Measurement of Acceptance for the Efficiency Adverb]

3. FEATURE:

Noun: [The specific Tool built for the User to execute the Verb in the prescribed Environment respecting the Principles]

Acceptance Criteria 1: [Measurement of Acceptance for the Noun]
Acceptance Criteria 2: [Measurement of Acceptance for the Noun]
Acceptance Criteria N: [Measurement of Acceptance for the Noun]

Adjectives The attributes of the Noun (Features) that best enable the Users to take Action reaching the above Effectiveness Outcomes (Adverb)

Sustainability Adjective: [e.g., "Encrypted", "Offline-first"]

Acceptance Criteria 1: [Measurement of Acceptance for the Sustainability Adjective]
Acceptance Criteria 2: [Measurement of Acceptance for the Sustainability Adjective]
Acceptance Criteria N: [Measurement of Acceptance for the Sustainability Adjective]

Efficiency Adjective: [e.g., "Automated", "Lightweight"]

Acceptance Criteria 1: [Measurement of Acceptance for the Efficiency Adjective]
Acceptance Criteria 2: [Measurement of Acceptance for the Efficiency Adjective]
Acceptance Criteria N: [Measurement of Acceptance for the Efficiency Adjective]

Scalability Adjective: [e.g., "Modular", "API-driven"]

Acceptance Criteria 1: [Measurement of Acceptance for the Scalability Adjective]
Acceptance Criteria 2: [Measurement of Acceptance for the Scalability Adjective]
Acceptance Criteria N: [Measurement of Acceptance for the Scalability Adjective]
