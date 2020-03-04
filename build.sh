#!/usr/bin/env bash
dir=$(dirname $(realpath $0))
mkdir -p "${dir}/out"

docker build --tag 'firecracker-kernel-builder' "${dir}"
id=$(docker create 'firecracker-kernel-builder')
docker start --attach ${id}

docker cp "${id}:/build/linux/vmlinux.bin" "${dir}/out/vmlinux.bin"
docker rm "${id}"
