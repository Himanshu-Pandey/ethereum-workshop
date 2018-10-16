FROM ubuntu:xenial AS builder

RUN apt-get update && \
    apt-get install -y build-essential wget unzip

ENV GOREL=go1.9.3.linux-amd64.tar.gz \
    PATH=$PATH:/usr/local/go/bin \
    QVER=2.1.0 \
    CONSTELLATION_URL=https://github.com/jpmorganchase/constellation/releases/download/v0.3.2/constellation-0.3.2-ubuntu1604.tar.xz

RUN wget -q https://dl.google.com/go/$GOREL && \
	tar xfz $GOREL && \
	mv go /usr/local/go

RUN wget https://github.com/jpmorganchase/quorum/archive/v$QVER.tar.gz && \
	tar xvzf v$QVER.tar.gz && \
	cd quorum-$QVER && \
	make all && \
	cp build/bin/geth /usr/local/bin && \
	cp build/bin/bootnode /usr/local/bin

RUN wget -q $CONSTELLATION_URL -O constellation.tar.xz && \
	tar xfJ constellation.tar.xz --strip-components 1 -C /usr/local/bin && \
	chmod 0755 /usr/local/bin/constellation-node

FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y build-essential libsodium18 libleveldb1v5 libgmp10 supervisor curl jq python3 python3-pip
RUN pip3 install ecdsa pysha3

COPY --from=builder /usr/local/bin/constellation-node /usr/local/bin/constellation-node
COPY --from=builder /usr/local/bin/geth /usr/local/bin/geth
COPY --from=builder /usr/local/bin/bootnode /usr/local/bin/bootnode
COPY . /data

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /data

ENTRYPOINT /data/init.sh
CMD []

HEALTHCHECK --interval=5s --timeout=80s --retries=5 --start-period=30s CMD ["/data/health-check.sh"]