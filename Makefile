# Makefile for Vendor Analysis Pipeline
# Run Python scripts in 04_code/ in the correct order

PYTHON ?= python3
CODE_DIR := 04_code

.PHONY: all classify qa clean help

# Default target: run full pipeline
all: classify qa
	@echo "Pipeline complete."

# Step 1: Classify all 386 vendors and generate Excel output
classify:
	@echo "==> Running vendor classification pipeline..."
	$(PYTHON) $(CODE_DIR)/process_all.py

# Step 2: Run QA validation checks
qa: classify
	@echo "==> Running quality checks..."
	$(PYTHON) $(CODE_DIR)/qa_checks.py

# Show help
help:
	@echo "Vendor Analysis Pipeline Makefile"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all       Run the full pipeline (classify -> qa)"
	@echo "  classify  Step 1: Classify vendors and generate Excel"
	@echo "  qa        Step 2: Run QA checks on output"
	@echo "  clean     Remove generated output files"
	@echo "  help      Show this help message"

# Clean generated outputs
clean:
	@echo "==> Cleaning generated files..."
	rm -f 03_outputs/*.xlsx
	rm -f 03_outputs/*.txt
	@echo "Clean complete."
