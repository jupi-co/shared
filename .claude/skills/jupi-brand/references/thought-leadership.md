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

Two fonts only. Both **MUST** be embedded as base64 woff2 in a `<style>` block at the top of `<head>`. Never use Google Fonts, CDN links, or relative `url()` paths for Jupi articles — without base64 embedding the browser falls back to system fonts and the entire design collapses.

**Fenul Standard** — headlines, section headings, definition verbs
- `font-weight: 800` = Heavy (default for headings)
- `font-weight: 400` italic = Medium Italic (for `<em>` inside headings)

**Roobert** — body text, meta, labels, captions, UI elements
- `font-weight: 400` = Regular (body)
- `font-weight: 500` = Medium (labels, nav, meta)
- `font-weight: 600` = SemiBold (pull quotes, conclusions)

**Never mix the two in the same heading.** Fenul Heavy + Fenul Italic works. Fenul Heavy + Roobert in the same heading line creates weight clash.

**How to embed — do this at the start of every article:**

1. Read each font file with `bash_tool`: `base64 -w 0 /mnt/skills/user/jupi-brand/assets/fonts/FenulStandard-Heavy.woff2`
2. Paste the output into the `<style>` block below — one `@font-face` per weight/style:

```html
<style>
@font-face {
  font-family: 'Fenul Standard';
  font-weight: 800;
  src: url('data:font/woff2;base64,[BASE64_FENUL_HEAVY]') format('woff2');
}
@font-face {
  font-family: 'Fenul Standard';
  font-weight: 400;
  font-style: italic;
  src: url('data:font/woff2;base64,[BASE64_FENUL_ITALIC]') format('woff2');
}
@font-face {
  font-family: 'Roobert';
  font-weight: 400;
  src: url('data:font/woff2;base64,[BASE64_ROOBERT_REGULAR]') format('woff2');
}
@font-face {
  font-family: 'Roobert';
  font-weight: 500;
  src: url('data:font/woff2;base64,[BASE64_ROOBERT_MEDIUM]') format('woff2');
}
@font-face {
  font-family: 'Roobert';
  font-weight: 600;
  src: url('data:font/woff2;base64,[BASE64_ROOBERT_SEMIBOLD]') format('woff2');
}
</style>
```

Font files are at `/mnt/skills/user/jupi-brand/assets/fonts/`. File names: `FenulStandard-Heavy.woff2`, `FenulStandard-MediumItalic.woff2`, `Roobert-Regular.woff2`, `Roobert-Medium.woff2`, `Roobert-SemiBold.woff2`.

---

## 3. Color palette

```css
--marble-white: #F5F4EE;   /* page background */
--almost-black: #3B3B3B;   /* all text, borders, icons */
--yellow:       #F7ED57;
--gold:         #FFCC70;
--pink:         #F398FF;
--violet:       #655CE5;
--teal:         #55B8B4;
```

Dark sections use `background: var(--almost-black)` with `color: var(--marble-white)`.
Never use pure `#000000` or `#FFFFFF`.

---

## 4. Typography scale

```css
/* Hero title */
font-family: 'Fenul Standard', Georgia, serif;
font-weight: 800;
font-size: clamp(52px, 8vw, 112px);
line-height: 0.95;
letter-spacing: -0.02em;

/* Section heading (h2) */
font-family: 'Fenul Standard', Georgia, serif;
font-weight: 800;
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

**Section heading pattern:** First line in Fenul Heavy, last line or key phrase in `<em>` (Fenul italic). Never put `<em>` on the first line if the heading has multiple lines — the italic should be the resolution, not the setup.

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
  font-weight: 800;
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

Use when the Jupi symbol appears as a fixed navigation element over a gradient or colored hero background. The goal is "presque fantôme" — visible mais pas dominant.

**CRITICAL: Always copy the exact SVG path data below — never attempt to reconstruct or approximate the Jupi symbol yourself.** Hand-drawn or approximated versions will be geometrically wrong. The two `<path>` elements below are the only correct source. Use them verbatim every time.

**HTML:**
```html
<nav>
  <a href="https://jupi.co" target="_blank"
     style="display:block;opacity:0.08;mix-blend-mode:multiply;transition:opacity 0.2s;text-decoration:none;"
     onmouseover="this.style.opacity=0.2"
     onmouseout="this.style.opacity=0.08">
    <svg viewBox="0 0 571 454" fill="none" xmlns="http://www.w3.org/2000/svg" style="width:67px;height:auto;">
      <path d="M403.762 137.782L429.072 131.239C429.072 131.239 390.028 64.1712 380.835 50.0957C356.133 12.2693 313.78 -4.82427 270.057 1.17368L176.41 40.5725L131.812 216.06C45.5075 180.351 0.98584 200.07 0.98584 200.07L25.7004 453.747H87.0241L101.188 352.39C240.929 346.113 260.102 236.844 275.839 162.814L278.096 162.243L292.083 217.163L418.357 185.386L403.774 137.808H403.762V137.782ZM366.366 91.9545C365.174 98.4851 357.3 109.403 350.135 108.097C342.945 106.791 332.344 96.6337 333.536 90.0905C334.728 83.5599 343.96 73.2252 351.162 74.544C358.378 75.8501 367.558 85.424 366.366 91.9545Z" fill="#3B3B3B"/>
      <path d="M536.36 330.973L439.099 354.343C444.717 290.521 434.547 237.681 427.369 220.879L298.28 241.536L352.148 453.037H480.159L570.902 377.156L536.372 330.973H536.36Z" fill="#3B3B3B"/>
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

**Paramètres clés:**
- `width: 67px` — présence sans dominer
- `opacity: 0.08` — effet glass, presque fantôme
- `mix-blend-mode: multiply` — se fonde dans le background gradient
- Hover: `opacity: 0.2` — confirme l'interactivité sans agressivité
- Couleur du symbol: `#3B3B3B` (Almost Black) — le blend mode fait le reste
- Position: top right fixe au scroll

**Variantes selon le contexte:**
- Sur fond blanc: `opacity: 0.12` suffit, `mix-blend-mode: multiply` reste
- Sur fond sombre (ex. section CTA noire): utiliser `jupi-symbol-white.svg` (fill `#F5F4EE`), supprimer `mix-blend-mode`, `opacity: 0.35`
- Sur fond coloré (violet, teal): tester entre `0.08` et `0.15` selon la couleur

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
  font-weight: 800;
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

**Principes clés:**
- `justify-content: flex-end` — le titre est toujours en bas de l'écran au chargement
- `z-index: 3` sur `.hero-content` — au-dessus du gradient et du fade
- Le gradient animé est dans `.hero-bg` — voir la section "Color Palettes" du jupi-brand SKILL.md pour le code complet des orbs
- Le `.hero-fade` crée la transition douce entre le gradient et le fond blanc du contenu
- Animations `fadeUp` staggerées : eyebrow 0.3s, titre 0.5s, meta 0.9s, scroll-line 1.5s
- `clamp(52px, 8vw, 112px)` pour le titre — reste lisible de mobile à grand écran
- La `scroll-line` s'étire en dernier (1.5s) — dernier élément à apparaître, signal de départ
- Tout le bloc meta est très discret : opacités 0.3–0.4, ce n'est pas de l'information principale

**Format date et durée de lecture:**
- Date : année seule (`2026`), jamais de mois ni de jour
- Durée : `N min read` en uppercase — calculer avec `Math.ceil(word_count / 200)` (body text uniquement, hors titres/labels/UI)
- Exemple : 1600 mots → `8 min read`
- Le séparateur entre date et durée est la ligne horizontale animée — jamais un bullet ou un slash

**Mobile (hero-meta):**
```css
@media (max-width: 768px) {
  .hero-meta { gap: 20px; }
  .scroll-line { width: 24px; }
}
```

---

## 9. Principle / failure mode block

**Quand l'utiliser :** Failure modes, principes, étapes, propriétés d'un système. Quand on a 3 à 6 items qui méritent chacun un nom propre. Exemple : "Memory failure / Alignment failure / Accountability failure / Learning failure".

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
  font-weight: 800;
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

**Note :** La colonne `.principle-n` est vide par défaut — le filet horizontal suffit à séparer. Si on veut numéroter, utiliser `01` `02` en Roobert très faible opacité. Jamais de bullet ou de numéro romain.

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
  font-weight: 800;
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

**Quand l'utiliser :** Quand il y a une progression historique ou logique à montrer. 4 à 6 lignes maximum. La dernière ligne est toujours la résolution — fond noir.

**Règles éditoriales pour le contenu :**
- Colonne 1 : nom du layer (Fenul Heavy) — concret, pas abstrait
- Colonne 2 : ce que le layer fait/produit (Roobert Medium) — une courte phrase. Pattern idéal : `"X happens. Y doesn't."` — trois premiers layers en négatif, dernier en positif
- Colonne 3 : exemples d'outils (Roobert Regular, discret) — 2–3 noms maximum
- Titre au-dessus : Fenul Heavy grand
- Sous-titre : Roobert 18px, une phrase qui dit ce que le tableau démontre

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

**Label column:** Fenul Heavy 16px
**Caption column:** Roobert 13px, opacity 0.55
**Tools column:** Roobert 12px, opacity 0.35, text-align right

Title above table: Fenul Heavy `clamp(22px, 3vw, 32px)`
Subtitle below title: Roobert 18px, weight 500, opacity 0.7

---

## 12. Simple inline diagram (3-block flow)

**Quand l'utiliser :** Quand on veut montrer ce qui se passe entre deux états. Exemple : Inputs → Decision → Execution. Maximum 3–4 blocs. Bloc central en noir = point de friction ou solution.

```html
<div class="ai-diag-title">Titre du diagramme</div>
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
  font-weight: 800;
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

**Quand l'utiliser :** Une conclusion de section, une ligne qui résume tout ce qui précède, sans sortir du flux. Fond très légèrement teinté, pas de couleur vive. Exemple : "AI does not make the decision problem smaller. It makes the cost of not solving it larger."

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

## 14. Quel format choisir — règle générale

Pour chaque bloc de contenu, se demander : est-ce une idée principale, un item de liste, une conclusion, ou une comparaison ? Ne jamais tout mettre en paragraphes. La variété des formats crée le rythme de lecture.

| Contenu | Format |
|---|---|
| Grande idée, argument principal | Section § numérotée |
| Liste de 3–6 items nommés | Sous-section principe/failure mode (§9) |
| Conclusion intermédiaire forte, une phrase | Interlude dark pleine largeur (§6) |
| Phrase importante dans le flux | Highlight block inline (§13) |
| Comparaison de layers/outils/approches | Stack diagram (§11) |
| Pipeline, transformation, flux | Diagramme de flux inline (§12) |
| Définition du produit | Typographic definition block (§10) |
| Conclusion finale | Closing heading + closing paragraphs |

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

**Important :** Le texte du CTA est en **Roobert Medium 16px**, pas en Fenul. Discret, border-bottom comme soulignement. Pas de gros titre.

**Footer — valeurs exactes :**

```css
footer {
  position: relative;
  padding: 40px 8vw;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
/* Séparateur en gradient, fondu sur les bords */
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

**Note sur le séparateur :** `footer::before` crée une ligne qui s'efface sur les bords — plus élégant qu'un `border-top` plein. Pas de `background` sur le footer — il hérite du fond de la page.

**Deux modes selon le contexte :**

Version fond dark (`decision_infrastructure_manifesto.html`) :
```css
.cta-section { background: var(--almost-black); }
footer { background: var(--almost-black); }
/* .cta-link color, .footer-copy color, SVG paths → var(--marble-white) / #F5F4EE */
```

Version avec gradient fixe visible jusqu'à la fin :
```css
.cta-section { background: transparent; }
footer { background: transparent; }
/* couleurs restent var(--almost-black) — le gradient fait le fond */
```

**Règle :** choisir l'une ou l'autre et être cohérent. Ne jamais mélanger.

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
