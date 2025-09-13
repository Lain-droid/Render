FROM ubuntu:20.04

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV TERM=xterm

RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    curl -L https://github.com/yudai/webtty/releases/download/5.0.0/webtty_linux_amd64.tar.gz | tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/webtty && \
    apt-get remove --purge -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["webtty", "--port", "8080", "--command", "bash"]
