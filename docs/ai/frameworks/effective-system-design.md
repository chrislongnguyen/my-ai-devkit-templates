---
phase: system-design
title: Effective System Design (ESD) — Reference Framework
version: 2.0 | 2026-02-28
status: Active Reference — use after ELF Learning phase is complete
scope: OE (Operational Excellence) and all UE (User Enablement) instances
---

# Effective System Design (ESD)
## Reference Framework for Translating Effective Learning into Deterministic Engineering Requirements

---

## 0. Executive Summary

The **Effective System Design (ESD)** framework is the translation layer between *learning* and *building*. After an operator completes the **Effective Learning Framework (ELF)** on a subject, the output — a 7-layer structured Learning Book — contains everything needed to design a User Enablement (UE) system. ESD takes that knowledge and decomposes it into three sequential phases:

1. **Phase 1 — Problem Discovery**: Reconstruct the User's system from ELF output. Who is the User? What blocks them? What drives them? *(Source: ELF UDO, User Roles, UBS, UDS)*
2. **Phase 2 — System Design**: Define the conceptual solution space. What principles govern the design? What environment and tools are needed? What is the Desirable Wrapper and Effective Core? *(Source: ELF EPS, UES, EOP)*
3. **Phase 3 — User's Requirements**: Translate Phase 2 into deterministic engineering requirements expressed as Verbs, Adverbs, Nouns, and Adjectives with binary Acceptance Criteria (A.C.). *(Derives from: Phases 1 + 2)*

**ESD is not the same as ELF.** ELF is a learning methodology. ESD is a design methodology. They operate in sequence:

```
ELF (Learn) → Learning Book → ESD Phase 1+2 (Design) → ESD Phase 3 (User's Requirements) → Build → Test
```

**ESD is a rulebook — not a document template.** ESD defines the *design methodology* the agent follows to translate learning into requirements. The output documentation for each project or feature built is captured using the **System Wiki Template** — a separate deliverable format. The relationship:

```
Agent reads ESD (design rules) → applies methodology → produces filled System Wiki (project documentation)
```

ESD is used by the OE operator to design any UE system — whether an AI agent, a multi-agent team, a workflow, or a human-facing operational process. It is also used to design the OE system itself.

---

## 1. Core Concepts Glossary

All terms ordered from highest to lowest abstraction. Use these definitions consistently across all system design documents.

---

### 1.1 System Types

**Value Chain — The 6-Layer Corporate Structure**
Every organisation operates through a value chain of six interdependent layers. Each layer enables the one above it:

```
Layer 0: Strategic Alignment     — defines direction and priorities
Layer 1: People Development      — builds capability to execute
Layer 2: Operational Excellence   — the systems that build systems (OE)
Layer 3: User Enablement          — the systems that serve users (UE)
Layer 4: Customer Intimacy        — the systems that retain and grow relationships
Layer 5: Financial Performance    — the measurable outcomes of all layers above
```

**OE — Operational Excellence (Layer 2)**
The meta-layer. The system of systems that designs, builds, monitors, and improves User Enablement (Layer 3). OE does not serve the end-user directly — it serves the *builder*. In a specific domain, OE manifests as a concrete system: e.g., in AI Orchestration, OE = the Orchestration Engine; in HR, OE = the Talent Management System; in Finance, OE = the Financial Controls System. The UDO of any OE is to enable any analyst or operator to build a domain-specific UE system that is Sustainable, Efficient, and Scalable.

**UE — User Enablement (Layer 3)**
A domain-specific system designed and built by OE. Its UDO is to enable a specific User to perform a specific set of Verbs and reach specific desired outcomes. Always built *for* a named User Persona. Example: Investment Research Agent, Recruitment Pipeline System, Monthly Reporting Dashboard.

---

### 1.2 Frameworks

**ELF — Effective Learning Framework**
A 7-layer methodology for learning any subject deeply enough to design a system around it.
Layers in order: `UDO → User Roles → UBS (+ UBS.UB + UBS.UD) → UDS (+ UDS.UD + UDS.UB) → EPS → UES → EOP`
Output: a structured Learning Book. **ELF is for learning, not designing.**

**ESD — Effective System Design**
A 3-phase methodology for translating ELF output into deterministic engineering requirements.
Phases: Problem Discovery → System Design → User's Requirements.
Output: design decisions + A.C. tables. **ESD is for designing, not learning.**

**System Wiki Template**
The documentation format for each project or feature built by the agent. Captures: Document Control, Desired Outcomes, Users & Roles, Effective Operating Principles (UBS/UDS/EPS), Environment, Tools, and EOP. One filled wiki per system built. **The wiki is for documenting, not designing.**

---

### 1.3 ELF Layers (inputs to ESD)

**UDO — Ultimate Desired Outcome**
The fundamental, non-technical state the User is trying to achieve. Not a feature or system output — a state of being. Carried verbatim from ELF into ESD Phase 1. Does not change between ELF and ESD.

**User Roles**
The set of distinct actors who interact with the system: who triggers it, who uses it, who benefits, who maintains it, and who must NOT use it. In ESD, translated into User Persona + Anti-Persona + RACI matrix per EOP step.

**UBS — Ultimate Blocking System**
The root system of forces preventing the User from reaching the UDO. Expressed recursively using dot-notation:
- `UBS` = root blocker
- `UBS.UD` = what drives the UBS harder (works AGAINST the User)
- `UBS.UB` = what disables the UBS (works IN the User's favour)
- `UBS.UD.UD`, `UBS.UB.UB`, etc. = deeper recursive layers

**UDS — Ultimate Driving System**
The root system of forces helping the User reach the UDO. Expressed recursively:
- `UDS` = root driver
- `UDS.UD` = what drives the UDS further (works IN the User's favour)
- `UDS.UB` = what blocks the UDS (works AGAINST the User)
- `UDS.UD.UD`, `UDS.UB.UB`, etc. = deeper recursive layers

**EPS — Effective Principle System**
The set of governing principles derived *directly* from UBS and UDS. Each principle either enables a UDS element or disables a UBS element. Never generic best practices. Each principle is labeled with its S/E/Sc pillar during ELF (see §1.5): `P[n](S)`, `P[n](E)`, `P[n](Sc)`. In ESD Phase 2, these bucketed principles become the source of Adverb A.C.s in Phase 3.

**UES — Ultimate Effective System**
The concrete environment and tools that implement the EPS principles. Organized in 3 universal causal layers. The layer **names** are subject-specific; the **logic** is always the same:

- **Layer 1 (Foundational)**: The base runtime — must exist before anything else can operate. Everything above depends on this. *(Example names: Infrastructure, Physical, Legal, Biological)*
- **Layer 2 (Operational)**: The working environment — requires Layer 1 to function. Where the actual work is done. *(Example names: Workspace, Digital, Process, Organisational)*
- **Layer 3 (Enhancement)**: Amplifies and optimises — requires Layers 1+2 to be useful. Without the layers below, this layer adds no value. *(Example names: Intelligence, Cultural, Strategic, Cognitive)*

**Why this order is always causal:** You cannot operate Layer 2 without Layer 1 running. Layer 3 amplifies nothing without Layer 2 to operate in. The structure is universal — only the names change per subject.

In ESD, UES becomes the Noun and Noun A.C.s in Phase 3.

**EOP — Effective Operating Procedure**
The sequential, gated steps a User takes using the UES to reach the UDO. Staged in two phases: first DERISK (Sustainability steps that neutralise the UBS), then OPTIMIZE (Efficiency/Scalability steps that amplify the UDS). Each step includes a full RACI assignment (Responsible, Accountable, Consulted, Informed), Required Input, Desired Output, Operating Tools, Typical Blocker, and Dos/Don'ts/KPIs. In ESD Phase 3, each EOP step where the primary User Role = Responsible becomes one Verb with its own A.C. block.

---

### 1.4 ESD-Specific Concepts

**User Persona**
A detailed profile of the primary User the UE system is built for. Derived from ELF User Roles (primary actor). Includes: role/title, operating context, current capability level, primary job-to-be-done, key constraints. Every Phase 3 A.C. is written *for this persona*.

**Anti-Persona**
An explicit profile of who the UE system is NOT built for. Any user matching the Anti-Persona is explicitly out of scope. Prevents scope creep. Must be specific — name the exact characteristics that disqualify an actor.

**Desirable Wrapper**
The surface-level experience of the UE system in its early iterations (Iterations 1–2). Tests *desirability*: "Will the User want to use this?" Addresses UBS and UDS at root level only. The minimum needed to validate the UDO is worth solving.

**Effective Core**
The deep mechanism of the UE system at maturity (Iterations 3–4). Tests *effectiveness*: "Does this actually solve the root cause?" Addresses all recursive UBS/UDS layers (UBS.UB.UB, UDS.UD.UD, etc.). What separates a useful tool from a transformative system.

**RACI**
Responsibility assignment matrix per EOP step: R = Responsible (does the work), A = Accountable (owns the outcome), C = Consulted (provides input), I = Informed (receives outcome). Phase 3 Verbs derive from the R column for the primary User Role only.

**MECE — Mutually Exclusive, Collectively Exhaustive**
No overlaps, no gaps. Every requirement counted exactly once. Apply to A.C. sets: each A.C. tests one distinct condition, and collectively the set covers all conditions needed.

---

### 1.5 Effectiveness Pillars (S/E/Sc)

Three pillars of Effectiveness. Always prioritized in this order. Sustainability gates everything.

**S — Sustainability**
Correct, safe, risk-managed operation. The system does the right thing in the right way without causing harm, data loss, regulatory violation, or compounding error. Addressed first — always. Sustainability A.C.s gate Iteration 1 (Concept). No Efficiency work begins until all Sustainability A.C.s pass.

**E — Efficiency**
Fast, lean, frugal operation. Minimum waste of time, tokens, API cost, compute, or cognitive load. Addressed only after Sustainability is confirmed. Efficiency A.C.s begin in Iteration 2 (Prototype). No Scalability work begins until all Efficiency A.C.s pass.

**Sc — Scalability**
Repeatable, comparable, growth-capable operation. Handles increasing load, users, domains, or complexity without redesign. Addressed only after Efficiency is confirmed. Scalability A.C.s begin in Iteration 3 (MVE).

---

### 1.6 Phase 3 Grammar

The four grammar elements of Phase 3 User's Requirements. Together they form a complete engineering requirement set.

**Verb**
An atomic action the primary User takes using the UE system to progress toward the UDO. Derived from one EOP step where the primary User Role = Responsible. A system with N such EOP steps has N Verbs. Each Verb has its own independent A.C. block. Verb A.C.s test whether the action can be performed at all — before any Adverb quality is applied.

**Adverb**
How a Verb must be performed to be considered effective. Bucketed by S/E/Sc pillar — one Adverb group per pillar per Verb:
- **SustainAdv**: The Verb done correctly and safely. Examples: "Verifiably", "Securely", "Deterministically".
- **EffAdv**: The Verb done quickly and leanly. Examples: "Incrementally", "Frugally", "Surgically".
- **ScalAdv**: The Verb done at scale and repeatably. Examples: "Repeatedly", "Comparatively", "Systematically".

Each Verb has three Adverb groups. Each group has N independent, atomic A.C.s.

**Noun**
The specific UE tool or system built to enable the User to perform the Verbs adverbly. Corresponds to the UES from ELF. The Noun is the system/tool *itself* — not its output. Noun A.C.s define what the Noun must HAVE (components, integrations, schemas), organized by UES causal layer (Foundational → Operational → Enhancement) — not by S/E/Sc. All Noun A.C.s are confirmed in Iteration 1 — the tool must exist before any Verb can be tested.

**Adjective**
A quality, attribute, or characteristic the Noun must POSSESS to effectively enable the Verbs. Grouped by S/E/Sc pillar — one group per pillar with N A.C.s (not one adjective word × 3 A.C.s):
- **SustainAdj**: Safety, auditability, source-integrity qualities. Examples: "Auditable", "Sourced", "Deterministic", "Encrypted".
- **EffAdj**: Speed, lightness, structure qualities. Examples: "Lightweight", "Structured", "Automated", "Cached".
- **ScalAdj**: Modularity, extensibility, throughput qualities. Examples: "Modular", "API-driven", "Extensible", "Stateless".

Within each pillar, there are N Adjective A.C.s (SustainAdj-AC1 … SustainAdj-ACN). Multiple quality attributes are expressed as multiple A.C.s within the same pillar group.

---

### 1.7 Acceptance Criteria (A.C.)

**A.C. — Acceptance Criterion (singular) / Acceptance Criteria (plural)**
A single, binary, deterministic pass/fail test that proves one specific grammar element requirement is met. The foundational unit of Phase 3. Every engineering decision traces to at least one A.C.

**Five properties every valid A.C. must satisfy:**

| Property | Definition | Pass Example | Fail Example |
|---|---|---|---|
| **Atomic** | Tests exactly one thing | "Agent returns ≥3 sectors" | "Agent returns ≥3 sectors AND cites sources" |
| **Binary** | Result is PASS or FAIL — no partial, no grading | "Completes in ≤5 seconds" | "Completes reasonably quickly" |
| **Deterministic** | Same test → same result every time | "Returns valid Pydantic model" | "Returns a good-looking output" |
| **Pre-committed** | Written and locked before building begins | Locked before Cursor opens | Adjusted after seeing early output |
| **Traceable** | 4-link chain completeable | Chain written below A.C. | No trace stated or possible |

**A.C. ID Format**: `{Grammar}-AC{n}` — e.g., `Verb-AC1`, `SustainAdv-AC2`, `EffAdj-AC1`
Numbers sequential within each grammar block. Do not rename or renumber once used in a planning document.

**4-link Traceability Chain** (required for every A.C.):
```
A.C. ← Grammar Element ← Phase 2 Decision ← ELF Layer ← UDO
```

**Rule**: If you cannot complete all 4 links, the A.C. does not belong in this system.

---

### 1.8 Iteration Stages

**Iteration 1 — Concept** (Desirable Wrapper)
User test: "Does the User desire this outcome when it works sustainably?"
Gate: all Verb A.C.s + all SustainAdv A.C.s + all Noun A.C.s + all SustainAdj A.C.s pass.

**Iteration 2 — Prototype** (Desirable Wrapper)
User test: "Can this be built reliably and efficiently for regular use?"
Gate: all Iteration 1 A.C.s + remaining Verb/Noun A.C.s (if deferred) + some EffAdv + some EffAdj A.C.s pass.

**Iteration 3 — MVE (Minimum Viable Enablement)** (Effective Core)
User test: "Does this solve the root cause at depth and begin to scale?"
Gate: all Iteration 2 A.C.s + remaining EffAdv + remaining EffAdj + some ScalAdv + some ScalAdj A.C.s pass.

**Iteration 4 — Leadership** (Effective Core)
User test: "Does this solve all root causes, scale fully, and endure?"
Gate: all Iteration 3 A.C.s + remaining ScalAdv + remaining ScalAdj + all new A.C.s spawned from MVE testing pass. Leadership A.C.s are not written until Iteration 3 testing is complete.

---

## 2. ELF ↔ ESD Mapping (The Bridge)

Explicit mapping of every ELF layer to its corresponding ESD element. Reference this when starting ESD after completing an ELF Learning Book.

| ELF Layer | ESD Phase | ESD Element | Translation Rule |
|---|---|---|---|
| UDO | Phase 1 | UDO | Carried verbatim. Do not rephrase. |
| User Roles (primary) | Phase 1 | User Persona | Primary User Role → full Persona profile |
| User Roles (excluded) | Phase 1 | Anti-Persona | Out-of-scope roles → Anti-Persona |
| User Roles (all) | Phase 2 | RACI per EOP step | R/A/C/I assigned per step across all roles |
| UBS (all recursive layers) | Phase 1 | Blockers section | UBS + UBS.UD + UBS.UB + all recursive sub-layers |
| UDS (all recursive layers) | Phase 1 | Drivers section | UDS + UDS.UD + UDS.UB + all recursive sub-layers |
| EPS — P[n](S) | Phase 2 | Sustainability Principles | Principles disabling UBS / enabling UDS via correct/safe operation → SustainAdv A.C.s |
| EPS — P[n](E) | Phase 2 | Efficiency Principles | Principles enabling UDS via fast/lean operation → EffAdv A.C.s |
| EPS — P[n](Sc) | Phase 2 | Scalability Principles | Principles enabling UDS via repeatable/scalable operation → ScalAdv A.C.s |
| UES — Layer 1 (Foundational) | Phase 2 → Phase 3 | Noun Layer 1 A.C.s | Foundational components → Noun-ACn (under Layer 1 header) |
| UES — Layer 2 (Operational) | Phase 2 → Phase 3 | Noun Layer 2 A.C.s | Operational components → Noun-ACn (under Layer 2 header) |
| UES — Layer 3 (Enhancement) | Phase 2 → Phase 3 | Noun Layer 3 A.C.s | Enhancement components → Noun-ACn (under Layer 3 header) |
| EOP (primary User Role = R) | Phase 2 → Phase 3 | EOP → Verbs | Each step where primary User = R → one Verb block |
| EOP (full RACI) | Phase 2 | EOP (full) | Complete RACI per step for multi-role documentation |
| *(not in ELF)* | Phase 2 | Desirable Wrapper | Defined in Phase 2: which Verbs + Sustainability A.C.s test desirability at root UBS/UDS level |
| *(not in ELF)* | Phase 2 | Effective Core | Defined in Phase 2: which A.C.s address recursive UBS/UDS depth layers |
| *(not in ELF)* | Phase 3 | Adjectives (SustainAdj/EffAdj/ScalAdj) | Derived from Phase 2 decisions about qualities the Noun must possess |

---

## 3. Phase 1: Problem Discovery

*Goal: Reconstruct the User's system from ELF output — before introducing any technology.*
*Source: ELF Learning Book (UDO, User Roles, UBS, UDS layers).*
*Rule: No solution language. Phase 1 describes the problem space only.*

---

### 3.1 User Definition

**User Persona (Primary)**
Who is the primary User this system is designed for? Derived from ELF User Roles.
Include: role/title, operating context, current tools and methods, capability level, primary job-to-be-done, key constraints.
*Specific enough that a designer can make decisions by referencing this profile.*

**Anti-Persona**
Who is explicitly NOT the User? What characteristics disqualify an actor from being the target User?
Include: what they do differently, why this system is not designed for them, and why designing for them would harm the primary User.
*Vague Anti-Personas fail to prevent scope creep. Be precise.*

---

### 3.2 Ultimate Desired Outcome (UDO)

Carried verbatim from ELF. The fundamental, non-technical state the User is trying to achieve.
Format: "[User] [desired state] without [current constraint]."
*Do not rephrase or add technology references. The UDO must be true regardless of which system is built.*

---

### 3.3 The Driving System (UDS)

Derived from ELF UDS layer and all recursive sub-layers.

| Element | Description |
|---|---|
| **UDS** | The root system of forces helping the User toward the UDO |
| **UDS.UD** | What drives the UDS further — amplifies the driver |
| **UDS.UB** | What blocks the UDS — the root force working against the driver |
| **UDS.UD.UD** | What amplifies UDS.UD further (if explored to this depth in ELF) |
| **UDS.UD.UB** | What blocks UDS.UD (if explored in ELF) |
| *...recursive* | Continue for all layers documented in the ELF Learning Book |

---

### 3.4 The Blocking System (UBS)

Derived from ELF UBS layer and all recursive sub-layers.

| Element | Description |
|---|---|
| **UBS** | The root system of forces preventing the User from reaching the UDO |
| **UBS.UD** | What drives the UBS harder — makes the blocker stronger |
| **UBS.UB** | What disables the UBS — the root force working in the User's favour |
| **UBS.UD.UD** | What amplifies UBS.UD further (if explored in ELF) |
| **UBS.UB.UB** | What disables UBS.UB (if explored in ELF) |
| *...recursive* | Continue for all layers documented in the ELF Learning Book |

---

## 4. Phase 2: System Design

*Goal: Define the conceptual solution space based ONLY on what was learned in Phase 1 and ELF.*
*Source: ELF Learning Book (EPS, UES, EOP) + Phase 1.*
*Rule: No technology introduced that was not surfaced by the ELF. No design decision without a causal link to UBS or UDS.*

---

### 4.1 Principles (Why)

Derived from EPS. Already bucketed by S/E/Sc pillar during ELF (each principle labeled `P[n](S)`, `P[n](E)`, or `P[n](Sc)` in the Learning Book). Each principle explicitly states which UDS element it enables or which UBS element it disables. Never generic.

**Sustainability Principles (S)**
Govern correct, safe, risk-managed operation. Primarily address UBS and its recursive sub-layers.
Format: `P[n](S): [Principle] — Disables [UBS element] / Enables [UDS element]`

**Efficiency Principles (E)**
Govern fast, lean, frugal operation. Primarily address UDS and its recursive sub-layers.
Format: `P[n](E): [Principle] — Enables [UDS.UD element]`

**Scalability Principles (Sc)**
Govern repeatable, comparable, growth-capable operation.
Format: `P[n](Sc): [Principle] — Enables [UDS.UD element at recursive depth]`

---

### 4.2 Environment (Where)

Derived from ELF UES (Environment sub-layer). The context where the UE system must operate. Specifies constraints on the operating environment — not the tools themselves (those are in §4.3).

**Environment is documented by type** (following the System Wiki Template format):

| Environment Type | DERISK (Sustainability) | OPTIMIZE (Efficiency/Scalability) |
|---|---|---|
| **Physical** | Physical safety, access control, privacy | Co-location, ergonomics, hardware |
| **Digital** | Data security, access rights, encryption | Speed, integration, automation |
| **Cultural** | Psychological safety, reporting culture | Deep work, recognition, autonomy |
| **Other** | Regulatory, legal, compliance constraints | Innovation sandbox, external partnerships |

*Note: Environment types (Physical/Digital/Cultural/Other) describe WHAT KIND of environment. The 3 causal layers (§4.3) describe DEPENDENCY ORDER of components. These are orthogonal classifications — environment types appear in the System Wiki; causal layers appear in the design.*

---

### 4.3 Tools (What)

Derived from ELF UES (Tools sub-layer). Organized by UES 3 causal layers. Layer names are subject-specific — define them before designing. Every tool traces to at least one Principle from §4.1.

**Layer 1 ([Subject-Specific Foundational Name])**: The base runtime. Must exist before any other layer can function. Everything above depends on this.
**Layer 2 ([Subject-Specific Operational Name])**: The working environment. Requires Layer 1. Where the actual work is done.
**Layer 3 ([Subject-Specific Enhancement Name])**: Amplifies and optimises. Requires Layers 1+2. Without the layers below, this layer adds no value.

*Before designing, name the 3 layers for your subject. Examples:*
- *AI Orchestration: INFRASTRUCTURE → WORKSPACE → INTELLIGENCE*
- *HR Operations: LEGAL COMPLIANCE → PROCESS TOOLS → TALENT ANALYTICS*
- *Financial Reporting: DATA INFRASTRUCTURE → REPORTING WORKSPACE → DECISION INTELLIGENCE*

**Desirable Wrapper** *(Iterations 1–2: addresses UBS/UDS at root level)*
Minimal tool configuration enabling the primary User to perform the Verb(s) and reach Sustainable Adverb outcomes. Tests: "Will the User desire this?"

**Effective Core** *(Iterations 3–4: addresses all recursive UBS/UDS layers)*
Full tool configuration enabling the User to reach the UDO by solving root-cause recursive layers. Tests: "Does this actually work at depth?"

---

### 4.4 EOP — Effective Operating Procedure (How)

Derived from ELF EOP. The sequential, gated steps the primary User Role takes using the Tools in the Environment to reach the UDO. Staged in two phases and documented per step with full RACI.

**Stage 1 — DERISK (Sustainability)**: Steps that neutralise the UBS — minimise failure risks. These steps must complete and gate before any OPTIMIZE steps begin.

**Stage 2 — OPTIMIZE (Efficiency + Scalability)**: Steps that amplify the UDS — maximise desired output. Only begin after all DERISK steps are gated.

**EOP Step Template** (per step — follows System Wiki Template §6 format):

```
| STAGE | STEP # | STEP NAME | REQUIRED INPUT | DESIRED OUTPUT |
|-------|--------|-----------|----------------|----------------|
| [DERISK/OPTIMIZE] | [N] | [Action Name] | [What is needed to start] | [What the step produces] |

RACI:
  R (Responsible): [System ID — who does the work]
  A (Accountable): [System ID — who owns the outcome]
  C (Consulted):   [System ID — who provides input before action]
  I (Informed):    [System ID — who is notified after action]

Operating Tools: [Hardware / Software / Documents / Wiki references]
Typical Blocker: [Most likely UBS element that blocks this step]

  Dos:    [Key actions to perform]
  Don'ts: [Actions/mistakes to avoid]
  KPI:    [How to measure success of this step]

Gate: [Verifiable condition before Step N+1 begins]
```

*Steps where the primary User Role = R generate the Verbs in Phase 3.*
*Steps where the primary User Role = C or I generate Noun or Adjective requirements instead — the tool does the work, not the User.*

---

## 5. Phase 3: User's Requirements

*Goal: Translate Phase 2 into strict, deterministic, binary engineering requirements.*
*Source: Phase 1 (User) + Phase 2 (EOP → Verbs, Principles → Adverbs, Tools → Nouns, Qualities → Adjectives).*
*Rule: Every A.C. must satisfy all five properties: Atomic, Binary, Deterministic, Pre-committed, Traceable.*

---

### 5.1 A.C. Quality Rules

Verify all five rules before writing any A.C. A compound, vague, or untraceable A.C. creates false confidence.

| Rule | Pass Example | Fail Example | Fix |
|---|---|---|---|
| **Atomic** (one thing only) | "Agent returns ≥3 sectors" | "Agent returns ≥3 sectors AND cites sources" | Split into two separate A.C.s |
| **Binary** (pass or fail only) | "Completes in ≤5 seconds" | "Completes reasonably quickly" | Add a specific measurable threshold |
| **Deterministic** (same result every time) | "Returns valid Pydantic model" | "Returns a good-looking output" | Replace subjective language with a verifiable condition |
| **Pre-committed** (written before build) | Locked before build begins | Adjusted after seeing early output | Revert; redesign Phase 2 if needed |
| **Traceable** (4-link chain complete) | Chain written beneath the A.C. | No chain stated or possible | Trace or remove the A.C. |

---

### 5.2 A.C. ID Naming Convention

Format: `{Grammar}-AC{n}`

| Grammar Prefix | Represents | Iteration Introduced | Example |
|---|---|---|---|
| `Verb` | Core user action — one block per EOP step where User = R | 1 — Concept | `Verb-AC1` |
| `SustainAdv` | How the Verb is done correctly/safely | 1 — Concept | `SustainAdv-AC1` |
| `EffAdv` | How the Verb is done quickly/leanly | 2 — Prototype | `EffAdv-AC1` |
| `ScalAdv` | How the Verb is done at scale/repeatably | 3 — MVE | `ScalAdv-AC1` |
| `Noun` | What the UE system must have — organized by 3 causal layers | 1 — Concept | `Noun-AC1` |
| `SustainAdj` | Safety/correctness qualities of the Noun | 1 — Concept | `SustainAdj-AC1` |
| `EffAdj` | Speed/lightness qualities of the Noun | 2 — Prototype | `EffAdj-AC1` |
| `ScalAdj` | Scalability/modularity qualities of the Noun | 3 — MVE | `ScalAdj-AC1` |

**Numbering rules:**
- Sequential within each grammar block: 1, 2, … N
- Each Verb has its own independent SustainAdv / EffAdv / ScalAdv blocks with independent numbering
- Noun A.C.s numbered continuously across all 3 causal layers (Noun-AC1 through Noun-ACN)
- Adjective A.C.s numbered continuously within each pillar group (SustainAdj-AC1 through N)
- Do not rename or renumber once used in any planning or tracking document

---

### 5.3 Section 1: User Definition

*(Transcribed from Phase 1 — the implementation team must know who they are building for)*

**Primary User Persona**: [One paragraph — role, context, capability level, job-to-be-done, key constraint]

**Anti-Persona**: [One paragraph — who is not the user, what disqualifies them, and why this matters for scope]

---

### 5.4 Section 2: Desired User Actions

*One complete block per Verb. Repeat for every EOP step where the primary User Role = Responsible.*
*Each block is self-contained: Verb A.C.s + three Adverb groups (SustainAdv, EffAdv, ScalAdv).*
*A.C.s within each group are independent atomic units — never compound.*

---

#### Verb: [Action word from EOP Step N]

*Traceability: EOP Step [N] — [Primary User Role] = Responsible ← ELF EOP layer*
*Definition: [One sentence — what this action is and what successful completion looks like]*

| A.C. ID | Acceptance Criteria |
|---|---|
| Verb-AC1 | [Binary, atomic test that the User can perform this action at all — baseline] |
| Verb-AC2 | [Binary, atomic test of a distinct completeness condition of the action] |
| Verb-ACN | [...] |

---

**Sustainability Adverb**: *[Named adverb(s) — e.g., "Correctly, Verifiably"]*
*Traceability: EPS P[n](S) — Disables [UBS element] ← ELF EPS layer*

| A.C. ID | Acceptance Criteria |
|---|---|
| SustainAdv-AC1 | [Binary, atomic test that the Verb is performed correctly/safely — one condition only] |
| SustainAdv-AC2 | [Binary, atomic test of a second, distinct sustainability condition] |
| SustainAdv-ACN | [...] |

---

**Efficiency Adverb**: *[Named adverb(s) — e.g., "Incrementally, Frugally"]*
*Traceability: EPS P[n](E) — Enables [UDS element] ← ELF EPS layer*

| A.C. ID | Acceptance Criteria |
|---|---|
| EffAdv-AC1 | [Binary, atomic test that the Verb is performed quickly/leanly — one condition only] |
| EffAdv-AC2 | [Binary, atomic test of a second, distinct efficiency condition] |
| EffAdv-ACN | [...] |

---

**Scalability Adverb**: *[Named adverb(s) — e.g., "Repeatedly, Comparatively"]*
*Traceability: EPS P[n](Sc) — Enables [UDS.UD element] ← ELF EPS layer*

| A.C. ID | Acceptance Criteria |
|---|---|
| ScalAdv-AC1 | [Binary, atomic test that the Verb scales to the required load or scope — one condition only] |
| ScalAdv-AC2 | [Binary, atomic test of a second, distinct scalability condition] |
| ScalAdv-ACN | [...] |

---

*[Repeat the full Verb block for every EOP step where the primary User Role = Responsible]*

---

### 5.5 Section 3: Feature Requirements

*One Noun for the primary UE system. Multiple Nouns if the system has distinct UE components.*
*Noun A.C.s: organized by UES causal layer (Foundational → Operational → Enhancement) — NOT by S/E/Sc.*
*Adjective A.C.s: organized by S/E/Sc pillar — NOT by individual adjective word.*

---

#### Noun: [Name of the UE system or primary component]

*Traceability: UES ([Layer1].n, [Layer2].n, [Layer3].n) ← ELF UES layer ← EPS Principles*
*Definition: [One sentence — what this tool is built to do and for whom]*

**[Layer 1 Name] Components** *(Foundational — confirm before Layer 2 is tested)*

| A.C. ID | Acceptance Criteria |
|---|---|
| Noun-AC1 | [Binary, atomic test that Foundational component 1 exists and functions in isolation] |
| Noun-AC2 | [Binary, atomic test that Foundational component 2 exists and functions in isolation] |
| Noun-ACN | [...] |

**[Layer 2 Name] Components** *(Operational — requires Foundational confirmed)*

| A.C. ID | Acceptance Criteria |
|---|---|
| Noun-AC[n+1] | [Binary, atomic test that Operational component 1 exists and functions] |
| Noun-AC[n+2] | [Binary, atomic test that Operational component 2 exists and functions] |
| Noun-ACN | [...] |

**[Layer 3 Name] Components** *(Enhancement — requires Operational confirmed)*

| A.C. ID | Acceptance Criteria |
|---|---|
| Noun-AC[n+1] | [Binary, atomic test that Enhancement component 1 exists and functions] |
| Noun-AC[n+2] | [Binary, atomic test that Enhancement component 2 exists and functions] |
| Noun-ACN | [...] |

---

**Sustainability Adjective**: *[Named quality attributes — e.g., "Auditable, Sourced, Deterministic"]*
*Traceability: EPS Sustainability Principles → qualities the Noun must possess to operate correctly/safely*
*Note: Multiple quality attributes expressed as multiple A.C.s within this single pillar group.*

| A.C. ID | Acceptance Criteria |
|---|---|
| SustainAdj-AC1 | [Binary, atomic test of one correctness/safety quality the Noun must possess] |
| SustainAdj-AC2 | [Binary, atomic test of a second, distinct correctness/safety quality] |
| SustainAdj-ACN | [...] |

---

**Efficiency Adjective**: *[Named quality attributes — e.g., "Lightweight, Structured, Automated"]*
*Traceability: EPS Efficiency Principles → qualities the Noun must possess to operate quickly/leanly*

| A.C. ID | Acceptance Criteria |
|---|---|
| EffAdj-AC1 | [Binary, atomic test of one speed/lightness quality the Noun must possess] |
| EffAdj-AC2 | [Binary, atomic test of a second, distinct speed/lightness quality] |
| EffAdj-ACN | [...] |

---

**Scalability Adjective**: *[Named quality attributes — e.g., "Modular, API-driven, Extensible"]*
*Traceability: EPS Scalability Principles → qualities the Noun must possess to handle growth*

| A.C. ID | Acceptance Criteria |
|---|---|
| ScalAdj-AC1 | [Binary, atomic test of one modularity/extensibility quality the Noun must possess] |
| ScalAdj-AC2 | [Binary, atomic test of a second, distinct modularity/extensibility quality] |
| ScalAdj-ACN | [...] |

---

### 5.6 A.C. Traceability Chain

Every A.C. requires a complete 4-link chain. Verify before locking.

```
A.C. ← Grammar Element ← Phase 2 Decision ← ELF Layer ← UDO
```

**Complete chain example:**
```
SustainAdv-AC1: "Every data point cites its source (e.g., 'YFinance 2026-02-28')"
  ← SustainAdv ("Verifiably, Correctly")
  ← EPS P1(S): "Use only verified, sourced data" — Disables UBS: Manual hallucination risk
  ← UBS: "Manual data processing generates unverifiable claims at volume"
  ← UDO: "Make accurate, timely investment decisions without manual aggregation"
```

**Incomplete chain example (invalid — remove or redesign):**
```
SustainAdv-ACX: "Output should look professional"
  ← SustainAdv (???)
  ← ??? no EPS principle governs visual polish in this system
  ← not traceable to any UBS or UDS element
  ACTION: Remove this A.C. or add a Phase 2 principle that justifies it
```

---

### 5.7 Conflict Resolution Rules

When two A.C.s conflict (passing one makes the other impossible to pass):

1. **Trace both A.C.s** to their ELF layer. Identify which EPS principle each derives from.
2. **Apply S/E/Sc priority**: if one is Sustainability and the other is Efficiency, Sustainability wins. Revise the Efficiency A.C. — never the Sustainability A.C.
3. **If both are the same pillar**: return to Phase 2 and resolve the principle-level conflict first. Then rewrite the A.C.s from the revised principle.
4. **Never weaken an A.C. to resolve a conflict.** Weakening a pre-committed A.C. is a Phase 2 regression, not a Phase 3 edit.

---

## 6. Iteration Framework

The 4-stage maturity model. Each iteration is cumulative — it passes all prior iterations' A.C.s plus new ones. No A.C. from a prior iteration may be softened, removed, or deferred.

**Wrapper vs Core:**
- **Desirable Wrapper** = Iterations 1 + 2. Tests *desirability*. Addresses UBS/UDS at root level.
- **Effective Core** = Iterations 3 + 4. Tests *effectiveness*. Addresses all recursive UBS/UDS layers.

---

### Iteration 1 — Concept (Desirable Wrapper)

**User test**: "Does the User desire this outcome when it works sustainably?"
**Focus**: Sustainability only. Build the minimum needed to confirm the primary Verb works correctly and safely.

| Category | A.C.s that MUST pass |
|---|---|
| Verbs (all) | All `Verb-ACn` for all Verbs — baseline action confirmation |
| Adverbs | All `SustainAdv-ACn` for all Verbs — correct, safe operation |
| Noun | All `Noun-ACn` — all Foundational + Operational + Enhancement components confirmed |
| Adjectives | All `SustainAdj-ACn` — all safety/correctness qualities of the Noun |
| **Not included** | `EffAdv`, `ScalAdv`, `EffAdj`, `ScalAdj` — deferred to Iterations 2–4 |

**Gate**: All Iteration 1 A.C.s pass before any Iteration 2 A.C.s are written or built toward.

---

### Iteration 2 — Prototype (Desirable Wrapper)

**User test**: "Can this be built reliably and efficiently for regular use?"
**Focus**: Begin Efficiency. All Sustainability A.C.s still pass — without exception.

| Category | A.C.s that MUST pass |
|---|---|
| Prior | All Iteration 1 A.C.s — unchanged, not softened |
| Verbs | Any `Verb-ACn` deferred from Iteration 1 (if applicable) |
| Adverbs | Some `EffAdv-ACn` for all Verbs — highest-priority efficiency requirements first |
| Noun | Any `Noun-ACn` deferred from Iteration 1 (if applicable) |
| Adjectives | Some `EffAdj-ACn` — highest-priority efficiency qualities |
| **Not included** | `ScalAdv`, `ScalAdj` — deferred to Iteration 3 |

**Gate**: All Iteration 1 + designated Iteration 2 A.C.s pass before Iteration 3 A.C.s are written.

---

### Iteration 3 — MVE: Minimum Viable Enablement (Effective Core)

**User test**: "Does this solve the root cause at depth and begin to scale?"
**Focus**: Complete Efficiency, begin Scalability. Transitions from Wrapper to Core.

| Category | A.C.s that MUST pass |
|---|---|
| Prior | All Iteration 1 + 2 A.C.s — unchanged |
| Adverbs | Remaining `EffAdv-ACn` + some `ScalAdv-ACn` for all Verbs |
| Noun | Any remaining deferred `Noun-ACn` |
| Adjectives | Remaining `EffAdj-ACn` + some `ScalAdj-ACn` |

**Gate**: All Iteration 1 + 2 + 3 A.C.s pass. Iteration 4 A.C.s now written — informed by MVE testing.

---

### Iteration 4 — Leadership (Effective Core)

**User test**: "Does this solve all root causes, scale fully, and endure?"
**Focus**: Complete Scalability + all A.C.s discovered during MVE testing.

| Category | A.C.s that MUST pass |
|---|---|
| Prior | All Iteration 1 + 2 + 3 A.C.s — unchanged |
| Adverbs | Remaining `ScalAdv-ACn` for all Verbs |
| Adjectives | Remaining `ScalAdj-ACn` |
| **Spawned (new)** | All new A.C.s discovered from MVE testing — edge cases, recursive layer failures, real-world conditions not anticipated in Iterations 1–3 |

**Gate**: All A.C.s from all iterations pass, including spawned A.C.s. No known A.C.s outstanding.

---

### Iteration A.C. Assignment Rules

1. **Sustainability A.C.s always go in Iteration 1.** Never defer. A system that is not sustainable is a liability.
2. **Efficiency A.C.s start in Iteration 2.** Split between Iterations 2 and 3 by build priority. Start with A.C.s most critical to daily usability.
3. **Scalability A.C.s start in Iteration 3.** Never introduce Scalability before Efficiency is confirmed — scale amplifies inefficiency into catastrophe.
4. **Leadership (spawned) A.C.s are not written until Iteration 3 testing is complete.** They reflect real conditions discovered in testing, not anticipated requirements.
5. **No A.C. may be softened, removed, or deferred once it appears in an iteration plan.** If an A.C. must change, return to Phase 2, revise the originating design decision, then rewrite the A.C. with a new ID.

---

## 7. Gap Closure

Structural gaps between ELF and ESD and how each is bridged.

---

### Gap 1: Phase 3 User's Requirements has no ELF equivalent

**The gap**: ELF produces 7 structured learning layers but does not produce Verb/Adverb/Noun/Adjective A.C.s.

**The bridge**:

| ELF Layer | → Phase 3 Element | Mechanism |
|---|---|---|
| EOP steps (primary User = R) | → Verbs | One step = one Verb block with independent A.C.s |
| EPS bucketed by S/E/Sc | → SustainAdv / EffAdv / ScalAdv | One principle per pillar = one or more Adverb A.C.s |
| UES (3 causal layers) | → Noun A.C.s (by layer) | One UES component = one Noun A.C. |
| Phase 2 design qualities | → SustainAdj / EffAdj / ScalAdj | Design decisions about Noun characteristics = Adjective A.C.s |

**Resolution**: Run ESD Phase 3 immediately after ELF + ESD Phase 1+2. Do not attempt to formalize during learning.

---

### Gap 2: Desirable Wrapper / Effective Core not in ELF

**The gap**: ELF generates knowledge of UBS/UDS at all recursive layers but does not distinguish "surface desirability" from "root-cause effectiveness."

**The bridge**: In ESD Phase 2, assign each A.C. or Iteration to Wrapper or Core by which UBS/UDS layer it addresses:
- **Wrapper A.C.s** → UBS and UDS at root level (Iterations 1–2)
- **Core A.C.s** → UBS.UB, UBS.UD, UDS.UD, UDS.UB and all deeper recursive layers (Iterations 3–4)

**Rule**: Never attempt to build a Core before a Wrapper is validated. A sophisticated solution to a problem no one wants solved is waste, not engineering.

---

### Gap 3: User Persona / Anti-Persona not in ELF

**The gap**: ELF defines User Roles but does not build a full Persona profile or explicitly name the Anti-Persona.

**The bridge**: In ESD Phase 1, derive Persona and Anti-Persona from ELF User Roles:
- Primary User Role → full Persona profile (context, constraints, job-to-be-done)
- Out-of-scope roles → Anti-Persona (specific disqualifying characteristics)

**Rule**: Every Phase 3 A.C. is written *for the named Persona*. A.C.s that would only be valid for the Anti-Persona must be removed.

---

### Gap 4: RACI matrix not fully developed in ELF EOP

**The gap**: ELF EOP defines sequential steps but does not always specify Responsible/Accountable/Consulted/Informed per step.

**The bridge**: In ESD Phase 2 EOP, define full RACI per step using all User Roles from Phase 1.

**Rule**: Phase 3 Verbs derive only from steps where the primary User Role = Responsible (R). Steps where the primary User = Consulted or Informed do not generate Verb A.C.s — they generate Noun or Adjective requirements instead (the tool does the work, not the User).

---

### Gap 5: EPS S/E/Sc bucketing not explicit in early ELF

**The gap**: ELF originally generated principles labeled `P1`, `P2`, `P3`... without explicit S/E/Sc bucketing. ESD requires principles to arrive pre-bucketed.

**The bridge**: The ELF page-3-principles template now requires each principle to be labeled with its S/E/Sc pillar: `P[n](S)`, `P[n](E)`, `P[n](Sc)`. This labeling happens during ELF, so principles arrive at ESD already bucketed.

**Rule**: If an ELF Learning Book has unlabeled principles, bucket them during ESD Phase 2 §4.1 before proceeding to Phase 3.

---

## 8. Worked Example

*Domain: Investment Research | Primary User: Investment Analyst*
*OE layer: AI Orchestration Engine | UE system: Investment Research Agent*
*UES layers for this subject: INFRASTRUCTURE (L1) → WORKSPACE (L2) → INTELLIGENCE (L3)*
*Use this to calibrate A.C. writing precision before applying ESD to your own domain.*

---

### Phase 1 Summary

**User Persona**: Investment Analyst, solo operator managing 50–200 public equities daily. Current process: manual data aggregation via Bloomberg terminal + Excel. Primary constraint: time — cannot monitor all positions and identify opportunities before the market moves. Job-to-be-done: identify actionable sector opportunities from a large ticker universe, faster than manual methods allow.

**Anti-Persona**: Quantitative researcher (requires statistically rigorous backtesting with historical data); retail investor (no institutional-grade API access). Designing for either would compromise the speed and structured-output requirements of the primary Persona.

**UDO**: Make timely, accurate investment decisions on sector allocation without manual data aggregation.

**UDS**: Access to structured, sourced, real-time market data
- UDS.UD: Automated data pipeline removes the human bottleneck
- UDS.UB: API reliability risk and data freshness risk

**UBS**: Manual data processing bottleneck
- UBS.UD: Ticker volume scales faster than analyst processing time
- UBS.UB: Automated analysis pipeline (what enables the User to escape the bottleneck)

---

### Phase 2 Summary

**Sustainability Principles**:
- P1(S): Use only verified, sourced data — Disables UBS (manual errors) and UBS.UD (volume-induced errors)
- P2(S): All output claims must be traceable to a specific data event — Disables UBS (hallucination risk)

**Efficiency Principles**:
- P1(E): Analysis must complete within analyst attention span — Enables UDS (timely decisions)

**Scalability Principles**:
- P1(Sc): System must handle N tickers without redesign — Enables UDS.UD (automated pipeline scales)

**Tools (UES)** — *Subject-specific layer names: INFRASTRUCTURE / WORKSPACE / INTELLIGENCE*:
- INFRASTRUCTURE (L1): Python 3.10+, Agno framework, YFinance API, Anthropic API
- WORKSPACE (L2): Cursor IDE, Pydantic output schema, Git
- INTELLIGENCE (L3): Claude claude-sonnet-4-6, AgentOS (stream_events=True)

**Desirable Wrapper**: Verbs 1+2 working correctly with sourced data, returning structured output → confirms analysts desire this outcome.

**Effective Core**: Full recursive solution — 1,000-ticker scale, modular data source, fully auditable event stream, all A.C.s across Iterations 1–3 passed.

**EOP** — *Staged: DERISK then OPTIMIZE*:

| Stage | Step | Action | R | A | Gate |
|---|---|---|---|---|---|
| DERISK | 1 | Analyst submits ticker list → Agent analyses market trends | Analyst | Analyst | Sourced trend data returned for all tickers |
| OPTIMIZE | 2 | Agent identifies growth sectors from trend data | Agent | Analyst | ≥3 GICS sectors returned with source citations |

---

### Phase 3: Full User's Requirements

#### Section 1: User Definition

**Primary User Persona**: Investment Analyst, solo operator, 50–200 equity universe, time-constrained, manual data aggregation bottleneck, requires structured and sourced output to make daily allocation decisions.

**Anti-Persona**: Quantitative researcher (requires backtesting rigor); retail investor (no API access). Both are explicitly out of scope.

---

#### Section 2: Desired User Actions

---

##### Verb 1: Analyse

*Traceability: EOP Step 1 — Investment Analyst = Responsible ← ELF EOP*
*Definition: The Analyst submits a list of tickers; the Agent analyses market trends and returns structured trend data for every ticker.*

| A.C. ID | Acceptance Criteria |
|---|---|
| Verb-AC1 | Agent returns trend data for every ticker submitted in the input list |

**Sustainability Adverb**: *Verifiably, Correctly*
*Traceability: EPS P1(S) + P2(S) ← UBS (manual errors) + UBS.UD (volume-induced errors)*

| A.C. ID | Acceptance Criteria |
|---|---|
| SustainAdv-AC1 | Every data point in the analysis output cites its source (e.g., "YFinance 2026-02-28") |
| SustainAdv-AC2 | Every cited value matches the exact value from the cited source |

**Efficiency Adverb**: *Incrementally, Quickly*
*Traceability: EPS P1(E) ← UDS (timely decisions)*

| A.C. ID | Acceptance Criteria |
|---|---|
| EffAdv-AC1 | Analysis step completes in ≤3 seconds for a 10-ticker input |

**Scalability Adverb**: *Repeatedly, At Scale*
*Traceability: EPS P1(Sc) ← UDS.UD (automated pipeline)*

| A.C. ID | Acceptance Criteria |
|---|---|
| ScalAdv-AC1 | Analysis returns valid, complete output for ticker lists of size 10, 100, and 1,000 without error or truncation |

---

##### Verb 2: Identify

*Traceability: EOP Step 2 — Agent = Responsible (Analyst = Informed). Included here as Agent-executed Verb; in RACI-strict design these requirements shift to Noun A.C.s.*
*Definition: The Agent identifies growth sectors from trend data and returns ≥3 GICS sector recommendations.*

| A.C. ID | Acceptance Criteria |
|---|---|
| Verb-AC1 | Agent returns ≥3 sector recommendations distinct from the input ticker list |

**Sustainability Adverb**: *Deterministically, Correctly*
*Traceability: EPS P1(S) ← UBS (manual errors)*

| A.C. ID | Acceptance Criteria |
|---|---|
| SustainAdv-AC1 | Each identified sector is a real, named GICS sector |

**Efficiency Adverb**: *Surgically*
*Traceability: EPS P1(E) ← UDS*

| A.C. ID | Acceptance Criteria |
|---|---|
| EffAdv-AC1 | Identification returns ≥3 sectors in ≤2 seconds |

**Scalability Adverb**: *Comparatively*
*Traceability: EPS P1(Sc) ← UDS.UD*

| A.C. ID | Acceptance Criteria |
|---|---|
| ScalAdv-AC1 | Identification draws from ≥11 available GICS sectors |

---

#### Section 3: Feature Requirements

---

##### Noun: Investment Research Agent

*Traceability: UES INFRA.1-2, WORKSPACE.1-2, INTEL.1-2 ← ELF UES ← EPS P1-P2 (S/E/Sc)*
*Definition: The AI agent built to enable the Investment Analyst to perform Verb 1 (Analyse) and receive the output of Verb 2 (Identify) — with sourced, structured, auditable results.*

**INFRASTRUCTURE Components** *(Layer 1 — Foundational)*

| A.C. ID | Acceptance Criteria |
|---|---|
| Noun-AC1 | Python 3.10+ environment runs without error |
| Noun-AC2 | YFinance API returns live ticker data on ping |
| Noun-AC3 | Anthropic API key is active and returns a structured response |

**WORKSPACE Components** *(Layer 2 — Operational)*

| A.C. ID | Acceptance Criteria |
|---|---|
| Noun-AC4 | Agno agent definition file runs without error |
| Noun-AC5 | Pydantic output schema has all required fields defined |

**INTELLIGENCE Components** *(Layer 3 — Enhancement)*

| A.C. ID | Acceptance Criteria |
|---|---|
| Noun-AC6 | Claude Sonnet returns structured JSON matching Pydantic schema |
| Noun-AC7 | AgentOS event stream is active and readable with stream_events=True |

---

**Sustainability Adjective**: *Auditable, Sourced*
*Traceability: EPS P1(S) + P2(S) → safety/correctness qualities the Agent must possess*

| A.C. ID | Acceptance Criteria |
|---|---|
| SustainAdj-AC1 | All agent events appear in AgentOS event stream for every run |
| SustainAdj-AC2 | No output field is populated from model internal knowledge — all claims require a live API call |

**Efficiency Adjective**: *Lightweight, Structured*
*Traceability: EPS P1(E) → efficiency qualities the Agent must possess*

| A.C. ID | Acceptance Criteria |
|---|---|
| EffAdj-AC1 | Pydantic model parses with zero null required fields on every run |
| EffAdj-AC2 | Total API token usage per run is ≤2,000 tokens |

**Scalability Adjective**: *Modular, Extensible*
*Traceability: EPS P1(Sc) → scalability qualities the Agent must possess*

| A.C. ID | Acceptance Criteria |
|---|---|
| ScalAdj-AC1 | Data source is swappable with ≤1 configuration change |
| ScalAdj-AC2 | New sector types can be added without modifying agent core logic |

---

### Iteration Progression Summary

| Iteration | Stage | Wrapper/Core | A.C.s Added | User Test |
|---|---|---|---|---|
| **1 · Concept** | Initial | Desirable Wrapper | V1:Verb-AC1 + V2:Verb-AC1 + V1:SustainAdv-AC1,2 + V2:SustainAdv-AC1 + Noun-AC1 through AC7 + SustainAdj-AC1,2 | "Does the analyst desire this?" |
| **2 · Prototype** | Build | Desirable Wrapper | + V1:EffAdv-AC1 + V2:EffAdv-AC1 + EffAdj-AC1,2 | "Can this be built reliably?" |
| **3 · MVE** | Depth | Effective Core | + V1:ScalAdv-AC1 + V2:ScalAdv-AC1 + ScalAdj-AC1 | "Does this solve the root cause?" |
| **4 · Leadership** | Maturity | Effective Core | + ScalAdj-AC2 + new A.C.s spawned from MVE testing | "Does this scale and endure?" |

---

*Document: `templates/effective-system-design.md`*
*Version: 2.0 | Date: 2026-02-28 | Status: Active Reference*
*Use after ELF Learning phase is complete. Do not use during learning.*
*Updates require User approval. Managed alongside `templates/system-wiki-template.md`.*
