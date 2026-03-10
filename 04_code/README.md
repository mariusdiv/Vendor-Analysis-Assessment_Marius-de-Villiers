# Code

Pipeline scripts for vendor classification and Excel generation.

- `process_all.py` - Main pipeline: reads template, classifies 386 vendors, generates all 4 Excel tabs
- `qa_checks.py` - QA validation: completeness, department/recommendation validity, description quality
- `vendor_db.json` - Classification database: 386 vendor entries with [department, description, recommendation]
