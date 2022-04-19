#!/bin/sh

if [ ${TARGETARCH} = "arm64" ]
then
    # TARGETARCH=arm64
    # install additional dependencies on arm platform
    apt-get install -y build-essential libudev-dev python3 dfu-util openssl
fi

# install nodejs and npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
apt-get install -y nodejs

# install particle cli
npm install -g particle-cli