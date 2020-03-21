#!/usr/bin/env bash
apk upgrade --no-cache

curl --output /build/archive/kernel.tar.xz "${KERNEL_SOURCE}"
tar --extract --file=/build/archive/kernel.tar.xz --strip-components=1

curl --silent --output /build/linux/.config 'https://raw.githubusercontent.com/firecracker-microvm/firecracker/master/resources/microvm-kernel-config'
make olddefconfig

sed -r -i 's/(.*)MODULE(.*)=y/\1MODULE\2=n/g' '/build/linux/.config'
sed -r -i 's/(.*)MODVERSION(.*)=y/\1MODVERSION\2=n/g' '/build/linux/.config'
sed -r -i 's/(.*)=m/\1=n/g' '/build/linux/.config'

make -j 8 vmlinux
