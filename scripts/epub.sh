#!/usr/bin/env bash
# Genera el EPUB del libro en book/el-desplazamiento-silencioso.epub
# Requiere pandoc. Uso: bash scripts/epub.sh
set -euo pipefail
cd "$(dirname "$0")/.."

mkdir -p book
pandoc capitulos/portada.md capitulos/[0-9][0-9]-*.md \
  --from markdown \
  --metadata-file epub.yaml \
  --resource-path capitulos \
  --lua-filter scripts/epub.lua \
  --toc --toc-depth 1 \
  --split-level 1 \
  --output book/el-desplazamiento-silencioso.epub

echo "Listo: book/el-desplazamiento-silencioso.epub"
