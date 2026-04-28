# Competitor Analysis Agent

## Project Layout

- `competitors.json` — master competitor list (fields: name, url, about)
- `context/` — MyProduct's product overview, features, pricing. Load before insights/brainstorm.
- `reports/` — generated markdown reports (report-YYYY-MM-DD.md)
- `.claude/skills/` — slash-command skills
- `skills/` — human-readable standalone copies
- `watch.sh` — shell script to run automated weekly report via Claude CLI

## Rules

- Competitor source of truth is `competitors.json` — always read it first.
- **Web browsing is restricted.** Only visit URLs explicitly listed in `competitors.json` (`url` and `about` fields). Do NOT search the web, visit any other URLs, or infer/guess additional pages.
- All generated reports go to `reports/report-YYYY-MM-DD.md`.
- Always read `context/` files before insights, brainstorm, or comparison tasks.

## Skills

| Slash Command | Purpose |
|---|---|
| `/compare` | Diff last two weekly snapshots; save report to reports/ |
| `/insights-builder` | Deep comparative study: MyProduct vs competitor(s) |
| `/brainstorm` | Validate idea against features + competitor landscape |
| `/customer-queries` | Extract pain points from customer text or screenshot |

## Automation

Run `./watch.sh` to trigger a full web-search-based competitor report via Claude CLI.
Scope to one competitor: `./watch.sh --competitor "Competitor A"`
Reports auto-save to `reports/report-YYYY-MM-DD.md`.
