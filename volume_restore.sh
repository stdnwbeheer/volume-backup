#!/bin/bash
# This script allows you to restore a single volume from a container
# Data in restored in volume with same backupped path
NEW_CONTAINER_NAME=$1
BACKUP_FILE=$2

usage() {
  echo "Usage: $0 [container name] [backup file]"
  exit 1
}

if [ -z $NEW_CONTAINER_NAME ]
then
  echo "Error: missing container name parameter."
  usage
fi

if [ -z $BACKUP_FILE ]
then
  echo "Error: missing backup file parameter."
  usage
fi

docker run --rm --volumes-from $NEW_CONTAINER_NAME -v $(pwd):/backup busybox tar xvf /backup/$BACKUP_FILE
