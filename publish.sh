#!/bin/bash
# 一鍵從 Obsidian 同步內容並部署到 GitHub Pages
set -e

# 確保用正確的 Node 版本
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use 22 --silent

BLOG_SOURCE="$HOME/tui/Obsidian/04_BLOG"
CONTENT_DIR="$HOME/tui/quartz-blog/content"

echo "==> 同步 Obsidian 04_BLOG → content/"
rsync -av --delete \
  --exclude='.obsidian' \
  --exclude='.trash' \
  --exclude='_*' \
  "$BLOG_SOURCE/" "$CONTENT_DIR/"

# 同步 Obsidian 附件（圖片等）
ATTACHMENTS="$HOME/tui/Obsidian/99_ATTACHMENTS"
if [ -d "$ATTACHMENTS" ] && [ "$(ls -A "$ATTACHMENTS" 2>/dev/null)" ]; then
  echo "==> 同步 99_ATTACHMENTS → content/attachments/"
  mkdir -p "$CONTENT_DIR/attachments"
  rsync -av "$ATTACHMENTS/" "$CONTENT_DIR/attachments/"
fi

echo "==> Git add + commit + push"
cd "$HOME/tui/quartz-blog"
git add -A
git commit -m "publish: $(date '+%Y-%m-%d %H:%M')" || echo "nothing to commit"
git push origin v4

echo "==> Done! GitHub Actions will build and deploy."
