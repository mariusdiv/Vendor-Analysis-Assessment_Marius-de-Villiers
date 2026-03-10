Generate the Top 3 Opportunities tab with defensible, data-driven cost
reduction recommendations.

Input:  03_outputs/vendors_classified.csv (386 rows with spend, department,
        recommendation columns)
Output: "Top 3 Opportunities" tab in the output Excel

For each opportunity, include ALL of the following fields:
  - Title (concise, action-oriented)
  - Current annual spend (sum from actual data)
  - Vendor count affected
  - Estimated savings percentage (cite the benchmark source)
  - Estimated savings in dollars (= current_spend * savings_pct)
  - Methodology: show the math explicitly, e.g.:
      "$3,100,000 x 15% enterprise discount = $465,000 annual savings"
  - Action plan (3-5 numbered steps)
  - Implementation timeline (30/60/90 day milestones)
  - Complexity rating: Low / Medium / High
  - Risk factors (1-2 sentences)

Savings methodology constraints:
  - Use ONLY numbers derived from actual vendor data. No invented figures.
  - Cite industry benchmarks by name where applicable (e.g., "Gartner SaaS
    benchmark: 15-25% savings on enterprise license renegotiation").
  - Show explicit arithmetic: spend * percentage = savings
  - Conservative estimates only. Use the LOW end of benchmark ranges.
  - Round dollar savings to nearest $1,000

Selection criteria for the 3 opportunities (rank by impact):
  1. Spend magnitude (higher spend = higher potential savings)
  2. Actionability (can be executed within 6 months)
  3. Feasibility (does not require major org restructuring)

FOLLOW UP:
Salesforce represents $3.1M of the $7.89M total spend (39.5%). This
concentration is a red flag. Research enterprise CRM license optimization:
  - What do Gartner/Forrester benchmarks say about CRM spend as % of revenue?
  - Typical savings from license audit (unused seats, duplicate licenses)?
  - Enterprise Agreement renegotiation leverage points?
Recalculate Opportunity #1 with these benchmarks and cite sources.

Also examine the 26 office/facilities vendors across multiple countries.
What would consolidation from 26 vendors to 3 preferred providers save?
Use FM industry benchmarks (IFMA, CoreNet) for consolidation savings rates.

For the 77 vendors flagged as Terminate: calculate total spend, assume a
realistic 60-75% elimination rate in Year 1 (some contracts have terms),
and project savings with a phase-out timeline.
