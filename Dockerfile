FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository multiverse \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y lib32gcc1 libsdl2-2.0-0:i386 locales \
    && locale-gen en_US.UTF-8

ADD "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" /tmp/
RUN tar xf /tmp/steamcmd_linux.tar.gz -C /usr/local/bin

ENV LANG en_US.UTF-8 \
    LANGUAGE en_US:en \
    LC_ALL en_US.UTF-8

WORKDIR /root/

RUN steamcmd.sh \
    +login anonymous \
    +force_install_dir ./ \
    +app_update 896660 validate\
    +exit

WORKDIR "/root/Steam/steamapps/common/Valheim dedicated server"

COPY ./start_server.sh .
RUN chmod +x ./start_server.sh

EXPOSE 2456-2458 2456-2458/udp

ENTRYPOINT [ "./start_server.sh" ]