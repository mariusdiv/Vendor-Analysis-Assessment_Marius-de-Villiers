Create the project directory tree for a vendor-spend diligence assessment.
Input: C:/Users/mariu/Downloads/Copy of A - TEMPLATE - RWA - Vendor Spend Strategy (NAME).xlsx
Candidate: Marius de Villiers | Role: VP of Operations

Build the following directory structure at the project root:

    00_admin/          - admin artefacts, evaluation rubric
    01_inputs/         - raw data extracts, source Excel copy
    02_working/        - intermediate files, vendor_db.json, scratch
    03_outputs/        - final deliverables (Excel, CSV, reports)
    04_code/           - Python scripts (process_all.py, helpers)
    05_prompts/        - this prompt audit trail (01..09)
    06_docs/           - methodology write-up, README, changelog

Place a README.md in each numbered directory describing:
  - purpose of the folder
  - expected input/output files with formats
  - upstream/downstream dependencies (which step feeds this folder)

Create a top-level README.md with:
  - project title, candidate name, date
  - pipeline overview (steps 01-09 in order)
  - how to reproduce (prerequisites, run order)
  - total vendor count (386) and total spend ($7,887,360.40)

Create a Makefile with targets: extract, classify, build, check, clean.

Verify the input Excel contains these tabs:
  - "Vendor Spend Strategy" (386 vendor rows with Name, Spend columns)
  - "Config" (12 department names)
  - "Top 3 Opportunities" (blank template)
  - "Methodology" (blank template)
  - "CEOCFO Recommendations" (blank template)

FOLLOW UP:
Confirm directory tree matches spec. Run `find . -name README.md` and verify
one README per numbered folder. Print file counts per directory.
