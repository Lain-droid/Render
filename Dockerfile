FROM ubuntu:20.04

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV DEBIAN_FRONTEND=noninteractive

# ttyd sürümünü tanımla
ENV TTYD_VER=1.7.3

# ttyd ve bash shell kurulumu
RUN apt-get update && \
    apt-get install -y curl unzip build-essential cmake git libjson-c-dev libwebsockets-dev libssl-dev pkg-config && \
    curl -LO https://github.com/tsl0922/ttyd/releases/download/${TTYD_VER}/ttyd.${TTYD_VER}.linux.x86_64.tar.gz && \
    tar -xzf ttyd.${TTYD_VER}.linux.x86_64.tar.gz && \
    mv ttyd /usr/local/bin/ && \
    chmod +x /usr/local/bin/ttyd && \
    rm ttyd.${TTYD_VER}.linux.x86_64.tar.gz && \
    apt-get remove --purge -y curl && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Portu aç
EXPOSE 7681

# ttyd başlat komutu (Render çalıştırınca otomatik çalışacak)
CMD ["ttyd", "-p", "7681", "bash"]
