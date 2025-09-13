FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl ca-certificates && \
    curl -sSf https://sshx.io/get | sh

EXPOSE 2222

CMD ["sshx"]
