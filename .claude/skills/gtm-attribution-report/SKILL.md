---
name: gtm-attribution-report
description: Generate/refresh the GTM plugin-install & attribution analytics report (Table 1 daily recap by source + Table 2 per-person install-clickers & sign-ups with identities and Datadog replay links), then update the Linear issue. Trigger when the user asks to "run the attribution report", "update the GTM analytics report", "refresh GTM-141", "plugin install / sign-up funnel report", or wants the daily install/sign-up/source breakdown for the marketing site.
---

# GTM plugin-install & attribution report

Produces two tables and writes them to a Linear issue in the **GTM** team, project **GTM 2 — Decision infrastructure for AI-first companies**. The living issue is **GTM-141** — update it by default (pass a new date window); create a new issue only if asked.

Requires MCP servers: **Neon** (read-only), **Datadog** (`plugin:datadog:mcp`), **Linear**. If any is unavailable/unauthenticated, tell the user before proceeding.

## Constants
- Neon project (app DB `jupi`): `lingering-dream-04362969`
- Datadog site: **EU** (`app.datadoghq.eu`). RUM application (Frontend): `d9da7893-fb09-4a9c-87bb-8439e871870c`
- Linear: team `GTM` (`0a930acf-a342-4643-88a1-7c800855ca20`), project `GTM 2` (`e057aa58-814b-4ac7-a7f0-b1c6d3a3a966`), issue `GTM-141`
- Replay URL: `https://app.datadoghq.eu/rum/replay/sessions/{session_id}?applicationId=d9da7893-fb09-4a9c-87bb-8439e871870c`

## Core principles (why the numbers are trustworthy)
- **`Event` table is the source of truth** for clicks & sign-ups; NOT RUM action labels (they get renamed) nor MCP OAuth tables.
- **`utm_source` is falsifiable** and datacenter bots spoof it. Real **Meta** = in-app `@browser.name:(Instagram OR Facebook)`; UTM `meta` from datacenter geos (Prineville, Forest City, Luleå, Altoona, Clonee, Fort Worth, Springfield) with 0 action = bots → exclude. "LinkedIn" only counts if a LinkedIn campaign is actually live.
- **Identity is set at session level post-login**, often under a different `usr.id` than the pre-login anon one → resolve via `@session.id` with `-@usr.email:undefined`, not the anon `usr.id`.

## Steps

Ask the user the **date window** (default: since `2026-07-01` → now, or last N days). Use UTC day boundaries. All queries below are parameterised by `{FROM}`/`{TO}`.

### Step 1 — Table 1 data (daily recap by source)
1. **Active users/day** (Datadog `aggregate_rum_events`): query `@type:session @session.action.count:>0`, `group_by {interval: 86400000}`, compute `CARDINALITY @usr.id`.
2. **Install clicks + sign-ups by day/type/source** (Neon `run_sql`):
```sql
SELECT date_trunc('day',e."createdAt") AS day, e.type,
  CASE
    WHEN u."utmParams"->>'utmSource'='meta' THEN 'Meta Ads'
    WHEN u."utmParams"->>'utmSource'='linkedin' OR u.referrer ILIKE '%linkedin%' THEN 'LinkedIn'
    WHEN u."utmParams"->>'utmSource' IS NOT NULL THEN u."utmParams"->>'utmSource'
    WHEN u.referrer ILIKE '%accounts.google.com%' THEN 'Google sign-in'
    WHEN u.referrer ILIKE '%google.%' OR u.referrer ILIKE '%bing.%' THEN 'Search'
    WHEN u.referrer='about:client' OR u.referrer='' OR u.referrer IS NULL THEN 'Direct'
    ELSE 'Referral' END AS source,
  count(DISTINCT e."userId") AS users
FROM "Event" e LEFT JOIN "User" u ON u.id=e."userId"
WHERE e."createdAt" >= '{FROM}' AND e.type IN ('plugin.claude.install','plugin.chatgpt.install','signinup.complete')
GROUP BY 1,2,3 ORDER BY 1,2,4 DESC;
```
3. **Distinct clickers by day/source**: same as above but `type IN ('plugin.claude.install','plugin.chatgpt.install')`, wrapped in `SELECT DISTINCT day,userId,source` then `GROUP BY day,source`.

Build Table 1: rows = Real active users, Install clicks — Claude (+ source sub-rows), Install clicks — ChatGPT (+ sub-rows), Distinct clickers (+ Meta Ads sub-row), Sign-ups (+ source sub-rows). Columns = one per day. Add the "Meta shifted from bounce to conversion" trend note when applicable (track Meta install clicks & sign-ups per day).

### Step 2 — Table 2 data (per-person install-clickers & sign-ups)
1. **Base rows** (Neon): one query for events + identity + attribution + timing:
```sql
SELECT e."userId", e.type, to_char(e."createdAt",'MM-DD HH24:MI') AS ts,
  u.anonymous, coalesce(u.email,'') AS email,
  trim(coalesce(u."firstName",'')||' '||coalesce(u."lastName",'')) AS name,
  u."utmParams"->>'utmSource' AS src, u."utmParams"->>'utmCampaign' AS campaign,
  u."utmParams"->>'utmContent' AS content, coalesce(u.referrer,'') AS referrer
FROM "Event" e LEFT JOIN "User" u ON u.id=e."userId"
WHERE e."createdAt" >= '{FROM}'
  AND e.type IN ('plugin.claude.install','plugin.chatgpt.install','signinup.complete')
ORDER BY e."userId", e."createdAt";
```
Collect the distinct `userId` set. Note: `Event.metadata` is null (no signup/signin flag).
2. **Session mapping** (Datadog `aggregate_rum_events`): `@type:view @usr.id:(id1 OR id2 …)`, `group_by {fields:['@usr.id','@session.id']}`, compute `SUM @view.time_spent`. Gives each person's session ids (multi-session users have several).
3. **Identity resolution** (Datadog): `-@usr.email:undefined @session.id:(sid1 OR sid2 …)`, `group_by {fields:['@session.id','@usr.email','@usr.name']}`. Fills real names/emails for rows that look anonymous by their pre-login usr.id (incl. Jupi team).
4. **Session start times** for chronological ordering (Datadog `search_datadog_rum_events`): `@type:session @session.id:(…)`, `sort: timestamp`. Read each session's `timestamp`.

### Step 3 — Classify each person
- **Type**: `Sign-up (new)` = first identification in window (external email created in-window); `Sign-in (returning)` = pre-existing account (team, or account clearly older); `—` = never identified (no `signinup.complete`). Team = `@jupi.co` or known team (Nick Hernandez, Paul Rousselle, Régis Lopez-Kaufman) → mark `(team)`, exclude from funnel counts.
- **Install**: `Claude` / `ChatGPT` (+ day) from the plugin.*.install events; **empty** if the person only signed up (no plugin click).
- **Campaign / Source / Content**: for UTM rows show `Meta · {utmCampaign} · {utmContent}` (🟢 if `jupi_plugin_ic` — the converting campaign); flag `⚠️` when source is inconsistent (e.g. `utm_source=linkedin` with a Facebook referrer). Non-UTM: `Direct` / `Google sign-in` / `Google (search)`.
- **Replay(s)**: one link per session, **ordered chronologically (▶1 = earliest)**.

### Step 4 — Build Table 2
One merged table, **one row per person, most-recent-first** (sort by each person's last event ts, descending). Columns: `Last activity | User | Type | Install | Campaign / Source / Content | Replay(s)`. Merge duplicate identities (e.g. same person's payfit + anon session ids into one row where obvious). Add Highlights: real company sign-ups from Meta `jupi_plugin_ic`, top-converting `utm_content` creatives, sign-ups without install click, non-converting anon Meta clicks.

### Step 5 — Write to Linear
Structure: **Table 1 first, Table 2 second, then an Appendix** (sources & method — copy the principles above). Everything **in English**. Update issue `GTM-141` via `save_issue` (id `GTM-141`), refreshing the title date range. Confirm the URL back to the user.

## Notes
- Numbers finalize upward for the current day (in-progress) — mark the last column with `*`.
- Keep the appendix's honesty caveats (utm falsifiable, signup/signin heuristic, some anon sign-ups have no captured identity).
- Related code fix that keeps attribution correct going forward: first-touch referrer PR jupi-co/decide#3858.
