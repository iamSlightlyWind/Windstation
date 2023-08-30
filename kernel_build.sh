#!/bin/bash


mkdir out

ARCH=arm64
BUILD_CROSS_COMPILE=$(pwd)/toolchain/gcc/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=$(pwd)/toolchain/clang/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -j$(nproc) -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=$ARCH CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE vendor/gts7l_eur_open_defconfig
make -j$(nproc) -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=$ARCH CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE