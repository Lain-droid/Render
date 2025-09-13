FROM ubuntu:24.04

# Ortam değişkenleri
ENV DEBIAN_FRONTEND=noninteractive

# Güncelleme, temel araçlar ve SSHX kurulumu
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl ca-certificates && \
    curl -sSf https://sshx.io/get | sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# SSHX'in kullanacağı port (örnek: 2222)
EXPOSE 2222

# SSHX'i başlat
CMD ["sshx"]
