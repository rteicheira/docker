# Uptime Kuma README

## What is Uptime Kuma?

[Uptime Kuma](https://github.com/louislam/uptime-kuma) is an easy-to-use, self-hosted monitoring tool. It tracks the uptime of HTTP(s), TCP, DNS, and other service types from a web dashboard and can send notifications through a wide range of channels when something goes down.

## Project source links

- [Website](https://uptime.kuma.pet/)
- [Docker Container](https://hub.docker.com/r/louislam/uptime-kuma)
- [GitHub Project](https://github.com/louislam/uptime-kuma)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

| Variable | Default Value | Comments |
| -- | -- | -- |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

## Network

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/louislam/uptime-kuma/issues).
