# Jupi Thought Leadership Article — Styling Guide

Use this reference whenever creating a long-form HTML essay, manifesto, or thought leadership article in the Jupi style. Reference implementation: `decision_infrastructure_manifesto.html`.

---

## 1. Design principles

- Aesthetic reference: **Stripe Press + Linear** — clean, essay-style, high-signal
- No decorative elements for their own sake. Every visual choice serves the text.
- Mobile-first responsive. Max content width ~680px centered.
- Zero em dashes throughout. Use colons, periods, or restructure.
- No "not X, not Y" defensive patterns.
- No VC clichés, no consulting abstractions.

---

## 2. Fonts

Two families only. Both **MUST** be embedded as base64 woff2 data URLs in a `<style>` block at the top of `<head>`. Never use Google Fonts, CDN links, or relative `url()` paths for Jupi articles: without embedding, the browser falls back to system fonts and the entire design collapses.

**Fenul Standard**: headlines, section headings, definition verbs
- `font-weight: 400` = Medium (all headings; the brand headline weight everywhere)
- `font-weight: 400` italic = Medium Italic (for `<em>` inside headings)

**Roobert**: body text, meta, labels, captions, UI elements
- `font-weight: 400` = Regular (body)
- `font-weight: 500` = Medium (labels, nav, meta)
- `font-weight: 600` = SemiBold (pull quotes, conclusions)

**Never mix the two families in the same heading.** Fenul Medium + Fenul Medium Italic works. Fenul + Roobert in the same heading line creates a clash.

**How to embed, at the start of every article:**

From the `jupi-brand` skill folder (fonts fetched once with `./fetch-fonts.sh`), generate the `@font-face` block and paste its output into the `<style>` block:

```bash
./embed-fonts.sh FenulStandard-Medium FenulStandard-MediumItalic Roobert-Regular Roobert-Medium Roobert-SemiBold
```

It prints one `@font-face` per file, with the family, weight and style already set.

---

## 3. Color palette

Same tokens as the `jupi-brand` SKILL.md (that file is the source of truth):

```css
--almost-black:    #3B3B3B;   /* all text, borders, icons */
--marble-white:    #F5F4EE;   /* page background */
--jupi-lavender:   #D8C8E8;   /* hero gradient */
--jupi-pink:       #F0C0C8;   /* hero gradient */
--jupi-peach:      #EBBF8A;   /* hero gradient */
--jupi-periwinkle: #C0C8E0;   /* hero gradient accent */
--science-purple:  #655CE5;   /* Jupi Science only */
--science-teal:    #55B8B4;   /* Jupi Science only */
```

Dark sections use `background: var(--almost-black)` with `color: var(--marble-white)`.
Never use pure `#000000`, and no `#FFFFFF` page or text colour (pure white is only for pills and badges).

---

## 4. Typography scale

```css
/* Hero title */
font-family: 'Fenul Standard', Georgia, serif;
font-weight: 400;
font-size: clamp(52px, 8vw, 112px);
line-height: 0.95;
letter-spacing: -0.02em;

/* Section heading (h2) */
font-family: 'Fenul Standard', Georgia, serif;
font-weight: 400;
font-size: clamp(32px, 4vw, 56px);
line-height: 1.05;
letter-spacing: -0.02em;

/* Section heading — italic portion (em inside h2) */
font-style: italic;
font-weight: 400; /* Fenul Medium Italic */

/* Body text */
font-family: 'Roobert', sans-serif;
font-weight: 400;
font-size: 18px;
line-height: 1.75;
color: var(--almost-black);
opacity: 0.8;

/* Eyebrow / label (uppercase small) */
font-family: 'Roobert', sans-serif;
font-weight: 500;
font-size: 11px;
letter-spacing: 0.14em;
text-transform: uppercase;
opacity: 0.35–0.5;

/* Section number */
font-family: 'Roobert', sans-serif;
font-weight: 500;
font-size: 11px;
letter-spacing: 0.14em;
text-transform: uppercase;
opacity: 0.25;
```

---

## 5. Page structure — sections

Each content section follows this pattern:
```html
<div class="section" id="sN">
  <div class="section-number">01</div>
  <h2 class="section-heading">Main heading<br><em>italic close.</em></h2>
  <p>Body copy...</p>
</div>
```

**Section heading pattern:** First line in Fenul Medium, last line or key phrase in `<em>` (Fenul Medium Italic). Never put `<em>` on the first line if the heading has multiple lines — the italic should be the resolution, not the setup.

**Section numbers:** Two digits, uppercase, very low opacity. They orient the reader without competing with the text.

**Content column:** max-width 680px, padding 0 8vw on desktop, 0 24px on mobile.

---

## 6. Dark interlude block

Full-bleed dark section used to punctuate between sections. One strong sentence, centered, white on dark.

```html
<div class="interlude">
  <div class="interlude-inner">
    <p>One strong sentence. <em>Italicized close.</em></p>
  </div>
</div>
```

```css
.interlude {
  background: var(--almost-black);
  padding: 80px 8vw;
}
.interlude-inner {
  max-width: 680px;
  margin: 0 auto;
}
.interlude p {
  font-family: 'Fenul Standard', Georgia, serif;
  font-weight: 400;
  font-size: clamp(24px, 3vw, 40px);
  line-height: 1.2;
  letter-spacing: -0.02em;
  color: var(--marble-white);
  opacity: 0.9;
}
.interlude em {
  font-style: italic;
  font-weight: 400;
  opacity: 0.7;
}
```

**Use sparingly** — maximum 2–3 per article. Each one should feel like a pause.

---

## 7. Nav logo — glass treatment

Use when the Jupi symbol appears as a fixed navigation element over a gradient or colored hero background. The goal is "almost a ghost": visible but not dominant.

**CRITICAL: never reconstruct or approximate the Jupi symbol.** Hand-drawn versions are geometrically wrong. Read `assets/jupi-symbol-dark.svg` from the skill folder and paste its `<path>` elements verbatim where marked below.

**HTML:**
```html
<nav>
  <a href="https://jupi.co" target="_blank"
     style="display:block;opacity:0.08;mix-blend-mode:multiply;transition:opacity 0.2s;text-decoration:none;"
     onmouseover="this.style.opacity=0.2"
     onmouseout="this.style.opacity=0.08">
    <svg viewBox="0 0 571 454" fill="none" xmlns="http://www.w3.org/2000/svg" style="width:67px;height:auto;">
      <!-- paste the <path> elements of assets/jupi-symbol-dark.svg here -->
    </svg>
  </a>
</nav>
```

**CSS:**
```css
nav {
  position: fixed;
  top: 0; right: 0;
  padding: 24px 48px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  z-index: 50;
}
```

**Key parameters:**
- `width: 67px`: present without dominating
- `opacity: 0.08`: glass effect, almost a ghost
- `mix-blend-mode: multiply`: blends into the background gradient
- Hover: `opacity: 0.2`: signals interactivity without shouting
- Symbol colour: `#3B3B3B` (Almost Black); the blend mode does the rest
- Position: top right, fixed on scroll

**Variants by context:**
- On a light background: `opacity: 0.12` is enough, keep `mix-blend-mode: multiply`
- On a dark background (e.g. a dark CTA section): use `jupi-symbol-white.svg` (fill `#F5F4EE`), drop `mix-blend-mode`, `opacity: 0.35`
- On a coloured background (Science purple or teal): try between `0.08` and `0.15` depending on the colour

---

## 8. Hero full-page cover

Full-viewport hero with animated gradient background, title at the bottom, eyebrow above the title, and meta info (date + read time). Reference: `decision_infrastructure_manifesto.html`.

**HTML structure:**
```html
<section class="hero">
  <div class="hero-bg">
    <div class="hero-orb3"></div>
    <div class="hero-fade"></div>
  </div>
  <div class="hero-content">
    <p class="hero-eyebrow">Category label</p>
    <h1 class="hero-title">The main<br><em>title.</em></h1>
    <div class="hero-meta">
      <span class="hero-date">2026</span>
      <div class="hero-scroll-hint">
        <div class="scroll-line"></div>
        8 min read
      </div>
    </div>
  </div>
</section>
```

**CSS:**
```css
.hero {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;  /* title at bottom */
  padding: 0 8vw 80px;
  position: relative;
  overflow: hidden;
}
/* Gradient background — see jupi-brand SKILL.md for orb animation */
.hero-bg {
  position: absolute;
  inset: 0;
  background-color: #F5F4EE;
  z-index: 0;
  overflow: hidden;
}
/* Fade at bottom to blend into content */
.hero-fade {
  position: absolute;
  bottom: 0; left: 0; right: 0;
  height: 40%;
  background: linear-gradient(to bottom, transparent 0%, #F5F4EE 100%);
  z-index: 1;
}
/* Content sits above background */
.hero-content {
  position: relative;
  z-index: 3;
}
/* Eyebrow — uppercase small label above title */
.hero-eyebrow {
  font-family: 'Roobert', sans-serif;
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--almost-black);
  opacity: 0;
  margin-bottom: 32px;
  transform: translateY(12px);
  animation: fadeUp 0.8s ease 0.3s forwards;
}
/* Hero title */
.hero-title {
  font-family: 'Fenul Standard', Georgia, serif;
  font-weight: 400;
  font-size: clamp(52px, 8vw, 112px);
  line-height: 0.95;
  letter-spacing: -0.02em;
  color: var(--almost-black);
  margin-bottom: 40px;
  opacity: 0;
  transform: translateY(20px);
  animation: fadeUp 1s ease 0.5s forwards;
}
.hero-title em {
  font-style: italic;
  font-weight: 400;
}
/* Meta — date + read time */
.hero-meta {
  display: flex;
  align-items: center;
  gap: 32px;
  opacity: 0;
  animation: fadeUp 0.8s ease 0.9s forwards;
}
.hero-date {
  font-family: 'Roobert', sans-serif;
  font-size: 12px;
  font-weight: 400;
  color: var(--almost-black);
  opacity: 0.4;
  letter-spacing: 0.06em;
}
.hero-scroll-hint {
  display: flex;
  align-items: center;
  gap: 8px;
  font-family: 'Roobert', sans-serif;
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--almost-black);
  opacity: 0.3;
}
.scroll-line {
  width: 40px;
  height: 1px;
  background: var(--almost-black);
  opacity: 0.4;
  animation: expandLine 1.2s ease 1.5s both;
}
/* Entry animations */
@keyframes fadeUp {
  to { opacity: 1; transform: translateY(0); }
}
@keyframes expandLine {
  from { width: 0; opacity: 0; }
  to   { width: 40px; opacity: 0.4; }
}
```

**Mobile:**
```css
@media (max-width: 768px) {
  .hero { padding: 0 6vw 60px; }
}
```

**Key principles:**
- `justify-content: flex-end`: the title always sits at the bottom of the screen on load
- `z-index: 3` on `.hero-content`: above the gradient and the fade
- The animated gradient lives in `.hero-bg`: see the "Hero Gradient Background Animation" section of the jupi-brand SKILL.md for the full orb code
- `.hero-fade` creates the soft transition between the gradient and the marble-white content background
- Staggered `fadeUp` animations: eyebrow 0.3s, title 0.5s, meta 0.9s, scroll-line 1.5s
- `clamp(52px, 8vw, 112px)` for the title: readable from mobile to large screens
- The `scroll-line` extends last (1.5s): the final element to appear, a cue to start reading
- The whole meta block is very quiet: opacities 0.3–0.4, it is not primary information

**Date and reading-time format:**
- Date: year only (`2026`), never month or day
- Duration: `N min read` in uppercase, computed as `Math.ceil(word_count / 200)` (body text only, excluding titles, labels and UI)
- Example: 1600 words → `8 min read`
- The separator between date and duration is the animated horizontal line, never a bullet or a slash

**Mobile (hero-meta):**
```css
@media (max-width: 768px) {
  .hero-meta { gap: 20px; }
  .scroll-line { width: 24px; }
}
```

---

## 9. Principle / failure mode block

**When to use:** failure modes, principles, steps, properties of a system. Whenever there are 3 to 6 items that each deserve their own name. Example: "Memory failure / Alignment failure / Accountability failure / Learning failure".

```html
<div class="principles-list">
  <div class="principle-item" id="p1">
    <span class="principle-n"></span>
    <div class="principle-text">
      <strong>Memory failure</strong>
      When a decision is made and recorded nowhere, it belongs to everyone and therefore to no one.
    </div>
  </div>
  <!-- repeat -->
</div>
```

```css
.principles-list {
  border-top: 1px solid rgba(59,59,59,0.1);
  margin: 40px 0;
}
.principle-item {
  display: grid;
  grid-template-columns: 40px 1fr;
  gap: 24px;
  padding: 24px 0;
  border-bottom: 1px solid rgba(59,59,59,0.1);
  opacity: 0;
  transform: translateY(12px);
  transition: opacity 0.5s ease, transform 0.5s ease;
}
.principle-item.visible { opacity: 1; transform: translateY(0); }
.principle-n {
  font-family: 'Roobert', sans-serif;
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.14em;
  color: var(--almost-black);
  opacity: 0.25;
  padding-top: 3px;
}
.principle-text strong {
  display: block;
  font-family: 'Fenul Standard', Georgia, serif;
  font-weight: 400;
  font-size: clamp(18px, 2vw, 24px);
  letter-spacing: -0.01em;
  margin-bottom: 8px;
  color: var(--almost-black);
}
.principle-text {
  font-family: 'Roobert', sans-serif;
  font-size: 17px;
  line-height: 1.65;
  color: var(--almost-black);
  opacity: 0.7;
}
```

**Note:** the `.principle-n` column is empty by default; the horizontal rule is enough to separate items. To number them, use `01` `02` in very low-opacity Roobert. Never bullets or Roman numerals.

---

## 10. Typographic definition block

Used for the key definition of the product/category. One intro sentence + animated verb list.

```html
<div class="definition-block">
  <div class="def-intro">Decision infrastructure is the layer that</div>
  <div class="def-verbs">
    <div class="def-verb-row">
      <span class="def-verb">surfaces</span>
      <span class="def-desc">the right decision, at the right time, from your data</span>
    </div>
    <!-- repeat -->
  </div>
</div>
```

```css
.def-intro {
  font-family: 'Roobert', sans-serif;
  font-size: clamp(20px, 2.5vw, 28px);
  font-weight: 400;
  opacity: 0.5;
  margin-bottom: 16px;
}
.def-verb {
  font-family: 'Fenul Standard', Georgia, serif;
  font-weight: 400;
  font-size: clamp(32px, 4vw, 56px);
  letter-spacing: -0.02em;
  min-width: 200px;
}
.def-desc {
  font-family: 'Roobert', sans-serif;
  font-size: 16px;
  opacity: 0.5;
  align-self: flex-end;
  padding-bottom: 8px;
}
```

Animate each row in with IntersectionObserver on `.def-verb-row` → add class `visible`:

```css
.def-verb-row {
  opacity: 0;
  transform: translateX(-12px);
  transition: opacity 0.5s ease, transform 0.5s ease;
}
.def-verb-row.visible {
  opacity: 1;
  transform: translateX(0);
}
```

Stagger each row by `i * 100ms` delay.

---

## 11. Data/comparison table (stack diagram)

**When to use:** when there is a historical or logical progression to show. 4 to 6 rows maximum. The last row is always the resolution, on a dark background.

**Editorial rules for the content:**
- Column 1: layer name (Fenul Medium), concrete, not abstract
- Column 2: what the layer does or produces (Roobert Medium), one short sentence. Ideal pattern: `"X happens. Y doesn't."`, first three layers negative, the last one positive
- Column 3: example tools (Roobert Regular, quiet), 2–3 names maximum
- Title above: large Fenul Medium
- Subtitle: Roobert 18px, one sentence saying what the table demonstrates

```css
.stack-outer {
  border: 1.5px solid var(--almost-black);
  border-radius: 3px;
  overflow: hidden;
}
.stack-row {
  display: grid;
  grid-template-columns: 160px 1fr 1fr;
  padding: 18px 24px;
  border-bottom: 1px solid rgba(59,59,59,0.1);
}
/* Graduated backgrounds — lightest at top */
.stack-row-0 { background: rgba(59,59,59,0.005); }
.stack-row-1 { background: rgba(59,59,59,0.02); }
.stack-row-2 { background: rgba(59,59,59,0.04); }
.stack-row-3 { background: rgba(59,59,59,0.06); }
/* Last row — dark, resolution */
.stack-row-4 { background: var(--almost-black); }
.stack-row-4 * { color: var(--marble-white); }
```

**Label column:** Fenul Medium 16px
**Caption column:** Roobert 13px, opacity 0.55
**Tools column:** Roobert 12px, opacity 0.35, text-align right

Title above table: Fenul Medium `clamp(22px, 3vw, 32px)`
Subtitle below title: Roobert 18px, weight 500, opacity 0.7

---

## 12. Simple inline diagram (3-block flow)

**When to use:** to show what happens between two states. Example: Inputs → Decision → Execution. 3–4 blocks maximum. The dark central block is the friction point or the solution.

```html
<div class="ai-diag-title">Diagram title</div>
<div class="ai-diagram">
  <div class="ai-diag-row">
    <div class="ai-diag-block ai-diag-inputs">
      <div class="ai-diag-label">Inputs</div>
      <div class="ai-diag-sub">Description courte</div>
      <div class="ai-diag-tag">Note optionnelle</div>
    </div>
    <div class="ai-diag-arrow">→</div>
    <div class="ai-diag-block ai-diag-decision"> <!-- dark center -->
      <div class="ai-diag-label">Centre</div>
      <div class="ai-diag-sub">Description</div>
    </div>
    <div class="ai-diag-arrow">→</div>
    <div class="ai-diag-block ai-diag-execution">
      <div class="ai-diag-label">Output</div>
      <div class="ai-diag-sub">Description courte</div>
      <div class="ai-diag-tag">Note optionnelle</div>
    </div>
  </div>
  <div class="ai-diag-caption">Une phrase de conclusion.</div>
</div>
```

```css
.ai-diag-title {
  font-family: 'Roobert', sans-serif;
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--almost-black);
  opacity: 0.35;
  margin-bottom: 12px;
}
.ai-diagram {
  margin: 48px 0;
  padding: 40px 32px 32px;
  background: rgba(59,59,59,0.03);
  border: 1px solid rgba(59,59,59,0.08);
  border-radius: 4px;
}
.ai-diag-row {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 24px;
}
.ai-diag-block {
  flex: 1;
  padding: 20px;
  border-radius: 2px;
}
.ai-diag-inputs, .ai-diag-execution {
  background: rgba(59,59,59,0.04);
  border: 1px solid rgba(59,59,59,0.1);
}
.ai-diag-decision { background: var(--almost-black); }
.ai-diag-label {
  font-family: 'Fenul Standard', Georgia, serif;
  font-weight: 400;
  font-size: 15px;
  color: var(--almost-black);
  margin-bottom: 4px;
}
.ai-diag-decision .ai-diag-label { color: var(--marble-white); }
.ai-diag-sub {
  font-size: 12px;
  color: var(--almost-black);
  opacity: 0.45;
}
.ai-diag-decision .ai-diag-sub { color: var(--marble-white); opacity: 0.5; }
.ai-diag-tag {
  margin-top: 10px;
  font-size: 10px;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--almost-black);
  opacity: 0.35;
}
.ai-diag-arrow {
  font-size: 18px;
  color: var(--almost-black);
  opacity: 0.2;
  flex-shrink: 0;
}
.ai-diag-caption {
  font-size: 13px;
  font-style: italic;
  color: var(--almost-black);
  opacity: 0.45;
  text-align: center;
  line-height: 1.6;
}
```

---

## 13. Highlight block inline

**When to use:** a section conclusion, one line that sums up everything before it, without leaving the flow. Very lightly tinted background, no bright colour. Example: "AI does not make the decision problem smaller. It makes the cost of not solving it larger."

```html
<div class="highlight-block">
  <p>AI does not make the decision problem smaller. <em>It makes the cost of not solving it larger.</em></p>
</div>
```

```css
.highlight-block {
  background: rgba(59,59,59,0.04);
  border-left: 2px solid rgba(59,59,59,0.15);
  padding: 24px 28px;
  margin: 32px 0;
  border-radius: 0 2px 2px 0;
}
.highlight-block p {
  font-family: 'Roobert', sans-serif;
  font-size: 18px;
  font-weight: 500;
  line-height: 1.65;
  color: var(--almost-black);
  opacity: 0.85;
  margin: 0;
}
.highlight-block em {
  font-style: italic;
  font-weight: 400;
  opacity: 0.7;
}
```

**Variante sans bordure gauche** — encore plus discret :
```css
.highlight-block-soft {
  background: rgba(59,59,59,0.03);
  padding: 20px 24px;
  margin: 32px 0;
  border-radius: 2px;
}
```

---

## 14. Choosing a format: general rule

For each block of content, ask: is it a main idea, a list item, a conclusion, or a comparison? Never put everything in paragraphs. Varied formats create the reading rhythm.

| Content | Format |
|---|---|
| Big idea, main argument | Numbered § section |
| List of 3–6 named items | Principle / failure mode block (§9) |
| Strong one-sentence interim conclusion | Full-width dark interlude (§6) |
| Important sentence in the flow | Inline highlight block (§13) |
| Comparing layers, tools or approaches | Stack diagram (§11) |
| Pipeline, transformation, flow | Inline flow diagram (§12) |
| Product definition | Typographic definition block (§10) |
| Final conclusion | Closing heading + closing paragraphs |

---

## 15. Scroll animations

Use IntersectionObserver for all section entries. Avoid CSS-only scroll animations (no browser support guarantee).

```js
const observer = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.classList.add('visible');
      observer.unobserve(e.target);
    }
  });
}, { threshold: 0.15 });

document.querySelectorAll('.section, .interlude, .principle-item, .def-verb-row, .ai-diagram').forEach(el => observer.observe(el));
```

Default entry animation:

```css
.section {
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 0.7s ease, transform 0.7s ease;
}
.section.visible {
  opacity: 1;
  transform: translateY(0);
}
```

Progress bar at top of page:

```js
window.addEventListener('scroll', () => {
  const pct = window.scrollY / (document.body.scrollHeight - window.innerHeight) * 100;
  document.getElementById('progress-bar').style.width = pct + '%';
});
```

```css
#progress-bar {
  position: fixed;
  top: 0; left: 0;
  height: 2px;
  background: var(--almost-black);
  opacity: 0.15;
  z-index: 100;
  transition: width 0.1s linear;
}
```

---

## 16. CTA section + footer

The CTA and footer background depend on whether the hero gradient is fixed or not. Choose one mode and be consistent — never mix transparent CTA with dark footer or vice versa.

**CTA — valeurs exactes :**

```css
.cta-section {
  padding: 80px 48px 120px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.cta-symbol { margin-bottom: 32px; }
.cta-symbol svg { width: 80px; height: auto; opacity: 0.85; }
.cta-link {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  font-family: 'Roobert', sans-serif;  /* PAS Fenul */
  font-size: 16px;
  font-weight: 500;
  color: var(--almost-black);
  text-decoration: none;
  border-bottom: 1px solid rgba(59,59,59,0.25);
  padding-bottom: 4px;
  transition: border-color 0.2s, opacity 0.2s;
  opacity: 0.65;
}
.cta-link:hover { border-color: var(--almost-black); opacity: 1; }
.cta-arrow { font-size: 18px; transition: transform 0.2s; }
.cta-link:hover .cta-arrow { transform: translateX(4px); }
```

**Important:** the CTA text is **Roobert Medium 16px**, not Fenul. Quiet, with a border-bottom as underline. No big heading.

**Footer — valeurs exactes :**

```css
footer {
  position: relative;
  padding: 40px 8vw;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
/* Gradient separator, fading out at the edges */
footer::before {
  content: '';
  position: absolute;
  top: 0; left: 0; right: 0;
  height: 1px;
  background: linear-gradient(
    to right,
    transparent 0%,
    rgba(59,59,59,0.15) 15%,
    rgba(59,59,59,0.15) 85%,
    transparent 100%
  );
}
.footer-copy {
  font-family: 'Roobert', sans-serif;
  font-size: 12px;
  font-weight: 400;
  color: var(--almost-black);
  opacity: 0.3;
  letter-spacing: 0.04em;
}
.footer-jupi {
  display: flex;
  align-items: center;
  gap: 10px;
  text-decoration: none;
}
.footer-jupi:hover .footer-jupi-wordmark,
.footer-jupi:hover .footer-jupi-sym,
.footer-jupi:hover .footer-jupi-label { opacity: 0.7; }
.footer-jupi-label {
  font-family: 'Roobert', sans-serif;
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--almost-black);
  opacity: 0.35;
}
.footer-jupi-sym      { height: 17px; width: auto; opacity: 0.35; transition: opacity 0.2s; }
.footer-jupi-wordmark { height: 13px; width: auto; opacity: 0.35; transition: opacity 0.2s; }
@media (max-width: 768px) {
  footer { padding: 32px 24px; flex-direction: column; gap: 20px; align-items: flex-start; }
}
```

**Separator note:** `footer::before` draws a line that fades out at the edges, more elegant than a solid `border-top`. No `background` on the footer: it inherits the page background.

**Two modes depending on context:**

Dark background version (`decision_infrastructure_manifesto.html`):
```css
.cta-section { background: var(--almost-black); }
footer { background: var(--almost-black); }
/* .cta-link color, .footer-copy color, SVG paths → var(--marble-white) / #F5F4EE */
```

Version with the fixed gradient visible to the end:
```css
.cta-section { background: transparent; }
footer { background: transparent; }
/* colours stay var(--almost-black); the gradient is the background */
```

**Rule:** pick one and stay consistent. Never mix them.

---

## 17. Copy principles (enforced on every article)

- **Zero em dashes.** Use colons, periods, or restructure the sentence.
- **No "Most companies…"** — credibility tax, remove.
- **No "not X, not Y"** defensive patterns.
- **No VC clichés** — "win the next decade", "only durable advantage", etc.
- **No consulting abstractions** — "structural", "institutional wisdom", "organizational life".
- Short declarative sentences. Brutal precision over polish.
- Concrete over abstract. If it "sounds smart" without being specific, cut it.
- The italic `<em>` in a heading is the resolution, not the setup.
- Section interludes: maximum one sentence. If it needs two, it's a paragraph, not an interlude.
