# syntax=docker.io/docker/dockerfile:1.4.2-labs

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

COPY scripts/*.sh /usr/local/bin/
COPY supervisord.conf /etc/

RUN <<EOT
apt-get update
apt-get install -y \
    busybox-static \
    curl \
    locales \
    software-properties-common \
    supervisor
\
add-apt-repository multiverse
dpkg --add-architecture i386
apt-get update
apt-get install -y lib32gcc1 libsdl2-2.0-0:i386
\
locale-gen en_US.UTF-8
\
mkdir -p /var/spool/cron/crontabs
echo '0 4 * * * /bin/bash /usr/local/bin/backup.sh' > /var/spool/cron/crontabs/root
echo '0 7 * * * /bin/bash /usr/local/bin/install_valheim_server.sh' > /var/spool/cron/crontabs/root
\
curl -L "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zx -C /usr/local/bin
\
chmod +x /usr/local/bin/*.sh
\
/usr/local/bin/install_valheim_server.sh
EOT

EXPOSE 2456-2458 2456-2458/udp

ENTRYPOINT [ "/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf" ]