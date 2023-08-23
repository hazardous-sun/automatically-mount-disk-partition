#!/bin/bash

PARTITION_ORIGIN_PATH='/dev/sdb1'
PARTITION_MOUNTING_PATH='/media/solaire/'
PARTITION_NAME='HD Toshiba'
echo "Starting to mount $PARTITION_NAME from $PARTITION_ORIGIN_PATH into $PARTITION_MOUNTING_PATH"
sudo mount -t auto -v "$PARTITION_ORIGIN_PATH" "$PARTITION_MOUNTING_PATH"
echo "Finished mounting partition"