# Valheim Dedicated Server in Docker

## Build

```bash
$ docker-compose build
```

## Run

Copy world save data to `./saves` and create `.env` as below.

```bash
SERVER_NAME=""
WORLD_NAME=""
PASSWORD=""
```

```bash
$ docker-compose up -d
```