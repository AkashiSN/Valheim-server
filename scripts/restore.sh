#!/bin/bash
set -eu

if [ $# -lt 1 ]; then
	echo "Please specify backup datetime."
  exit 1
fi

DATETIME="$1"

echo "Use: ${DATETIME}"

BACKUP_DIR="/mnt/backup/valheim"
DIRECTORY_BACKUP="${BACKUP_DIR}/valheim-${DATETIME}.tar.xz"

if [ ! -e ${DIRECTORY_BACKUP} ];then
  echo "${DIRECTORY_BACKUP} is not exists."
  exit 1
fi

rm -rf /root/saves
mkdir -p /root/saves

echo "Restore valheim dir"
tar xf "${DIRECTORY_BACKUP}" -C /root/saves .
