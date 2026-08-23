# Slash README

## What is Slash?

[Slash](https://github.com/yourselfhosted/slash) is a self-hosted bookmarking and link-shortening platform. It lets me create short, memorable shortcuts for long URLs and share them either publicly or just with my own team.

## Project source links

- [Docker Container](https://hub.docker.com/r/yourselfhosted/slash)
- [GitHub Project](https://github.com/yourselfhosted/slash)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `TZ` | unset | Used to define the container's local time. [List of TZ database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

## Network

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/yourselfhosted/slash/issues).
