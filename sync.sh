#!/bin/bash
# 根目录同步脚本 - 同步整个 Obsidian 仓库

cd /mnt/d/obsidian

echo "=== Obsidian Git 同步 ==="
echo "时间: $(date)"

# 检查是否有更改
if git diff --quiet && git diff --staged --quiet; then
    echo "没有更改，跳过同步"
    exit 0
fi

# 拉取远程更新
echo "[1/4] 拉取远程更新..."
git pull origin main

# 添加所有更改
echo "[2/4] 添加更改..."
git add .

# 提交更改
echo "[3/4] 提交更改..."
git commit -m "Auto sync: $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到远程
echo "[4/4] 推送到 GitHub..."
git push origin main

echo "=== 同步完成 ==="
