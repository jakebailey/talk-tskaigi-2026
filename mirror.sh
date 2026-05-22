#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/"
DEST="$HOME/work/talk-tskaigi-2026/"

# Files/dirs to exclude from mirroring (edit this list)
EXCLUDES=(
  .git
  node_modules
  dist
  slides.md.bak
  _find_placeholders.py
  _reorder.py
  notes.md
  perfdata.txt
  .agents
  skills-lock.json
)

RSYNC_ARGS=(
  -av
  --delete
)

for exc in "${EXCLUDES[@]}"; do
  RSYNC_ARGS+=(--exclude "$exc")
done

mkdir -p "$DEST"
rsync "${RSYNC_ARGS[@]}" "$SRC" "$DEST"

# Squash everything into a single commit and force push
cd "$DEST"

if [ ! -d .git ]; then
  git init
  git remote add origin "$(cd "$SRC" && git remote get-url origin | sed 's/talk-tskaigi-2026-wip/talk-tskaigi-2026/')"
fi

git add -A
git commit --allow-empty -m "The talk"

# Replace all history with a single orphan commit
git checkout --orphan _mirror_tmp
git add -A
git commit -m "The talk"
git branch -M _mirror_tmp main
git push --force origin main
