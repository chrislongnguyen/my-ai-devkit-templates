---
phase: design
title: Effective System Design & Architecture
description: Translates the System Design into technical architecture and physical data models.
---

# 1. THE SYSTEM DESIGN (Context & Bridge)
*This section maps the approved Phase 2 from the Requirements document into the physical/digital space.*

* **Principles (Why):** [The general and/or scientific principles governing the drivers and blockers]
* **Environment (Where):** [The physical/digital/cultural context where the solution/enablement lives]
* **Tools (What):** 
  * *Desirable Wrapper:* [The hook/interface the user interacts with]
  * *Effective Core:* [The hidden mechanic solving the root drivers/blockers most effectively]
* **SOP (How):** [The step-by-step user action required to use the Tools in the Environment that has the highest confidence level in reaching their UDO - Ultimate Desired Outcome]

---

# 2. TECHNICAL ARCHITECTURE (The Noun)
*Goal: Provide clear, material explanation of the architecture so the User fully understands how the Wrapper and Core physically operate.*

* **Feature Noun:** [What specific Tool/Solution/Enablement are we building?]

## 2.1 Visual Map (Mermaid)
[Insert Mermaid diagram mapping the user flow, the Desirable Wrapper (UI/Client), and the Effective Core (Backend/Logic).]

## 2.2 Component Mapping
* **Wrapper Implementation:** [Clear explanation of how the UI/UX is built to act as the Desirable Wrapper]
* **Core Implementation:** [Clear explanation of the backend logic/scripts that act as the Effective Core]

## 2.3 Data Models & APIs
[Define the inputs, outputs, and database schema. Explain materially why this data structure is the most effective choice.]
[Where applicable, always try to apply Data Science best practices: Data Collection, Data Management, Descriptive Analytics, Diagnosis Analytics , Predictive Analytics, Prescriptive Analytics]

---

# 3. EFFECTIVENESS ATTRIBUTES OF THE SOLUTION / ENABLEMENT (The Adjectives)
*How the feature attributes enable the user to reach the Effectiveness Outcomes.*

*Map each attribute below to the corresponding Requirements A.C. IDs (e.g. SustainAdj-AC1, EffAdj-AC1, ScalAdj-AC1) and to the Planning iteration where that A.C. is validated. Design defines how; Requirements and Planning define what and when.*

* **Sustainability (Risk/Safety):** [List Adjectives + Exact Implementation Strategy]
* **Efficiency (Speed/Utility):** [List Adjectives + Exact Implementation Strategy]
* **Scalability (Growth):** [List Adjectives + Exact Implementation Strategy]

---

# 4. RESOURCE IMPACT (The "Price Tag")
* **Financial Cost (OpEx):** [Estimated monthly/fixed costs]
* **Build Complexity:** [Low/Medium/High]
* **ROI Sanity Check:** [Does this architecture respect the Principle of Efficiency?]

*Ongoing tracking:* See Planning §3 (Resource & Budget Tracker) for current usage vs limits.

**Requesting Resources / Budget from the User (optional):** When the design or execution requires a budget increase, new tool, or paid service:
1. **When to ask:** Before committing to a task that exceeds current limits (e.g. new API, hosting, paid tier). Do not assume; request explicit approval.
2. **What to specify:** Amount or ceiling (e.g. $X/month, Y API calls/day), purpose (which A.C. or task it serves), and alternative if the User says no.
3. **Approval gate:** Do not spend or integrate until the User approves. Record the approved limit in Planning §3 (Hard Limit) and proceed. If the User declines, adjust scope or task (e.g. mark 🟠 Stuck and propose an alternative).
