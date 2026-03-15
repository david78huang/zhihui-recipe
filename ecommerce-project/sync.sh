#!/bin/bash
# Obsidian Git 同步脚本

cd /mnt/d/obsidian/ecommerce-project

echo "=== Obsidian Git 同步 ==="
echo "时间: $(date)"

# 拉取远程更新
echo "[1/4] 拉取远程更新..."
git pull origin main

# 添加所有更改
echo "[2/4] 添加更改..."
git add .

# 提交更改
echo "[3/4] 提交更改..."
git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到远程
echo "[4/4] 推送到远程..."
git push origin main

echo "=== 同步完成 ==="
