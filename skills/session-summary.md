# Session Summary — Skill Reference

**Purpose:** Summarize the current Claude Code session — decisions, context changes, reports generated, and open threads. Saves to `reports/`.

**Invoke via Claude Code:** `/session-summary`

## Steps

1. Reflect on the full conversation in the current session.
2. Identify: what was researched, what files changed, what decisions were made, what's unresolved.
3. Save to `reports/session-YYYY-MM-DD.md`.

## Output Format

```
# Session Summary — [DATE]

## What We Did
- [Action taken]

## Key Decisions
- [Decision + reason]

## Context Updated
- [File] — [what changed and why]

## Competitors Researched
| Competitor | Pages Visited | Key Finding |

## Reports Generated
- [filename] — [summary]

## Open Threads
- [ ] [Unresolved item]

## Next Session Priorities
1. [Priority 1]
2. [Priority 2]
```

## Rules

- Factual only — what actually happened in this session.
- Always include Open Threads — unresolved items are the most valuable part.
- Omit sections that don't apply (no competitors researched → skip that table).
