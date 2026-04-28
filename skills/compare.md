# Compare — Skill Reference

**Purpose:** Weekly diff report across all (or one) competitor's snapshots. Saves to `reports/`.

**Invoke via Claude Code:** `/compare` or `/compare <competitor-name>`
**Automate:** `./watch.sh` (full web-based report) or `./watch.sh --competitor "Name"`

## Steps

1. Read `competitors.json` for competitor list (name, url, about).
2. Scope to named competitor if argument provided, else all.
3. For each: find two most recent `competitors/<slug>/snapshots/YYYY-WW.md` files.
4. Diff and produce report → save to `reports/report-YYYY-MM-DD.md`.

## Output Format

```
# Competitor Weekly Comparison Report
Period: [older week] → [newer week]

## [Competitor Name]
Tracked Page: [url]

### Changes Detected
- [Change]

### Unchanged
- [Stable area]

### Signal
[Strategic takeaway]

---

## Key Takeaways
- [Top 3 cross-competitor signals]
```

## Flags

- `⚠️ PRICING CHANGE`
- `🆕 NEW FEATURE`
- `🗑️ REMOVED`
