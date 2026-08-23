# Wiki.js README

## What is Wiki.js?

[Wiki.js](https://github.com/requarks/wiki) is a modern, lightweight, and powerful wiki app built on Node.js. I use it as a self-hosted knowledge base for documenting my homelab and personal projects.

## Project source links

- [My Docker Compose](docker-compose.yaml)

| Project | Website | Container | GitHub Project |
| -- | -- | -- | -- |
| Wiki.js | [Website](https://js.wiki/) | [Container](https://hub.docker.com/r/requarks/wiki) | [GitHub Project](https://github.com/requarks/wiki) |
| PostgreSQL | - | [Container](https://hub.docker.com/_/postgres) | [GitHub Project](https://github.com/postgres/postgres) |

## My environment variables overview

| Variable | Default Value | Comments |
| -- | -- | -- |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |
| `DB_NAME` | unset | The Postgres database name, shared between the `db` and `wiki` containers. |
| `DB_USER` | unset | The Postgres database user. |
| `DB_PASS` | unset | The Postgres database password. |

## Network

The `db` container only needs to talk to `wiki`, so it sits on its own dedicated `wikijs` network. The `wiki` container also joins *ProxNET* so it can be reached through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the original project for its default port.

## Maintenance scripts

- [backupwiki.sh](backupwiki.sh) — runs weekly via cron to export both containers and snapshot the database volume to external storage.
- [upgradewiki.sh](upgradewiki.sh) — pulls the latest `wiki` image and recreates the stack. My primary way of upgrading this stack is through Portainer instead.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/requarks/wiki/discussions).
