FROM pingcap/alpine-glibc

RUN apk add --no-cache curl ca-certificates \
    && curl https://download.pingcap.org/tidb-latest-linux-amd64.tar.gz -o /tmp/tidb.tar.gz \
    && tar -C /tmp -xzf /tmp/tidb.tar.gz \
    && cp /tmp/tidb-latest-linux-amd64/bin/pd-server /pd-server
COPY entrypoint.sh /entrypoint.sh

EXPOSE 2379 2380

ENTRYPOINT ["/pd-server"]
