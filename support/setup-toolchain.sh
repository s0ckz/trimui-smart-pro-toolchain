#!/bin/bash -e
TOOLCHAIN_TAR="/root/aarch64-linux-gnu-7.5.0-linaro.tgz"
SYSROOT_TAR="/root/SDK_usr_tg5040_a133p.tgz"

cd /opt
tar xf "${TOOLCHAIN_TAR}"

cd aarch64-linux-gnu-7.5.0-linaro
mkdir sysroot
cd sysroot
cp -a ../aarch64-linux-gnu/libc/* .
tar xf "${SYSROOT_TAR}"

rm -f "${TOOLCHAIN_TAR}" "${SYSROOT_TAR}"