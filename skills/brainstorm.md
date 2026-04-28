# Brainstorm — Skill Reference

**Purpose:** Validate an idea against current features, product vision, and competitor landscape.

**Invoke via Claude Code:** `/brainstorm <your idea>`

## Steps

1. Takes idea as argument (prompts if missing).
2. Checks `context/features.md` — already built / partial / gap?
3. Checks `context/product-overview.md` — vision + market fit.
4. Checks `context/pricing.md` — pricing model impact.
5. Checks all competitor `profile.md` files — do they have it?

## Output Format

```
# Brainstorm: [Idea]

## Idea Summary
## Existing Coverage
## Fit Check
- Vision fit: ✅ / ❌ / 🔶
- Target market fit: ✅ / ❌ / 🔶
- Pricing impact: [none / minor / significant]

## Competitor Landscape
| Competitor | Have it? | Notes |

## Differentiation Score: [1-5]
Reason: [justification]

## Risks
## Recommended Next Steps
```

## Differentiation Score Guide

| Score | Meaning |
|---|---|
| 1 | Commodity — everyone has it |
| 3 | Partial differentiation |
| 5 | Genuinely unique |
