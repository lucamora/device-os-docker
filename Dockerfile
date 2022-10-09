FROM ubuntu:22.04
LABEL maintainer="Luca Morandini <lucamorait@gmail.com>"

ARG TARGETARCH
ARG DOS_VER_STR
ARG DOS_VER_NUM
ARG DOS_GIT_SHA

# environment variables for device-os version
ENV DEVICEOS_VERSION_STRING=$DOS_VER_STR
ENV DEVICEOS_VERSION_NUMBER=$DOS_VER_NUM

# environment variables for gcc-arm version
ENV GCC_ARM_VERSION="10-2020q4"
ENV GCC_ARM_RELEASE="10-2020-q4-major"

# install gcc-arm toolchain
WORKDIR /tools
COPY install_toolchain.sh .
RUN chmod u+x install_toolchain.sh \
    && ./install_toolchain.sh

ENV PATH $PATH:/tools/gcc-arm-none-eabi-${GCC_ARM_RELEASE}/bin

# clone device-os repo
COPY clone_repo.sh .
RUN chmod u+x clone_repo.sh \
    && ./clone_repo.sh

WORKDIR /app

VOLUME [ "/deviceos", "/app" ]