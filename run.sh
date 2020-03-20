#!/bin/bash

#DATA_DIR=${DATA_DIR:-/data}
#LOG_DIR=${LOG_DIR:-"$DATA_DIR/logs"}
#CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch}
#LISTEN=${LISTEN:-127.0.0.1}
LISTEN=0.0.0.0

#mkdir -p $DATA_DIR
#mkdir -p $LOG_DIR
#chown -R elasticsearch $DATA_DIR
#chown -R elasticsearch $LOG_DIR

#su -c "/elasticsearch-7.6.1/bin/elasticsearch -Epath.data=${DATA_DIR} -Epath.logs=${LOG_DIR} -Ecluster.name=${CLUSTER_NAME} -Enetwork.host=${LISTEN}  -Expack.ml.enabled=false  $*" elasticsearch
su -c "/elasticsearch-7.6.1/bin/elasticsearch -Enetwork.host=${LISTEN}  -Expack.ml.enabled=false -Ediscovery.zen.minimum_master_nodes=1 -Enode.master=true -Enode.ingest=true -Enode.data=true -Ediscovery.type=\"single-node\"  $*" elasticsearch


