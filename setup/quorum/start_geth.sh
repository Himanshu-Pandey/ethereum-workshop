#!/usr/bin/env bash
while ! [ -e  /data/constellation.ipc ]; do
    echo 'Waiting for constellation to start...'
    sleep 1
done
PRIVATE_CONFIG=/data/constellation.ipc nohup /usr/local/bin/geth \
    --datadir ${QUORUM_DIR} \
    --raft \
    --rpc \
    --rpcaddr 0.0.0.0 \
    --rpccorsdomain "*" \
    --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft \
    --emitcheckpoints \
    --raftport 50401 \
    --rpcport 22000 \
    --port 21000 \
    --verbosity 5 \
    --nodiscover 