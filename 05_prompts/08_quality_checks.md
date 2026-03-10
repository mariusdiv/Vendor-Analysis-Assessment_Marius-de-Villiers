Run comprehensive quality checks on the output deliverables.
Write results to 03_outputs/quality_check_report.md in markdown format.

Input files:
  - 03_outputs/<output_excel>.xlsx
  - 03_outputs/vendors_classified.csv
  - 02_working/vendor_db.json

Exit codes: 0 = all checks pass, 1 = any check fails.

CHECK 1: COMPLETENESS
  - vendors_classified.csv row count == 386
  - No blank vendor_name, department, description, or recommendation fields
  - All 4 Excel tabs present: Vendor Spend Strategy, Top 3 Opportunities,
    Methodology, CEOCFO Recommendations
  Pass criteria: 386/386 rows, zero blanks, 4 tabs

CHECK 2: DEPARTMENT VALIDATION
  Allowed values (case-sensitive):
    { Engineering, Facilities, Finance, G&A, Legal, M&A, Marketing,
      Product, Professional Services, SaaS, Sales, Support }
  - Every department value must be in the allowed set
  Pass criteria: zero invalid department values

CHECK 3: RECOMMENDATION VALIDATION
  Allowed values: { Consolidate, Terminate, Optimize }
  - Every recommendation value must be in the allowed set
  Pass criteria: zero invalid recommendation values

CHECK 4: DESCRIPTION QUALITY
  Reject descriptions matching these generic patterns:
    "Business services", "Various services", "Professional services provider",
    "General business", "Services and solutions", "Business operations"
  - Flag any description with fewer than 3 words or more than 15 words
  Pass criteria: zero generic descriptions, all within word count range

CHECK 5: SPEND INTEGRITY
  - Sum of all spend values == $7,887,360.40 (tolerance: +/- $0.01)
  - No negative spend values
  - No zero spend values (flag as warning, not failure)
  Pass criteria: total within tolerance, zero negatives

CHECK 6: DUPLICATE DETECTION
  Use difflib.SequenceMatcher to find near-duplicate vendor names:
  - Threshold: 85% similarity ratio
  - Compare all pairs (use sorted list + adjacent comparison for efficiency,
    then full O(n^2) for names within same department)
  - Report duplicates as: "DUPLICATE: 'Vendor A' ~ 'Vendor B' (similarity: 0.87)"
  Pass criteria: zero unresolved duplicates (known duplicates may be whitelisted)

CHECK 7: TOP 10 SPOT CHECK
  - List the 10 highest-spend vendors with all fields
  - Verify department assignment is reasonable for each
  - Verify description is specific (not generic)
  Pass criteria: manual review (print for inspection)

AGGREGATION TABLES (append to report):

  Table 1 - Department Summary:
    | Department | Vendor Count | Total Spend | Avg Spend | % of Total |

  Table 2 - Recommendation Summary:
    | Recommendation | Vendor Count | Total Spend | % of Total |

  Table 3 - Top 25 Vendors by Spend:
    | Rank | Vendor Name | Spend | Department | Recommendation |

Output format: Markdown with pass/fail badges per check, e.g.:
  - [PASS] Check 1: Completeness - 386/386 vendors, 4/4 tabs
  - [FAIL] Check 4: Description Quality - 3 generic descriptions found

Print summary line: "Quality Check: X/7 passed"

If any check fails, list specific failing items with enough detail to fix
them (vendor name, current value, expected value).

FOLLOW UP:
If any descriptions are flagged as generic, update vendor_db.json with
specific descriptions and regenerate the output. Re-run quality checks
until all 7 checks pass.
