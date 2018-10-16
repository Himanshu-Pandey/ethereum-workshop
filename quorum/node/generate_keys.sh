#!/bin/bash
set -e

for company in $@
do
    export KEYS_DIR="keys/$company"
    mkdir -p ${KEYS_DIR}

    # Generating Quorum Keys
    /usr/local/bin/bootnode -genkey ${KEYS_DIR}/nodekey

    # TODO :  should be removed (nodepub can be derived from nodekey)
    /usr/local/bin/bootnode -nodekey ${KEYS_DIR}/nodekey -writeaddress > ${KEYS_DIR}/nodepub

    # Generating Constellation Keys
    echo "" | /usr/local/bin/constellation-node --generatekeys=${KEYS_DIR}/constellation

    # Generating Account Keys
    python3 /data/eckeypair.py ${KEYS_DIR}
done
