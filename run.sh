#!/bin/bash
#HOSTNAME=$(curl rancher-metadata/latest/self/host/name)
pmm-admin config --client-address=$CLIENT_ADDRESS --bind-address=$BIND_ADDRESS
pmm-admin config --server $MONITORING_SERVICE_NAME --client-name host_${HOSTNAME}
pmm-admin add mongodb --uri=$MONGODB_URI

/usr/local/percona/pmm-client/node_exporter -web.listen-address=$CLIENT_ADDRESS:42000 -collectors.enabled=diskstats,filesystem,loadavg,meminfo,netdev,netstat,stat,time,uname,vmstat
