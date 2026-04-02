# Shared Claude Code Workspace

A forkable base for Claude Code productivity workspaces. Fork this repo, fill in your credentials and brand, and start working.

## Quick Start

1. **Fork this repo** on GitHub
2. **Clone your fork** locally
3. **Set up MCP servers** — copy `.mcp.json.template` to `.mcp.json` and replace the placeholder tokens:
   - `YOUR_GITHUB_PAT_HERE` — [create a GitHub PAT](https://github.com/settings/tokens) with the scopes you need
   - `YOUR_TAVILY_API_KEY_HERE` — [get a Tavily API key](https://tavily.com/)
   - Figma and Linear use browser-based OAuth (no tokens needed in config)
4. **Set up Claude Code credentials** — copy `.claude/settings.local.json.example` to `.claude/settings.local.json` and fill in your AWS Bedrock credentials
5. **Customize your brand** — edit `.claude/skills/company-brand/SKILL.md` with your colors, fonts, logos, and voice. Add brand assets to `assets/brand/`

## What's Included

### MCP Servers

| Server | What it does | Auth |
|---|---|---|
| **GitHub** | Repo management, PRs, issues, code search | GitHub PAT in `.mcp.json` |
| **Figma** | Read designs, get screenshots, create FigJam diagrams | Browser OAuth |
| **Linear** | Project/issue tracking, documents | Browser OAuth |
| **Tavily** | Web search, research, content extraction | API key in `.mcp.json` |

### Plugins

| Plugin | What it does |
|---|---|
| **document-skills** | Create and edit .docx, .pdf, .xlsx, .pptx files |
| **skill-creator** | Create new Claude Code skills from scratch |

### Skills

| Skill | What it does |
|---|---|
| **company-brand** | Template for your brand identity — colors, fonts, logos, voice, Figma library. Customize before use. |

## Adding Your Own Skills

Create a new folder in `.claude/skills/` with a `SKILL.md` file:

```
.claude/skills/
└── my-new-skill/
    └── SKILL.md
```

The `SKILL.md` file needs YAML frontmatter with `name` and `description` fields. The description tells Claude when to activate the skill. See the `company-brand` skill for an example.

You can also use the `/skill-creator` plugin to generate skills interactively.

## Credentials Setup

| Credential | Where to get it | Where it goes |
|---|---|---|
| GitHub PAT | [github.com/settings/tokens](https://github.com/settings/tokens) | `.mcp.json` → `github.headers.Authorization` |
| Tavily API key | [tavily.com](https://tavily.com/) | `.mcp.json` → `tavily.env.TAVILY_API_KEY` |
| AWS Access Key ID | Your AWS IAM console | `.claude/settings.local.json` → `env.AWS_ACCESS_KEY_ID` |
| AWS Secret Access Key | Your AWS IAM console | `.claude/settings.local.json` → `env.AWS_SECRET_ACCESS_KEY` |
| AWS Region | Your Bedrock-enabled region | `.claude/settings.local.json` → `env.AWS_REGION` |

**Important:** `.mcp.json` and `.claude/settings.local.json` are both gitignored. Never commit real credentials.

## Customization

### Brand skill
Edit `.claude/skills/company-brand/SKILL.md` — it's a full scaffold with sections for colors, typography, logos, motion, voice & tone, and Figma library references. Replace all `[placeholder]` values with your real brand tokens.

### Adding MCP servers
Add new entries to your `.mcp.json`. See [Claude Code MCP docs](https://docs.anthropic.com/en/docs/claude-code/mcp) for configuration options.

### Model selection
The default model is `eu.anthropic.claude-opus-4-6-v1` (AWS Bedrock, EU region). Change this in `.claude/settings.local.json` and `.vscode/settings.json`.

## Syncing with upstream

When new MCP servers, skills, or plugins are added to this shared repo, pull them into your fork:

### First time: add the upstream remote

```bash
git remote add upstream git@github.com:jupi-co/shared.git
```

### Each time: pull upstream changes

```bash
# Fetch the latest from shared
git fetch upstream

# Rebase your work on top of the latest shared base
git rebase upstream/main
```

If you get conflicts (typically in files you've customized like `company-brand/SKILL.md` or `CLAUDE.md`), resolve them by keeping your version for brand-specific content and taking upstream for new infrastructure.

### Alternative: merge instead of rebase

If you prefer a merge commit (simpler, but noisier history):

```bash
git fetch upstream
git merge upstream/main
```

### What won't conflict

These files are gitignored and live only on your machine, so they're never affected by upstream changes:
- `.mcp.json` (your tokens)
- `.claude/settings.local.json` (your AWS credentials)

### Tip

If upstream adds a new `.mcp.json.template` entry (e.g., a new MCP server), you'll see the change in the template file after syncing. Copy the new entry into your local `.mcp.json` and fill in your token.
