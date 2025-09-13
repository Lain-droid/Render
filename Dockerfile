FROM ubuntu:20.04

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

# Gereken araçları yükle
RUN apt-get update && \
    apt-get install -y curl netcat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# SSHX tünel başlasın, arka planda
RUN mkdir -p /app
WORKDIR /app

# Uygulama başlangıç komutu
CMD bash -c "\
    (curl -sSf https://sshx.io/get | sh -s run &) && \
    while true; do echo -e 'HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n' | nc -l -p 80; done"
