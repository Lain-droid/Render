FROM ubuntu:22.04

LABEL maintainer="you@example.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    pkg-config \
    libjson-c-dev \
    libwebsockets-dev \
    libssl-dev \
    libtool \
    autoconf \
    automake \
    bash \
    curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/tsl0922/ttyd.git /ttyd && \
    cd /ttyd && mkdir build && cd build && \
    cmake .. && make && make install

EXPOSE 8080

CMD ["ttyd", "-p", "8080", "bash"]
