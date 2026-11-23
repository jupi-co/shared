#!/usr/bin/env bash
# Print @font-face rules with the brand fonts embedded as base64 woff2,
# ready to paste into a <style> block. Run ./fetch-fonts.sh first.
#   ./embed-fonts.sh                                  # every font
#   ./embed-fonts.sh Roobert-Regular FenulStandard-Medium
set -euo pipefail
cd "$(dirname "$0")/assets/fonts"

ALL="FenulStandard-Medium FenulStandard-MediumItalic Roobert-Regular Roobert-RegularItalic Roobert-Medium Roobert-MediumItalic Roobert-SemiBold Roobert-SemiBoldItalic"
[ $# -gt 0 ] || set -- $ALL

for name in "$@"; do
  file="$name.woff2"
  if [ ! -f "$file" ]; then
    echo "missing $file: run ./fetch-fonts.sh first (known names: $ALL)" >&2
    exit 1
  fi
  case "$name" in
    FenulStandard-*) family="Fenul Standard" ;;
    Roobert-*)       family="Roobert" ;;
    *) echo "unknown font: $name" >&2; exit 1 ;;
  esac
  case "$name" in
    *SemiBold*) weight=600 ;;
    Roobert-Medium*) weight=500 ;;
    *) weight=400 ;;   # Roobert Regular, and Fenul Medium (its only headline cut)
  esac
  case "$name" in *Italic) style=italic ;; *) style=normal ;; esac
  printf "@font-face {\n  font-family: '%s';\n  font-weight: %s;\n  font-style: %s;\n  font-display: swap;\n  src: url('data:font/woff2;base64,%s') format('woff2');\n}\n" \
    "$family" "$weight" "$style" "$(base64 < "$file" | tr -d '\n')"
done
