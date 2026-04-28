---
name: customer-queries
description: >
  Analyze customer feedback, support text, or screenshots to extract pain points,
  feature requests, sentiment, and map findings to the competitive landscape.
  Accepts text pasted inline or image attachments. Trigger: /customer-queries,
  "analyze customer feedback", "what are customers asking for", "customer pain points".
---

# Customer Queries Skill

Extract structured insights from customer feedback — text or image input.

## Steps

1. Accept input as either: pasted text, support ticket, chat log, review, OR an attached screenshot/image.
2. Read `context/features.md` — map complaints to existing features (is this a bug, gap, or UX issue?).
3. Read `competitors.json` — for competitor context, browse ONLY the `url` and `about` fields listed. Do not search the web or visit any other URLs.
4. Generate the pain point report.

## Input Handling

- **Text:** Analyze as-is. Handle multiple tickets/reviews if pasted together.
- **Image/Screenshot:** Read the visible text and UI. Describe what you see, then analyze.
- **No input:** Ask "Please paste the customer feedback or attach a screenshot."

## Output Format

```
# Customer Pain Point Report

## Input Summary
[1-2 sentences describing the input: type, volume, source if mentioned]

## Pain Points Identified

### 🔴 Critical (blocks usage or causes churn risk)
- [Pain point]: [exact quote or description]
  - Maps to: [existing feature / gap / bug]
  - Competitor response: [does a competitor solve this?]

### 🟡 Friction (annoying but not blocking)
- [Pain point]: [exact quote or description]
  - Maps to: [existing feature / gap]
  - Competitor response: [does a competitor solve this?]

### 🔵 Feature Requests
- [Request]: [exact quote or description]
  - Currently: [do we have it? partial?]
  - Competitor response: [do competitors have it?]

## Sentiment Summary
- Overall tone: [Positive / Neutral / Frustrated / Churning]
- Key emotional drivers: [what's making them feel this way]

## Competitive Gaps Exposed
[Pain points where a competitor already has a solution — highest-priority churn risks]

## Recommended Actions
- [ ] [Immediate fix / response]
- [ ] [Feature to prioritize]
- [ ] [Message to address in marketing/docs]
```

## Rules

- Quote customer language exactly where possible — don't sanitize their words.
- Distinguish bugs (broken) from gaps (missing) from UX issues (confusing).
- Flag competitive gaps separately — those are highest-priority churn signals.
- Only browse URLs listed in `competitors.json` — no web search, no guessed URLs.
- If image is blurry or text is unreadable, say so and ask for a clearer version.
