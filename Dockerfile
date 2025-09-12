FROM debian:trixie

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV DEBIAN_FRONTEND=noninteractive

# Gerekli paketleri kur
RUN apt-get update && \
    apt-get install -y \
    curl \
    ca-certificates \
    libjson-c5 \
    libwebsockets16 \
    libssl3 \
    bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ttyd indir (en son stabil sürüm)
RUN curl -sL https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64 \
    -o /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd

# Script dosyasını kopyala
COPY run_ttyd.sh /run_ttyd.sh
RUN chmod +x /run_ttyd.sh

EXPOSE 7681

# Başlat
CMD ["/bin/bash", "/run_ttyd.sh"]
