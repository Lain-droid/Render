FROM ubuntu:20.04

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV DEBIAN_FRONTEND=noninteractive

# ttyd sürümü
ENV TTYD_VER=1.7.7

RUN apt-get update && \
    apt-get install -y curl libjson-c-dev libwebsockets-dev libssl-dev && \
    # ttyd için uygun dosyayı indir
    curl -LO https://github.com/tsl0922/ttyd/releases/download/${TTYD_VER}/ttyd.${TTYD_VER}.linux.x86_64 && \
    chmod +x ttyd.${TTYD_VER}.linux.x86_64 && \
    mv ttyd.${TTYD_VER}.linux.x86_64 /usr/local/bin/ttyd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 7681

CMD ["ttyd", "-p", "7681", "bash"]
