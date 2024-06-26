#!/usr/bin/sh

DATE_COVER=$(date "+%d %B %Y")

SOURCE_FORMAT="markdown"

# --pdf-engine lualatex \
# -t beamer presentation.md -o presentation.tex
# -t beamer presentation.md -o presentation.pdf
pandoc -s -f "$SOURCE_FORMAT" --slide-level 2 \
-t beamer presentation.md -o presentation.pdf
