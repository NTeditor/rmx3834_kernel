FROM ubuntu:24.04

RUN apt-get update && \
  apt-get install -y git curl bc bison flex build-essential libssl-dev libncurses-dev \
  make gcc-aarch64-linux-gnu cpio && \
  apt-get clean && \
  apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*

RUN curl -Lo /tmp/clang.tar.gz \
  "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/tags/android-12.0.0_r0.16/clang-r416183b.tar.gz" && \
  mkdir -p /opt/clang && \
  tar -xf /tmp/clang.tar.gz -C /opt/clang && \
  rm -rf /tmp/clang.tar.gz

ENV PATH="/opt/clang/bin:$PATH" \
  LLVM="1" \
  CROSS_COMPILE="aarch64-linux-gnu-" \
  CLANG_TRIPLE="aarch64-linux-gnu-" \
  KERNEL_DIR="/kernel-source" \
  KERNEL_ROOT="/kernel-source" \
  ARCH="arm64" \
  KBUILD_OUTPUT="out"

WORKDIR /kernel-source/
