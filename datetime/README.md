# Datetime.app README

## What is Datetime.app?

[Datetime.app](https://github.com/airyland/datetime.app) is a clean, self-hosted time viewing and conversion tool. It's designed for developers, remote teams, and anyone who needs to work across multiple time zones, offering quick timezone conversion and support for a range of time formats.

## Project source links

- [Website App](https://datetime.app/)
- [Docker Container](https://ghcr.io/airyland/datetime.app)
- [GitHub Project](https://github.com/airyland/datetime.app)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

No environment variables are required. All configuration is handled in-app.

## Network

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/airyland/datetime.app/issues).
