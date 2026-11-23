# Workspace Guide

This is a productivity workspace powered by Claude Code. It provides MCP integrations, plugins, and Jupi's brand skill as a foundation for specialized work.

## Available tools

### MCP Servers
- **GitHub** — repo management, PRs, issues, code search
- **Figma** — read designs, get screenshots, create FigJam diagrams
- **Linear** — project/issue tracking, documents
- **Tavily** — web search and research

### Plugins
- **document-skills** — create and edit .docx, .pdf, .xlsx, .pptx files
- **skill-creator** — create new Claude Code skills

### Skills
- `/jupi-brand` — Jupi's brand system (colors, fonts, logos, voice). Fonts are fetched locally with `.claude/skills/jupi-brand/fetch-fonts.sh` (never committed) and embedded in artifacts with `embed-fonts.sh`

## Directory conventions
- `.claude/skills/jupi-brand/assets/` — brand logos (SVG) and the locally fetched, gitignored fonts

## Customization checklist
- [ ] Copy `.mcp.json.template` to `.mcp.json` and fill in your API tokens
- [ ] Copy `.claude/settings.local.json.example` to `.claude/settings.local.json` and fill in AWS credentials
- [ ] Run `.claude/skills/jupi-brand/fetch-fonts.sh` once to get the brand fonts

## Troubleshooting
- If MCP tools are failing, check that you've replaced placeholder tokens in `.mcp.json`
- Figma and Linear use browser-based OAuth — make sure you're authenticated in your browser
- If Claude Code can't find your model, verify the env vars in `.claude/settings.local.json`
