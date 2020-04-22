![GitHub](https://img.shields.io/badge/license-GPL--3.0-informational?style=plastic)
![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)

# akito13/selfoss

![selfoss](https://i.imgur.com/8hJyBgk.png "selfoss")

### What is this ?

The new multipurpose rss reader, live stream, mashup, aggregation web application.

This is a fork of https://github.com/hardware/selfoss .

## Pull
```bash
docker pull akito13/selfoss
```

## Build
```bash
docker build -t akito-selfoss:test -f Dockerfile .
```

### Features

- Lightweight & secure image (no root process)
- Based on Alpine Linux
- Latest Selfoss version (2.19)
- SQLite driver
- With Nginx and PHP7

### Build-time variables

- **VERSION** = selfoss version
- **COMMIT** = selfoss short commit hash (7 characters)

### Ports

- 8888

### Environment variables

| Variable | Description | Type | Default value |
| -------- | ----------- | ---- | ------------- |
| **UID** | selfoss user id | *optional* | 991
| **GID** | selfoss group id | *optional* | 991
| **CRON_PERIOD** | Cronjob period for updating feeds | *optional* | 15m
| **UPLOAD_MAX_SIZE** | Attachment size limit | *optional* | 25M
| **LOG_TO_STDOUT** | Enable nginx and php error logs to stdout | *optional* | false
| **MEMORY_LIMIT** | PHP memory limit | *optional* | 128M

### Docker-compose.yml

```yml
selfoss:
  image: hardware/selfoss
  container_name: selfoss
  volumes:
    - /mnt/docker/selfoss:/selfoss/data
```

## License
Copyright (C) 2020  Akito <the@akito.ooo>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
