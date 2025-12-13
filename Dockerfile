FROM ubuntu:24.04

RUN apt-get update && \
  apt-get install -y git bc bison flex build-essential libssl-dev libncurses-dev \
  make gcc-aarch64-linux-gnu cpio && \
  apt-get clean && \
  apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --single-branch --branch android-12.0.0_r0.16 \
  https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 \
  /root/clang/ && \
  rm -rf /root/clang/.git/

COPY . /root/kernel-source/

ENV PATH="/root/clang/clang-r416183b/bin:$PATH" \
  LLVM="1" \
  CROSS_COMPILE="aarch64-linux-gnu-" \
  CLANG_TRIPLE="aarch64-linux-gnu-" \
  KERNEL_DIR="/root/kernel-source" \
  KERNEL_ROOT="/root/kernel-source" \
  ARCH="arm64" \
  KBUILD_OUTPUT="out"

WORKDIR /root/kernel-source/
