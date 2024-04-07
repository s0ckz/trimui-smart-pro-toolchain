# TrimUI Smart Pro Toolchain Docker image

Based on the [Miyoo Mini Union toolchain Docker image](https://github.com/MiyooMini/union-toolchain/). The toolchain and sysroot files used here are originally [here](https://github.com/trimui/toolchain_sdk_smartpro/releases/tag/20231018).

## Installation

With Docker installed and running, `make shell` builds the toolchain and drops into a shell inside the container. The container's `~/workspace` is bound to `./workspace` by default. The `CROSS_COMPILE` and `PATH` env vars have been updated with the toolchain location.

After building the first time, `make shell` will skip building and drop into the shell.

## Workflow

- On your host machine, clone repositories into `./workspace` and make changes as usual.
- In the container shell, find the repository in `~/workspace` and build as usual.

## Docker for Mac

Docker for Mac has a memory limit that can make the toolchain build fail. Follow [these instructions](https://docs.docker.com/docker-for-mac/) to increase the memory limit.

## Ported Stuff

- [DevilutionX](https://github.com/s0ckz/devilutionX).
