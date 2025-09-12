FROM debian:unstable

# Ortam değişkenleri
ENV DEBIAN_FRONTEND=noninteractive

# Güncelleme, yükseltme ve sshx kurulumu
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl && \
    curl -sSf https://sshx.io/get | sh -s run && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# SSHX portu aç
EXPOSE 2222

# SSHX'i arka planda başlatmak için komut (örnek)
CMD ["sshx", "-p", "2222"]
