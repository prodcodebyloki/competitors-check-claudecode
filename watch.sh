#!/usr/bin/env bash
# Competitor watch — generates a weekly report via Claude Code
# Usage: ./watch.sh
#        ./watch.sh --competitor "Competitor A"   (single competitor)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPETITORS_FILE="$SCRIPT_DIR/competitors.json"
REPORTS_DIR="$SCRIPT_DIR/reports"
DATE=$(date +%Y-%m-%d)
REPORT_FILE="$REPORTS_DIR/report-$DATE.md"

# Optional single-competitor filter
FILTER=""
if [[ "${1:-}" == "--competitor" && -n "${2:-}" ]]; then
  FILTER="$2"
fi

mkdir -p "$REPORTS_DIR"

# Build competitor context string from competitors.json
if command -v python3 &>/dev/null; then
  COMPETITOR_LIST=$(python3 - <<'PYEOF'
import json, sys, os
path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "competitors.json")
with open(path) as f:
    data = json.load(f)
for c in data:
    print(f"- {c['name']}: {c['url']} (about: {c['about']})")
PYEOF
)
elif command -v node &>/dev/null; then
  COMPETITOR_LIST=$(node -e "
const data = require('./competitors.json');
data.forEach(c => console.log(\`- \${c.name}: \${c.url} (about: \${c.about})\`));
")
else
  echo "Error: python3 or node required to parse competitors.json" >&2
  exit 1
fi

if [[ -n "$FILTER" ]]; then
  COMPETITOR_LIST=$(echo "$COMPETITOR_LIST" | grep -i "$FILTER" || true)
  if [[ -z "$COMPETITOR_LIST" ]]; then
    echo "No competitor matching '$FILTER' found in competitors.json" >&2
    exit 1
  fi
fi

PROMPT="You are a competitive intelligence analyst. Today is $DATE.

## Competitors to monitor
$COMPETITOR_LIST

## Task
For each competitor above:
1. Visit ONLY the exact URLs listed above (url and about fields) — no other URLs
2. Do NOT search the web or visit any pages not explicitly listed in the competitor data
3. Extract from those pages only: new features, pricing changes, blog posts, API changes, partnerships, model releases from the past 7 days

## Output
Write a markdown report with EXACTLY this structure and save it to: $REPORT_FILE

\`\`\`
# Competitor Watch Report — $DATE

## [Competitor Name]
- **[Feature/Release name]** — [1-2 sentence summary of what it is and why it matters]

(repeat per finding; if nothing found: \"No major releases this week\")

---

## Key Takeaways
- [Top 3 most impactful things that happened this week across all competitors]
\`\`\`

## Rules
- ONLY browse URLs provided in the competitor list above — no web search, no inferred URLs
- Only include activity from the past 7 days
- 1-2 sentences per item max
- Focus on: new models, API changes, pricing updates, product launches, major partnerships
- After writing the file, print its full path and the word DONE on the last line"

echo "Running competitor watch for $DATE..."
echo "Competitors:"
echo "$COMPETITOR_LIST"
echo ""

claude --print "$PROMPT"

if [[ -f "$REPORT_FILE" ]]; then
  echo ""
  echo "Report saved: $REPORT_FILE"
else
  echo ""
  echo "Note: Claude did not write the file directly — copy the output above into $REPORT_FILE"
fi
