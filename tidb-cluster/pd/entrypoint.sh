#!/bin/sh

if [[ -z $"KUBERNETES_PORT" ]]; then
    exec "$@"	       # not in kubernetes, execute what user provides
fi

hostname=$(hostname)
num=$(hostname | awk -F '-' '{print $NF}') # get statefulset ordinal index for current pod
if [[ $num == "0" ]]; then
    # first pd pod
    exec /pd-server "$@" --initial-cluster="${hostname}=http://${hostname}.${MY_CLUSTER_NAME}-pd.${MY_NAMESPACE}.svc:2380"
else
    exec /pd-server "$@" --join="http://${MY_CLUSTER_NAME}-pd-client:2379"
fi
