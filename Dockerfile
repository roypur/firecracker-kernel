FROM debian:bullseye-slim
WORKDIR /build/linux

COPY ["build", "/build"]

RUN ["sh", "/build/setup.sh"]

ENV KERNEL_SOURCE="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.21.tar.xz"

RUN ["sh", "/build/compile.sh"]

ENTRYPOINT ["cp", "/build/vmlinux.bin", "/out/vmlinux.bin"]
