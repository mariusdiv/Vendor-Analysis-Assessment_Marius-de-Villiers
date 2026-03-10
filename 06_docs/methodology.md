# Methodology

## Overview
Vendor spend diligence assessment covering 386 vendors totaling $7,887,360 in annual spend.
This document describes the end-to-end process used to categorize, describe, and recommend actions for each vendor.

## Tools Used
- Claude Code CLI (claude-opus-4-6) for vendor research and classification
- Python 3 with openpyxl for Excel manipulation
- JSON classification database (vendor_db.json) for reproducible lookups

## Step 1: Data Extraction
Read the Excel template using openpyxl. Extracted 386 vendor names and spend amounts.
Created actual_vendors.txt as a pipe-delimited reference file for verification.
Verified total spend reconciliation: $7,887,360.40.

## Step 2: Classification Database Construction
Built vendor_db.json with 386 entries, each containing [department, description, recommendation].
Constructed in 5 incremental batches to ensure accuracy:
- Batch 1: SaaS tools (48), Engineering (20), Telecom (10)
- Batch 2: Travel, Professional Services, Legal vendors
- Batch 3: Facilities, Insurance/Support, Marketing vendors
- Batch 4: Hotels, Food/Catering, Entertainment vendors
- Batch 5: Croatian businesses (D.O.O., J.D.O.O.), shipping, misc

Fixed 22 vendors with special character encoding (Croatian suffixes).

## Step 3: Classification Pipeline
Two-tier classification approach:
1. Exact match: Lookup vendor name (lowercased) in vendor_db.json
2. Heuristic fallback: Keyword-based rules for any unmatched vendors

Result: All 386 vendors matched via exact DB lookup (0 fallback needed).

## Step 4: Department Taxonomy
12 departments from the Config tab: Engineering, Facilities, G&A, Legal, M&A, Marketing,
SaaS, Professional Services, Support, Finance, Product, Sales.

Classification rules:
- Assign by function (what vendor does), not delivery model
- HR/People operations -> G&A or Professional Services
- IT/Security tools -> Engineering or SaaS
- Insurance/benefits -> Support

## Step 5: Recommendation Framework
- Optimize (237 vendors): Renegotiate terms or right-size contracts
- Consolidate (72 vendors): Reduce vendor count through preferred providers
- Terminate (77 vendors): Eliminate spend with no validated business need

## Step 6: Quality Assurance
6 validation checks + duplicate detection, all passed:
1. Completeness: 386/386 vendors classified (0 blanks)
2. Department validation: All use valid departments from Config tab
3. Recommendation validation: All use Consolidate/Terminate/Optimize
4. Description quality: 0 generic descriptions (verified twice)
5. Tab content: All 4 required tabs populated
6. Spend integrity: Total reconciled to $7,887,360.40
6. Top 10 spot check: Manual verification of highest-spend vendors

## Step 7: Prompts Used
All Claude Code prompts documented in 05_prompts/ directory (9 files).
Each prompt file records the instruction given and actions taken.

## Key Findings
- Salesforce represents 39.5% of total vendor spend ($3.1M) - CRM concentration risk
- 26 facility vendors across 8 countries - fragmented office footprint
- 77 vendors flagged for termination - discretionary spend leakage
- 18 overlapping professional services engagements - consolidation opportunity
- Total estimated savings: $1,274,130 (16.2% of total spend)

## Limitations
- Classification based on vendor name and spend only (no contracts or usage data)
- Some Croatian/international vendors classified with limited public information
- Savings estimates are directional; actual savings depend on contract terms
- Stakeholder review recommended before implementing termination recommendations
