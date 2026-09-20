# CFPB Customer Complaint & Regulatory Risk Analytics

An executive-level operational and regulatory risk assessment analyzing federal consumer complaint disclosures from the Consumer Financial Protection Bureau (CFPB). This project evaluates institutional processing bottlenecks, competitor resolution strategies, intake channel friction, and regional compliance exposure across major U.S. retail banking institutions.

---

## Client Background & Overview

The **Consumer Financial Protection Bureau (CFPB)** is an independent agency of the United States government responsible for consumer protection in the financial sector. The CFPB maintains a public database of federal consumer complaints submitted against financial institutions, serving as a critical signal for market compliance issues, operational friction, and customer friction.

This analysis evaluates over **22,000+ customer complaint filings** across leading U.S. retail banks (including JPMorgan Chase, Bank of America, and Wells Fargo). Reporting to the **Chief Operations Officer (COO)** and **Head of Regulatory Compliance**, this project translates unstructured public dispute data into structured operational intelligence to identify SLA breach triggers, resolution cost disparities, and regional exposure.

---

## Northstar Metrics

* **Total Complaint Volume:** Baseline measure of total public customer dispute escalations across products and jurisdictions.
* **Average Processing Duration:** Operational turnaround time in calendar days from initial complaint intake to final corporate disposition.
* **SLA Breach Rate (>15 Days):** Percentage of cases exceeding the mandatory 15-day regulatory response window, serving as the primary compliance risk indicator.
* **Monetary Relief Settlement Rate:** Proportion of resolved claims resulting in direct financial payout to consumers versus non-monetary explanations.
* **Digital Intake Adoption:** Percentage of filings received via automated web portals versus manual offline channels (Postal Mail, Phone, Referrals).

---

## Executive Summary & Insights Deep Dive

### 1. Operational SLA Delays by Product Line


![Operational SLA Delays](assets/sla_delays.png)

#### Business Interpretation & Stakeholder Analysis
* **Core Risk Concentration:** **Credit Cards (1.7%)** and **Checking/Savings Accounts (1.6%)** represent the highest rates of extreme processing delays exceeding the 15-day SLA limit.
* **Disproportionate Operational Volume:** Because Credit Cards and Checking Accounts represent the highest intake volume, these two product categories generate **78% of all national regulatory SLA breaches**.
* **Process Complexity Gap:** High-volume, low-friction transactional disputes (fee waivers, billing errors, chargebacks) frequently stall in manual verification queues, driving system-wide SLA compliance risks.

---

### 2. Competitive Benchmarking & Resolution Strategy

![Competitive Benchmarking](assets/competitive_benchmarking.png)

#### Business Interpretation & Stakeholder Analysis
* **Divergent Resolution Philosophies:** **JPMorgan Chase** resolves complaints predominantly through formal communications, closing **6.4K cases** with non-monetary explanations. Conversely, **Bank of America** relies on financial settlements, issuing direct monetary relief in **2.2K cases**—more than double Chase (**0.9K**) and Wells Fargo (**0.8K**) combined.
* **Operational Backlog Exposure:** Bank of America carries **1.5K in-progress complaints**, signaling severe back-office resolution bottlenecks compared to Chase (**0.2K**) and Wells Fargo (**0.4K**).
* **Low Non-Monetary Settlement Utilization:** Across all major institutions, non-monetary relief remains below 0.4K cases, demonstrating that dispute outcomes strictly bifurcate into financial compensation or non-financial explanations.

---

### 3. Submission Channel Processing Friction

![Submission Channel Processing Efficiency](assets/channel_efficiency.png)

#### Business Interpretation & Stakeholder Analysis
* **Digital Portal Dominance:** Web submissions represent **20.4K complaints (89% of total intake)**, demonstrating strong customer transition to digital self-service channels.
* **Extreme Offline Processing Overhead:** Physical **Postal Mail averages 3.49 days** per case, while **Referrals average 2.78 days** and **Phone intakes average 2.06 days**.
* **Turnaround Speed Advantage:** Automated Web submissions process in an average of **0.60 days**. Offline paper mail takes **nearly 6x longer** to process due to manual scanning, physical sorting, and data entry overhead.

---

### 4. Geographic Hotspots & Volume Concentration

![Geographic Hotspots](assets/geographic_hotspots.png)

#### Business Interpretation & Stakeholder Analysis
* **Sunbelt & Coastal Concentration:** Three states—**California (4.7K)**, **Florida (2.5K)**, and **Texas (2.2K)**—drive **over 34% of all national complaint filings**.
* **Market Size & Branch Correlation:** High population density, aggressive retail banking branch footprints, and active state-level regulatory awareness drive heightened escalation rates in top-tier markets.
* **Volume Drop-off:** Beyond New York (**2.0K complaints**), individual state volumes drop significantly below **0.9K cases**, confirming that compliance risk is heavily concentrated in specific major markets.

---

## Strategic Recommendations

### Category A: Operations & Process Engineering
* **Priority Level:** **High (Immediate Action)**
* **Target Issue:** **78% SLA Breach Concentration in Credit Cards & Checking Accounts**
* **Action Plan:** Establish dedicated rapid-response dispute triage squads for retail banking product lines. Implement automated system triggers at **Day 10** for pending retail claims to guarantee resolution prior to the 15-day regulatory SLA breach threshold.

### Category B: Digital Transformation & Channel Strategy
* **Priority Level:** **High (Immediate Action)**
* **Target Issue:** **3.49-Day Processing Lag in Physical Postal Mail**
* **Action Plan:** Deploy Optical Character Recognition (OCR) and automated document ingestion at central mail facilities to digitize physical mailers on Day 1. Integrate digital portal prompts and QR codes into physical statements to shift offline callers and mailers to automated web forms.

### Category C: Customer Resolution & Legal Strategy
* **Priority Level:** **Medium (Structural Optimization)**
* **Target Issue:** **Bank of America Backlog (1.5K Cases) & Settlement Disparities**
* **Action Plan:** Conduct a comprehensive policy audit on settlement guidelines. Benchmark JPMorgan Chase’s explanation routing workflow to standardise resolution criteria, clear pending backlogs, and prevent unnecessary financial payout leakage.

### Category D: Regional Compliance & Risk Management
* **Priority Level:** **Medium (Structural Optimization)**
* **Target Issue:** **34% National Volume Concentration in CA, FL, and TX**
* **Action Plan:** Establish regional compliance review teams dedicated to state-specific regulations in California, Florida, and Texas. Conduct root-cause audits across regional branch networks to resolve recurring service issues before they trigger formal regulatory escalations.

---

## Technical Artifacts & Repository Links

* **Data Cleaning & Inspection Scripts:** The SQL queries used to inspect, clean, and transform the raw CFPB dataset into analytical tables can be found in [`sql/01_data_cleaning.sql`](sql/01_data_cleaning.sql).
