# Workspace Guide

This is a productivity workspace powered by Claude Code. It provides MCP integrations, plugins, and a brand skill template as a foundation for specialized work.

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
- `/company-brand` — apply brand identity to visual and written output (customize before use)

## Directory conventions
- `assets/brand/` — logos, fonts, Lottie animations, and other brand assets

## Customization checklist
- [ ] Copy `.mcp.json.template` to `.mcp.json` and fill in your API tokens
- [ ] Copy `.claude/settings.local.json.example` to `.claude/settings.local.json` and fill in AWS credentials
- [ ] Edit `.claude/skills/company-brand/SKILL.md` with your actual brand system
- [ ] Add your brand assets to `assets/brand/`

## Troubleshooting
- If MCP tools are failing, check that you've replaced placeholder tokens in `.mcp.json`
- Figma and Linear use browser-based OAuth — make sure you're authenticated in your browser
- If Claude Code can't find your model, verify the env vars in `.claude/settings.local.json`
