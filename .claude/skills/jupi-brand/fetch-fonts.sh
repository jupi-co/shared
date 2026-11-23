#!/usr/bin/env bash
# Fetch Jupi's licensed brand fonts (Fenul Standard, Roobert) into assets/fonts/.
# They are not committed here because this repo is public.
# Source: the private jupi-co/decide repo. Needs the GitHub CLI (gh) logged in
# with an account that can read jupi-co/decide.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p assets/fonts
SRC=apps/frontend/public/assets/fonts
# skill file name  ->  path in jupi-co/decide (without extension)
FONTS="
FenulStandard-Medium:FenulStandardMedium/font
FenulStandard-MediumItalic:FenulStandardMediumItalic
FenulStandard-Heavy:FenulStandardHeavy/font
Roobert-Regular:RoobertRegular
Roobert-RegularItalic:RoobertRegularItalic
Roobert-Medium:RoobertMedium
Roobert-MediumItalic:RoobertMediumItalic
Roobert-SemiBold:RoobertSemiBold
Roobert-SemiBoldItalic:RoobertSemiBoldItalic
"
for pair in $FONTS; do
  name=${pair%%:*}; src=${pair#*:}
  for ext in woff2 woff; do
    gh api -H "Accept: application/vnd.github.raw" "repos/jupi-co/decide/contents/$SRC/$src.$ext" > "assets/fonts/$name.$ext"
  done
  echo "ok  $name"
done
echo "Fonts saved in $(pwd)/assets/fonts"
