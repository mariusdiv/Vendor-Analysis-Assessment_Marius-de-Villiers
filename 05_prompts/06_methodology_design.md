Write the Methodology tab content for the output Excel workbook.
Target length: 500-700 words. Factual, auditable, reproducible.

Input:  05_prompts/ (this prompt audit trail), 04_code/, 03_outputs/
Output: "Methodology" tab in the output Excel

Include these sections in order:

1. TOOLS AND ENVIRONMENT (50-80 words)
   - Claude Code CLI: model name, invocation method
   - Python version and key libraries: openpyxl, pandas, json, difflib
   - Data structures: vendor_db.json (dict), vendors_classified.csv
   - Operating environment: local execution, no cloud APIs

2. DATA PIPELINE (100-150 words)
   - Step-by-step pipeline from raw Excel to final deliverable
   - Reference actual file paths: 01_inputs/, 02_working/, 03_outputs/
   - Data flow diagram in text form:
       Excel -> actual_vendors.txt -> vendor_db.json -> process_all.py -> Output Excel

3. DEPARTMENT TAXONOMY (80-120 words)
   - List all 12 departments with 1-line classification rule each
   - Tie-break logic: when a vendor could fit multiple departments,
     assign based on primary revenue source
   - Edge cases handled (e.g., IT consulting -> Professional Services
     vs. Engineering)

4. RECOMMENDATION FRAMEWORK (80-100 words)
   - Criteria for each recommendation:
     Optimize: strategic vendor, keep but reduce cost (renegotiate, right-size)
     Consolidate: overlapping vendors in same category, merge to fewer
     Terminate: non-essential, redundant, or low-value vendor
   - Decision tree logic

5. PROMPT AUDIT TRAIL (60-80 words)
   - Reference 05_prompts/01..09 by number and title
   - Note that prompts are stored as-executed for reproducibility
   - State that each prompt was run sequentially through Claude Code CLI

6. QUALITY ASSURANCE (60-80 words)
   - List all validation checks performed (reference 08_quality_checks.md)
   - Duplicate detection methodology (difflib, 85% threshold)
   - Spot-check protocol for top 10 vendors by spend

7. KEY FINDINGS (60-80 words)
   - Total vendors, total spend, department distribution summary
   - Recommendation breakdown: N Optimize, N Consolidate, N Terminate
   - Concentration risk: top vendor as % of total spend

Keep language factual. No marketing tone. Every claim must be verifiable
from the project artefacts.
