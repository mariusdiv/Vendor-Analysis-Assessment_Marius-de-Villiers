Extract all vendor names and spend amounts from the Excel template into a
reproducible flat file for downstream classification.

Input:  C:/Users/mariu/Downloads/Copy of A - TEMPLATE - RWA - Vendor Spend Strategy (NAME).xlsx
        Tab: "Vendor Spend Strategy"
Output: 01_inputs/actual_vendors.txt

File format - pipe-delimited, UTF-8, no BOM, Unix line endings:

    Vendor Name|Spend Amount

Column spec:
  - Vendor Name: raw string exactly as it appears in the Excel cell,
    preserving special characters (Croatian: D.O.O., J.D.O.O., D.D.,
    diacritics such as C, S, Z). Strip leading/trailing whitespace only.
  - Spend Amount: numeric, two decimal places, no currency symbol, no
    thousands separator. Example: 1234567.89

Verification criteria (all must pass):
  1. Row count == 386 (excluding header)
  2. No blank Vendor Name fields (assert len(name.strip()) > 0)
  3. No negative spend amounts
  4. No duplicate vendor names (case-insensitive)
  5. Total spend sums to $7,887,360.40 (tolerance +/- $0.01)
  6. File is valid UTF-8 (open with encoding="utf-8" and read without error)

Print a summary table after extraction:
  - Total vendors, total spend, min/max/median spend, top 5 by spend

Store a SHA-256 hash of actual_vendors.txt in 01_inputs/checksums.txt for
reproducibility verification.

FOLLOW UP:
Compare extracted vendor names against the Excel source. Flag any names
containing only whitespace, numeric-only names, or names shorter than
2 characters. List the top 10 highest-spend vendors for manual review.
