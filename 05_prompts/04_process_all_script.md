Write 04_code/process_all.py - the main pipeline script that reads the Excel
template, classifies all 386 vendors, and generates all 4 required tabs.

Input files:
  - C:/Users/mariu/Downloads/Copy of A - TEMPLATE - RWA - Vendor Spend Strategy (NAME).xlsx
  - 02_working/vendor_db.json

Output files:
  - 03_outputs/<candidate_name>_Vendor_Spend_Strategy.xlsx (4 populated tabs)
  - 03_outputs/vendors_classified.csv

Function specifications:

  load_vendor_db(path: str) -> dict
      Load vendor_db.json. Return dict[str, list[str]].
      Raise FileNotFoundError with helpful message if missing.

  classify_vendor(name: str, db: dict) -> tuple[str, str, str, str]
      Return (department, description, recommendation, match_method).
      Primary: exact match on name.strip().lower() in db.
      Fallback: keyword-based heuristic rules:
        "law|solicitor|legal|attorney"      -> Legal
        "hotel|resort|accommodation"        -> G&A
        "software|cloud|saas|tech"          -> Engineering
        "consult|advisory|professional"     -> Professional Services
        "insurance|insur"                   -> Support
        "market|advertis|media|brand"       -> Marketing
      match_method: "db_exact" or "heuristic_<rule_name>"

  generate_top3(df: DataFrame) -> list[dict]
      Identify 3 highest-impact cost reduction opportunities.
      Each dict: {title, current_spend, vendor_count, savings_pct,
                  savings_dollar, methodology, action_plan, timeline}

  generate_methodology() -> str
      Return methodology text for the Methodology tab.

  generate_executive_memo(df: DataFrame, top3: list) -> str
      Return formatted memo text for the CEOCFO Recommendations tab.

CSV output spec (03_outputs/vendors_classified.csv):
  Columns: vendor_name, spend, department, description, recommendation,
           match_method, confidence
  confidence: "high" for db_exact, "medium" for heuristic, "low" for unmatched
  Encoding: UTF-8 with BOM (for Excel compatibility)
  Delimiter: comma, quoting: all fields

Tracking requirements:
  - Print progress every 50 vendors: "Classified 150/386 (db: 148, heuristic: 2)"
  - Track match method counts: {db_exact: N, heuristic: N, unmatched: N}
  - Log any unmatched vendors to stderr with vendor name and spend

Error handling:
  - If vendor_db.json is missing, exit with code 1 and message
  - If Excel file is missing, exit with code 1 and message
  - If any vendor is unmatched after heuristic, log warning but continue
  - If final count != 386, exit with code 2 and mismatch message

Post-run verification:
  - 386/386 vendors classified (zero unmatched target)
  - Total spend reconciles to $7,887,360.40
  - All 4 tabs present and non-empty in output Excel
  - vendors_classified.csv row count == 386

FOLLOW UP:
Run the script. Print the match method breakdown. If any vendors fell through
to heuristic or unmatched, add them to vendor_db.json and re-run until
db_exact == 386.
