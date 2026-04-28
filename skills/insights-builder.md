# Insights Builder — Skill Reference

**Purpose:** Deep comparative study — MyProduct vs competitor(s). Loads all context files.

**Invoke via Claude Code:** `/insights-builder` or `/insights-builder <competitor-name>`

## Steps

1. Read all `context/` files (product-overview, features, pricing).
2. Read `competitors/_index.md`.
3. Read target competitor `profile.md` + latest snapshot (or all if no arg).
4. Generate comparative study.

## Output Format

```
# Competitive Insights Report
Generated: [date]
Scope: MyProduct vs [Competitor(s)]

## Executive Summary
[3-5 sentences]

## Feature Comparison
| Capability | MyProduct | Competitor | Edge |

## Positioning Comparison
| Dimension | MyProduct | Competitor |

## Pricing Delta
[Side-by-side]

## Strategic Opportunities
1. [Opportunity]

## Risks
- [Risk]

## Recommended Actions
- [ ] [Action]
```

## Legend

- ✅ Has it  |  ❌ Doesn't have it  |  🔶 Partial/Limited
