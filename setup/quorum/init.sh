#!/bin/bash
set -e

export QUORUM_DIR="/quorum"

# Only initialise the Quorum data directory if this has not been done before
if [[ ! -e "${QUORUM_DIR}/geth/genesis.json" && ! -d "${QUORUM_DIR}/chaindata" ]]; then
    echo "Copying genesis.json to geth path ${QUORUM_DIR}/geth/genesis.json"
    mkdir -p ${QUORUM_DIR}/geth
    cp /data/genesis.json ${QUORUM_DIR}/geth/genesis.json

    echo "Copying Constellation keys to Quorum data directory ${QUORUM_DIR}"
    echo ${CONSTELLATION_PUB} > ${QUORUM_DIR}/constellation.pub
    echo ${CONSTELLATION_KEY} > ${QUORUM_DIR}/constellation.key
    chmod 0600 ${QUORUM_DIR}/constellation.key

    echo "Initialising the Quorum node"
    /usr/local/bin/geth --datadir ${QUORUM_DIR} init ${QUORUM_DIR}/geth/genesis.json

    echo "Copying configured accountkey to Quorum data directory ${QUORUM_DIR}"
    echo ${ACCOUNTKEY} > ${QUORUM_DIR}/accountkey

    echo "Importing configured account into Quorum"
    echo "" > ${QUORUM_DIR}/password.txt
    /usr/local/bin/geth account import --datadir ${QUORUM_DIR} --password ${QUORUM_DIR}/password.txt ${QUORUM_DIR}/accountkey
    rm ${QUORUM_DIR}/password.txt

    echo "Copying configured nodekey to geth path ${QUORUM_DIR}/geth"
    echo ${NODEKEY} > ${QUORUM_DIR}/geth/nodekey
else
    echo "Quorum node already initialised. Reading state from provided directory ${QUORUM_DIR}"
fi


# Clean up old Constellation socket file descriptor if it exists
if [ -e /data/constellation.ipc ]; then
    rm /data/constellation.ipc
fi

if [ "$PERMISSIONED_NODES" != "" ]; then
    echo -e "Please provide permissioned nodes as environment variables.\nExiting.............."
    echo "${PERMISSIONED_NODES}" > ${QUORUM_DIR}/permissioned-nodes.json
    cp ${QUORUM_DIR}/permissioned-nodes.json ${QUORUM_DIR}/static-nodes.json
    echo "Updated ${QUORUM_DIR}/permissioned-nodes.json and ${QUORUM_DIR}/static-nodes.json from environment variable inputs"
fi

if [ "$CONSTELLATION_NODES" == "" ]; then
    echo -e "Please provide constellation nodes as environment variables.\nExiting.............."
    exit 1
fi


echo "Configuring constellation"
for node in ${CONSTELLATION_NODES//,/ }
do
    PEERS+=\"${node}\",
done
sed -i "s@QUORUM_DIR@${QUORUM_DIR}@g" /data/constellation.conf
sed -i "s@CONSTELLATION_NODES@${PEERS::-1}@g" /data/constellation.conf
sed -i "s@QUORUM_NODE_ADDRESS@${QUORUM_NODE_ADDRESS}@g" /data/constellation.conf

chmod +x /data/start_geth.sh

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n
