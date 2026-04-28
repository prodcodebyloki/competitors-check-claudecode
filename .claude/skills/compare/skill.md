---
name: compare
description: >
  Generate a summarized comparison report between last week and this week for competitors.
  Reads competitors.json for the competitor list, then diffs the two most recent report
  files in reports/. Saves new report to reports/report-YYYY-MM-DD.md.
  Trigger: /compare, "compare competitors", "what changed this week", "weekly diff".
  Optional argument: competitor name to scope to one competitor.
---

# Compare Skill

Generate a structured weekly diff report by comparing the two most recent reports in `reports/`.

## Steps

1. Read `competitors.json` to get competitor list (fields: name, url, about).
2. List files in `reports/` — find the two most recent `report-YYYY-MM-DD.md` files.
3. If `$ARGUMENTS` is provided, scope output to that competitor section only.
4. Diff the two reports per competitor and produce a summary.
5. Save result to `reports/report-YYYY-MM-DD.md` (today's date).

## Output Format

```
# Competitor Weekly Comparison Report
Period: [older date] → [newer date]
Saved: reports/report-[date].md

## [Competitor Name]
Tracked Page: [url from competitors.json]

### Changes Detected
- [Specific change 1]

### Unchanged
- [Area that stayed the same]

### Signal
[1-2 sentence strategic takeaway]

---

## Key Takeaways
- [Top 3 cross-competitor signals this week]
```

## Flags

- `⚠️ PRICING CHANGE`
- `🆕 NEW FEATURE`
- `🗑️ REMOVED`

If fewer than 2 reports exist: "Not enough history to compare — run watch.sh first."
Always confirm: "Report saved to reports/report-[date].md"
