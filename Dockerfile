FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    lib32gcc1=1:8.3.0-6 \
    lib32stdc++6=8.3.0-6 \
    wget=1.20.1-1.1 \
    ca-certificates=20190110 \
    rsync=3.1.3-6 \
    unzip=6.0-23+deb10u1 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m get5csgo

USER get5csgo

RUN mkdir /home/get5csgo/Steam

WORKDIR /home/get5csgo/Steam

RUN wget -qO- https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar zxf -

RUN /home/get5csgo/Steam/steamcmd.sh +quit

WORKDIR /home/get5csgo

RUN mkdir server

COPY entrypoint.sh /usr/local/bin/

CMD [ "entrypoint.sh" ]
