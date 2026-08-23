# Portainer README

## What is Portainer?

[Portainer](https://github.com/portainer/portainer) is a lightweight container management platform that provides a graphical interface for administering Docker (and Swarm, Kubernetes, ACI) environments. I use it as my primary dashboard for managing containers, images, volumes, and networks, and for deploying stacks from Docker Compose files.

> [!NOTE]
> Unlike the rest of my containers, Portainer isn't run from a `docker-compose.yaml` file — it's started directly with `docker run`, since it's effectively the tool I use to manage all my other stacks.

## Project source links

- [Website](https://www.portainer.io/)
- [Docker Container](https://hub.docker.com/r/portainer/portainer-ce)
- [GitHub Project](https://github.com/portainer/portainer)
- [My upgrade script](upgradeportainer.sh)

## Running Portainer

```bash
docker run -d \
    -p 8000:8000 \
    -p 9443:9443 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:lts
```

## Network

| Port | Description |
| -- | -- |
| 8000:8000 | Edge agent tunnel port. |
| 9443:9443 | HTTPS web UI. |

## Upgrading

I use [upgradeportainer.sh](upgradeportainer.sh) to check for and apply updates. It detects whether `portainer` or `portainer_agent` is running, pulls the latest image, and if an update is available, recreates the container with the same options used above.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/portainer/portainer/discussions).
