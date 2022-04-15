FROM alpine:3.15

ARG HAMMER_VER="0.5.7"

RUN apk add --no-cache curl

WORKDIR /spanner

RUN curl -OL https://github.com/daichirata/hammer/releases/download/v${HAMMER_VER}/hammer-${HAMMER_VER}-linux-amd64.tar.gz && \
    tar xzvf hammer-${HAMMER_VER}-linux-amd64.tar.gz && \
    mv hammer-${HAMMER_VER}-linux-amd64/hammer /spanner/hammer && \
    chmod +x /spanner/hammer && \
    rm -rf hammer-*
COPY entrypoint.sh /spanner/entrypoint.sh

ENTRYPOINT ["/spanner/entrypoint.sh"]
