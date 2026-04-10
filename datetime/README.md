# Datetime.app README
## Project source links
- [Datetime.app Website](https://datetime.app/)
- [Datetime.app Container](https://ghcr.io/airyland/datetime.app)
- [Datetime.app GitHub Project](https://github.com/airyland/datetime.app)

## My environment variables overview
None

## Network
ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/docker-compose.yaml). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.