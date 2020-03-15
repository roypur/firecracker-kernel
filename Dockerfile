FROM debian:bullseye-slim
WORKDIR /build/linux
COPY ["build/setup.sh", "/build/setup.sh"]
COPY ["build/apt-conf", "/etc/apt/apt.conf.d/apt-conf"]
COPY ["build/sources.list", "/build/sources.list"]

RUN ["sh", "/build/setup.sh"]

COPY ["build/compile.sh", "/build/compile.sh"]
RUN ["chmod", "755", "/build/compile.sh"]

ENV KERNEL_SOURCE="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.25.tar.xz"

ENTRYPOINT ["/build/compile.sh"]
