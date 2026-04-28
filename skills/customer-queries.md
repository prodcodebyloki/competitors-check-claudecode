# Customer Queries — Skill Reference

**Purpose:** Analyze customer feedback (text or image) to extract pain points, feature requests, sentiment, and competitive gaps.

**Invoke via Claude Code:** `/customer-queries` then paste text or attach image

## Input Types

- **Text:** Paste support tickets, chat logs, reviews, survey responses
- **Image/Screenshot:** Attach screenshot of feedback, review, or support thread
- **Mixed:** Multiple tickets pasted together — analyzed as a batch

## Steps

1. Accept text or image input.
2. Map complaints to `context/features.md` (bug vs gap vs UX).
3. Check competitor `profile.md` files — do they solve this pain?
4. Generate pain point report.

## Output Format

```
# Customer Pain Point Report

## Input Summary
## Pain Points Identified

### 🔴 Critical
- [Pain point]: [quote]
  - Maps to: [feature/gap]
  - Competitor response: [competitor solves this? how?]

### 🟡 Friction
### 🔵 Feature Requests

## Sentiment Summary
- Tone: [Positive / Neutral / Frustrated / Churning]
- Key drivers: [why]

## Competitive Gaps Exposed
[Pain points a competitor already solves = churn risk]

## Recommended Actions
- [ ] [Fix]
- [ ] [Feature priority]
- [ ] [Messaging change]
```

## Key Distinctions

- **Bug** = broken (should work, doesn't)
- **Gap** = missing (never existed)
- **UX issue** = exists but confusing/hard to use
