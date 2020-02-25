#!/usr/bin/env bash
dir=$(dirname $(realpath $0))

docker build --tag firecracker-kernel-builder ${dir}
docker run --volume "${dir}/out:/out" -it firecracker-kernel-builder

cp "${dir}/out/vmlinux.bin" "${dir}/out/vmlinux-tmp.bin"
rm "${dir}/out/vmlinux.bin"
mv "${dir}/out/vmlinux-tmp.bin" "${dir}/out/vmlinux.bin"
