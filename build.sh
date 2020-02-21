#!/usr/bin/env bash
dir=$(dirname $(realpath $0))

docker build --tag firecracker-kernel-builder ${dir}
docker run --volume "${dir}/out:/out" -it firecracker-kernel-builder

sudo chown "$(id -u):$(id -g)" "${dir}/out/vmlinux.bin"
chmod 644 "${dir}/out/vmlinux.bin"
