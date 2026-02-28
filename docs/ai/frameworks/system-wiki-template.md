
# [LTC ALL]_DOC TEMPLATE - System Wiki Template

> **Design Methodology Reference:** This template is filled out AFTER completing the **Effective System Design (ESD)** Phases 1–3. Each section below corresponds to ESD output. For design methodology, see `templates/effective-system-design.md`.

# [COMPANY NAME]_System NAME - 0. Overview of the System

### 0.1. DOCUMENT CONTROL


| FIELD                | VALUE / INSTRUCTION                                                                                                                                            |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SOP ID:              | `[ e.g., OPS-HR-001. Use format: [FUNCTION ID]-[SYSTEM TYPE]-[NUMBER] ]`                                                                                       |
| FOCUS AREA:          | `[ Select Strategic Focus Area: FA 0 (Strategy) / FA 1 (People) / FA 2 (Ops) / FA 3 (User Enablement) / FA 4 (Customer) / FA 5 (Finance) / FA 6 (Corp Resp) ]` |
| CORE AREA:           | `[ Copy the exact name of the Strategic Core Area from the Strategy Map, e.g., "CA PD 1.2 Recruit & Onboard Talents" ]`                                        |
| SYSTEM NAME:         | `[ Name the system clearly, e.g., "Talent Acquisition System" or "Monthly Financial Reporting System" ]`                                                       |
| FUNCTION NAME:       | `[ Enter the "System Identification Name" of the owning function, e.g., [OPS HR]_LTC HR Team ]`                                                                |
| OWNER (ACCOUNTABLE): | `[ Name of the Function Head or Admin who is ultimately Accountable for the success of this system ]`                                                          |
| VERSION:             | `[ e.g., 1.0 ]`                                                                                                                                                |
| STATUS:              | `[ Draft / Under Review / Approved / Deprecated ]`                                                                                                             |
| LEVEL OF ADHERENCE:  | `[ Mandatory (Must Follow) / Guideline (Discretion Allowed) / Recommended (Best Practice) ]`                                                                   |
| EFFECTIVE DATE:      | `[ The date this version goes live ]`                                                                                                                          |
| LAST REVIEWED:       | `[ Date of last audit ]`                                                                                                                                       |
| NEXT REVIEW DATE:    | `[ Set a review date (typically every 6 months) to ensure Continuous Improvement ]`                                                                            |


### 0.2. PURPOSE

`[ Instructions: Define the "Why". Explain how this system empowers the "Effective Doer" to achieve the "Desired Outcome" using specific "Principles" and "Tools". Explicitly state how this system contributes to the mission of safeguarding and growing family capital or improving the "Cost of Safety". ]`

### 0.3. SCOPE

`[ Instructions: Define the boundaries. 1) Who are the Users? (Specify if this applies to COE members or specific Agile Squads in Functional Groups). 2) What triggers this system? 3) What is explicitly OUT of scope? ]`

### 0.4. DATA GOVERNANCE

- Classification: `[ Select one: Public / Internal / Confidential / Restricted. Refer to Policy 8.4 ]`
- Handling: `[ Define specific handling rules based on classification. Example: "Confidential data must be encrypted in Google Drive and never shared via personal email." ]`

### 0.5. METRICS FOR SUCCESS (KPIs)

`[ Instructions: Define the "Strategic Key Results" for this system. You must select metrics that prove Effectiveness, not just activity. Use the Three Pillars: 1) Sustainability (Risk metrics), 2) Efficiency (Input/Output metrics), and 3) Scalability (Growth capacity metrics). These must be trackable in ClickUp or Odoo. ]`


| METRIC                                                            | TARGET               |
| ----------------------------------------------------------------- | -------------------- |
| `[ e.g., Sustainability: % of Compliance Breaches (Target: 0%) ]` | `[ e.g., 0% ]`       |
| `[ e.g., Efficiency: Cycle Time to complete the process ]`        | `[ e.g., < 2 Days ]` |
| `[ e.g., Scalability: Unit cost per additional transaction ]`     | `[ e.g., < $50 ]`    |


### 0.6. RISK MANAGEMENT

`[ Instructions: Diagnose the "Ultimate Blocking System" (UBS). What are the specific failure paths or risks that could destroy value or threaten the firm's existence? Map a specific mitigation action for every identified risk. ]`


| **POTENTIAL RISKS**                                      | **SEVERITY** (Low/Medium/High/Extreme/Catastrophic) | **MITIGATION**                                                                             |
| -------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `[ e.g., Loss of sensitive client data (Privacy Risk) ]` | `[ Catastrophic ]`                                  | `[ Enforce 2FA/Passkeys and restricted access rights in Google Drive per Policy 8.6 ]`     |
| `[ e.g., Single point of failure in decision making ]`   | `[ High ]`                                          | `[ Implement the RACI model requiring "Consulted" input from Compliance before approval ]` |


### 0.7. COMPLIANCE & ENFORCEMENT

**Compliance Monitoring:**

`[ Instructions: How do we verify that we are "Doing the Right Things Right"? Define the audit mechanism. ]`


| COMPLIANCE MONITORING METHOD   | DESCRIPTION & FREQUENCY                                                                       | RESPONSIBLE               |
| ------------------------------ | --------------------------------------------------------------------------------------------- | ------------------------- |
| `[ e.g., ClickUp Task Audit ]` | `[ Random review of 5 completed tasks to check for required attachment evidence. (Monthly) ]` | `[ [OPS PROCESS]_Admin ]` |
| `[ e.g., Odoo Log Review ]`    | `[ Automated scan for unauthorized access attempts. (Weekly) ]`                               | `[ [OPS IT]_Admin ]`      |


**Corrective Measures for Non-Compliance:**


| NON-COMPLIANCE LEVEL  | DESCRIPTION OF NON-COMPLIANT ACTION                                       | CORRECTIVE ACTION                                                                                     |
| --------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| 1: Minor / Accidental | `[ e.g., Missing a non-critical field in a report form ]`                 | `[ Direct coaching by Team Lead; correction within 24 hours ]`                                        |
| 2: Negligent          | `[ e.g., Repeated failure to upload required evidence after coaching ]`   | `[ Formal Verbal Warning; Record in HR file ]`                                                        |
| 3: Willful / Severe   | `[ e.g., Bypassing safety controls; Sharing passwords; Falsifying data ]` | `[ Immediate escalation to Compliance Committee; Potential termination per Disciplinary Procedures ]` |


### 0.8. VERSION HISTORY


| VERSION | DATE       | AUTHOR     | SUMMARY OF CHANGES    | APPROVED BY                   | EFFECTIVE DATE |
| ------- | ---------- | ---------- | --------------------- | ----------------------------- | -------------- |
| 1.0     | `[ Date ]` | `[ Name ]` | `[ Initial Release ]` | `[ "Accountable" Role Name ]` | `[ Date ]`     |


# [COMPANY NAME]_System NAME - 1. Desired Outcomes

### 1.1. SUCCESS DEFINITION (THE "WHY")

`[` `**Instructions:`** `Define what "Winning" looks like for this system. You must adhere to LTC's "Derived Truth #1": Effective Systems must incorporate all 3 pillars of effectiveness. Note that "Sustainability" (Risk Management) is the foundation—if a system is efficient but exposes us to ruin, it is ineffective. ]`


| PILLARS OF EFFECTIVENESS | OBJECTIVE TYPE                               | SYSTEM OBJECTIVE (INSTRUCTIONS)                                                                                                                 | METRIC TO MEASURE SUCCESS                      | TARGET                          | REPORTING SOURCE                      |
| ------------------------ | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- | ------------------------------- | ------------------------------------- |
| SUSTAINABILITY           | Minimize Failure Risks                       | `[ Define the "Floor". How does this system prevent failure or ruin? Example: "Ensure 100% adherence to labor laws to prevent lawsuits." ]`     | `[ e.g., # of Compliance Violations ]`         | `[ e.g., 0 ]`                   | `[ e.g., Compliance Audit Log ]`      |
|                          | Produce Desired Outcomes                     | `[ Define the "Baseline". What is the core job of this system? Example: "Fill open positions with qualified candidates." ]`                     | `[ e.g., % of Roles Filled ]`                  | `[ e.g., > 90% ]`               | `[ e.g., ClickUp Recruitment Space ]` |
| EFFICIENCY               | Maximize De-risking at Current Resources     | `[ How do we make safety "cheaper"? Example: "Reduce time spent on compliance checks by using standardized checklists." ]`                      | `[ e.g., Hours per Audit ]`                    | `[ e.g., < 2 hours ]`           | `[ e.g., ClickUp Time Tracking ]`     |
|                          | Maximize Outputs at Current Resources        | `[ How do we produce more value with the same team? Example: "Reduce time-to-hire to increase recruiter capacity." ]`                           | `[ e.g., Cycle Time (Days) ]`                  | `[ e.g., < 45 Days ]`           | `[ e.g., ClickUp Time Tracking ]`     |
| SCALABILITY              | Maximize De-risking Gains at Resource Growth | `[ As we grow, does risk management get easier? Example: "Implement automated background checks that scale infinitely without human effort." ]` | `[ e.g., Compliance Cost per New Hire ]`       | `[ e.g., Decrease by 10% ]`     | `[ e.g., Odoo Accounting ]`           |
|                          | Maximize Output Gains at Resource Growth     | `[ As we grow, does output grow faster than costs? Example: "Use Odoo templates to handle 2x candidate volume without adding recruiters." ]`    | `[ e.g., Candidates processed per Recruiter ]` | `[ e.g., Increase by 20% YoY ]` | `[ e.g., Odoo Recruitment Module ]`   |


# [COMPANY NAME]_System NAME - 2. Users & Roles

### 2.1. ROLE ASSIGNMENTS

`[` `**Instructions**: Define the "Effective Doers". You must use the RACI model (Responsible, Accountable, Consulted, Informed). ]`
`[` `**CRITICAL**: Do not just list names. You must list the "System Identification Name" (e.g., [OPS HR]_Recruiter) found in the Organizational Chart. This ensures the system works regardless of who currently holds the seat. ]`


| ROLE                             | PEOPLE IN CHARGE            | SYSTEM IDENTIFICATION (ID)                  | PRIMARY RESPONSIBILITIES                                                                                                           |
| -------------------------------- | --------------------------- | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| RESPONSIBLE (The Doer)           | `[ e.g., Thao Nguyen ]`     | `[ e.g., [OPS HR]_Recruitment Specialist ]` | `[ Executes the day-to-day tasks. "Flows to work" in this specific system. ]`                                                      |
| ACCOUNTABLE (The Owner/Reviewer) | `[ e.g., Tina Nguyen ]`     | `[ e.g., [MGT HR]_Admin ]`                  | `[ Has veto power. Ensures the system delivers the "Desired Outcomes" defined in Section 1. Only one person can be Accountable. ]` |
| CONSULTED (The Expert)           | `[ e.g., Long Nguyen ]`     | `[ e.g., [CORP LEGAL]_Legal Admin ]`        | `[ Two-way communication. Must be consulted before a decision or action is taken (e.g., for compliance or risk checks). ]`         |
| INFORMED (The Stakeholder)       | `[ e.g., Hiring Managers ]` | `[ e.g., [MGT]_Function Heads ]`            | `[ One-way communication. Notified after the action is completed (e.g., "Candidate Offer Signed"). ]`                              |


# [COMPANY NAME]_System NAME - 3. Effective Operating Principles

### 3.1. THE ULTIMATE BLOCKING SYSTEM (UBS) OF THIS SYSTEM

**Diagnosis:** `[ Instructions: Identify the specific "Ultimate Blocking System" (UBS) for this System. In a team context, the UBS is often defined by "human-related biases" or "shadow operating systems" (unofficial ways of doing things). What psychological biases, structural bottlenecks, or natural failure paths prevent this system from succeeding? ]`

**Mitigation Strategy:** `[ Instructions: How does this system systematically disable or overcome these blockers? ]`


| ASPECTS                                                                                                                                                                                                                                               | COMPONENTS                                                                                            | KEY QUESTION                                                                            | DESCRIPTION                                                                                                                         | UTILIZATION STRATEGY                                                                                   | IMPORTANT NOTES |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------- |
| THE UBS                                                                                                                                                                                                                                               | UBS.Principles                                                                                        | What principles are the UBS based on? (The System's Failure Principles)                 | `[ e.g., "Conflict Avoidance," "Recency Bias," or "Short-termism." What is the governing failure principle? ]`                      | `[ How do we disable this? e.g., "Enforce mandatory written feedback to bypass conflict avoidance." ]` |                 |
| UBS.Environment                                                                                                                                                                                                                                       | What environmental conditions do the UBS require to work? (The System's Failure Environment)          | `[ e.g., "No privacy for sensitive conversations," or "High noise levels." ]`           | `[ e.g., "Require 'War Room' booking for sensitive deals." ]`                                                                       |                                                                                                        |                 |
| [UBS.Tools](http://UBS.Tools)                                                                                                                                                                                                                         | What tool(s) the UBS require to work? (The System's Failure Tools)                                    | `[ e.g., "Unsecure chat apps (WhatsApp)," "Mental math," or "Outdated spreadsheets." ]` | `[ e.g., "Block usage of personal chat apps for client data." ]`                                                                    |                                                                                                        |                 |
| UBS.Actions                                                                                                                                                                                                                                           | How does it work successfully? (The System's Failure Procedure)                                       | `[ e.g., "People skip the checklist to save time," or "Information is hoarded." ]`      | `[ e.g., "Automate the checklist in ClickUp so it cannot be skipped." ]`                                                            |                                                                                                        |                 |
| DRIVERS OF THE UBS (UBS.UD)                                                                                                                                                                                                                           | UBS.UD + UBS.UD.UD + UBS.UB.UB                                                                        | What ultimately cause the UBS to work successfully? (The System's Root Blockers)        | `[ The Root Drivers of Failure. e.g., "Fear of offending colleagues," or "Incentives aligned with speed over quality." ]`           | `[ How do we attack the root? e.g., "Training on Radical Candor" or "Redesigning incentives." ]`       |                 |
| UBS.UD.Principles + UBS.UD.UD.Principles + UBS.UB.UB.Principles                                                                                                                                                                                       | What principles are the UBS' ultimate drivers based on? (The System's Root Failure Principles)        | `[ The Root Failure Principles. ]`                                                      |                                                                                                                                     |                                                                                                        |                 |
| UBS.UD.Environment + UBS.UD.UD.Environment + UBS.UB.UB.Environment [UBS.UD.Tools](http://UBS.UD.Tools) + [UBS.UD.UD.Tools](http://UBS.UD.UD.Tools) + [UBS.UB.UB.Tools](http://UBS.UB.UB.Tools) UBS.UD.Actions + UBS.UD.UD.Actions + UBS.UB.UB.Actions | How do the UBS' ultimate drivers cause it to work successfully? (The System's Root Failure Mechanism) | `[ The Root Failure Mechanism. ]`                                                       |                                                                                                                                     |                                                                                                        |                 |
| BLOCKERS OF THE UBS (UBS.UB)                                                                                                                                                                                                                          | UBS.UB UBS.UD.UB UBS.UB.UD                                                                            | What ultimately cause the UBS to fail? (The System's Root Drivers)                      | `[ The Root Blockers of Failure. What naturally stops the failure? e.g., "High visibility of errors," or "Strong peer pressure." ]` | `[ How do we amplify this? e.g., "Public dashboards of error rates." ]`                                |                 |
| UBS.UB.Principles + UBS.UD.UB.Principles + UBS.UB.UD.Principles                                                                                                                                                                                       | What principles are the UBS' ultimate blockers based on? (The System's Root Success Principles)       | `[ The Root Success Principles. ]`                                                      |                                                                                                                                     |                                                                                                        |                 |
| UBS.UB.Environment + UBS.UD.UB.Environment + UBS.UB.UD.Environment [UBS.UB.Tools](http://UBS.UB.Tools) + [UBS.UD.UB.Tools](http://UBS.UD.UB.Tools) + [UBS.UB.UD.Tools](http://UBS.UB.UD.Tools) UBS.UB.Actions + UBS.UD.UB.Actions + UBS.UB.UD.Actions | How do the UDS' ultimate blockers cause the UBS to fail? (The System's Root Success Mechanism)        | `[ The Root Success Mechanism. ]`                                                       |                                                                                                                                     |                                                                                                        |                 |


### 3.2. THE ULTIMATE DRIVING SYSTEM (UDS) OF THIS SYSTEM

**Diagnosis**: `[ Instructions: Identify the "Ultimate Driving System" (UDS). For teams, this is the "collective logical & analytical reasoning capability". What logic, data, or discipline makes this system succeed? ]`


| ASPECTS                                                                                                                                                                                                                                               | COMPONENTS                                                                                            | KEY QUESTION                                                                    | DESCRIPTION                                                                                                             | UTILIZATION STRATEGY                                                                           | IMPORTANT NOTES |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | --------------- |
| THE UDS                                                                                                                                                                                                                                               | UDS.Principles                                                                                        | What principles are the UDS based on? (The System's Success Principles)         | `[ e.g., "Meritocracy," "Evidence-based decision making," or "Fiduciary Duty." ]`                                       | `[ How do we enable this? e.g., "Require data attachments for all proposals." ]`               |                 |
| UDS.Environment                                                                                                                                                                                                                                       | What environmental conditions do the UDS require to work? (The System's Success Environment)          | `[ e.g., "Access to real-time market data," or "Quiet zones for deep work." ]`  | `[ e.g., "Provide Data Terminal access" or "Enforce library rules in COE zones." ]`                                     |                                                                                                |                 |
| [UDS.Tools](http://UDS.Tools)                                                                                                                                                                                                                         | What tool(s) the UDS require to work? (The System's Success Tools)                                    | `[ e.g., "Financial Modeling Templates," or "ClickUp Automations." ]`           | `[ e.g., "Standardize templates in Excel to reduce error." ]`                                                           |                                                                                                |                 |
| UDS.ACTIONS                                                                                                                                                                                                                                           | How does it work successfully? (The System's Success Actions)                                         | `[ The Success Actions. ]`                                                      | `[ e.g., "Conducting a pre-mortem before investment." ]`                                                                |                                                                                                |                 |
| DRIVERS OF THE UDS (UDS.UD)                                                                                                                                                                                                                           | UDS.UD UDS.UD.UD UDS.UB.UB                                                                            | What ultimately cause the UDS to work successfully? (The System's Root Drivers) | `[ The Root Drivers of Success. e.g., "Curiosity," "Professional Pride," or "Clear Accountability." ]`                  | `[ How do we amplify the root? e.g., "Recognition programs for thorough analysis." ]`          |                 |
| UDS.UD.Principles + UDS.UD.UD.Principles + UDS.UB.UB.Principles                                                                                                                                                                                       | What principles are the UDS' ultimate drivers based on? (The System's Root Success Principles)        | `[ The Root Success Principles. ]`                                              |                                                                                                                         |                                                                                                |                 |
| UDS.UD.Environment + UDS.UD.UD.Environment + UDS.UB.UB.Environment [UDS.UD.Tools](http://UDS.UD.Tools) + [UDS.UD.UD.Tools](http://UDS.UD.UD.Tools) + [UDS.UB.UB.Tools](http://UDS.UB.UB.Tools) UDS.UD.Actions + UDS.UD.UD.Actions + UDS.UB.UB.Actions | How do the UDS' ultimate drivers cause it to work successfully? (The System's Root Success Mechanism) | `[ The Root Success Mechanism. ]`                                               |                                                                                                                         |                                                                                                |                 |
| BLOCKERS OF THE UDS (UDS.UB)                                                                                                                                                                                                                          | UDS.UB + UDS.UB.UD + UBS.UD.UB                                                                        | What ultimately cause the UDS to fail? (The System's Root Blockers)             | `[ The Root Blockers of Success. What stops logic from working? e.g., "Time pressure," "Burnout," or "Lack of data." ]` | `[ How do we mitigate the root? e.g., "Enforce minimum review periods" or "Mandatory rest." ]` |                 |
| UDS.UB.Principles + UDS.UB.UD.Principles + UBS.UD.UB.Principles                                                                                                                                                                                       | What principles are the UDS' ultimate blockers based on? (The System's Root Failure Principles)       | `[ The Root Failure Principles. ]`                                              |                                                                                                                         |                                                                                                |                 |
| UDS.UB.Environment + UDS.UB.UD.Environment + UBS.UD.UB.Environment [UDS.UB.Tools](http://UDS.UB.Tools) + [UDS.UB.UD.Tools](http://UDS.UB.UD.Tools) + [UBS.UD.UB.Tools](http://UBS.UD.UB.Tools) UDS.UB.Actions + UDS.UB.UD.Actions + UBS.UD.UB.Actions | How do the UDS' ultimate blockers cause the UDS to fail? (The System's Root Failure Mechanism)        | `[ The Root Failure Mechanism. ]`                                               |                                                                                                                         |                                                                                                |                 |


### 3.3. THE EFFECTIVE PRINCIPLES OF THIS SYSTEM

**Instructions**: Principles should arrive pre-labeled from ESD (see `effective-system-design.md` §4.1). Each principle is labeled with its S/E/Sc pillar: `P[n](S)`, `P[n](E)`, `P[n](Sc)`. List them below, grouped by pillar with 2 sub-categories per pillar. These principles must be derived from your analysis of the UBS and UDS above and trace directly to how this system disables blockers or enables drivers.

**Principle Label Format**: `P1(S)`, `P2(S)`, `P3(E)`, `P4(Sc)`, etc. — where the letter indicates the Effectiveness pillar.

| PILLAR & LABEL | PURPOSE OF PRINCIPLES | PRINCIPLE NAME & DESCRIPTION | DISABLES/ENABLES | IMPORTANT NOTES |
| --- | --- | --- | --- | --- |
| **SUSTAINABILITY (S)** | Minimize failure risks | `[ e.g., P1(S): "Principle of Redundancy: No single point of failure." ]` | Disables: [UBS element] | These principles disable/avoid the following: Combined Root Failure Principles (UBS.UD + UBS.UD.UD + UBS.UB.UB + UDS.UB + UDS.UB.UD + UBS.UD.UB), and the root Failure Principles (UBS). |
| | Produce desired outcomes | `[ e.g., P2(S): "Principle of Auditability: All decisions leave a traceable record." ]` | Enables: [UDS element] | |
| **EFFICIENCY (E)** | De-risk at current resources | `[ e.g., P3(E): "Principle of Standardization: Do it once, use it many times." ]` | Enables: [UDS.UD element] | These principles enable/utilize the following: Root Success Principles (UDS.UD + UDS.UD.UD + UDS.UB.UB + UBS.UB + UBS.UD.UB + UBS.UB.UD), and the root Success Principles (UDS). |
| | Maximize outputs at current resources | `[ e.g., P4(E): "Principle of Automation: Automate low-value tasks to free up human time." ]` | Enables: [UDS element] | |
| **SCALABILITY (Sc)** | De-risk gains at growth | `[ e.g., P5(Sc): "Principle of Systems over Heroes: Build processes that survive staff turnover." ]` | Enables: [UDS.UD element at depth] | These principles enable scalability at recursive UDS layers. |
| | Output gains at growth | `[ e.g., P6(Sc): "Principle of Self-Service: Enable users to help themselves via self-service tools." ]` | Enables: [UDS element] | |


### 3.4. CORE VALUES FOR THIS SYSTEM

`[` `**Instructions**: Explicitly map this system to LTC’s Five Principles found in the Handbook. ]`

- **Ethics Above All:** `[ How does this system ensure we "do what's right"? e.g., "Whistleblower protection is built-in." ]`
- **Effectiveness Over Efficiency:** `[ How does this system prioritize "doing it better" (effectiveness) over just "doing it fast" (efficiency)? ]`
- **Transparency, Open Minds, and Open Communication:** `[ How does this system foster psychological safety and information sharing? ]`
- **Collective Leadership:** `[ How does this system ensure "no single person dominates" and diverse voices are heard? ]`
- **Continuous Improvement:** `[ How does this system learn from mistakes (e.g., Post-Mortem Reviews)? ]`

# [COMPANY NAME]_System NAME - 4. Effective Operating Environment

### 4.1. EFFECTIVE OPERATING ENVIRONMENT

**Design Source**: Derived from ESD Phase 2 §4.2 (Environment).

**Classification Note**: Environment types below (Physical/Digital/Cultural/Other) describe the **KIND** of environment. These are orthogonal to ESD's UES causal layers (Foundational/Operational/Enhancement), which describe **DEPENDENCY ORDER**. Both classifications are useful: environment types for operational documentation (this wiki), causal layers for design methodology (ESD).

| PURPOSE OF THE ENVIRONMENT      | TYPE OF ENVIRONMENT  | SPECIFICATION                                                                                                                | IMPORTANT NOTES                                                        |
| ------------------------------- | -------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| DERISK / MINIMIZE FAILURE RISKS | Physical Environment | `[ e.g., "Private, sound-proof meeting room." Required for sensitive HR or Legal discussions to prevent privacy breaches. ]` | `[ Link to Office Map or Booking System if applicable. ]`              |
|                                 | Digital Environment  | `[ e.g., "Restricted Google Drive Folder (Level 3 - Confidential)." Required to prevent unauthorized data access. ]`         | `[ Ensure access rights are audited monthly per Policy 8.6. ]`         |
|                                 | Cultural Environment | `[ e.g., "Psychologically Safe Zone." A culture where reporting "Near Misses" is rewarded, not punished. ]`                  | `[ Critical for overcoming the UBS of "Fear of Retaliation". ]`        |
|                                 | Other Environments   | `[ e.g., "Regulatory Sandbox." A safe testing environment for new financial products before public launch. ]`                |                                                                        |
| OPTIMIZE OUTPUT                 | Physical Environment | `[ e.g., "War Room / Co-location." Required for Agile Squads during "Sprint Mode" to maximize communication speed. ]`        | `[ Teams should flow to these rooms during critical project phases. ]` |
|                                 | Digital Environment  | `[ e.g., "ClickUp List with 'High-Speed' View." A clutter-free interface designed for rapid task execution. ]`               | `[ Link to the specific ClickUp List/View. ]`                          |
|                                 | Cultural Environment | `[ e.g., "Deep Work Zone." A cultural agreement that headphones on = do not disturb. ]`                                      | `[ Critical for enabling the UDS of "Deep Analytical Thinking". ]`     |
|                                 | Other Environments   | `[ e.g., "Knowledge Library." Access to the COE's shared wisdom to prevent reinventing the wheel. ]`                         |                                                                        |


# [COMPANY NAME]_System NAME - 5. Effective Operating Tools

### 5.1. EFFECTIVE OPERATING TOOLS

`[` `**Instructions**: Define the specific tools the "Effective Doer" needs to execute this system. According to Ultimate Truth #1, "Tools" are a fundamental component of any system. You must strictly distinguish between tools used for Safety (e.g., encryption, audit logs) and tools used for Productivity (e.g., automation, AI). Prefer standard LTC tools (ClickUp, Odoo, Google Workspace) to ensure integration and scalability. ]`


| PURPOSE OF THE TOOLS            | TYPE OF ENVIRONMENT  | TOOLS & SPECIFICATION                                | MAIN USE OF THIS TOOL                                     | LOCATION TO ACCESS THE TOOL   | ACCESS LEVEL      | IMPORTANT NOTES                                     |
| ------------------------------- | -------------------- | ---------------------------------------------------- | --------------------------------------------------------- | ----------------------------- | ----------------- | --------------------------------------------------- |
| DERISK / MINIMIZE FAILURE RISKS | Physical Environment | `[ e.g., "Cross-cut Paper Shredder." ]`              | `[ Destroying physical confidential documents. ]`         | `[ Office Utility Area ]`     | `[ All Members ]` | `[ Mandatory for all [CONFIDENTIAL] hard copies. ]` |
|                                 | Digital Environment  | `[ e.g., "1Password / Bitwarden." ]`                 | `[ Secure password storage and sharing. ]`                | `[ Browser Extension ]`       | `[ All Members ]` | `[ Never share passwords via chat. ]`               |
|                                 | Cultural Environment | `[ e.g., "Whistleblower Hotline / Anonymous Box." ]` | `[ Reporting ethical breaches without fear. ]`            | `[ Intranet / Physical Box ]` | `[ All Members ]` | `[ Monitored by Compliance Committee only. ]`       |
|                                 | Other Environments   | `[ e.g., "Legal Regulatory Database." ]`             | `[ Checking latest compliance laws. ]`                    | `[ Link to External Vendor ]` | `[ Legal Team ]`  |                                                     |
| OPTIMIZE OUTPUT                 | Physical Environment | `[ e.g., "Dual Monitor Setup." ]`                    | `[ Increasing data processing speed for analysts. ]`      | `[ COE Workstations ]`        | `[ COE Members ]` |                                                     |
|                                 | Digital Environment  | `[ e.g., "Odoo ERP - Recruitment Module." ]`         | `[ Tracking candidate pipelines and automating emails. ]` | `[ Odoo Dashboard ]`          | `[ HR Squad ]`    | `[ The "Single Source of Truth" for this data. ]`   |
|                                 | Cultural Environment | `[ e.g., "Bonusly / Peer Recognition App." ]`        | `[ Reinforcing positive behaviors and output. ]`          | `[ Integration in Chat App ]` | `[ All Members ]` |                                                     |
|                                 | Other Environments   | `[ e.g., "Gemini Pro / AI Assistant." ]`             | `[ Drafting content and summarizing data. ]`              | `[ Workspace Sidebar ]`       | `[ All Members ]` | `[ Do not input PII into public AI models. ]`       |


# [COMPANY NAME]_System NAME - 6. Effective Operating Procedures

### **6.1. PROCEDURE & RESPONSIBILITIES**

`[` `**Instructions**: Detail the step-by-step process. You must strictly separate steps that "Minimize Failure Risks" (Sustainability) from steps that "Optimize Output" (Efficiency). This ensures the "Ultimate Blocking System" (UBS) identified in Section 3 is systematically neutralized before the "Ultimate Driving System" (UDS) is deployed. ]`
`[` `**Critical**: Use the RACI model. Map every step to a specific "System ID" (e.g., [OPS HR]) to ensure clear ownership. ]`


| **STAGE**                           | **STEP #**                            | **STEP NAME**                   | **REQUIRED INPUT**                         | **DESIRED OUTPUT**                                | **OPERATING USERS**                                             | **OPERATING TOOLS**                                       | **TYPICAL BLOCKER**                                             | **REFERENCES & IMPORTANT NOTES**                                  |
| ----------------------------------- | ------------------------------------- | ------------------------------- | ------------------------------------------ | ------------------------------------------------- | --------------------------------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------------- | ----------------------------------------------------------------- |
| **RESPONSIBLE** (The Doer)          | **ACCOUNTABLE** (The Reviewer/Tester) | **CONSULTED** (The Expert)      | **INFORMED** (Other Relevant Stakeholders) | **HARDWARE**                                      | **SOFTWARE**                                                    | **DOCUMENTS**                                             | **RELEVANT WIKI**                                               | **COE LINK / OTHER REFERENCES**                                   |
| **DOS**                             | **DON'TS**                            | **KPI**                         | **DOS**                                    | **DON'TS**                                        | **KPI**                                                         | **DOS**                                                   | **DON'TS**                                                      | **KPI**                                                           |
| (What is needed to start?)          | (What is the final result?)           | (Key actions to perform)        | (Actions/Mistakes to Avoid)                | (Key Performance Indicator(s) to measure success) | (Oversight/Approval Tasks)                                      | (Negligence/ Delegation to Avoid)                         | (Key Performance Indicator(s) to measure success)               | (Advice/ Input to Provide)                                        |
| **DERISK / MINIMIZE FAILURE RISKS** | **1**                                 | `[ Name of De-risking Step 1 ]` | List inputs needed for this step           | `[ Define safe outcome ]`                         | **Role Name****:** Action to perform (add more Roles if needed) | **Role Name:** Action to avoid (add more Roles if needed) | **Role Name:** KPI to measure success (add more KPIs if needed) | **Role Name:** Oversight/approval task (add more Roles if needed) |
|                                     | **2**                                 | `[ Name of De-risking Step 2 ]` | List inputs needed for this step           | `[ Define safe outcome ]`                         | **Role Name****:** Action to perform (add more Roles if needed) | **Role Name:** Action to avoid (add more Roles if needed) | **Role Name:** KPI to measure success (add more KPIs if needed) | **Role Name:** Oversight/approval task (add more Roles if needed) |
| **OPTIMIZE OUTPUT**                 | **3**                                 | `[ Name of Execution Step 1 ]`  | List inputs needed for this step           | `[ Define value outcome ]`                        | **Role Name****:** Action to perform (add more Roles if needed) | **Role Name:** Action to avoid (add more Roles if needed) | **Role Name:** KPI to measure success (add more KPIs if needed) | **Role Name:** Oversight/approval task (add more Roles if needed) |
|                                     | **4**                                 | `[ Name of Execution Step 2 ]`  | List inputs needed for this step           | `[ Define value outcome ]`                        | **Role Name****:** Action to perform (add more Roles if needed) | **Role Name:** Action to avoid (add more Roles if needed) | **Role Name:** KPI to measure success (add more KPIs if needed) | **Role Name:** Oversight/approval task (add more Roles if needed) |
|                                     | **5**                                 | **… / Continuous**              | … / Continuous                             | … / Continuous                                    | … / Continuous                                                  | … / Continuous                                            | … / Continuous                                                  | … / Continuous                                                    |


### 6.2. EXCEPTION HANDLING & ESCALATION

- Deadlock Resolution: `[ If the Responsible and Accountable parties cannot agree, the decision is escalated to the [MGT STRATEGY] Strategy Steering Committee for a simple majority vote. ]`
- Crisis Protocol: `[ If a "Catastrophic" risk (identified in Section 0.6) materializes (e.g., Data Breach, Regulatory Raid), stop this procedure immediately and trigger the [FA 4.18] Crisis Management Plan. Contact: [MGT LEGAL]. ]`

