# Diun README

## What is Diun?

[Diun](https://github.com/crazy-max/diun) (Docker Image Update Notifier) watches container images and tells you when an update is available. It periodically checks the source registry for new tags or digest changes and pushes a notification so I don't have to manually check for updates myself.

## Project source links

- [Website](https://crazymax.dev/diun/)
- [Docker Container](https://hub.docker.com/r/crazymax/diun)
- [GitHub Project](https://github.com/crazy-max/diun)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [Diun documentation](https://crazymax.dev/diun/config/) for a full list.

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `TZ` | unset | Used to define the container's local time. [List of TZ database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

### Diun Specific

| Variable | Default Value | Comments |
| -- | -- | -- |
| `DIUN_WATCH_WORKERS` | `10` | Number of concurrent workers used to check for image updates. |
| `DIUN_WATCH_SCHEDULE` | `0 */6 * * *` | Cron expression for how often Diun checks for image updates. |
| `DIUN_WATCH_JITTER` | unset | A random jitter added on top of the schedule so checks don't all fire at the exact same moment. |
| `DIUN_PROVIDERS_DOCKER` | `false` | Enables the Docker provider so Diun can discover containers to watch. |
| `DIUN_PROVIDERS_DOCKER_WATCHBYDEFAULT` | `false` | When `true`, watches every container automatically. I leave this `false` and opt in per-container with the `diun.enable=true` label instead. |
| `DIUN_DB_PATH` | `diun.db` | Path to the local database Diun uses to track image state between runs. |
| `DIUN_NOTIF_DISCORD_WEBHOOKURL` | unset | The Discord webhook URL notifications are sent to. |
| `DIUN_NOTIF_DISCORD_RENDERFIELDS` | `false` | Renders notification details (image, provider, etc.) as Discord embed fields instead of inline text. |
| `DIUN_NOTIF_DISCORD_TIMEOUT` | `10s` | How long to wait on the Discord notification request before timing out. |

> [!NOTE]
> My compose file also sets a custom `DIUN_NOTIF_DISCORD_TEMPLATEBODY` so the Discord message includes the hostname that triggered the check.

## Network

Unlike most of my other containers, Diun isn't a web app and doesn't need to sit behind NPM — it only needs access to the Docker socket to inspect running containers. It runs on its own dedicated `diun` network instead of *ProxNET*.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/crazy-max/diun/issues).
