#!/bin/bash

DATA_DIR=${DATA_DIR:-/data}
LOG_DIR=${LOG_DIR:-"$DATA_DIR/logs"}
CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch}
LISTEN=${LISTEN:-127.0.0.1}

mkdir -p $DATA_DIR
mkdir -p $LOG_DIR
chown -R elasticsearch $DATA_DIR
chown -R elasticsearch $LOG_DIR

su -c "/elasticsearch-2.2.0/bin/elasticsearch -server -Dpath.data=${DATA_DIR} -Dpath.logs=${LOG_DIR} -Dcluster.name=${CLUSTER_NAME} -Dnetwork.host=${LISTEN} $*" elasticsearch
