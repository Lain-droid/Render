FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl

RUN curl -sSf https://sshx.io/get | sh

EXPOSE 2222

CMD ["./sshx", "-p", "2222"]
