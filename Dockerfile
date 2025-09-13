FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

# Güncelleme ve temel paketlerin kurulumu
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# sshx'i indirip "run" komutuyla başlatmak için ENTRYPOINT ayarlanıyor
ENTRYPOINT ["sh", "-c", "curl -sSf https://sshx.io/get | sh -s run"]
