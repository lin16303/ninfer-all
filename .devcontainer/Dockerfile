FROM nvidia/cuda:13.1.1-devel-ubuntu24.04

# 避免安装时产生交互提示
ENV DEBIAN_FRONTEND=noninteractive

# 一次性安装编译 ninfer-all 所需的所有依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    git \
    wget \
    ffmpeg \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswscale-dev \
    libcurl4-openssl-dev \
    libpcre2-dev \
    && rm -rf /var/lib/apt/lists/*

# 验证环境（在构建日志中能看到输出）
RUN nvcc --version && cmake --version && ninja --version
