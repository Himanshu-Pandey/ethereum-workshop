#!/usr/bin/env bash

geth --datadir /root/.ethereum \
    --rpc \
    --networkid 2017 \
    --rpcaddr 0.0.0.0 \
    --rpccorsdomain "*" \
    --mine \
    --minerthreads=1 \
    --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3 \
    --rpcport 22000 \
    --port 21000 \
    --verbosity 5 \
    --nodiscover