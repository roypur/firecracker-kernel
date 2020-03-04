#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

apt-get --yes update
apt-get --yes upgrade

curl --output /build/archive/kernel.tar.xz "${KERNEL_SOURCE}"
tar --extract --file=/build/archive/kernel.tar.xz --strip-components=1

curl --silent --output /build/linux/.config 'https://raw.githubusercontent.com/firecracker-microvm/firecracker/master/resources/microvm-kernel-config'

make olddefconfig
make -j 8 vmlinux
