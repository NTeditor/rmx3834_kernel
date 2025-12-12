FROM ubuntu:24.04

RUN apt-get update && \
  apt-get install -y git bc bison flex build-essential libssl-dev libncurses-dev \
  make gcc-aarch64-linux-gnu cpio curl unzip kmod && \
  apt-get clean && \
  apt-get autoclean

COPY . /root/kernel-source/

ENV PATH="/root/clang/clang-r416183b/bin:$PATH" \
  LLVM="1" \
  CROSS_COMPILE="aarch64-linux-gnu-" \
  CLANG_TRIPLE="aarch64-linux-gnu-" \
  KERNEL_DIR="/root/kernel-source" \
  KERNEL_ROOT="/root/kernel-source" \
  ARCH="arm64"

WORKDIR /root/kernel-source/
