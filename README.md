# Valheim Dedicated Server in Docker

## Run

Copy world save data to `./saves` and create `.env` as below.

```bash
SERVER_NAME=""
WORLD_NAME=""
PASSWORD=""
```

```bash
$ docker compose up -d
```

## Backup

```
$ docker compose run --rm --entrypoint=backup.sh valheim
```

## Restore

Restore by running the following before docker compose up.

```
$ docker compose run --rm --entrypoint=restore.sh valheim ${DATETIME}
```