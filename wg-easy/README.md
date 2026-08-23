# WG-Easy README

## What is WG-Easy?

[WG-Easy](https://github.com/wg-easy/wg-easy) is the easiest way to install and manage a [WireGuard](https://www.wireguard.com/) VPN. It bundles the WireGuard server with a web-based admin UI for creating, managing, and monitoring VPN clients.

## What is...?

- [WG-Easy](https://github.com/wg-easy/wg-easy) is the WireGuard server and web UI.
- [Autoheal](https://github.com/willfarrell/docker-autoheal) monitors the container's healthcheck (a repeated ping to `1.1.1.1`) and restarts it if it becomes unhealthy.

## Project source links

- [My Docker Compose](docker-compose.yaml)

| Project | Website | Container | GitHub Project |
| -- | -- | -- | -- |
| WG-Easy | - | [Container](https://ghcr.io/wg-easy/wg-easy) | [GitHub Project](https://github.com/wg-easy/wg-easy) |
| Autoheal | [README](https://github.com/willfarrell/docker-autoheal/blob/main/README.md) | [Container](https://hub.docker.com/r/willfarrell/autoheal/) | [GitHub Project](https://github.com/willfarrell/docker-autoheal) |

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [WG-Easy documentation](https://wg-easy.github.io/wg-easy/latest/) for a full list.

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `LANG` | unset | Used to define the container's language. [IETF language tag](https://en.wikipedia.org/wiki/IETF_language_tag). |

### WG-Easy

| Variable | Default Value | Comments |
| -- | -- | -- |
| `WG_PORT` | `51820` | The UDP port WireGuard itself listens on. |
| `PORT` | `51821` | The TCP port the web UI listens on. |
| `PASSWORD_HASH` | unset | A bcrypt hash of the admin UI password. |
| `WG_HOST` | unset | The public hostname or IP clients use to reach this server. |
| `WG_DEFAULT_DNS` | `1.1.1.1` | The DNS server pushed to connected clients. |
| `WG_MTU` | unset | Overrides the WireGuard interface MTU (e.g. `1420`). |
| `WG_PERSISTENT_KEEPALIVE` | unset | Interval, in seconds, for keepalive packets — useful for clients behind NAT. |
| `WG_ALLOWED_IPS` | `0.0.0.0/0, ::/0` | The routes pushed to clients, determining what traffic goes through the tunnel. |
| `WG_DEVICE` | `eth0` | The host network interface WireGuard routes traffic through. |
| `UI_TRAFFIC_STATS` | `false` | Enables traffic statistics in the web UI. |
| `UI_CHART_TYPE` | unset | The chart style used for traffic stats in the UI. |

### Autoheal

| Variable | Default Value | Comments |
| -- | -- | -- |
| `AUTOHEAL_CONTAINER_LABEL` | `autoheal` | Used to tell autoheal which containers to monitor. |

## Network

WG-Easy needs to expose the actual WireGuard tunnel directly, so it can't be routed entirely through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). It runs on its own dedicated `wireguard` network for the tunnel, and also joins *ProxNET* so the web UI can be reached through NPM.

| Port | Description |
| -- | -- |
| 51820:51820/udp | The WireGuard VPN tunnel. |

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/wg-easy/wg-easy/discussions).
