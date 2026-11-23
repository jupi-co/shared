# Shared Claude Code Workspace

A forkable base for Claude Code productivity workspaces. Fork this repo, fill in your credentials, and start working. Jupi's brand system comes ready to use.

## Quick Start

1. **Fork this repo** on GitHub
2. **Clone your fork** locally
3. **Set up MCP servers** — copy `.mcp.json.template` to `.mcp.json` and replace the placeholder tokens:
   - `YOUR_GITHUB_PAT_HERE` — [create a GitHub PAT](https://github.com/settings/tokens) with the scopes you need
   - `YOUR_TAVILY_API_KEY_HERE` — [get a Tavily API key](https://tavily.com/)
   - Figma and Linear use browser-based OAuth (no tokens needed in config)
4. **Set up Claude Code credentials** — copy `.claude/settings.local.json.example` to `.claude/settings.local.json` and fill in your AWS Bedrock credentials
5. **Install the Jupi brand plugin** — opening this repo in Claude Code offers to install it (it is enabled in `.claude/settings.json`). To use it in any other project too:
   ```
   /plugin marketplace add jupi-co/shared
   /plugin install jupi-brand@jupi
   ```
   Then fetch the licensed fonts once with the plugin's `fetch-fonts.sh`

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
| **jupi-brand** (this repo) | Jupi's brand system, ready to use: colors and gradients, Fenul Standard and Roobert, logos as SVG, motion, voice and tone, Figma library overview, long-form article styling. Run `fetch-fonts.sh` once for the licensed fonts, then `embed-fonts.sh` to embed them in artifacts. |

## Adding Your Own Skills

This repo is also a plugin marketplace (`.claude-plugin/marketplace.json`, plugins in `plugins/`). A skill the whole team should have anywhere goes in a plugin there: add it under `plugins/<plugin>/skills/`, list new plugins in `marketplace.json`, bump the plugin's `version` in its `plugin.json`, and check with `claude plugin validate .`.

A skill only for this workspace goes in a folder in `.claude/skills/` with a `SKILL.md` file:

```
.claude/skills/
└── my-new-skill/
    └── SKILL.md
```

The `SKILL.md` file needs YAML frontmatter with `name` and `description` fields. The description tells Claude when to activate the skill. See the `jupi-brand` skill for an example.

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
`plugins/jupi-brand/skills/jupi-brand/` holds Jupi's brand system: `SKILL.md` (colors, typography, logos, motion, voice), `references/thought-leadership.md` (long-form article styling) and the logo SVGs in `assets/`. Brand changes go there, upstream; bump `version` in `plugins/jupi-brand/.claude-plugin/plugin.json` so installed copies update.

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

If you get conflicts (typically in files you've customized like `CLAUDE.md`), resolve them by keeping your version for brand-specific content and taking upstream for new infrastructure.

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
