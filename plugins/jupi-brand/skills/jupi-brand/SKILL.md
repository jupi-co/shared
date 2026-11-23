---
name: jupi-brand
description: >
  Apply Jupi's brand identity when producing any visual or written output — including HTML/React components,
  artifact visuals, social media copy, Canva assets, and marketing content. Use this skill whenever the user
  asks to create anything "on-brand", "for Jupi", "in Jupi's style", or whenever producing UI components,
  landing page sections, social posts, or written copy for the Jupi product or Jupi Science sub-brand.
  Also trigger when the user asks for a gradient background, branded card, social asset, or any visual where
  Jupi colors, fonts or logos should appear. Don't wait to be explicitly asked — if the output is Jupi-related,
  load this skill first.
---

# Jupi Brand Skill

This skill equips Claude with the full Jupi brand system so every output — visual, written, or structural — is on-brand without the user having to repeat themselves.

---

## Brand Architecture

Jupi has **two distinct brands**:

| Brand | Use case | Gradient | Logo |
|---|---|---|---|
| **Jupi** (master) | Product, homepage, marketing | Hero gradient (warm) | Bird symbol + logotype |
| **Jupi Science** | Research, knowledge, content layer | Science gradient (cool) | "JUPI SCIENCE" wordmark |

Never mix the two gradient systems. Choose the brand context first, then apply the corresponding palette.

---

## Color Palettes

### Design tokens (confirmed from Figma components)

```css
/* Core neutrals — used across both brands */
--almost-black:  #3B3B3B;  /* primary text, logo dark, dark backgrounds */
--marble-white:  #F5F4EE;  /* base bg, logo light, text on dark */
--pure-white:    #FFFFFF;  /* badge/pill backgrounds */

/* Jupi master — pastel palette (updated) */
--jupi-lavender: #D8C8E8;  /* hero top-left */
--jupi-pink:     #F0C0C8;  /* hero top-center, spotlight orb */
--jupi-peach:    #EBBF8A;  /* hero right */
--jupi-periwinkle: #C0C8E0; /* hero bottom-left accent */
--footer-cream:  #FDFAF5;  /* footer/full gradient base */
--footer-gold:   #F0D4A0;  /* footer bottom-right */
--jupi-blush:    #F2C8C8;  /* Full & Footer gradients, bottom-left */

/* Jupi Science — cool palette */
--science-purple: #655CE5;
--science-teal:   #55B8B4;  /* a.k.a. Jade Green */
```

### Jupi Master — 4 official gradients
All gradients are raster image assets in Figma — treat them as images, not pure CSS.
Approximate CSS reproductions for web use:

**Hero** (pastel, lavender top-left → pink top-center → peach-orange right — canonical, do not alter proportions)
```css
background: radial-gradient(ellipse at 15% 10%, #D8C8E8 0%, #F0C0C8 35%, #F5F4EE 60%, #EBBF8A 100%),
            radial-gradient(ellipse at 80% 80%, #C0C8E0 0%, transparent 60%);
background-color: #F5F4EE;
```

**Full** (softer, very light — near-white center, pink bottom-left, peach-gold bottom-right)
```css
background: radial-gradient(ellipse at 0% 100%, #F2C8C8 0%, #FDFAF5 55%, #F0D4A0 100%);
background-color: #FDFAF5;
```

**Footer** (ultra-light — white/cream center fading to pink bottom-left and peach-gold bottom-right)
```css
background: radial-gradient(ellipse at 5% 100%, #F2C8C8 0%, transparent 50%),
            radial-gradient(ellipse at 95% 100%, #F0D4A0 0%, transparent 50%);
background-color: #FDFAF5;
```

**Spotlight** (off-white base, pink+peach orb center-left, lavender top-right)
```css
background: radial-gradient(ellipse at 35% 55%, #F0C0C8 0%, #F5F4EE 60%),
            radial-gradient(ellipse at 75% 20%, #D8C8E8 0%, transparent 50%);
background-color: #F5F4EE;
```

**Science** (dark, teal top-right, purple/indigo left, charcoal base — unchanged)
```css
background: radial-gradient(ellipse at 70% 15%, #55B8B4 0%, #655CE5 45%, #3B3B3B 100%);
```

### Social template colour rules (extracted from Figma components)

**Jupi Awareness posts** (master brand, light)
- Background: `#F5F4EE` (Marble White flat — not gradient in 1:1 format; for gradient contexts use Hero pastel CSS)
- Headline: `#3B3B3B`, Fenul Standard Medium, 165px, -3.3px tracking, 95% leading
- URL badge: `rgba(245,244,238,0.4)` bg, `rgba(59,59,59,0.2)` border, backdrop-blur
- CTA label: `#3B3B3B`, Roobert Medium, 22px, ALL CAPS

**Jupi Science posts** (dark, charcoal)
- Background: `#3B3B3B` (Almost Black flat)
- Headline: `#F5F4EE`, Fenul Standard Medium, 120px, -2.4px tracking, 95% leading
- Illustration: centered orb/planetary imagery in Science palette tones

### Neutral / Both brands
| Token | Hex | Use |
|---|---|---|
| `--almost-black` | `#3B3B3B` | Text on light, dark bg, logo dark |
| `--marble-white` | `#F5F4EE` | Base bg, text on dark, logo light |
| `--pure-white` | `#FFFFFF` | Pills, badges, overlays |

---

## Typography

### Primary — Headlines & Titles
**Fenul Standard Medium**
- Use for: all headlines (H1, H2, sub-headlines, display titles)
- Case: Sentence case
- Leading: 95% (headlines), 100% (sub-headlines)
- Tracking: -1%
- Weight: always Medium, including long-form articles (Medium is the only upright Fenul cut shipped with this skill, so it is declared at `font-weight: 400`)
- Character: "surreal but serious" — high contrast, editorial serif

### Secondary — Body & UI
**Roobert**
- Weights: Regular (body), Semibold (emphasis), Medium (CTAs/buttons)
- Use for: body copy, captions, CTAs, UI labels, navigation
- Case: Sentence case for body; ALL CAPS for buttons/CTAs/titles
- Leading: 110–120%
- Tracking: 0% (body), -1% (buttons)

### Brand font files — available locally

All font files go in `assets/fonts/`. **They are licensed and not committed to this public repo**: run `./fetch-fonts.sh` from this skill folder once (needs the GitHub CLI `gh`, logged in with an account that can read the private repo the script pulls from). **Always use these in HTML/React artifacts** — do not rely on system fallbacks or Google Fonts.

Available files:
| File | Weight | Style |
|---|---|---|
| `FenulStandard-Medium.woff2` / `.woff` | Medium, declared as `font-weight: 400` | Normal |
| `FenulStandard-MediumItalic.woff2` / `.woff` | Medium, declared as `font-weight: 400` | Italic |
| `Roobert-Regular.woff2` / `.woff` | Regular (400) | Normal |
| `Roobert-RegularItalic.woff2` / `.woff` | Regular (400) | Italic |
| `Roobert-Medium.woff2` / `.woff` | Medium (500) | Normal |
| `Roobert-MediumItalic.woff2` / `.woff` | Medium (500) | Italic |
| `Roobert-SemiBold.woff2` / `.woff` | SemiBold (600) | Normal |
| `Roobert-SemiBoldItalic.woff2` / `.woff` | SemiBold (600) | Italic |

### Embedding the fonts in an artifact

Always embed the fonts as base64 `woff2` data URLs. Relative `url('assets/fonts/…')` paths break as soon as the artifact is opened anywhere other than next to this skill folder. From this skill folder, after `./fetch-fonts.sh`:

```bash
./embed-fonts.sh                      # every font
./embed-fonts.sh Roobert-Regular FenulStandard-Medium   # only the ones you need
```

It prints ready-to-paste `@font-face` rules (family, weight and style set) for a `<style>` block at the top of `<head>`. Embed only the weights the page uses: each font adds 30–60 KB.

### System Fallbacks (only when font files are inaccessible)
- Headlines: `Times New Roman`, Georgia, serif
- Body / UI: `Helvetica Neue`, Helvetica, Arial, sans-serif

### Font stack for web artifacts
```css
--font-headline: 'Fenul Standard', 'Times New Roman', Georgia, serif;
--font-body: 'Roobert', 'Helvetica Neue', Helvetica, Arial, sans-serif;
```

### Type Hierarchy Quick Reference
| Level | Font | Case | Tracking |
|---|---|---|---|
| Headline | Fenul Standard Medium | Sentence | -1% |
| Sub-headline | Fenul Standard Medium | Sentence | -1% |
| Title (section) | Roobert Regular | ALL CAPS | 0% |
| Body | Roobert Regular / Semibold | Sentence | 0% |
| Button / CTA | Roobert Medium | ALL CAPS | -1% |

---

## Logos

Four logos, two colorways each, as SVG files in this skill's `assets/` folder.

### Logo usage rules
- **On light / Hero gradient backgrounds** → Almost Black (`#3B3B3B`, `-dark` files)
- **On dark / Science gradient backgrounds** → Marble White (`#F5F4EE`, `-white` files)
- Never rotate, distort, or recolor outside these two values
- Always give clear breathing room (min padding = logo height × 0.25)
- The two colorways of each logo have slightly different path data: always use the matching file, never swap the fill on the other one

| File | Content | Use |
|---|---|---|
| `jupi-lockup-dark.svg` / `-white.svg` | Lock-up: symbol + wordmark (primary logo) | Social posts, headers, marketing |
| `jupi-symbol-dark.svg` / `-white.svg` | Symbol only (the bird) | Avatar, favicon, app icon, nav logo |
| `jupi-wordmark-dark.svg` / `-white.svg` | Wordmark only ("JUPI" lettering) | Tight spaces, signatures, footers |
| `jupi-science-dark.svg` / `-white.svg` | Jupi Science wordmark (chunky blocky lettering) | **Only** on Jupi Science touchpoints |

### Using a logo in an HTML/SVG artifact
**Never** draw or approximate a Jupi logo, and never pull it from Figma or an external URL.
1. Read the file you need from `assets/` in this skill folder
2. Paste the SVG **inline** in the HTML, not via `<img src="">` or `background-image`
3. Size it with `width` / `height` (or CSS) on the `<svg>` tag; the `viewBox` keeps proportions

---

## Motion & Animation

Jupi has Lottie animations of the symbol plus an animated navigation logo. **They are not in this repo**: the production files live in the Jupi website codebase. Ask the user for the one you need and put it next to your artifact.

| Animation | Canvas | Duration | Description |
|---|---|---|---|
| **Thinking** | 600×600 | ~3.76s (94f @25fps) | The symbol "thinking": foot tapping, gentle movement. Layers: Head + Leg |
| **Jump** | 720×720 | ~8.24s (206f @25fps) | The symbol jumping: festive, long |
| **Spin** | 720×720 | ~5.72s (143f @25fps) | The symbol spinning on itself |
| **Navigation** | 147×55 | ~3.64s (91f @25fps) | Animated navbar logo: wordmark + animated symbol + embedded base64 gradient. Color `#3B3B3B`. Self-contained |

### Using them in artifacts and components

```html
<!-- With lottie-player (CDN) -->
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="JUPI-Symbol-Jump.json" background="transparent"
  speed="1" style="width:300px;height:300px" loop autoplay></lottie-player>
```

```jsx
// With @lottiefiles/react-lottie-player
import { Player } from '@lottiefiles/react-lottie-player';
import jumpAnim from './JUPI-Symbol-Jump.json';
<Player autoplay loop src={jumpAnim} style={{ width: 300, height: 300 }} />
```

### Which animation when
- **Thinking**: loading and processing states ("Jupi is thinking")
- **Jump**: success, onboarding, celebration moments
- **Spin**: transitions, rotating loading states
- **Navigation**: animated navbar, page header

---

## Hero Gradient Background Animation

Used on hero sections requiring a "living" background (e.g. `decision_infrastructure_manifesto.html`). Three radial gradient orbs animating slowly over a `#F5F4EE` (marble white) base.

**Critical constraint:** `mix-blend-mode: screen` does not work in iframe/widget contexts. Use `rgba` radial gradients with CSS keyframe animations on `::before`, `::after`, and a third `.hero-orb3` div.

### HTML structure

```html
<div class="hero-bg">
  <div class="hero-orb3"></div>
  <div class="hero-fade"></div>
</div>
```

### CSS

```css
@keyframes orb1 {
  0%,100% { transform: translate(0,0) scale(1); }
  33%     { transform: translate(18%,12%) scale(1.12); }
  66%     { transform: translate(-12%,20%) scale(0.9); }
}
@keyframes orb2 {
  0%,100% { transform: translate(0,0) scale(1); }
  40%     { transform: translate(-20%,-15%) scale(1.15); }
  70%     { transform: translate(14%,10%) scale(0.88); }
}
@keyframes orb3 {
  0%,100% { transform: translate(0,0) scale(1); }
  50%     { transform: translate(16%,-18%) scale(1.1); }
}
.hero-bg {
  position: absolute;
  inset: 0;
  background-color: #F5F4EE;
  z-index: 0;
  overflow: hidden;
}
.hero-bg::before,
.hero-bg::after,
.hero-orb3 {
  content: '';
  position: absolute;
  border-radius: 50%;
  filter: blur(60px);
}
.hero-bg::before {
  width: 80%; height: 80%;
  top: -20%; left: -10%;
  background: radial-gradient(ellipse, #D8C8E8 0%, #F0C0C8 45%, transparent 75%);
  animation: orb1 8s ease-in-out infinite;
}
.hero-bg::after {
  width: 70%; height: 70%;
  bottom: 10%; right: -15%;
  background: radial-gradient(ellipse, #EBBF8A 0%, #F5F4EE 55%, transparent 80%);
  animation: orb2 12s ease-in-out infinite;
  z-index: 0;
}
.hero-orb3 {
  position: absolute;
  border-radius: 50%;
  filter: blur(70px);
  width: 50%; height: 50%;
  bottom: -10%; left: 30%;
  background: radial-gradient(ellipse, #C0C8E0 0%, transparent 70%);
  animation: orb3 16s ease-in-out infinite;
  z-index: 0;
}
.hero-fade {
  position: absolute;
  bottom: 0; left: 0; right: 0;
  height: 40%;
  background: linear-gradient(to bottom, transparent 0%, #F5F4EE 100%);
  z-index: 1;
}
```

### Orb colors (from Jupi palette)
- Orb 1 (top-left): lavender `#D8C8E8` → pink `#F0C0C8`
- Orb 2 (bottom-right): gold `#EBBF8A`
- Orb 3 (bottom-center): periwinkle `#C0C8E0`

### Speed tuning
| Speed | Durations | Feel |
|---|---|---|
| Energetic | `8s / 12s / 16s` | Visible movement, dynamic |
| Elegant | `32s / 42s / 55s` | Barely perceptible, ambient |

**Amplitude rule:** Movement translate of 18–20% is the minimum for visibility at slow speeds. Below 5% the animation is invisible even at fast speeds.

---

## Voice & Tone

Jupi's copy is **confident, warm, and precise**. It speaks to executives and decision-makers — people who trust their own judgment but want better inputs.

### Personality
- **Confident** — never hedging, never over-explaining
- **Warm** — not corporate, not cold; approachable authority
- **Precise** — short sentences, active verbs, no filler
- **Slightly playful** — room for wit, but never at the expense of clarity

### Key phrases / Jupi vocabulary
- Decision Object, The Loop, programmable decisions
- "Better, faster decisions"
- "Jupi eliminates hard choices"
- "Confidence in every choice"
- "Smarter, faster, and a whole lot nicer"

### Avoid
- Jargon soup ("synergize", "leverage", "empower")
- Passive voice
- Filler adjectives ("amazing", "powerful", "revolutionary")
- AI hype ("cutting-edge AI", "next-gen", "game-changing")

### CTA style
All caps, Roobert Medium, rounded pill button. Examples: `MAKE A DECISION`, `TALK TO US`, `MAKE A DECISION →`

---

## Usage Rules

### When to use Hero gradient (Jupi master)
- Homepage hero sections
- Marketing pages and landing pages
- Social assets for the main Jupi product
- Light-background UI components

### When to use Science gradient (Jupi Science)
- Blog posts, research content, Jupi Science articles
- Knowledge/insight-focused social posts
- Any touchpoint explicitly labeled "Jupi Science"

### Logo placement
- Always give the logo clear breathing room (min padding = logo height × 0.25)
- On Hero gradient: use dark (`#3B3B3B`) symbol
- On Science gradient or dark backgrounds: use Marble White (`#F5F4EE`) symbol
- Never rotate, distort, or recolor the logo outside approved palette

---

## Figma Brand Library

The brand guidelines live in Figma (file **Jupi_Brand-Guidelines**, v3.0). The file link is not stored here: when you need an asset or template from it, ask the user for the link (or the frame link), then use the Figma tools (`get_design_context`, `get_screenshot`) on it.

What the library contains:
- **Brand assets**: logos (all colorways), the four gradients (Hero, Full, Spotlight, Science), 36 icons at 250×250, hero and spot illustrations (1500×1500), backdrops (1920×1080), team portraits
- **Social assets**: square and circle avatars (expressive, dark and light colorways), LinkedIn banners, and social post templates in 1:1, 9:16 and 16:9, in four families:
  - **Awareness**: headline-led, Hero gradient
  - **Showcasing**: product UI / feature-led
  - **Jupi Science**: Science gradient, research and insight-led
  - **Case studies**: people / photo-led, with stats

### How to use the Figma library
When the user asks for a specific social asset type:
1. Identify the family (Awareness / Showcasing / Science / Case studies) and the format (1:1 / 9:16 / 16:9)
2. Ask for the Figma link to that frame if you don't have it
3. Inspect it with `get_design_context` / `get_screenshot`
4. Use it as reference for generating the asset or directing Canva output

Logos never come from Figma: use the SVG files in `assets/` (see Logos).

---

## Long-form Articles & Thought Leadership

When producing a long-form HTML essay, manifesto, or thought leadership article (Stripe Press / Linear aesthetic), load the full styling reference before writing any code:

```
references/thought-leadership.md   (in this skill folder)
```

This reference covers: typography scale, section structure, dark interlude blocks, principle lists, definition blocks, comparison tables, flow diagrams, scroll animations, CTA section, and copy principles. Follow it precisely — these patterns were validated on `decision_infrastructure_manifesto.html`.

**Quick checklist before starting:**
- Fonts embedded as base64 woff2 (never CDN)
- Max content width 680px centered
- Zero em dashes
- Scroll animations via IntersectionObserver
- Progress bar at top of page

---

## Applying the Skill

### For HTML/React artifacts
1. Embed the brand fonts as base64 with `./embed-fonts.sh`; only if the font files are unavailable, fall back to the system stacks above (never Google Fonts)
2. Apply gradient as `background` on root or hero container
3. Embed the SVG logo inline, read from `assets/` (see Logos)
4. Use `#3B3B3B` for all text on light backgrounds
5. CTAs: pill-shaped (`border-radius: 9999px`), ALL CAPS, Roobert Medium

### For Canva / social assets
1. Determine brand context (Jupi vs Jupi Science)
2. Apply the correct canonical gradient as background
3. Use Fenul Standard for headline, Roobert for body/CTA
4. Place logo in a corner with clear padding
5. Keep copy to ≤ 10 words for headline, ≤ 20 for body

### For written copy
1. Lead with the decision/outcome, not the feature
2. Sentence case everywhere except CTAs
3. Short paragraphs (1–3 sentences max for social/headlines)
4. Use Jupi vocabulary where natural, never forced
