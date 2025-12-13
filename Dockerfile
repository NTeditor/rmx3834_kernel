FROM ubuntu:24.04

RUN apt-get update && \
  apt-get install -y git bc bison flex build-essential libssl-dev libncurses-dev \
  make gcc-aarch64-linux-gnu cpio curl unzip kmod && \
  apt-get clean && \
  apt-get autoclean

COPY . /root/kernel-source/

RUN git clone --depth 1 --single-branch --branch android-12.0.0_r0.16 \
  https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 \
  /root/clang/

ENV PATH="/root/clang/clang-r416183b/bin:$PATH" \
  LLVM="1" \
  CROSS_COMPILE="aarch64-linux-gnu-" \
  CLANG_TRIPLE="aarch64-linux-gnu-" \
  KERNEL_DIR="/root/kernel-source" \
  KERNEL_ROOT="/root/kernel-source" \
  ARCH="arm64"

WORKDIR /root/kernel-source/
