#!/bin/sh

git clone --recursive https://github.com/particle-iot/device-os.git /deviceos && \
cd /deviceos && \
git checkout ${DOS_GIT_SHA}