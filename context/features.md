# Anthropic — Features & Architecture

## Core Features

| Feature | Description | Status |
|---|---|---|
| Claude 3.5 Sonnet | Mid-tier model — best speed/quality balance | Live |
| Claude 3.5 Haiku | Fast, cheap model for high-volume tasks | Live |
| Claude Opus 4 | Most capable model for complex reasoning | Live |
| 200K context window | Process full books, codebases, legal docs | Live |
| Vision / multimodal | Analyze images, charts, screenshots | Live |
| Tool use / function calling | Structured outputs, API integrations | Live |
| Prompt caching | Cache repeated context to cut cost + latency | Live |
| Claude.ai web app | Consumer + Teams chat interface | Live |
| Claude Code | AI coding agent in the terminal + IDE | Live |
| Artifacts | Generate and render code/docs in-chat | Live |
| Projects | Persistent memory + files per use case | Live |
| Batch API | Async bulk processing at lower cost | Live |
| Files API | Upload and reference documents in API calls | Live |

## Architecture Notes

- **Model family:** Claude 3 → Claude 3.5 → Claude 4 (Haiku / Sonnet / Opus tiers)
- **Training:** Constitutional AI + RLHF + extensive safety evaluations
- **Deployment:** Cloud-hosted API; AWS Bedrock and Google Cloud Vertex AI integrations
- **API:** REST API with streaming; SDKs for Python and TypeScript

## Roadmap Themes (next 6 months)

1. Agentic capabilities — multi-step autonomous task completion
2. Extended memory and personalization
3. Deeper IDE and developer tooling integrations

## Known Limitations

- No image generation (text and vision only)
- No real-time internet access in base models (web search via tool use only)
- Opus 4 is slower and more expensive than GPT-4o for high-volume use
