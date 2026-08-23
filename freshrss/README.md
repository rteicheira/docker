# FreshRSS README

## What is FreshRSS?

[FreshRSS](https://github.com/FreshRSS/FreshRSS) is a self-hosted RSS/Atom feed aggregator. It lets me follow news sites, blogs, and podcasts from one lightweight, fully customizable reader instead of relying on a third-party service.

## Project source links

- [Website](https://freshrss.org/)
- [Docker Container](https://hub.docker.com/r/freshrss/freshrss)
- [GitHub Project](https://github.com/FreshRSS/FreshRSS)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [FreshRSS Docker documentation](https://freshrss.github.io/FreshRSS/en/admins/03_Docker.html) for a full list.

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `TZ` | unset | Used to define the container's local time. [List of TZ database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

### FreshRSS Specific

| Variable | Default Value | Comments |
| -- | -- | -- |
| `CRON_MIN` | unset | The minute(s) past the hour on which FreshRSS automatically refreshes all feeds (e.g. `2,32`). Leave unset to disable the built-in scheduler. |
| `TRUSTED_PROXY` | unset | The IP/CIDR of a trusted reverse proxy (e.g. NPM) so FreshRSS reads the real client IP from forwarded headers instead of the proxy's own. |

## Network

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/FreshRSS/FreshRSS/issues).
