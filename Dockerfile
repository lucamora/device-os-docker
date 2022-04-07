FROM gcc:9.4.0
LABEL maintainer="Luca Morandini <lucamorait@gmail.com>"

ARG TARGETARCH
ARG DOS_VER_STR
ARG DOS_VER_NUM

# environment variables for device-os version
ENV DEVICEOS_VERSION_STRING=$DOS_VER_STR
ENV DEVICEOS_VERSION_NUMBER=$DOS_VER_NUM

# environment variables for gcc-arm version
ENV GCC_ARM_VERSION="9-2020q2"
ENV GCC_ARM_RELEASE="9-2020-q2-update"

# install gcc-arm toolchain
WORKDIR /tools
COPY install_toolchain.sh .
RUN chmod u+x install_toolchain.sh \
    && ./install_toolchain.sh

ENV PATH $PATH:/tools/gcc-arm-none-eabi-${GCC_ARM_RELEASE}/bin

# copy device-os folder
COPY ./deviceos /deviceos

WORKDIR /app

VOLUME [ "/deviceos", "/app" ]