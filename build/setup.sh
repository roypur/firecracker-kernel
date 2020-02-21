#!/bin/sh
export DEBIAN_FRONTEND=noninteractive

mkdir -p /build/linux
mkdir -p /build/archive

apt-get --yes update
apt-get --yes install ca-certificates

cp /build/sources.list /etc/apt/sources.list

apt-get --yes update
apt-get --yes build-dep linux
apt-get --yes install curl tar
apt-get --yes upgrade

rm -rf /var/cache/*
