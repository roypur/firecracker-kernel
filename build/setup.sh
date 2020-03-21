#!/bin/sh
mkdir -p /build/linux
mkdir -p /build/archive

apk add --no-cache $(cat '/build/packages.txt')
