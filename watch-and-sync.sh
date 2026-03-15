#!/bin/bash
# 文件变动监听同步脚本

WATCH_DIR="/mnt/d/obsidian"
SYNC_SCRIPT="$WATCH_DIR/sync.sh"

echo "=== Obsidian 自动同步监听 ==="
echo "监听目录: $WATCH_DIR"
echo "按 Ctrl+C 停止"

# 使用 inotifywait 监听文件变动
while true; do
    inotifywait -r -e modify,create,delete,move "$WATCH_DIR" --exclude '.git' 2>/dev/null
    
    # 等待 2 秒，避免频繁同步
    sleep 2
    
    # 执行同步
    echo "检测到文件变动，正在同步..."
    bash "$SYNC_SCRIPT"
done
