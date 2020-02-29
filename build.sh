#!/usr/bin/env bash
dir=$(dirname $(realpath $0))
mkdir -p "${dir}/out"

docker build --tag firecracker-kernel-builder ${dir}
docker run --user "$(id -u):$(id -g)" --volume "${dir}/out:/out" -it firecracker-kernel-builder
