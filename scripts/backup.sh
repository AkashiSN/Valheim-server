#!/bin/bash
set -eu

function search_file() {
  echo $(find "$1" -maxdepth 1 -name "$2" -printf "%T+ %p\n" | sort | cut -d " " -f 2)
}

DATETIME=$(date +"%Y%m%d%H%M%S")
echo "Now: ${DATETIME}"

BACKUP_DIR="/mnt/backup/valheim"
DIRECTORY_BACKUP="${BACKUP_DIR}/valheim-${DATETIME}.tar.gz"

MAX_BACKUP=30

DIR_BACKUP_LIST=($(search_file ${BACKUP_DIR} '*.tar.gz'))
if [ ${#DIR_BACKUP_LIST[@]} -gt ${MAX_BACKUP} ]; then # 最大バックアップ数より多い場合古いバックアップを削除する
  for DIR_BACKUP in "${DIR_BACKUP_LIST[@]: 0:$((${#DIR_BACKUP_LIST[@]}-${MAX_BACKUP}))}"; do
    echo "Remove ${DIR_BACKUP}"
    rm ${DIR_BACKUP}
  done
fi

echo "Backup valheim dir"
tar zcf "${DIRECTORY_BACKUP}" -C /root/saves .