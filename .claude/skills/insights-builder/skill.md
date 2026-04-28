---
name: insights-builder
description: >
  Deep comparative study between Anthropic and competitor(s). Loads context/ folder
  (product overview, features, pricing) and competitors.json to produce a structured
  competitive analysis. Trigger: /insights-builder, "insights", "compare us to competitor",
  "competitive analysis", "how do we stack up". Optional argument: competitor name.
---

# Insights Builder Skill

Produce a deep comparative study between Anthropic and one or all competitors.

## Steps

1. Read ALL files in `context/` (product-overview.md, features.md, pricing.md).
2. Read `competitors.json` — get name, url, about for each competitor.
3. If `$ARGUMENTS` specifies a competitor, scope to that entry only. Otherwise process all.
4. Browse ONLY the `url` and `about` URLs from `competitors.json` — no other URLs, no web search.
5. Generate the comparative study below.

## Output Format

```
# Competitive Insights Report
Generated: [date]
Scope: Anthropic vs [Competitor Name(s)]

## Executive Summary
[3-5 sentences: overall competitive position, biggest opportunity, biggest risk]

## Feature Comparison

| Capability | Anthropic | [Competitor] | Edge |
|---|---|---|---|
| [Feature area] | ✅ / ❌ / 🔶 Partial | ✅ / ❌ / 🔶 Partial | Us / Them / Tie |

## Positioning Comparison

| Dimension | Anthropic | [Competitor] |
|---|---|---|
| Target buyer | | |
| Key message | | |
| Pricing model | | |
| Go-to-market | | |

## Pricing Delta
[Side-by-side pricing comparison. Note where we're cheaper/expensive and by how much.]

## Strategic Opportunities
1. [Gap competitor has that we could exploit]
2. [Area where we're losing and should respond]
3. [Messaging opportunity]

## Risks
- [Where competitor is stronger or moving fast]

## Recommended Actions
- [ ] [Specific action 1]
- [ ] [Specific action 2]
```

## Rules

- Ground every claim in `context/` files or the competitor URLs provided — do not invent or assume.
- Browse ONLY URLs in `competitors.json`. Do not visit any other pages or run web searches.
- Use ✅ = has it, ❌ = doesn't have it, 🔶 = partial/limited.
- Keep Executive Summary honest — don't spin weaknesses as strengths.
