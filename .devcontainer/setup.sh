#!/bin/bash
set -e

echo "=== 验证环境 ==="
nvcc --version
cmake --version
ninja --version

echo "=== 进入项目目录 ==="
cd /workspaces/ninfer-all

echo "=== 配置 CMake（RTX 4090, sm_89）==="
cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CUDA_ARCHITECTURES=89

echo "=== 开始编译 ==="
cmake --build build --target ninfer-serve ninfer-calibrate -j$(nproc)

echo "=== 编译完成！ ==="
echo "可执行文件位于: build/ninfer-serve 和 build/ninfer-calibrate"
