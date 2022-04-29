FROM ubuntu:21.04

LABEL org.opencontainers.image.source https://github.com/EHRMS/nsis-builder

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt -y update && \
    apt -y upgrade && \
    apt -y install \
        nsis && \
    apt -y autoremove && \
    apt -y autoclean && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/*

COPY build.sh /build.sh

RUN chmod +x /build.sh

CMD ["/build.sh"]