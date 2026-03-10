Build a JSON classification database covering all 386 vendors.

Input:  01_inputs/actual_vendors.txt
Output: 02_working/vendor_db.json

JSON schema (one entry per vendor):

    {
      "<vendor_name_lowercase>": [
        "<Department>",
        "<Description>",
        "<Recommendation>"
      ]
    }

Key rules:
  - key = vendor_name.strip().lower()
  - Keys MUST match the exact vendor names from actual_vendors.txt after
    lowercasing. No invented names. No partial matches.
  - Special characters in Croatian vendor names (D.O.O., J.D.O.O., D.D.)
    must be preserved exactly. Copy names from actual_vendors.txt verbatim
    before lowercasing.

Field constraints:

  Department - exactly one of these 12 values (case-sensitive):
    { Engineering, Facilities, Finance, G&A, Legal, M&A, Marketing,
      Product, Professional Services, SaaS, Sales, Support }

  Description - 4-10 words, specific to the vendor's actual business.
    BAD:  "Business services and operations"
    GOOD: "Enterprise CRM platform and sales automation"
    BAD:  "Professional services provider"
    GOOD: "Big Four audit and tax advisory firm"

  Recommendation - exactly one of: { Consolidate, Terminate, Optimize }

Build in 5 batches to manage context and accuracy:
  Batch 1: SaaS tools, Engineering, Telecom vendors
  Batch 2: Travel, Professional Services, Legal vendors
  Batch 3: Facilities, Insurance, Support, Marketing vendors
  Batch 4: Hotels, Food/Catering, Entertainment vendors
  Batch 5: Croatian businesses (D.O.O., J.D.O.O., D.D.), shipping, misc

After each batch:
  - Print running count (e.g., "Batch 3 complete: 247/386")
  - Validate all keys exist in actual_vendors.txt (case-insensitive match)
  - Validate Department values against the allowed set
  - Validate Recommendation values against the allowed set

Final verification:
  - len(vendor_db) == 386
  - All keys map to a row in actual_vendors.txt
  - No duplicate keys
  - JSON is valid (json.loads succeeds)
  - All Department and Recommendation values are in allowed sets

FOLLOW UP:
Load vendor_db.json and print department distribution (count per department).
Flag any department with fewer than 5 vendors or more than 80 for review.
