#!/bin/bash -e
TOOLCHAIN_TAR="/root/aarch64-linux-gnu-7.5.0-linaro.tgz"
SYSROOT_TAR="/root/SDK_usr_tg5040_a133p.tgz"
SDL2_TAR="/root/SDL2-2.26.1.GE8300.tgz"

cd /opt
tar xf "${TOOLCHAIN_TAR}"

tar xf "${SDL2_TAR}"
mv /root/sdl2-config.cmake /opt/SDL2-2.26.1

cd aarch64-linux-gnu-7.5.0-linaro
mkdir sysroot
cd sysroot
cp -a ../aarch64-linux-gnu/libc/* .
tar xf "${SYSROOT_TAR}"

rm -f "${TOOLCHAIN_TAR}" "${SYSROOT_TAR}" "${SDL2_TAR}"