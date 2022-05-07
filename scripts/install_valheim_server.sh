#!/bin/sh
set -eu

cd  /root

steamcmd.sh \
    +login anonymous \
    +force_install_dir ./ \
    +app_update 896660 validate\
    +exit