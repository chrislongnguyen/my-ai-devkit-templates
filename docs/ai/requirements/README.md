---
phase: requirements
title: Effective Requirements & User's System Map
description: The causal mapping of the User's reality and the deterministic constraints for the solution.
---

# PHASE 1: PROBLEM DISCOVERY (The User's System Map)
*Goal: Understand the human reality before introducing technology.*

* **User Persona & Anti-Persona:** [Who is the User of this System and who is NOT the User]
* **Ultimate Desired Outcome (UDO):** [The fundamental, non-technical state / outcome the User is trying to achieve]
* **User's Action:** [The action the User is trying to take to reach that UDO]

## The Drivers (UDS - Ultimate Driving System)
* **UDS:** [The conscious system of forces pushing the user toward the UDO]
* **UDS.UD (Driver of the Driver):** [The root driver that ultimately causes the UDS to succeed]
* **UDS.UB (Blocker of the Driver):** [The root blocker that ultimately makes this driver fail]

## The Blockers (UBS - Ultimate Blocking System)
* **UBS:** [The conscious system of forces stopping the User from reaching the UDO]
* **UBS.UD (Driver of the Blocker):** [What ultimately causes the UBS to succeed in blocking the User]
* **UBS.UB (Blocker of the Blocker):** [What ultimately prevents the UBS from blocking the User]

---

# PHASE 2: THE SYSTEM DESIGN (Context & Bridge)
*Goal: Define the conceptual solution space based ONLY on what we understand about the User in Phase 1.*

* **Principles (Why):** [The general, scientific Principles governing each of the Drivers (UDS, UDS.UD, UBS.UB) and each of the Blockers (UBS, UBS.UD, UDS.UB)]
* **Environment (Where):** [The Physical, Digital, or Cultural environment where the solution / enablement must live]
* **Tools (What):** 
  * *Desirable Wrapper:* [The hook that gets the User to use it]
  * *Effective Core:* [The hidden mechanic that actually solves the root drivers/blockers of the User]
* **SOP (How):** [The step-by-step action by the User leveraging the Tools and Environment that has the highest confidence level in reaching the UDO]

---
# Phase 3: THE FORMALIZATION (The Output)
Goal: Translate the System Design into strict, deterministic engineering requirements.

**A.C. ID naming convention (use across Requirements, Design, and Planning):** Short, stable IDs so Planning can reference exactly one A.C. per row. Format: `{Grammar}-AC{n}`. Grammar prefixes: **Verb**, **SustainAdv**, **EffAdv**, **ScalAdv**, **Noun**, **SustainAdj**, **EffAdj**, **ScalAdj**. Examples: `Verb-AC1`, `SustainAdv-AC1`, `EffAdj-AC2`. Number A.C. per block (1, 2, … N). Do not rename once used in Planning.

---

1. USER(S): [Define detailed User Persona and Anti-Persona (Who is not the User)]
* **Primary User Persona:** [Detailed description]
* **Anti-Persona:** [Who is explicitly NOT the user]    

2. DESIRED USER ACTION(S): All Acceptance Criteria must be as MECE as possible

Verb: [The core action to achieve the UDO]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Verb-AC1 | [Measurement of Acceptance for the Verb] |
| Verb-AC2 | [Measurement of Acceptance for the Verb] |
| Verb-ACN | [Measurement of Acceptance for the Verb] |

Adverbs (The Effectiveness Outcomes - What the UDO comprises of):

Sustainability Adverb: [Risk/Safety outcomes, e.g., "Correctly", "Securely", "Deterministically"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdv-AC1 | [Measurement of Acceptance for the Sustainability Adverb] |
| SustainAdv-AC2 | [Measurement of Acceptance for the Sustainability Adverb] |
| SustainAdv-ACN | [Measurement of Acceptance for the Sustainability Adverb] |

Efficiency Adverb: [Speed/Utility outcomes, e.g., "Incrementally" "Frugally", "Surgically"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdv-AC1 | [Measurement of Acceptance for the Efficiency Adverb] |
| EffAdv-AC2 | [Measurement of Acceptance for the Efficiency Adverb] |
| EffAdv-ACN | [Measurement of Acceptance for the Efficiency Adverb] |

Scalability Adverb: [Growth outcomes, e.g., "Repeatedly", "Comparatively"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdv-AC1 | [Measurement of Acceptance for the Scalability Adverb] |
| ScalAdv-AC2 | [Measurement of Acceptance for the Scalability Adverb] |
| ScalAdv-ACN | [Measurement of Acceptance for the Scalability Adverb] |

3. FEATURE:

Noun: [The specific Tool built for the User to execute the Verb in the prescribed Environment respecting the Principles]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Noun-AC1 | [Measurement of Acceptance for the Noun] |
| Noun-AC2 | [Measurement of Acceptance for the Noun] |
| Noun-ACN | [Measurement of Acceptance for the Noun] |

Adjectives The attributes of the Noun (Features) that best enable the Users to take Action reaching the above Effectiveness Outcomes (Adverb)

Sustainability Adjective: [e.g., "Encrypted", "Offline-first"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdj-AC1 | [Measurement of Acceptance for the Sustainability Adjective] |
| SustainAdj-AC2 | [Measurement of Acceptance for the Sustainability Adjective] |
| SustainAdj-ACN | [Measurement of Acceptance for the Sustainability Adjective] |

Efficiency Adjective: [e.g., "Automated", "Lightweight"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdj-AC1 | [Measurement of Acceptance for the Efficiency Adjective] |
| EffAdj-AC2 | [Measurement of Acceptance for the Efficiency Adjective] |
| EffAdj-ACN | [Measurement of Acceptance for the Efficiency Adjective] |

Scalability Adjective: [e.g., "Modular", "API-driven"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdj-AC1 | [Measurement of Acceptance for the Scalability Adjective] |
| ScalAdj-AC2 | [Measurement of Acceptance for the Scalability Adjective] |
| ScalAdj-ACN | [Measurement of Acceptance for the Scalability Adjective] |

---