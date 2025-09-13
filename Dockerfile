FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=2222

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl ca-certificates bash && \
    curl -sSf https://sshx.io/get | sh

EXPOSE 2222

CMD ["bash", "-c", "sshx -p $PORT"]
