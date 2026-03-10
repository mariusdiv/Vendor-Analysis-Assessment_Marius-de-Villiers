# Data Dictionary

## Overview
This document defines all datasets produced during the vendor analysis pipeline.

---

## Dataset: vendor_db.json
**Location:** 04_code/
**Description:** Classification database mapping vendor names to department, description, and recommendation.

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| key | string | Lowercased vendor name | salesforce uk ltd-uk |
| value[0] | string | Department assignment | SaaS |
| value[1] | string | One-line vendor description | Enterprise CRM platform and customer engagement suite |
| value[2] | string | Recommendation | Optimize |

---

## Dataset: actual_vendors.txt
**Location:** 01_inputs/
**Description:** Pipe-delimited extract of raw vendor names and spend amounts.

| Column | Type | Description |
|--------|------|-------------|
| Vendor Name | string | Original vendor name from Excel |
| Spend Amount | float | Last 12 months cost in USD |

---

## Output: Vendor Analysis Assessment Excel
**Location:** 03_outputs/
**Description:** Final deliverable with 5 sheets.

### Tab: Vendor Spend Strategy
| Column | Type | Description | Allowed Values |
|--------|------|-------------|----------------|
| Vendor Name | string | Original vendor name | Any |
| Last 12 months Cost (USD) | float | Annual spend | Positive numbers |
| Department | string | Assigned department | See Departments below |
| 1-line Description | string | What the vendor does | Specific description |
| Suggestions | string | Recommendation | Consolidate / Terminate / Optimize costs |

### Tab: Top 3 Opportunities
Structured analysis of three highest-impact cost reduction opportunities plus one conditional opportunity (SaaS portfolio rationalization, pending Salesforce assessment).

### Tab: Methodology
Documentation of tools, approach, and quality assurance steps.

### Tab: CEOCFO Recommendations
Executive memo with findings, recommendations, timeline, and risks.

---

## Controlled Value Lists

### Departments (12)
Engineering, Facilities, G&A, Legal, M&A, Marketing, SaaS, Product, Professional Services, Sales, Support, Finance

### Recommendations (3)
- Consolidate: Reduce vendor count through preferred provider programs
- Terminate: Eliminate spend with no validated business need
- Optimize costs: Renegotiate terms or right-size existing contracts

### Department Distribution
| Department | Count | Spend |
|------------|-------|-------|
| G&A | 131 | Largest by vendor count |
| Engineering | 50 | Cloud/telecom/dev tools |
| SaaS | 48 | Salesforce-dominated |
| Professional Services | 40 | Consulting/advisory |
| Support | 36 | Insurance/benefits |
| Facilities | 26 | Office/coworking |
| Legal | 18 | Law firms |
| Finance | 17 | Audit/accounting |
| Marketing | 17 | PR/events |
| M&A | 3 | Advisory |
