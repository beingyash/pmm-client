#!/bin/bash
#HOSTNAME=$(curl rancher-metadata/latest/self/host/name)
pmm-admin config --client-address=$CLIENT_ADDRESS --bind-address=$BIND_ADDRESS
pmm-admin config --server $MONITORING_SERVICE_NAME --client-name host_${HOSTNAME}
pmm-admin add linux:metrics
/usr/local/percona/pmm-client/node_exporter -web.listen-address=$MY_IP:42000 -collectors.enabled=diskstats,filesystem,loadavg,meminfo,netdev,netstat,stat,time,uname,vmstat
