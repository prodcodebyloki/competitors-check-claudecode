# Competitor Intelligence Agent

## What this is NOT

Most competitor tools are **news collators** — they scrape headlines, aggregate RSS feeds, and dump a list of links. You still have to read everything, form your own opinions, and figure out what it means for your product.

This is different.

---

## What this actually does

This agent is a **reasoning layer on top of your own context**. It doesn't just fetch — it thinks.

Every skill loads your `context/` folder (product overview, features, pricing) before it does anything. That means when it reads a competitor's page, it already knows who you are, what you've built, and what you charge. The output is never "here's what OpenAI shipped" — it's "here's what OpenAI shipped, and here's what it means for you specifically."

| News Collator | This Agent |
|---|---|
| Fetches headlines | Reads + reasons |
| No product context | Knows your features, pricing, roadmap |
| Generic summaries | Gaps, risks, and opportunities relative to you |
| You interpret the signal | Signal is pre-interpreted |
| Same output for everyone | Output is unique to your product |

---

## Why token cost stays low

Three reasons:

**1. Controlled browsing.**
The agent only visits URLs you explicitly list in `competitors.json`. No open-ended web search, no crawling, no pagination. Two pages per competitor per run — that's it.

**2. Structured prompts.**
Every skill has a tight output format. The model isn't asked to "write everything you know" — it fills a defined template. Short inputs, short outputs, no padding.

**3. Context is files, not conversation.**
Your product knowledge lives in `context/` as flat markdown files. They're read once per invocation, not re-explained in every message. As you refine those files, the quality goes up — the token count doesn't.

---

## How context improves over time

This is the compounding advantage.

On day one, `context/` has your basic product overview. The agent gives you decent analysis.

Over weeks, you:
- Add pricing nuance you've learned from sales calls
- Add features your roadmap moved forward or killed
- Add a "known weaknesses" section after a lost deal
- Add a new competitor to `competitors.json`

The agent doesn't need to be retrained. It reads your files fresh every run. Every improvement you make to your context directly improves every future report, brainstorm, and customer analysis — with no extra cost.

```
Week 1:  context/ = basic overview     →  generic but useful analysis
Week 4:  context/ = detailed + honest  →  sharp, specific recommendations
Week 12: context/ = battle-tested      →  analysis your team trusts
```

Reports accumulate in `reports/`. Over time, `/compare` diffs not just two pages — it diffs two moments in your competitive landscape, with your own product evolution as the reference point.

---

## The four skills and when to use them

| Skill | When to use |
|---|---|
| `./watch.sh` / `/compare` | Monday morning — what changed last week |
| `/insights-builder` | Before a sales call, board deck, or pricing review |
| `/brainstorm <idea>` | Before writing a spec — does this already exist? does it differentiate? |
| `/customer-queries` | After support calls or churned accounts — what pain maps to competitive gaps |

---

## Setup in 3 steps

1. Edit `competitors.json` — add your real competitors with their key page URLs
2. Fill `context/` — product overview, features, pricing (be honest about gaps)
3. Run `./watch.sh` — first report lands in `reports/`

Everything else improves from there.
