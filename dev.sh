#!/bin/bash
# 本地開發：同步內容 + 啟動 dev server
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
  "$BLOG_SOURCE/" "$CONTENT_DIR/"

echo "==> 啟動 Quartz dev server (http://localhost:8080)"
cd "$HOME/tui/quartz-blog"
npx quartz build --serve
