---
name: company-brand
description: >
  Apply your company's brand identity when producing any visual or written output — including HTML/React components,
  artifact visuals, social media copy, Canva assets, and marketing content. Use this skill whenever the user
  asks to create anything "on-brand", "for [Company]", or whenever producing UI components, landing page sections,
  social posts, or written copy. Also trigger when the user asks for a gradient background, branded card, social
  asset, or any visual where brand colors, fonts, or logos should appear.
---

# Company Brand Skill

This skill equips Claude with your full brand system so every output — visual, written, or structural — is on-brand without the user having to repeat themselves.

**To customize:** Replace all `[placeholder]` values below with your actual brand tokens, then delete these instructions.

---

## Brand Architecture

Define your brand(s). Many companies have a master brand and one or more sub-brands.

| Brand | Use case | Gradient / Color | Logo |
|---|---|---|---|
| **[Primary Brand]** | Product, homepage, marketing | [Primary palette] | [Primary logo] |
| **[Sub-brand]** (optional) | Research, content, sub-product | [Secondary palette] | [Sub-brand logo] |

Never mix the two palette systems. Choose the brand context first, then apply the corresponding palette.

---

## Color Palettes

### Design tokens

```css
/* Core neutrals */
--primary-dark:   #000000;  /* primary text, dark backgrounds */
--primary-light:  #FFFFFF;  /* base background, text on dark */

/* Primary brand palette */
--brand-color-1:  #000000;  /* [describe usage] */
--brand-color-2:  #000000;  /* [describe usage] */
--brand-color-3:  #000000;  /* [describe usage] */

/* Sub-brand palette (if applicable) */
--sub-color-1:    #000000;  /* [describe usage] */
--sub-color-2:    #000000;  /* [describe usage] */
```

### Gradients (if applicable)

Define your brand gradients as CSS. Example structure:

```css
/* Primary gradient */
background: radial-gradient(ellipse at 15% 10%, var(--brand-color-1) 0%, var(--brand-color-2) 50%, var(--primary-light) 100%);

/* Secondary gradient */
background: radial-gradient(ellipse at 70% 15%, var(--sub-color-1) 0%, var(--sub-color-2) 45%, var(--primary-dark) 100%);
```

---

## Typography

### Primary — Headlines & Titles
**[Headline Font Name]**
- Use for: all headlines (H1, H2, sub-headlines, display titles)
- Case: Sentence case
- Leading: 95% (headlines), 100% (sub-headlines)
- Tracking: -1%

### Secondary — Body & UI
**[Body Font Name]**
- Weights: Regular (body), Semibold (emphasis), Medium (CTAs/buttons)
- Use for: body copy, captions, CTAs, UI labels, navigation
- Case: Sentence case for body; ALL CAPS for buttons/CTAs
- Leading: 110-120%

### Brand font files

Place all font files in `assets/brand/fonts/`. Use these in HTML/React artifacts — do not rely on system fallbacks.

```css
/* Example @font-face declarations — update paths and font names */
@font-face {
  font-family: '[Headline Font]';
  src: url('/assets/brand/fonts/HeadlineFont-Medium.woff2') format('woff2');
  font-weight: 500;
  font-style: normal;
}

@font-face {
  font-family: '[Body Font]';
  src: url('/assets/brand/fonts/BodyFont-Regular.woff2') format('woff2');
  font-weight: 400;
  font-style: normal;
}
/* Add more weights as needed */
```

### System Fallbacks (only when font files are inaccessible)
- Headlines: `Times New Roman, Georgia, serif`
- Body / UI: `Helvetica Neue, Helvetica, Arial, sans-serif`

### Font stack
```css
--font-headline: '[Headline Font]', 'Times New Roman', Georgia, serif;
--font-body: '[Body Font]', 'Helvetica Neue', Helvetica, Arial, sans-serif;
```

### Type Hierarchy Quick Reference

| Level | Font | Case | Tracking |
|---|---|---|---|
| Headline | [Headline Font] Medium | Sentence | -1% |
| Sub-headline | [Headline Font] Medium | Sentence | -1% |
| Title (section) | [Body Font] Regular | ALL CAPS | 0% |
| Body | [Body Font] Regular / Semibold | Sentence | 0% |
| Button / CTA | [Body Font] Medium | ALL CAPS | -1% |

---

## Logos

Four logo variants, two colorways each. All SVG files should be in `assets/brand/`.

### Logo usage rules
- **On light backgrounds** -> use dark colorway
- **On dark backgrounds** -> use light colorway
- Never rotate, distort, or recolor outside approved values
- Always give clear breathing room (min padding = logo height x 0.25)

### 1. Lock-up (wordmark + symbol) — primary logo
**Dark** — `assets/brand/logo-lockup-dark.svg`
**Light** — `assets/brand/logo-lockup-light.svg`

### 2. Symbol only (icon / glyph)
**Dark** — `assets/brand/logo-symbol-dark.svg`
**Light** — `assets/brand/logo-symbol-light.svg`

### 3. Wordmark only — lettering without symbol
**Dark** — `assets/brand/logo-wordmark-dark.svg`
**Light** — `assets/brand/logo-wordmark-light.svg`

### 4. Sub-brand wordmark (if applicable)
**Dark** — `assets/brand/logo-subbrand-dark.svg`
**Light** — `assets/brand/logo-subbrand-light.svg`

---

## Motion & Animation

If you have Lottie animations or other motion assets, place them in `assets/brand/` and list them here.

| Animation | File | Duration | Use case |
|---|---|---|---|
| **[Loading]** | `assets/brand/[file].json` | ~3s | Loading states, processing |
| **[Success]** | `assets/brand/[file].json` | ~5s | Success, onboarding, celebration |
| **[Transition]** | `assets/brand/[file].json` | ~4s | Transitions, page changes |

---

## Voice & Tone

### Personality
- **[Trait 1]** — [description]
- **[Trait 2]** — [description]
- **[Trait 3]** — [description]
- **[Trait 4]** — [description]

### Key phrases / vocabulary
- [Your product vocabulary and preferred terms]
- [Taglines or recurring phrases]

### Avoid
- [Words, phrases, or patterns to never use]
- Passive voice
- Jargon soup
- AI hype ("cutting-edge AI", "next-gen", "game-changing")

### CTA style
[Describe your CTA format — e.g., ALL CAPS, pill-shaped buttons, specific font weight]

---

## Figma Brand Library (if applicable)

**File key:** `[YOUR_FIGMA_FILE_KEY]`
**File name:** [Your brand guidelines file name]

Use `Figma:get_design_context` or `Figma:get_screenshot` with the file key and node IDs below to pull assets directly.

### Key Node IDs
- Logos: `[node-id]`
- Colors: `[node-id]`
- Typography: `[node-id]`
- Icons: `[node-id]`
- Social Templates: `[node-id]`

---

## Applying the Skill

### For HTML/React artifacts
1. Load brand fonts via `@font-face` (from `assets/brand/fonts/`)
2. Apply gradient or solid color as `background` on root or hero container
3. Embed SVG logo inline or via `<img>` tag
4. Use dark color token for all text on light backgrounds
5. CTAs: follow your CTA style (e.g., pill-shaped, ALL CAPS, medium weight)

### For Canva / social assets
1. Determine brand context (primary vs sub-brand)
2. Apply the correct palette as background
3. Use headline font for titles, body font for copy/CTA
4. Place logo in a corner with clear padding
5. Keep copy concise: max 10 words for headline, 20 for body

### For written copy
1. Lead with the outcome, not the feature
2. Sentence case everywhere except CTAs
3. Short paragraphs (1-3 sentences max for social/headlines)
4. Use brand vocabulary where natural, never forced
