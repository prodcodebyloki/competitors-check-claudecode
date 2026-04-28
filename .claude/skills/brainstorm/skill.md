---
name: brainstorm
description: >
  Validate and develop an idea by checking it against Anthropic's current features,
  roadmap, and the competitor landscape. Takes the idea as $ARGUMENTS.
  Trigger: /brainstorm <idea>, "brainstorm", "what if we built", "should we add".
  Requires an idea as argument — prompt for one if missing.
---

# Brainstorm Skill

Validate and develop an idea. Takes `$ARGUMENTS` as the idea to evaluate.

## Steps

1. If `$ARGUMENTS` is empty, ask: "What's the idea you want to brainstorm?"
2. Read `context/features.md` — does this already exist, partially exist, or is it missing?
3. Read `context/product-overview.md` — does this fit the vision and target market?
4. Read `context/pricing.md` — does this affect pricing model or tier logic?
5. Read `competitors.json` — for each competitor, browse ONLY their `url` and `about` URLs. Do not visit any other pages or run web searches.
6. Generate the brainstorm report.

## Output Format

```
# Brainstorm: [Idea]

## Idea Summary
[Restate the idea in 1-2 sentences to confirm understanding]

## Existing Coverage
- Already built: [what we have that overlaps]
- Partially covered: [related features]
- Gap: [what's genuinely new]

## Fit Check
- Vision fit: ✅ / ❌ / 🔶 — [reason]
- Target market fit: ✅ / ❌ / 🔶 — [reason]
- Pricing model impact: [none / adds tier / changes limits]

## Competitor Landscape
| Competitor | Do they have this? | Notes |
|---|---|---|
| [Name] | ✅ / ❌ / 🔶 | [how they do it / gap] |

## Differentiation Score: [1-5]
[1 = everyone has it, 5 = genuinely unique]
Reason: [why this score]

## Risks
- [Technical risk]
- [Market risk]
- [Cannibalizes existing feature?]

## Recommended Next Steps
1. [Concrete action]
2. [Validation experiment]
3. [Who to talk to]
```

## Rules

- Don't just say "interesting idea" — be direct about fit and feasibility.
- Differentiation score must be justified, not flattering.
- If competitors already do this well, say so plainly.
- Only browse URLs listed in `competitors.json` — no web search, no guessed URLs.
