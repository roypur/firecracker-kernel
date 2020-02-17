FROM debian:buster-slim

RUN ["mkdir", "-p", "/build"]
WORKDIR /build

RUN ["apt-get", "--yes", "update"]
RUN ["apt-get", "--yes", "install", "ca-certificates"]

COPY ["debian-sources", "/etc/apt/sources.list"]

RUN ["apt-get", "--yes", "update"]
RUN ["apt-get", "--yes", "install", "build-essential", "curl", "git"]
RUN ["apt-get", "--yes", "build-dep", "linux"]
RUN ["apt-get", "--yes", "upgrade"]

RUN ["git", "clone", "--depth", "1", "--single-branch", "--branch", "linux-5.4.y", "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git", "/build/linux"]

WORKDIR /build/linux

RUN ["curl", "--output", "/build/linux/.config", "https://raw.githubusercontent.com/firecracker-microvm/firecracker/master/resources/microvm-kernel-config"]
RUN ["make", "olddefconfig"]

RUN ["make", "-j", "8", "vmlinux"]

ENTRYPOINT ["cp", "/build/linux/vmlinux", "/out/vmlinux.bin"]
