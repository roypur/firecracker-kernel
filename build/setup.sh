#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

mkdir -p /build/linux
mkdir -p /build/archive

rm '/etc/apt/apt.conf.d/70debconf'

apt-get update
apt-get install ca-certificates

cp /build/sources.list /etc/apt/sources.list

apt-get update
apt-get build-dep linux
apt-get install curl tar
apt-get upgrade

rm -rf /var/cache/*
