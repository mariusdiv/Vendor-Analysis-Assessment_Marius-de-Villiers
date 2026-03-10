# Change Log

## Purpose
Track all manual corrections and adjustments made to vendor data after QA review.

---

## Log Format

| Date | Vendor | Field | Before | After | Reason |
|------|--------|-------|--------|-------|--------|
| 2026-03-09 | (25 vendors) | description | Generic: Business services and operations | Specific descriptions per vendor | Evaluation criteria requires specific descriptions |
| 2026-03-09 | (31 vendors) | description | Vague consulting/freelancer descriptions | Specific service descriptions | Additional specificity pass |
| 2026-03-09 | All SaaS | savings_pct | 15% | 20% | Increased to be meaningful for $1B business |
| 2026-03-09 | All Facilities | savings_pct | 30% | 35% | Increased for consolidation from 26 to 3 vendors |
| 2026-03-09 | All Terminate | savings_pct | 80% | 85% | Increased elimination rate for discretionary spend |
| 2026-03-09 | PS vendors | savings | 0% | 12% | Added consolidation savings via volume discounts |
| 2026-03-10 | Salesforce (Opp #1) | caveat | None | Dependency caveat added | Flagged that we lack visibility into why Salesforce is 39.5% of spend; may reflect operational need |
| 2026-03-10 | Non-SF SaaS vendors | opportunity | None | Conditional Opportunity 4 | Alternative savings path ($60K-$100K) if Salesforce spend cannot be reduced |
| 2026-03-10 | All artefacts | savings_total | $1,274,130 | $710K-$1,274,130 | Savings shown as range: conservative (excl. SF) to full scenario |
| 2026-03-10 | All artefacts | language | Assertive SF claims | Hedged language | Changed "concentration risk" to "concentration question"; removed claims of operational criticality |

---

## Instructions

1. Date: Use ISO format (YYYY-MM-DD)
2. Vendor: Name or group affected
3. Field: Column or parameter changed
4. Before/After: Original and new values
5. Reason: Business logic for the change
