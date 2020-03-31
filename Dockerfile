FROM alpine:edge
WORKDIR /build/linux
COPY ["build/setup.sh", "/build/setup.sh"]
COPY ["build/packages.txt", "/build/packages.txt"]

RUN ["sh", "/build/setup.sh"]

COPY ["build/compile.sh", "/build/compile.sh"]
RUN ["chmod", "755", "/build/compile.sh"]

ENV KERNEL_SOURCE="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.28.tar.xz"

ENTRYPOINT ["/build/compile.sh"]
