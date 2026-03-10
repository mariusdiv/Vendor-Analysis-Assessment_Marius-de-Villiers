# Batch Log: vendor_db.json Construction

> **File**: `04_code/vendor_db.json`
> **Total Vendors**: 386
> **Total Spend**: $7,887,360.40
> **Batches**: 5
> **Date**: 2025-03-09

---

## Overview

The vendor classification database (`vendor_db.json`) was built in five
sequential batches. Each batch was submitted to an LLM with the vendor name
and annual spend, and the model returned a department assignment, a one-line
description, and a recommendation (Consolidate / Optimize / Terminate).

The JSON file maps each lowercase vendor name to a three-element array:

```json
"vendor name": ["Department", "One-line description.", "Recommendation"]
```

---

## Batch Summary

| Batch | Index Range | Vendors | Departments Covered | Primary Recommendations |
|-------|-------------|---------|---------------------|------------------------|
| 001   | 0 -- 77     | 78      | SaaS, Engineering   | Optimize (70), Consolidate (8) |
| 002   | 78 -- 139   | 62      | PS, Legal, Finance, G&A, Engineering, M&A | Consolidate (39), Optimize (22), Terminate (1) |
| 003   | 140 -- 210  | 71      | Support, Facilities, Marketing, Legal | Optimize (49), Consolidate (22) |
| 004   | 211 -- 275  | 65      | G&A, Marketing      | Terminate (60), Optimize (5) |
| 005   | 276 -- 385  | 110     | G&A, Engineering, PS, Finance, Facilities, Support, Marketing, Legal | Optimize (91), Terminate (16), Consolidate (3) |

---

## Batch 001 -- SaaS & Engineering Core

- **Index range**: 0 -- 77
- **Vendor count**: 78
- **Department breakdown**:
  - SaaS: 48
  - Engineering: 30
- **Recommendation breakdown**:
  - Optimize: 70
  - Consolidate: 8
- **Notes**: First batch focused on the technology stack -- SaaS subscriptions
  and engineering tools. The overwhelming majority were flagged for
  optimization rather than termination, reflecting their operational
  necessity.

---

## Batch 002 -- Professional Services & Advisory

- **Index range**: 78 -- 139
- **Vendor count**: 62
- **Department breakdown**:
  - Professional Services: 27
  - Legal: 11
  - Finance: 10
  - G&A: 6
  - Engineering: 5
  - M&A: 3
- **Recommendation breakdown**:
  - Consolidate: 39
  - Optimize: 22
  - Terminate: 1
- **Notes**: This batch covered consulting, legal, and financial advisory
  vendors. The high consolidation count (63%) suggests significant overlap
  among professional-services providers. All three M&A vendors in the
  database appear in this batch.

---

## Batch 003 -- Support, Facilities & Marketing

- **Index range**: 140 -- 210
- **Vendor count**: 71
- **Department breakdown**:
  - Support: 31
  - Facilities: 23
  - Marketing: 12
  - Legal: 5
- **Recommendation breakdown**:
  - Optimize: 49
  - Consolidate: 22
- **Notes**: Operational vendors -- customer support platforms, office and
  facility services, and marketing tools. No terminations were recommended
  in this batch, indicating these vendors are considered essential but
  could benefit from better contract terms or consolidation.

---

## Batch 004 -- G&A Tail Spend

- **Index range**: 211 -- 275
- **Vendor count**: 65
- **Department breakdown**:
  - G&A: 61
  - Marketing: 4
- **Recommendation breakdown**:
  - Terminate: 60
  - Optimize: 5
- **Notes**: The G&A tail-spend batch. Over 92% of vendors here were
  flagged for termination, making this the highest-risk batch. These are
  predominantly low-value general and administrative vendors where the
  relationship cost likely exceeds the benefit.

---

## Batch 005 -- Residual & Special Characters

- **Index range**: 276 -- 385
- **Vendor count**: 110
- **Department breakdown**:
  - G&A: 59
  - Engineering: 17
  - Professional Services: 13
  - Finance: 7
  - Facilities: 5
  - Support: 5
  - Marketing: 2
  - Legal: 2
- **Recommendation breakdown**:
  - Optimize: 91
  - Terminate: 16
  - Consolidate: 3
- **Notes**: The final catch-all batch included the remaining unclassified
  vendors. This batch contains all 11 vendors with non-ASCII or special
  characters in their names. The broad department spread reflects the
  residual nature of this batch.

---

## Aggregate Statistics

### By Department

| Department             | Count | Share  |
|------------------------|------:|-------:|
| G&A                    |   126 | 32.6%  |
| Engineering            |    52 | 13.5%  |
| SaaS                   |    48 | 12.4%  |
| Professional Services  |    40 | 10.4%  |
| Support                |    36 |  9.3%  |
| Facilities             |    28 |  7.3%  |
| Legal                  |    18 |  4.7%  |
| Marketing              |    18 |  4.7%  |
| Finance                |    17 |  4.4%  |
| M&A                    |     3 |  0.8%  |
| **Total**              | **386** | **100%** |

### By Recommendation

| Recommendation | Count | Share  |
|----------------|------:|-------:|
| Optimize       |   237 | 61.4%  |
| Terminate      |    77 | 19.9%  |
| Consolidate    |    72 | 18.7%  |
| **Total**      | **386** | **100%** |

---

## Data-Quality Notes

1. **Departments Product and Sales** are defined in the Config tab of the
   output workbook but are not assigned to any vendor in `vendor_db.json`.
2. **11 vendors** contain non-ASCII characters (accents, special symbols).
   All appear in Batch 005 (indices 276 -- 385).
3. Every vendor has exactly three fields (department, description,
   recommendation) with no nulls or empty strings.
4. The sum of vendor counts across all five batches equals the total
   database size: 78 + 62 + 71 + 65 + 110 = **386**.
