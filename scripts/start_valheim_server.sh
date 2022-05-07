#!/bin/sh
set -eu

cd "/root/Steam/steamapps/common/Valheim dedicated server"

export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH

./valheim_server.x86_64 -name "$SERVER_NAME" -port 2456 -world "$WORLD_NAME" -password "$PASSWORD" -savedir /root/saves -public 1
