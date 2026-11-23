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
--jupi-pink:     #F0C0C8;  /* hero top-center, footer bottom-left */
--jupi-peach:    #EBBF8A;  /* hero right */
--jupi-periwinkle: #C0C8E0; /* hero bottom-left accent */
--footer-cream:  #FDFAF5;  /* footer/full gradient base */
--footer-gold:   #F0D4A0;  /* footer bottom-right */

/* Jupi Science — cool palette */
--science-purple: #655CE5;
--dusty-blue:     #55B8B4;  /* also Jade Green */
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
- Character: "surreal but serious" — high contrast, editorial serif

### Secondary — Body & UI
**Roobert**
- Weights: Regular (body), Semibold (emphasis), Medium (CTAs/buttons)
- Use for: body copy, captions, CTAs, UI labels, navigation
- Case: Sentence case for body; ALL CAPS for buttons/CTAs/titles
- Leading: 110–120%
- Tracking: 0% (body), -1% (buttons)

### Brand font files — available locally

All font files go in `assets/fonts/`. **They are licensed and not committed to this public repo**: run `./fetch-fonts.sh` from this skill folder once (needs `gh` and access to the private `jupi-co/decide` repo). **Always use these in HTML/React artifacts** — do not rely on system fallbacks or Google Fonts.

Available files:
| File | Weight | Style |
|---|---|---|
| `FenulStandard-Medium.woff2` / `.woff` | Medium (400) | Normal |
| `FenulStandard-MediumItalic.woff2` / `.woff` | Medium (400) | Italic |
| `FenulStandard-Heavy.woff2` / `.woff` | Heavy (800) | Normal |
| `Roobert-Regular.woff2` / `.woff` | Regular (400) | Normal |
| `Roobert-RegularItalic.woff2` / `.woff` | Regular (400) | Italic |
| `Roobert-Medium.woff2` / `.woff` | Medium (500) | Normal |
| `Roobert-MediumItalic.woff2` / `.woff` | Medium (500) | Italic |
| `Roobert-SemiBold.woff2` / `.woff` | SemiBold (600) | Normal |
| `Roobert-SemiBoldItalic.woff2` / `.woff` | SemiBold (600) | Italic |

### @font-face snippet — copy into every HTML/React artifact

When producing a Jupi artifact, read the font files from `assets/fonts/` and embed them as base64 `@font-face` declarations, **or** reference them via a relative path if the artifact is served from the same origin. For Claude.ai artifacts (no filesystem access), use the base64 approach:

```css
/* --- Fenul Standard --- */
@font-face {
  font-family: 'Fenul Standard';
  src: url('assets/fonts/FenulStandard-Medium.woff2') format('woff2'),
       url('assets/fonts/FenulStandard-Medium.woff') format('woff');
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: 'Fenul Standard';
  src: url('assets/fonts/FenulStandard-MediumItalic.woff2') format('woff2'),
       url('assets/fonts/FenulStandard-MediumItalic.woff') format('woff');
  font-weight: 400;
  font-style: italic;
}
@font-face {
  font-family: 'Fenul Standard';
  src: url('assets/fonts/FenulStandard-Heavy.woff2') format('woff2'),
       url('assets/fonts/FenulStandard-Heavy.woff') format('woff');
  font-weight: 800;
  font-style: normal;
}

/* --- Roobert --- */
@font-face {
  font-family: 'Roobert';
  src: url('assets/fonts/Roobert-Regular.woff2') format('woff2'),
       url('assets/fonts/Roobert-Regular.woff') format('woff');
  font-weight: 400;
  font-style: normal;
}
@font-face {
  font-family: 'Roobert';
  src: url('assets/fonts/Roobert-RegularItalic.woff2') format('woff2'),
       url('assets/fonts/Roobert-RegularItalic.woff') format('woff');
  font-weight: 400;
  font-style: italic;
}
@font-face {
  font-family: 'Roobert';
  src: url('assets/fonts/Roobert-Medium.woff2') format('woff2'),
       url('assets/fonts/Roobert-Medium.woff') format('woff');
  font-weight: 500;
  font-style: normal;
}
@font-face {
  font-family: 'Roobert';
  src: url('assets/fonts/Roobert-MediumItalic.woff2') format('woff2'),
       url('assets/fonts/Roobert-MediumItalic.woff') format('woff');
  font-weight: 500;
  font-style: italic;
}
@font-face {
  font-family: 'Roobert';
  src: url('assets/fonts/Roobert-SemiBold.woff2') format('woff2'),
       url('assets/fonts/Roobert-SemiBold.woff') format('woff');
  font-weight: 600;
  font-style: normal;
}
@font-face {
  font-family: 'Roobert';
  src: url('assets/fonts/Roobert-SemiBoldItalic.woff2') format('woff2'),
       url('assets/fonts/Roobert-SemiBoldItalic.woff') format('woff');
  font-weight: 600;
  font-style: italic;
}
```

### System Fallbacks (only when font files are inaccessible)
- Headlines: `Times New Roman Regular`
- Body / UI: `Helvetica Neue Regular / Bold / Medium`

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

Four logo variants, two colorways each. All SVG files are in `assets/`. Path data for the two most-used logos is embedded below for quick inline use.

### Logo usage rules
- **On light / Hero gradient backgrounds** → use Almost Black (`#3B3B3B`)
- **On dark / Science gradient backgrounds** → use Marble White (`#F5F4EE`)
- Never rotate, distort, or recolor outside these two values
- Always give clear breathing room (min padding = logo height × 0.25)

---

### 1. Jupi Lock-up (wordmark + symbol) — most common logo
Use this as the primary brand identifier in social posts, headers, and marketing.

**Almost Black** — `assets/jupi-lockup-dark.svg`
```svg
<svg width="2000" height="466" viewBox="0 0 2000 466" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1054.27 115.267L1032.43 277.935L1011.23 301.039L955.193 317.41L846.444 354.995L837.06 396.169L836.667 454.526L729.947 457.391L721.577 392.644L723.378 331.574L710.748 241.985L699.209 131.486L700.515 10.9434L819.903 0L958.097 5.85847C958.097 5.85847 1063.42 42.011 1054.28 115.267H1054.27ZM846.875 81.9932L841.968 137.839L840.547 273.154L886.248 283.793L944.098 165.369L967.887 95.8785L905.32 82.5638L846.964 81.9805H846.888L846.875 81.9932Z" fill="#3B3B3B"/>
<path d="M332.397 320.821L335.961 130.877L328.783 74.6637L327.097 10.9181L463.363 5.85847L463.896 139.031L480.685 339.22L532.13 369.172L570.528 331.574L576.779 172.901L566.077 5.85847L644.747 8.3946L645.673 91.0091L640.119 164.024L642.173 241.972L630.038 377.833L516.926 451.254L452.686 466.002C452.686 466.002 346.41 432.499 332.372 320.821L332.397 320.846V320.821Z" fill="#3B3B3B"/>
<path d="M274.866 5.87063L270.567 74.6759L277.516 200.417L276.223 268.627L278.607 331.573L230.458 430.774L119.198 466.001L15.7621 370.021L0 259.877L61.1081 241.972L100.558 323.648L158.166 241.972L149.365 87.8131L153.322 10.9302L274.853 5.87063H274.866Z" fill="#3B3B3B"/>
<path d="M1220.25 5.87063L1216.07 62.2489L1220.39 185.682L1213.99 257.151L1219.92 377.832L1221.03 454.538L1093.78 457.404L1089.44 394.508L1097.35 331.738L1088.86 268.969L1097.4 138.041L1089.71 10.9429H1156.41L1220.23 5.88331L1220.25 5.87063Z" fill="#3B3B3B"/>
<path d="M1832.86 140.236L1858.17 133.692C1858.17 133.692 1819.13 66.6243 1809.93 52.5488C1785.23 14.7224 1742.88 -2.37115 1699.15 3.62681L1605.51 43.0256L1560.91 218.513C1474.61 182.805 1430.08 202.523 1430.08 202.523L1454.8 456.2H1516.12L1530.29 354.843C1670.03 348.566 1689.2 239.297 1704.94 165.267L1707.19 164.697L1721.18 219.617L1847.46 187.839L1832.87 140.261H1832.86V140.236ZM1795.46 94.4077C1794.27 100.938 1786.4 111.856 1779.23 110.55C1772.04 109.244 1761.44 99.0868 1762.63 92.5436C1763.83 86.0131 1773.06 75.6783 1780.26 76.9971C1787.48 78.3032 1796.66 87.8771 1795.46 94.4077Z" fill="#3B3B3B"/>
<path d="M1965.46 333.426L1868.2 356.796C1873.81 292.974 1863.64 240.134 1856.47 223.332L1727.38 243.989L1781.25 455.49H1909.26L2000 379.609L1965.47 333.426H1965.46Z" fill="#3B3B3B"/>
</svg>
```

**Marble White** — `assets/jupi-lockup-white.svg` (same paths, fill `#F5F4EE`)
```svg
<svg width="2000" height="466" viewBox="0 0 2000 466" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1054.27 115.269L1032.43 277.936L1011.23 301.04L955.193 317.411L846.444 354.997L837.06 396.171L836.667 454.527L729.947 457.393L721.577 392.646L723.378 331.576L710.748 241.987L699.209 131.487L700.515 10.945L819.903 0.00158691L958.097 5.86005C958.097 5.86005 1063.42 42.0126 1054.28 115.269H1054.27ZM846.875 81.9948L841.968 137.84L840.547 273.156L886.248 283.795L944.098 165.37L967.887 95.8801L905.32 82.5654L846.964 81.9821H846.888L846.875 81.9948Z" fill="#F5F4EE"/>
<path d="M332.397 320.822L335.961 130.879L328.783 74.6653L327.097 10.9196L463.363 5.86005L463.896 139.032L480.685 339.222L532.13 369.174L570.528 331.576L576.779 172.902L566.077 5.86005L644.747 8.39618L645.673 91.0107L640.119 164.026L642.173 241.974L630.038 377.835L516.926 451.256L452.686 466.003C452.686 466.003 346.41 432.501 332.372 320.822L332.397 320.848V320.822Z" fill="#F5F4EE"/>
<path d="M274.866 5.87219L270.567 74.6775L277.516 200.419L276.223 268.628L278.607 331.575L230.458 430.776L119.198 466.003L15.7621 370.023L0 259.879L61.1081 241.973L100.558 323.65L158.166 241.973L149.365 87.8146L153.322 10.9318L274.853 5.87219H274.866Z" fill="#F5F4EE"/>
<path d="M1220.25 5.87219L1216.07 62.2504L1220.39 185.684L1213.99 257.152L1219.92 377.834L1221.03 454.539L1093.78 457.405L1089.44 394.509L1097.35 331.74L1088.86 268.971L1097.4 138.043L1089.71 10.9445H1156.41L1220.23 5.88487L1220.25 5.87219Z" fill="#F5F4EE"/>
<path d="M1832.86 140.237L1858.17 133.694C1858.17 133.694 1819.13 66.6259 1809.93 52.5504C1785.23 14.724 1742.88 -2.36956 1699.15 3.6284L1605.51 43.0272L1560.91 218.515C1474.61 182.806 1430.08 202.525 1430.08 202.525L1454.8 456.201H1516.12L1530.29 354.845C1670.03 348.568 1689.2 239.298 1704.94 165.269L1707.19 164.698L1721.18 219.618L1847.46 187.84L1832.87 140.263H1832.86V140.237ZM1795.46 94.4092C1794.27 100.94 1786.4 111.858 1779.23 110.552C1772.04 109.246 1761.44 99.0884 1762.63 92.5452C1763.83 86.0147 1773.06 75.6799 1780.26 76.9987C1787.48 78.3048 1796.66 87.8787 1795.46 94.4092Z" fill="#F5F4EE"/>
<path d="M1965.46 333.427L1868.2 356.798C1873.81 292.976 1863.64 240.136 1856.47 223.334L1727.38 243.991L1781.25 455.491H1909.26L2000 379.61L1965.47 333.427H1965.46Z" fill="#F5F4EE"/>
</svg>
```

---

### 2. Jupi Symbol only (bird/figure glyph)
Use as standalone icon, favicon, social avatar, or app icon.

**Almost Black** — `assets/jupi-symbol-dark.svg`
```svg
<svg width="571" height="454" viewBox="0 0 571 454" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M403.762 137.782L429.072 131.239C429.072 131.239 390.028 64.1712 380.835 50.0957C356.133 12.2693 313.78 -4.82427 270.057 1.17368L176.41 40.5725L131.812 216.06C45.5075 180.351 0.98584 200.07 0.98584 200.07L25.7004 453.747H87.0241L101.188 352.39C240.929 346.113 260.102 236.844 275.839 162.814L278.096 162.243L292.083 217.163L418.357 185.386L403.774 137.808H403.762V137.782ZM366.366 91.9545C365.174 98.4851 357.3 109.403 350.135 108.097C342.945 106.791 332.344 96.6337 333.536 90.0905C334.728 83.5599 343.96 73.2252 351.162 74.544C358.378 75.8501 367.558 85.424 366.366 91.9545Z" fill="#3B3B3B"/>
<path d="M536.36 330.973L439.099 354.343C444.717 290.521 434.547 237.681 427.369 220.879L298.28 241.536L352.148 453.037H480.159L570.902 377.156L536.372 330.973H536.36Z" fill="#3B3B3B"/>
</svg>
```

**Marble White** — `assets/jupi-symbol-white.svg` (slightly different path data — use this file, not just a fill swap)
```svg
<svg width="571" height="455" viewBox="0 0 571 455" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M403.762 138.529L429.072 131.986C429.072 131.986 390.028 64.9177 380.835 50.8422C356.133 13.0158 313.78 -4.07775 270.057 1.9202L176.41 41.319L131.812 216.807C45.5075 181.098 0.98584 200.816 0.98584 200.816L25.7004 454.493H87.0241L101.188 353.137C240.929 346.86 260.102 237.59 275.839 163.561L278.096 162.99L292.083 217.91L418.357 186.132L403.774 138.554H403.762V138.529ZM366.366 92.7011C365.174 99.2316 357.3 110.15 350.135 108.844C342.945 107.537 332.344 97.3802 333.536 90.837C334.728 84.3065 343.96 73.9717 351.162 75.2905C358.378 76.5966 367.558 86.1705 366.366 92.7011Z" fill="#F5F4EE"/>
<path d="M536.36 331.719L439.099 355.09C444.717 291.268 434.547 238.427 427.369 221.626L298.28 242.282L352.148 453.783H480.159L570.902 377.902L536.372 331.719H536.36Z" fill="#F5F4EE"/>
</svg>
```

---

### 3. Jupi Wordmark only — "JUPI" lettering without symbol
Use when space is tight or a square format isn't suitable for the Lock-up.

**Almost Black** — `assets/jupi-wordmark-dark.svg`
```svg
<svg width="1222" height="466" viewBox="0 0 1222 466" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1054.28 115.267L1032.44 277.935L1011.24 301.039L955.207 317.41L846.458 354.995L837.074 396.169L836.681 454.526L729.96 457.391L721.591 392.644L723.392 331.574L710.762 241.985L699.222 131.486L700.528 10.9434L819.917 0L958.111 5.85847C958.111 5.85847 1063.44 42.011 1054.29 115.267H1054.28ZM846.889 81.9932L841.981 137.839L840.561 273.154L886.262 283.793L944.111 165.369L967.9 95.8785L905.334 82.5638L846.977 81.9805H846.901L846.889 81.9932Z" fill="#3B3B3B"/>
<path d="M332.411 320.821L335.974 130.877L328.797 74.6637L327.111 10.9181L463.377 5.85847L463.91 139.031L480.699 339.22L532.144 369.172L570.541 331.574L576.793 172.901L566.09 5.85847L644.761 8.3946L645.687 91.0091L640.133 164.024L642.187 241.972L630.052 377.833L516.94 451.254L452.7 466.002C452.7 466.002 346.423 432.499 332.386 320.821L332.411 320.846V320.821Z" fill="#3B3B3B"/>
<path d="M274.88 5.87063L270.581 74.6759L277.53 200.417L276.237 268.627L278.62 331.573L230.472 430.774L119.212 466.001L15.7757 370.021L0.0136719 259.877L61.1218 241.972L100.571 323.648L158.18 241.972L149.379 87.8131L153.336 10.9302L274.867 5.87063H274.88Z" fill="#3B3B3B"/>
<path d="M1220.27 5.87063L1216.08 62.2489L1220.41 185.682L1214 257.151L1219.94 377.832L1221.04 454.538L1093.79 457.404L1089.45 394.508L1097.37 331.738L1088.87 268.969L1097.42 138.041L1089.72 10.9429H1156.42L1220.24 5.88331L1220.27 5.87063Z" fill="#3B3B3B"/>
</svg>
```

**Marble White** — `assets/jupi-wordmark-white.svg` (same paths, fill `#F5F4EE`)

---

### 4. Jupi Science Wordmark
Chunky blocky lettering. **Only on Jupi Science touchpoints.** Both colorways have slightly different path data — always use the correct file.

**Almost Black** — `assets/jupi-science-dark.svg`
```svg
<svg width="1230" height="771" viewBox="0 0 1230 771" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M959.202 5.79792L821.022 0L701.652 11.0133L700.292 131.605L711.916 242.126L724.594 331.702L722.763 392.844L731.168 457.648L837.861 454.735L838.305 396.339L847.626 355.227L956.455 317.637L1012.55 301.27L1033.8 278.189L1055.66 115.57C1064.84 42.3609 959.507 6.13082 959.507 6.13082L959.202 5.82566V5.79792ZM945.276 165.366L887.352 283.821L841.634 273.113L843.021 137.846L847.904 82.0587L906.299 82.669L968.8 95.957L944.943 165.504L945.248 165.338L945.276 165.366Z" fill="#3B3B3B"/>
<path d="M645.86 8.40406L567.13 5.79638L577.839 172.854L571.569 331.507L533.203 369.096L481.687 339.135L464.876 138.899L464.266 5.76864L327.917 10.8175L329.61 74.567L336.795 130.826L333.272 320.826C347.336 432.568 453.558 466.024 453.558 466.024L517.751 451.349L630.852 377.973L642.919 242.096L640.922 164.143L646.415 91.073L645.499 8.37632H645.805L645.86 8.40406Z" fill="#3B3B3B"/>
<path d="M278.567 200.373L271.687 74.7327L275.959 5.79567L154.286 10.9833L150.319 87.8543L159.196 241.929L101.578 323.711L62.1295 241.929L0.987793 259.989L16.7448 370.038L120.22 466.023L231.49 430.875L279.649 331.672L277.346 268.7L278.567 200.373Z" fill="#3B3B3B"/>
<path d="M1215.19 257.242L1221.6 185.698L1217.33 62.1937L1221.46 5.79567L1157.57 10.9833H1090.94L1098.56 138.011L1090.02 269.005L1098.56 331.811L1090.63 394.478L1094.9 457.451L1222.24 454.538L1221.15 377.806L1215.19 257.215V257.242Z" fill="#3B3B3B"/>
<path d="M387.63 624.773L393.524 665.823L388.802 767.474L425.464 766.08H463.71L462.933 689.572L460.145 606.078L463.9 545.984L461.444 506.915L388.375 508.578L388.992 555.538L387.63 624.757V624.773Z" fill="#3B3B3B"/>
<path d="M320.419 655.584L361.2 662.697L352.169 717.293L285.326 770.464L228.924 752.212L196.746 695.002L190.694 577.239L228.924 515.703C228.924 515.703 258.314 499.48 296.195 508.558C334.076 517.636 352.169 550.622 352.169 550.622L364.305 610.082L317.916 617.861L304.132 576.541L261.593 571.804L244.815 631.518L250.82 691.897L279.512 709.467L320.451 655.615L320.419 655.584Z" fill="#3B3B3B"/>
<path d="M1019.7 660.799L1060.48 668.102L1051.45 724.14L1014.16 768.85L962.173 766.68C962.173 766.68 911.902 764.81 894.364 701.912L887.63 619.685L896.027 587.191L931.913 512.474L1001.13 501.954L1060.51 553.73L1048.98 614.742L1011.97 621.111L1000.29 563.172L985.289 557.912L963.631 558.166L953.253 619.574L958.228 701.468L993.686 704.225L1019.73 660.783L1019.7 660.799Z" fill="#3B3B3B"/>
<path d="M641.357 708.451L590.516 712.475L560.825 710.732L571.013 667.147L630.393 648.325L622.741 608.749L593.273 608.052L570.236 609.953L566.941 559.476L600.228 561.631L645.445 560.712L647.298 536.82L645.001 508.54L570.553 506.749L499.987 510.124L492.382 580.453L499.385 671.52L496.169 719.177L499.1 765.978L645.904 767.372L648.09 741.262L641.357 708.451Z" fill="#3B3B3B"/>
<path d="M1177.47 713.402L1147.72 714.052L1150.81 667.9L1217.07 660.47L1216.4 636.198L1212.12 607.03L1151.6 607.981L1144.57 571.177L1182.32 570.717L1226.27 566.662L1229.96 530.222L1229.36 510.18L1154.61 506.394L1084.14 508.691L1081.21 538.334L1088.72 623.903L1082.75 710.234L1083.44 767.491L1167.08 764.972L1228.46 767.491L1228.9 719.407L1177.47 713.402Z" fill="#3B3B3B"/>
<path d="M854.024 508.104L794.453 509.767L791.776 582.916L795.118 634.106L780.559 634.803L767.583 614.254L726.105 508.31L673.822 509.91L677.102 576.008L671.667 675.029L675.058 765.985L722.255 767.839L722.984 714.21L715.553 637.876L734.043 634.343L770.15 737.436L788.512 766.603L855.592 767.966L859.363 649.505L864.227 589.348L854.024 508.104Z" fill="#3B3B3B"/>
<path d="M73.2111 592.131L73.6072 561.839L113.944 551.588L123.434 597.074L159.716 605.186L162.868 540.086L114.435 504.644L43.4257 513.168L19.2013 549.56L10.741 579.393L15.8742 600.259L36.3279 621.41L63.1981 643.796L107.053 662.079L100.557 698.075L79.9921 704.413L61.2653 698.075L40.5422 666.753L4.59375 675.863L15.288 731.457C15.288 731.457 33.1276 768.737 84.555 768.737C135.982 768.737 147.405 750.755 147.405 750.755L166.607 702.369L169.95 657.263L73.227 592.1L73.2111 592.131Z" fill="#3B3B3B"/>
</svg>
```

**Marble White** — `assets/jupi-science-white.svg` (slightly different path data — use this file, not a fill swap)
```svg
<svg width="1230" height="771" viewBox="0 0 1230 771" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M959.202 6.26161L821.022 0.463684L701.652 11.477L700.292 132.068L711.916 242.589L724.594 332.166L722.763 393.308L731.168 458.111L837.861 455.199L838.305 396.803L847.626 355.691L956.455 318.101L1012.55 301.734L1033.8 278.653L1055.66 116.034C1064.84 42.8246 959.507 6.5945 959.507 6.5945L959.202 6.28935V6.26161ZM945.276 165.829L887.352 284.285L841.634 273.576L843.021 138.31L847.904 82.5223L906.299 83.1327L968.8 96.4207L944.943 165.968L945.248 165.802L945.276 165.829Z" fill="#F5F4EE"/>
<path d="M645.86 8.86772L567.13 6.26004L577.839 173.318L571.569 331.97L533.203 369.56L481.687 339.599L464.876 139.363L464.266 6.2323L327.917 11.2812L329.61 75.0306L336.795 131.29L333.272 321.29C347.336 433.032 453.558 466.488 453.558 466.488L517.751 451.812L630.852 378.437L642.919 242.56L640.922 164.607L646.415 91.5367L645.499 8.83998H645.805L645.86 8.86772Z" fill="#F5F4EE"/>
<path d="M278.567 200.837L271.687 75.1964L275.959 6.25934L154.286 11.447L150.319 88.318L159.196 242.393L101.578 324.174L62.1295 242.393L0.987793 260.453L16.7448 370.502L120.22 466.487L231.49 431.339L279.649 332.136L277.346 269.163L278.567 200.837Z" fill="#F5F4EE"/>
<path d="M1215.19 257.706L1221.6 186.161L1217.33 62.6573L1221.46 6.25934L1157.57 11.447H1090.94L1098.56 138.474L1090.02 269.468L1098.56 332.275L1090.63 394.942L1094.9 457.915L1222.24 455.002L1221.15 378.27L1215.19 257.678V257.706Z" fill="#F5F4EE"/>
<path d="M387.63 625.237L393.524 666.287L388.802 767.938L425.464 766.543H463.71L462.933 690.036L460.145 606.542L463.9 546.448L461.444 507.379L388.375 509.042L388.992 556.002L387.63 625.221V625.237Z" fill="#F5F4EE"/>
<path d="M320.419 656.047L361.2 663.161L352.169 717.757L285.326 770.927L228.924 752.676L196.746 695.466L190.694 577.702L228.924 516.167C228.924 516.167 258.314 499.943 296.195 509.022C334.076 518.1 352.169 551.086 352.169 551.086L364.305 610.545L317.916 618.325L304.132 577.005L261.593 572.268L244.815 631.981L250.82 692.36L279.512 709.931L320.451 656.079L320.419 656.047Z" fill="#F5F4EE"/>
<path d="M1019.7 661.262L1060.48 668.566L1051.45 724.604L1014.16 769.314L962.173 767.143C962.173 767.143 911.902 765.274 894.364 702.376L887.63 620.149L896.027 587.654L931.913 512.937L1001.13 502.417L1060.51 554.193L1048.98 615.206L1011.97 621.575L1000.29 563.636L985.289 558.376L963.631 558.629L953.253 620.038L958.228 701.932L993.686 704.689L1019.73 661.247L1019.7 661.262Z" fill="#F5F4EE"/>
<path d="M641.357 708.914L590.516 712.939L560.825 711.196L571.013 667.611L630.393 648.789L622.741 609.212L593.273 608.515L570.236 610.416L566.941 559.94L600.228 562.094L645.445 561.175L647.298 537.284L645.001 509.003L570.553 507.213L499.987 510.588L492.382 580.916L499.385 671.984L496.169 719.64L499.1 766.441L645.904 767.836L648.09 741.726L641.357 708.914Z" fill="#F5F4EE"/>
<path d="M1177.47 713.866L1147.72 714.516L1150.81 668.364L1217.07 660.933L1216.4 636.662L1212.12 607.494L1151.6 608.445L1144.57 571.641L1182.32 571.181L1226.27 567.125L1229.96 530.686L1229.36 510.644L1154.61 506.857L1084.14 509.155L1081.21 538.797L1088.72 624.367L1082.75 710.697L1083.44 767.955L1167.08 765.436L1228.46 767.955L1228.9 719.871L1177.47 713.866Z" fill="#F5F4EE"/>
<path d="M854.024 508.568L794.453 510.231L791.776 583.38L795.118 634.569L780.559 635.267L767.583 614.718L726.105 508.774L673.822 510.374L677.102 576.472L671.667 675.493L675.058 766.449L722.255 768.303L722.984 714.673L715.553 638.34L734.043 634.807L770.15 737.9L788.512 767.067L855.592 768.43L859.363 649.969L864.227 589.812L854.024 508.568Z" fill="#F5F4EE"/>
<path d="M73.2111 592.595L73.6072 562.303L113.944 552.052L123.434 597.538L159.716 605.65L162.868 540.55L114.435 505.108L43.4257 513.632L19.2013 550.024L10.741 579.857L15.8742 600.723L36.3279 621.873L63.1981 644.26L107.053 662.543L100.557 698.539L79.9921 704.876L61.2653 698.539L40.5422 667.217L4.59375 676.327L15.288 731.921C15.288 731.921 33.1276 769.2 84.555 769.2C135.982 769.2 147.405 751.218 147.405 751.218L166.607 702.833L169.95 657.727L73.227 592.563L73.2111 592.595Z" fill="#F5F4EE"/>
</svg>
```

---

## Motion & Animation

Jupi has Lottie animations of the symbol plus an animated navigation logo. **They are not in this repo**: the production files live in the private `jupi-co/website` repo under `public/animations/` (e.g. `JUPI-Symbol-Jump.json`, `Jupi-Icon-Spin-White.json`, `navigation-black.json`, `navigation-white.json`, `JUPI-LogoAnim-Footer.json`). Copy the one you need next to your artifact.

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
- Always give the symbol clear breathing room (min padding = symbol width × 0.25)
- On Hero gradient: use dark (`#3B3B3B`) symbol
- On Science gradient or dark backgrounds: use Marble White (`#F5F4EE`) symbol
- Never rotate, distort, or recolor the logo outside approved palette

---

## Figma Brand Library

**File key:** `HDSOBHpWqXkmmaYpsmndut`  
**File name:** Jupi_Brand-Guidelines  
**Version:** 3.0

Use `Figma:get_design_context` or `Figma:get_screenshot` with `fileKey: HDSOBHpWqXkmmaYpsmndut` and the node IDs below to pull any asset directly.

### Page 1 — Brand Guidelines (Cover)
| Frame | Node ID |
|---|---|
| Cover / All together | `951:8810` |

### Page 2 — Brand Assets (node `1151:9520`)

#### Logos (`951:4237`)
| Asset | Node ID | Almost Black | Marble White |
|---|---|---|---|
| Logo Lock-up (symbol + wordmark) | `804:3942` | `804:3887` | `804:3943` |
| Logo Wordmark only | `804:3936` | `804:3889` | `804:3937` |
| Logo Symbol only | `804:3909` | `804:3908` | `804:3910` |
| Jupi Science logo | `827:13355` | `827:13354` | `827:13356` |

#### Colour Gradients (`1151:9511`)
| Gradient | Node ID | Use case |
|---|---|---|
| Hero | `1151:9514` | Homepage hero, warm marketing (canonical — do not alter) |
| Full | `1151:9515` | Full-bleed backgrounds |
| Spotlight | `1151:9516` | Focused / product contexts |
| Science | `1151:9517` | Jupi Science touchpoints |

#### Iconography (`951:4242`) — 36 icons at 250×250
| Icon | Node ID | Icon | Node ID |
|---|---|---|---|
| Phone | `951:4221` | MagnifyingGlass | `951:4216` |
| Trash | `951:4231` | ChatBubble | `951:4222` |
| Heart | `951:4227` | Asterisk | `951:4219` |
| Share | `951:4228` | Plus-Circle | `951:4229` |
| Lock | `951:4225` | Bell | `951:4217` |
| DoubleChevron-Left | `951:4223` | Chevron-Left | `951:4215` |
| HourGlass | `951:4213` | Home | `951:4218` |
| User | `951:4212` | Tick-Circle | `951:4214` |
| Layers | `951:4224` | Chevron-Right | `951:4210` |
| Calendar | `951:4211` | Settings | `951:4206` |
| Hand | `951:4226` | Plus | `951:4209` |
| Save | `951:4207` | DoubleChevron-Right | `951:4205` |
| Pin | `951:4208` | Options | `951:4203` |
| Star | `951:4202` | Tick | `951:4201` |
| Copy | `951:4200` | Arrow-Left | `951:4199` |
| Refresh | `951:4204` | Mail | `951:4198` |
| Plane | `951:4197` | QuestionMark | `951:4230` |
| @ | `951:4196` | Arrow-Right | `951:4220` |

#### Illustrations
**Hero** (`1151:9503`)
| Asset | Node ID | Size |
|---|---|---|
| Hero 1 Extended | `1151:9512` | 2400×1500 |
| Hero 1 Square | `1151:9513` | 1500×1500 |

**Spot illustrations** (`1151:8709`) — 1500×1500 each
| Asset | Node ID |
|---|---|
| Spot 1 — Sharpen decision making | `1139:5092` |
| Spot 2 — Industry best practice | `1139:5093` |
| Spot 3 — Be back in control | `1139:5094` |
| Spot 4 — Align to your strategy | `1139:5095` |

**Backdrops** (`951:4243`) — 1920×1080 each
| Asset | Node ID |
|---|---|
| Backdrop 01 | `805:3743` |
| Backdrop 02 | `805:3744` |
| Backdrop 03 | `805:3745` |

#### Employee Portraits (`1128:3780`)
Node IDs: `1120:212`, `1120:209`, `1120:199`, `1120:210`, `1120:211`, `1120:214`

### Page 3 — Social Assets (node `1151:8818`)

#### Avatars (`951:4240`)
| Asset | Node ID |
|---|---|
| Social Avatar — Square (3 colorways) | `805:2887` |
| Social Avatar — Circle (3 colorways) | `805:2926` |

Avatar colorways per frame:
- `Colour=Primary-Expressive` — Hero gradient background
- `Colour=Secondary-DarkBackground` — dark/Science background  
- `Colour=Secondary-LightBackground` — light/marble background

#### LinkedIn Banners (`951:4241`)
| Asset | Node ID |
|---|---|
| LinkedIn Header — Headline 1 | `805:3095` |
| LinkedIn Header — Headline 2 | `1151:10965` |
| LinkedIn Header — Headline 3 | `1151:10966` |
| LinkedIn Header — Headline 4 | `1151:10967` |
| LinkedIn Header — Logo only | `805:3489` |

#### Social Posts — Awareness (`951:4236`)
Brand awareness posts (copy/headline-led, Hero gradient).

| Format | Frame Node ID | Variants |
|---|---|---|
| 1:1 (1080×1080) | `951:4184` | 6 variants: `818:4508` → `818:4526/4535/4511/4530/4528` |
| 9:16 (1080×1920) | `951:4185` | 6 variants: `818:4498/4496/4525/4531/4522/4503` |
| 16:9 (1920×1080) | `951:4186` | 6 variants: `818:4534/4527/4519/4516/4504/4500` |

#### Social Posts — Showcasing (`951:4235`)
Product showcasing posts (UI/feature-led).

| Format | Frame Node ID | Variants |
|---|---|---|
| 1:1 | `951:4187` | 6 variants: `818:4532/4492/4490/4509/4497/4489` |
| 9:16 | `951:4188` | 6 variants: `818:4475/4474/4473/4472/4485/4471` |
| 16:9 | `951:4189` | 6 variants: `818:4488/4483/4502/4494/4478/4529` |

#### Social Posts — Jupi Science (`951:4233`)
Science gradient, research/insight-led content.

| Format | Frame Node ID | Variants |
|---|---|---|
| 1:1 | `951:4190` | 6 variants: `818:4523/4481/4469/4491/4533/4470` |
| 9:16 | `951:4191` | 6 variants: `818:4468/4521/4467/4505/4466/4465` |
| 16:9 | `951:4192` | 6 variants: `818:4518/4514/4480/4499/4486/4476` |

#### Social Posts — Case Studies (`951:4234`)
People/photo-led posts with stats (e.g. "92%", "12,345").

| Format | Frame Node ID | Variants |
|---|---|---|
| 1:1 | `951:4193` | 6 variants: `818:4515/4506/4512/4510/4495/4517` |
| 9:16 | `951:4194` | 6 variants: `818:4487/4464/4501/4493/4513/4507` |
| 16:9 | `951:4195` | 6 variants: `818:4484/4482/4520/4479/4477/4524` |

### How to use the Figma library
When the user asks for a specific social asset type:
1. Identify the correct section (Awareness / Showcasing / Science / CaseStudies)
2. Identify the format (1:1 / 9:16 / 16:9)
3. Call `Figma:get_design_context` on the frame node ID to see all variants
4. Call `Figma:get_screenshot` on a specific variant node ID to inspect it
5. Use the design as reference for generating or directing Canva output

---

## SVG Assets: read them from `assets/` in this skill folder

**CRITICAL: never go through the Figma MCP or external URLs for Jupi logos. The SVG files are in this skill's `assets/` folder and embed inline without distortion.**

| File | Content | Use |
|---|---|---|
| `jupi-lockup-dark.svg` | Wordmark + symbol, Almost Black `#3B3B3B` | On light / Hero gradient backgrounds |
| `jupi-lockup-white.svg` | Wordmark + symbol, Marble White `#F5F4EE` | On dark / Science gradient backgrounds |
| `jupi-symbol-dark.svg` | Symbol only (bird), Almost Black | Avatar, favicon, square icon on light backgrounds |
| `jupi-symbol-white.svg` | Symbol only (bird), Marble White | Avatar, favicon, square icon on dark backgrounds |
| `jupi-wordmark-dark.svg` | Wordmark only (JUPI lettering), Almost Black | Signature, footer on light backgrounds |
| `jupi-wordmark-white.svg` | Wordmark only (JUPI lettering), Marble White | Signature, footer on dark backgrounds |
| `jupi-science-dark.svg` | Jupi Science logo, Almost Black | Research and insight content |
| `jupi-science-white.svg` | Jupi Science logo, Marble White | Research and insight content on dark backgrounds |

**To use a logo in an HTML/SVG artifact:**
1. Read `assets/jupi-symbol-white.svg` (or the file you need) from this skill folder
2. Paste the SVG **inline** in the HTML, never via `<img src="">` or `background-image`, which distort it
3. The SVG scales to any size through `width` / `height` on the `<svg>` tag

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
1. Import Google Fonts fallbacks if brand fonts unavailable (use `Times New Roman` + `Helvetica Neue`)
2. Apply gradient as `background` on root or hero container
3. Embed SVG logo inline (copy path data from above)
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
