ARG ARCH=amd64
FROM ubuntu:20.04

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

RUN apt-get update && \
    apt-get install -y \
      git \
      golang-go \
      build-essential \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /build

# webtty kaynağını klonla
RUN git clone https://github.com/maxmcd/webtty.git /build/webtty

WORKDIR /build/webtty

# Go ile derle
RUN GOARCH=$ARCH go build -o /usr/local/bin/webtty .

# Kullanılmayacak paketleri temizle
RUN apt-get remove --purge -y git build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /build

EXPOSE 8080

CMD ["webtty", "--port", "8080", "--cmd", "bash"]
