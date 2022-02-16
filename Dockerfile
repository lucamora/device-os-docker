FROM gcc:11.2.0
LABEL maintainer="Luca Morandini <lucamorait@gmail.com>"

# install crc32
RUN apt-get update \
    && apt-get -y install libarchive-zip-perl xxd

WORKDIR /tools

# install gcc-arm toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-aarch64-linux.tar.bz2 \
    && tar xvf gcc-arm-none-eabi-10.3-2021.10-aarch64-linux.tar.bz2 \
    && rm gcc-arm-none-eabi-10.3-2021.10-aarch64-linux.tar.bz2

ENV PATH $PATH:/tools/gcc-arm-none-eabi-10.3-2021.10/bin

# copy device-os folder
COPY ./deviceos /deviceos

WORKDIR /app

VOLUME [ "/deviceos", "/app" ]