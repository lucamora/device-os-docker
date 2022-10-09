#!/bin/sh

if [ ${TARGETARCH} = "arm64" ]
then
    # TARGETARCH=arm64
    GCC_ARM_ARCH="aarch64"
else
    # TARGETARCH=amd64
    GCC_ARM_ARCH="x86_64"
fi

# install crc32 and xxd
apt update && \
apt -y install libarchive-zip-perl xxd wget bzip2 git make

# install and extract gcc-arm toolchain
wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/${GCC_ARM_VERSION}/gcc-arm-none-eabi-${GCC_ARM_RELEASE}-${GCC_ARM_ARCH}-linux.tar.bz2 && \
tar xvf gcc-arm-none-eabi-${GCC_ARM_RELEASE}-${GCC_ARM_ARCH}-linux.tar.bz2 && \
rm gcc-arm-none-eabi-${GCC_ARM_RELEASE}-${GCC_ARM_ARCH}-linux.tar.bz2