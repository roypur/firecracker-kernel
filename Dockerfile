FROM debian:buster-slim

RUN ["mkdir", "-p", "/build"]
WORKDIR /build

RUN ["apt-get", "--yes", "update"]
RUN ["apt-get", "--yes", "install", "ca-certificates"]

COPY ["debian-sources", "/etc/apt/sources.list"]

RUN ["apt-get", "--yes", "update"]
RUN ["apt-get", "--yes", "install", "build-essential", "tar", "curl"]
RUN ["apt-get", "--yes", "build-dep", "linux"]
RUN ["apt-get", "--yes", "upgrade"]

RUN ["curl", "--output", "/build/kernel.tar.xz", "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.20.tar.xz"]
RUN ["tar", "xf", "kernel.tar.xz"]
RUN ["mv", "/build/linux-5.4.20", "/build/linux"]

COPY ["kernel-config", "/build/linux/.config"]

WORKDIR /build/linux
RUN ["make", "-j", "8", "vmlinux"]

ENTRYPOINT ["cp", "/build/linux/vmlinux", "/out/vmlinux.bin"]
