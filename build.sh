source version.sh

echo "> building image: device-os v${DEVICEOS_VERSION_STRING} (${DEVICEOS_VERSION_NUMBER})"

docker buildx build \
--build-arg DOS_VER_STR=$DEVICEOS_VERSION_STRING \
--build-arg DOS_VER_NUM=$DEVICEOS_VERSION_NUMBER \
--platform=linux/amd64,linux/arm64 \
--push \
-t docker.io/lucamora/device-os:$DEVICEOS_VERSION_STRING .