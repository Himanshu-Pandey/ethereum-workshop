FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y software-properties-common supervisor && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY genesis.json /root/.ethereum/geth/genesis.json
COPY . /data

WORKDIR /data

ENTRYPOINT /data/init.sh
CMD []
HEALTHCHECK --interval=5s --timeout=2s --retries=5 --start-period=30s CMD ["/data/health-check.sh"]