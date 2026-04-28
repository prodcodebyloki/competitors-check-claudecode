---
name: session-summary
description: >
  Summarize the current Claude Code session — decisions made, context added, competitors
  researched, reports generated, and open threads. Saves to reports/session-YYYY-MM-DD.md.
  Trigger: /session-summary, "summarize session", "what did we do", "session recap",
  "end of session", "wrap up".
---

# Session Summary Skill

Generate a structured summary of the current session and save it to `reports/`.

## Steps

1. Reflect on the full conversation so far in this session.
2. Identify: what was researched, what files were changed, what decisions were made, what was left open.
3. Save the summary to `reports/session-YYYY-MM-DD.md` (today's date).

## Output Format

```
# Session Summary — [DATE]

## What We Did
- [Action 1 — e.g. "Added Mistral to competitors.json"]
- [Action 2 — e.g. "Ran /compare, found OpenAI dropped free tier limits"]
- [Action 3]

## Key Decisions
- [Decision + reason — e.g. "Scoped URL browsing to competitors.json only — reduce noise + token cost"]

## Context Updated
- [File changed] — [what changed and why]
  (e.g. context/pricing.md — added enterprise tier after sales call)

## Competitors Researched
| Competitor | Pages Visited | Key Finding |
|---|---|---|
| [Name] | [url] | [1-line finding] |

## Reports Generated
- [report filename] — [1-line summary of what it covered]

## Open Threads
- [ ] [Unresolved question or follow-up action]
- [ ] [Something to revisit next session]

## Next Session Priorities
1. [Highest priority thing to do next]
2. [Second priority]
```

## Rules

- Be factual — only include things that actually happened in this session.
- Open Threads = anything mentioned but not resolved. Don't skip these.
- If no competitors were researched, omit that section.
- If no context files were updated, omit that section.
- Always confirm: "Session summary saved to reports/session-[date].md"
