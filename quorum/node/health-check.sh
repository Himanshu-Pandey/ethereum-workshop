#!/usr/bin/env bash
retries=4
outcome=1
while (( retries > 0 && outcome == 1 ))
do
    if ((supervisorctl -c /etc/supervisor/supervisord.conf status geth | grep -E RUNNING &> /dev/null) && (supervisorctl -c /etc/supervisor/supervisord.conf status constellation | grep -E RUNNING &> /dev/null)) ; then
        outcome=0
    fi
    echo $outcome
    if [ $outcome -eq 0 ] ;
    then
        echo "Quorum is healthy"
        exit 0
    else
        echo "Sleeping for 10s"
        sleep 10
    fi
    echo "Retrying..."
    ((retries--))
done

echo "Healthcheck was unsuccessful :("
exit 1