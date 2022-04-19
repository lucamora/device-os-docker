# DeviceOS Docker Image

[Docker image](https://github.com/lucamora/device-os-docker/pkgs/container/device-os) of [DeviceOS](https://github.com/particle-iot/device-os) for building locally firmware for Particle Devices.

## Available tags
Each **image tag** is associated to a **release** of the DeviceOS:
- [`v1.5.2`](https://github.com/particle-iot/device-os/releases/tag/v1.5.2)

## How to use
Clone the [`docker-compose.template.yml`](docker-compose.template.yml) inside the firmware folder and run the following command:
```bash
docker-compose run --rm build
```

The **firmware folder** (current directory where `docker-compose` is started) is mounted inside the container in the `/app` directory.

The **DeviceOS folder** (located in the `/deviceos` directory inside the container) is mounted inside a Docker volume to store build artifacts between consecutive builds.

### Example of docker-compose.yml
```yml
version: "3"
services:
  build:
    image: ghcr.io/lucamora/device-os:1.2.3
    container_name: deviceos
    volumes:
      - ./:/app
      - deviceos:/deviceos
    environment:
      - SYSTEMDIR=/deviceos
      - APPDIR=/app
volumes:
  deviceos:
```

## Environment variables
During the build process, the Dockerfile defines two environment variables with the version of the DeviceOS which are available inside the container:

- `DEVICEOS_VERSION_STRING` (ex: `1.2.3`)
- `DEVICEOS_VERSION_NUMBER` (ex: `0x01020300`)

### Version number format
Version number is encoded as a 32 bit hexadecimal number.

Format: `0xAABBCCDE`

- `AA`: major release
- `BB`: minor release
- `CC`: patch number
- `D`: pre-release label
    - `A`: alpha
    - `B`: beta
    - `C`: rc
- `E`: pre-release number