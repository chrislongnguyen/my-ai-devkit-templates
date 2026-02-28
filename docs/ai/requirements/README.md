---
phase: requirements
title: Effective Requirements & User's System Map
esd_reference: docs/ai/frameworks/effective-system-design.md
note: This template captures Phases 1–3 output — with focus on Phase 3 User's Requirements. For methodology, see ESD reference.
---

# User's Requirements — ESD Phases 1–3 Output

> **ESD Phases:** `Problem Discovery (Phase 1) → System Design (Phase 2) → User's Requirements (Phase 3)`
> 
> This document captures the **output** of ESD. For the **methodology** (how to fill these sections), reference `docs/ai/frameworks/effective-system-design.md` §1–3.

---

## Quick Reference: Key ESD Concepts

| Term | Definition | Recursive Notation |
| :--- | :--- | :--- |
| **UDO** | Ultimate Desired Outcome — the non-technical state the User seeks | — |
| **UDS** | Ultimate Driving System — forces pushing User toward UDO | `UDS.UD` (driver of driver), `UDS.UB` (blocker of driver) |
| **UBS** | Ultimate Blocking System — forces stopping User from reaching UDO | `UBS.UD` (driver of blocker), `UBS.UB` (blocker of blocker) |
| **EPS** | Effective Principles of the System — what makes the system work | Labeled `P[n](S)`, `P[n](E)`, `P[n](Sc)` |
| **UES** | Ultimate Enabling System — environment + tools that enable EPS | 3 layers: Foundational / Operational / Enhancement |
| **EOP** | Effective Operating Procedure — step-by-step user actions | Per step: Responsible, Accountable, Consulted, Informed |

*For full definitions and examples, see ESD §1.3 (ELF Layers).*

---

# PHASE 1: PROBLEM DISCOVERY (The User's System Map)
*ESD §1.3: Reconstruct the User's system from ELF output. Who is the User? What blocks them? What drives them?*

**Source:** UDO, User Roles, UBS, UDS from ELF Learning Book

* **User Persona & Anti-Persona:** [Who is the User of this System and who is NOT the User]
* **Ultimate Desired Outcome (UDO):** [The fundamental, non-technical state / outcome the User is trying to achieve]
* **User's Action:** [The action the User is trying to take to reach that UDO]

## The Drivers (UDS — Ultimate Driving System)
*ESD: Recursive analysis of what helps the User succeed*

* **UDS:** [The conscious system of forces pushing the user toward the UDO]
* **UDS.UD (Driver of the Driver):** [The root driver that ultimately causes the UDS to succeed — `UDS.UD.UD` for deeper recursion]
* **UDS.UB (Blocker of the Driver):** [The root blocker that ultimately makes this driver fail — what stops the UDS from working]

## The Blockers (UBS — Ultimate Blocking System)
*ESD: Recursive analysis of what stops the User — disabled via `UBS.UB` elements*

* **UBS:** [The conscious system of forces stopping the User from reaching the UDO]
* **UBS.UD (Driver of the Blocker):** [What ultimately causes the UBS to succeed in blocking the User — `UBS.UD.UD` for deeper recursion]
* **UBS.UB (Blocker of the Blocker):** [What ultimately prevents the UBS from blocking the User — the user's natural defenses]

---

# PHASE 2: THE SYSTEM DESIGN (Context & Bridge)
*ESD §2: Define the conceptual solution space. What principles govern the design? What environment and tools are needed?*

**Source:** EPS, UES, EOP from ELF Learning Book

* **Principles (Why):** [The general, scientific Principles governing each of the Drivers (UDS, UDS.UD, UBS.UB) and each of the Blockers (UBS, UBS.UD, UDS.UB)]
  * *ESD labels:* `P1(S)`, `P2(S)` (Sustainability), `P3(E)`, `P4(E)` (Efficiency), `P5(Sc)`, `P6(Sc)` (Scalability)
* **Environment (Where):** [The Physical, Digital, or Cultural environment where the solution / enablement must live — UES layers]
* **Tools (What):** 
  * *Desirable Wrapper:* [The hook that gets the User to use it — aligns with UDO]
  * *Effective Core:* [The hidden mechanic that actually solves the root drivers/blockers of the User — neutralizes UBS via UBS.UB principles]
* **EOP (How):** [The step-by-step action by the User leveraging the Tools and Environment that has the highest confidence level in reaching the UDO — detailed EOP with per-step RACI in System Wiki §6 after I4 completion]

---

# Phase 3: User's Requirements (The Output)
*ESD §3: Translate the System Design into strict, deterministic engineering requirements.*

**Goal:** Binary Acceptance Criteria (A.C.) that are MECE (Mutually Exclusive, Collectively Exhaustive).

**A.C. ID naming convention (use across Requirements, Design, and Planning):** Short, stable IDs so Planning can reference exactly one A.C. per row. Format: `{Grammar}-AC{n}`. Grammar prefixes: **Verb**, **SustainAdv**, **EffAdv**, **ScalAdv**, **Noun**, **SustainAdj**, **EffAdj**, **ScalAdj**. Examples: `Verb-AC1`, `SustainAdv-AC1`, `EffAdj-AC2`. Number A.C. per block (1, 2, … N). Do not rename once used in Planning.

**Iteration assignment:** Which iteration validates each A.C. is defined in Planning per **ESD §6 Iteration Framework** (Concept → Prototype → MVE → Leadership; Sustainability I1, Efficiency I2, Scalability I3, spawned I4).

---

## 1. USER(S): [Define detailed User Persona and Anti-Persona (Who is not the User)]
*ESD §1.3: User Roles — who triggers it, who uses it, who benefits, who maintains it, who must NOT use it*

* **Primary User Persona:** [Detailed description]
* **Anti-Persona:** [Who is explicitly NOT the user]    

## 2. DESIRED USER ACTION(S): All Acceptance Criteria must be as MECE as possible
*ESD §3: The Verb — core action to achieve UDO*

**Verb:** [The core action to achieve the UDO]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Verb-AC1 | [Measurement of Acceptance for the Verb] |
| Verb-AC2 | [Measurement of Acceptance for the Verb] |
| Verb-ACN | [Measurement of Acceptance for the Verb] |

### Adverbs (The Effectiveness Outcomes — What the UDO comprises of)
*ESD §3: Three pillars — Sustainability (S), Efficiency (E), Scalability (Sc)*

**Sustainability Adverb:** [Risk/Safety outcomes, e.g., "Correctly", "Securely", "Deterministically"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdv-AC1 | [Measurement of Acceptance for the Sustainability Adverb] |
| SustainAdv-AC2 | [Measurement of Acceptance for the Sustainability Adverb] |
| SustainAdv-ACN | [Measurement of Acceptance for the Sustainability Adverb] |

**Efficiency Adverb:** [Speed/Utility outcomes, e.g., "Incrementally", "Frugally", "Surgically"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdv-AC1 | [Measurement of Acceptance for the Efficiency Adverb] |
| EffAdv-AC2 | [Measurement of Acceptance for the Efficiency Adverb] |
| EffAdv-ACN | [Measurement of Acceptance for the Efficiency Adverb] |

**Scalability Adverb:** [Growth outcomes, e.g., "Repeatedly", "Comparatively"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdv-AC1 | [Measurement of Acceptance for the Scalability Adverb] |
| ScalAdv-AC2 | [Measurement of Acceptance for the Scalability Adverb] |
| ScalAdv-ACN | [Measurement of Acceptance for the Scalability Adverb] |

## 3. FEATURE:
*ESD §3: The Noun — specific Tool built for the User to execute the Verb*

**Noun:** [The specific Tool built for the User to execute the Verb in the prescribed Environment respecting the Principles]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| Noun-AC1 | [Measurement of Acceptance for the Noun] |
| Noun-AC2 | [Measurement of Acceptance for the Noun] |
| Noun-ACN | [Measurement of Acceptance for the Noun] |

### Adjectives (The attributes of the Noun that enable the Effectiveness Outcomes)
*ESD §3: Features that embody Sustainability, Efficiency, Scalability*

**Sustainability Adjective:** [e.g., "Encrypted", "Offline-first", "Deterministic"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| SustainAdj-AC1 | [Measurement of Acceptance for the Sustainability Adjective] |
| SustainAdj-AC2 | [Measurement of Acceptance for the Sustainability Adjective] |
| SustainAdj-ACN | [Measurement of Acceptance for the Sustainability Adjective] |

**Efficiency Adjective:** [e.g., "Automated", "Lightweight", "Frugal"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| EffAdj-AC1 | [Measurement of Acceptance for the Efficiency Adjective] |
| EffAdj-AC2 | [Measurement of Acceptance for the Efficiency Adjective] |
| EffAdj-ACN | [Measurement of Acceptance for the Efficiency Adjective] |

**Scalability Adjective:** [e.g., "Modular", "API-driven", "Swarm-ready"]

| A.C. ID | Acceptance Criteria |
| :--- | :--- |
| ScalAdj-AC1 | [Measurement of Acceptance for the Scalability Adjective] |
| ScalAdj-AC2 | [Measurement of Acceptance for the Scalability Adjective] |
| ScalAdj-ACN | [Measurement of Acceptance for the Scalability Adjective] |

---

*For methodology on how to derive these sections from ELF output, see `docs/ai/frameworks/effective-system-design.md` §1–3.*
