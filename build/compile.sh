#!/bin/sh

apt-get --yes update
apt-get --yes upgrade

curl --output /build/archive/kernel.tar.xz "${KERNEL_SOURCE}"
tar --extract --file=/build/archive/kernel.tar.xz --strip-components=1

curl --output /build/linux/.config 'https://raw.githubusercontent.com/firecracker-microvm/firecracker/master/resources/microvm-kernel-config'

make olddefconfig
make -j 8 vmlinux

cp /build/linux/vmlinux /build/vmlinux.bin

rm -rf '/var/cache'
rm -rf '/build/linux'
rm -rf '/build/archive'
