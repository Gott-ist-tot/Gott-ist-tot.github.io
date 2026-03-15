#!/bin/bash
# 一鍵從 Obsidian 同步內容並部署到 GitHub Pages
set -e

BLOG_SOURCE="$HOME/tui/Obsidian/04_BLOG"
CONTENT_DIR="$HOME/tui/quartz-blog/content"

echo "==> 同步 Obsidian 04_BLOG → content/"
rsync -av --delete \
  --exclude='.obsidian' \
  --exclude='.trash' \
  "$BLOG_SOURCE/" "$CONTENT_DIR/"

echo "==> Git add + commit + push"
cd "$HOME/tui/quartz-blog"
git add -A
git commit -m "publish: $(date '+%Y-%m-%d %H:%M')" || echo "nothing to commit"
git push origin v4

echo "==> Done! GitHub Actions will build and deploy."
