#!/bin/bash

echo "init genesis.json"
geth --datadir $HOME/.ethereum init $HOME/.ethereum/geth/genesis.json

echo "Copying public nodekey to geth path"

echo ${NODEKEY} > $HOME/.ethereum/geth/nodekey
echo ${ACCOUNTKEY} > /data/accountkey
echo "" > /data/password.txt

geth account import --datadir $HOME/.ethereum --password /data/password.txt /data/accountkey

chmod +x /data/start_geth.sh
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n