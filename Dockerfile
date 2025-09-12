FROM ubuntu:20.04
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

RUN apt-get update && apt-get install -y curl bash && \
    curl -LO https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    mv ttyd.x86_64 /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY /run_ttyd.sh /run_ttyd.sh
RUN chmod 744 /run_ttyd.sh

EXPOSE 8080

CMD ["/bin/bash", "/run_ttyd.sh"]
