#!/bin/bash
set -e

echo "=== 安装系统依赖 ==="
apt-get update && apt-get install -y \
    build-essential \
    libffmpeg-dev \
    libcurl4-openssl-dev \
    libpcre2-dev \
    wget \
    git \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

echo "=== 验证 CUDA 环境 ==="
nvcc --version
cmake --version
ninja --version

echo "=== 克隆或进入项目目录 ==="
# 如果 Codespace 是从你的仓库创建的，代码已经在工作目录中
cd /workspaces/ninfer-all

echo "=== 配置 CMake（针对 RTX 4090, sm_89）==="
cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CUDA_ARCHITECTURES=89

echo "=== 开始编译 ==="
cmake --build build --target ninfer-serve ninfer-calibrate -j$(nproc)

echo "=== 编译完成！ ==="
echo "可执行文件位于: build/ninfer-serve 和 build/ninfer-calibrate"
