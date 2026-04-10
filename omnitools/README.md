# OmniTools README
## Project source links
- [OmniTools Website](https://omnitools.app/)
- [OmniTools Container](https://hub.docker.com/r/iib0011/omni-tools)
- [OmniTools GitHub Project](https://github.com/iib0011/omni-tools)

## My environment variables overview
None

## Network
ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/docker-compose.yaml). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.