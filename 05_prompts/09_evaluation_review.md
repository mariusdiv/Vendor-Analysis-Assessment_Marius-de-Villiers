Perform a final self-evaluation of the complete submission against the
assessment rubric. Fix any gaps before final delivery.

Input:  All project artefacts (03_outputs/, 04_code/, 05_prompts/, 06_docs/)
Output: 03_outputs/evaluation_checklist.md

Evaluation criteria checklist - score each as PASS or FAIL:

CRITERION 1: VENDOR CLASSIFICATION ACCURACY
  - All 386 vendors classified (zero unmatched)
  - Department assignments are defensible (spot-check 20 random vendors)
  - No obvious misclassifications in top 50 by spend
  Pass: 386/386 classified, zero misclassifications in spot check

CRITERION 2: DESCRIPTION SPECIFICITY
  - Every description is specific to the vendor's actual business
  - No generic descriptions ("Business services", "Various services")
  - Descriptions are 4-10 words, informative to someone unfamiliar with the vendor
  Pass: zero generic descriptions, all within word count range

CRITERION 3: RECOMMENDATION QUALITY
  - Recommendations are logically justified given vendor type and spend
  - High-spend strategic vendors are Optimize (not Terminate)
  - Redundant/overlapping vendors are Consolidate
  - Low-value, non-essential vendors are Terminate
  Pass: logical consistency across all 386 recommendations

CRITERION 4: TOP 3 OPPORTUNITIES + CONDITIONAL OPPORTUNITY
  - Identifies real, high-impact cost reduction opportunities
  - Dollar amounts are derived from actual data (not invented)
  - Savings percentages cite industry benchmarks
  - Action plans are specific and implementable within stated timelines
  - Salesforce caveat: explicitly states we lack visibility into why the
    39.5% concentration exists; does NOT assert it is operationally critical,
    only that this is possible and must be investigated
  - Conditional Opportunity 4 provides alternative savings path if Salesforce
    spend cannot be reduced
  - Total savings shown as a range (conservative and full scenarios)
  Pass: all 3+1 opportunities have verifiable math, credible benchmarks,
  and appropriately hedged Salesforce language

CRITERION 5: METHODOLOGY DOCUMENTATION
  - Describes how Claude Code CLI was leveraged at each pipeline step
  - References the prompt audit trail (05_prompts/01..09)
  - Pipeline is reproducible from the documentation alone
  - Includes quality check descriptions
  Pass: methodology is complete, references actual files, reproducible

CRITERION 6: EXECUTIVE MEMO FORMAT
  - Proper business memo format (TO/FROM/DATE/RE)
  - 400-500 words
  - Dollar impacts meaningful for a $1B+ enterprise
  - Risk mitigation table with 5 rows (including Salesforce concentration caveat)
  - 4-phase implementation timeline (Phase 0: Salesforce assessment)
  - Savings presented as a range ($710K-$1.27M), not a single figure
  Pass: correct format, within word limit, all required sections present

CRITERION 7: DATA INTEGRITY
  - Total spend reconciles to $7,887,360.40
  - 386 vendor count is consistent across all artefacts
  - CSV, JSON, and Excel outputs are internally consistent
  - No data corruption or encoding errors (especially Croatian characters)
  Pass: all totals match, zero encoding errors

CRITERION 8: PROJECT ORGANIZATION
  - Numbered directory structure (00-06)
  - README in each folder
  - Clear file naming conventions
  - Prompt audit trail is complete (01-09)
  - Code is runnable (process_all.py executes without errors)
  Pass: all directories present, all READMEs present, code runs clean

Write the checklist to 03_outputs/evaluation_checklist.md with PASS/FAIL
for each criterion and specific notes on any issues found.

If any criterion is FAIL:
  1. Identify the specific gap
  2. Fix it (update vendor_db.json, regenerate output, edit methodology, etc.)
  3. Re-run quality checks (08)
  4. Re-evaluate until all 8 criteria are PASS

Final output should state: "SUBMISSION READY: 8/8 criteria passed" or list
remaining gaps with remediation steps.
