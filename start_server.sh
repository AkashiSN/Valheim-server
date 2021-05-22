#!/bin/sh

export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH

./valheim_server.x86_64 -name "$SERVER_NAME" -port 2456 -world "$WORLD_NAME" -password "$PASSWORD" -savedir /root/saves -public 1
