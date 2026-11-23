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
- **jupi-brand** (from this repo's `jupi` marketplace) — Jupi's brand system (colors, fonts, logos, voice); run as `/jupi-brand:jupi-brand`. Fonts are embedded in artifacts with its `embed-fonts.sh`

## Directory conventions
- `.claude-plugin/marketplace.json` + `plugins/` — this repo is a plugin marketplace; team-wide skills live in its plugins
- `plugins/jupi-brand/skills/jupi-brand/assets/` — brand logos (SVG) and fonts

## Customization checklist
- [ ] Copy `.mcp.json.template` to `.mcp.json` and fill in your API tokens
- [ ] Copy `.claude/settings.local.json.example` to `.claude/settings.local.json` and fill in AWS credentials
- [ ] Accept the `jupi-brand` plugin install prompt, then run its `fetch-fonts.sh` once

## Troubleshooting
- If MCP tools are failing, check that you've replaced placeholder tokens in `.mcp.json`
- Figma and Linear use browser-based OAuth — make sure you're authenticated in your browser
- If Claude Code can't find your model, verify the env vars in `.claude/settings.local.json`
