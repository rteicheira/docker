# Paperless-ngx README

## What is Paperless-ngx?

[Paperless-ngx](https://github.com/paperless-ngx/paperless-ngx) is a document management system that turns physical documents into a searchable online archive. It uses OCR to index scanned documents so they can be found, tagged, and archived digitally instead of kept as physical paper.

## Project source links

- [My Docker Compose](docker-compose.yaml)

| Project | Website | Container | GitHub Project |
| -- | -- | -- | -- |
| Paperless-ngx | [Website](https://docs.paperless-ngx.com/) | [Container](https://ghcr.io/paperless-ngx/paperless-ngx) | [GitHub Project](https://github.com/paperless-ngx/paperless-ngx) |
| Redis | - | [Container](https://hub.docker.com/_/redis) | [GitHub Project](https://github.com/redis/redis) |
| PostgreSQL | - | [Container](https://hub.docker.com/_/postgres) | [GitHub Project](https://github.com/postgres/postgres) |

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [Paperless-ngx configuration documentation](https://docs.paperless-ngx.com/configuration/) for a full list.

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `TZ` | unset | Passed through as `PAPERLESS_TIME_ZONE`. Used to define the container's local time. [List of TZ database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). |

### Postgres

| Variable | Default Value | Comments |
| -- | -- | -- |
| `POSTGRES_DB` | unset | The database name, shared between the `db` and `webserver` containers. |
| `POSTGRES_USER` | unset | The database user. |
| `POSTGRES_PASSWORD` | unset | The database password. |

### Paperless-ngx Specific

| Variable | Default Value | Comments |
| -- | -- | -- |
| `PAPERLESS_SECRET_KEY` | random | A random secret used for authentication. If left unset, one is generated automatically, but I set my own so it survives a rebuild. Generate with `python3 -c "import secrets; print(secrets.token_urlsafe(64))"`. |
| `PAPERLESS_URL` | unset | The public facing URL of my Paperless instance (e.g. `https://paperless.example.com`), used to derive `ALLOWED_HOSTS` and `CSRF_TRUSTED_ORIGINS`. |
| `PAPERLESS_CSRF_TRUSTED_ORIGINS` | unset | A comma-separated list of trusted origins for unsafe (e.g. `POST`) requests, needed to access the Django admin behind a reverse proxy. |
| `PAPERLESS_ALLOWED_HOSTS` | unset | A comma-separated list of hostnames Paperless is allowed to serve. |

## Network

The `db` and `broker` containers only need to talk to `webserver`, so they sit on their own dedicated `paperless` network. The `webserver` container also joins *ProxNET* so it can be reached through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the original project for its default port.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/paperless-ngx/paperless-ngx/discussions).
