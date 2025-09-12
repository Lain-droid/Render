FROM ubuntu:20.04

# Gereken paketler: curl ve bash
RUN apt-get update && apt-get install -y curl bash && apt-get clean && rm -rf /var/lib/apt/lists/*

# sshx kurulum scriptini indirip run modunda çalıştırmak için gerekli binaryleri hazırla
RUN curl -sSf https://sshx.io/get | sh -s download && \
    chmod +x ./sshx && \
    mv ./sshx /usr/local/bin/

# sshx'i run komutuyla başlat (bu terminali açar)
CMD ["sshx", "run"]
