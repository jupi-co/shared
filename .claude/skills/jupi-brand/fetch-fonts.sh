#!/usr/bin/env bash
# Fetch Jupi's licensed brand fonts (Fenul Standard, Roobert) into assets/fonts/.
# They are not committed here because this repo is public.
# Needs the GitHub CLI (gh) logged in with an account that can read the source repo.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p assets/fonts

REPO=jupi-co/decide
SRC=apps/frontend/public/assets/fonts
# skill file name  ->  path in $REPO under $SRC (without extension)
FONTS="
FenulStandard-Medium:FenulStandardMedium/font
FenulStandard-MediumItalic:FenulStandardMediumItalic
Roobert-Regular:RoobertRegular
Roobert-RegularItalic:RoobertRegularItalic
Roobert-Medium:RoobertMedium
Roobert-MediumItalic:RoobertMediumItalic
Roobert-SemiBold:RoobertSemiBold
Roobert-SemiBoldItalic:RoobertSemiBoldItalic
"

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
failed=0

# fetch <remote path> <local file> <magic bytes>: writes the file only if the download is a real font
fetch() {
  if gh api -H "Accept: application/vnd.github.raw" "repos/$REPO/contents/$1" > "$tmp" 2>/dev/null \
     && [ "$(head -c 4 "$tmp")" = "$3" ]; then
    mv "$tmp" "$2"
    return 0
  fi
  return 1
}

for pair in $FONTS; do
  name=${pair%%:*}; src=${pair#*:}
  if fetch "$SRC/$src.woff2" "assets/fonts/$name.woff2" wOF2; then
    if fetch "$SRC/$src.woff" "assets/fonts/$name.woff" wOFF; then
      echo "ok    $name"
    else
      echo "ok    $name (woff2 only, no .woff found)"
    fi
  else
    echo "FAIL  $name: could not download $SRC/$src.woff2 from $REPO" >&2
    failed=1
  fi
done

if [ "$failed" -ne 0 ]; then
  echo "Some fonts failed. Check 'gh auth status' and that your account can read $REPO." >&2
  exit 1
fi
echo "Fonts saved in $(pwd)/assets/fonts"
