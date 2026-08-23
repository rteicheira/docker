# RustDesk Server README

## What is RustDesk Server?

[RustDesk Server](https://github.com/rustdesk/rustdesk-server) is the self-hosted server component for [RustDesk](https://rustdesk.com/), an open-source remote desktop application. It's made up of two services: `hbbs`, the ID/rendezvous server that handles client discovery and key exchange, and `hbbr`, the relay server that forwards traffic when a direct peer-to-peer connection can't be established.

## Project source links

- [Website](https://rustdesk.com/)
- [Docker Container](https://hub.docker.com/r/rustdesk/rustdesk-server)
- [GitHub Project](https://github.com/rustdesk/rustdesk-server)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [RustDesk Server GitHub Project](https://github.com/rustdesk/rustdesk-server) for a full list.

| Variable | Default Value | Comments |
| -- | -- | -- |
| `RELAY` | unset | The hostname/IP that `hbbs` advertises to clients as the relay (`hbbr`) address, via `hbbs -r ${RELAY}:21117`. |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

`ALWAYS_USE_RELAY=Y` is hardcoded on `hbbs`, forcing all traffic through `hbbr` rather than attempting a direct connection, which is simpler to reason about behind my firewall.

## Network

Because RustDesk relies on raw TCP/UDP connections rather than HTTP, it can't be routed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/) like my other containers. It runs on its own dedicated `rustdesk` network with the following ports exposed directly:

| Port | Description |
| -- | -- |
| 21115:21115/tcp | NAT type test (`hbbs`). |
| 21116:21116/tcp | ID registration and heartbeat (`hbbs`). |
| 21116:21116/udp | ID registration and heartbeat (`hbbs`). |
| 21118:21118/tcp | Web client connection (`hbbs`). |
| 21117:21117/tcp | Relay server (`hbbr`). |
| 21119:21119/tcp | Web client relay (`hbbr`). |

## In-app setup

On first run, `hbbs` generates a keypair under the mounted `/root` volume (`id_ed25519`/`id_ed25519.pub`). Copy the public key into each RustDesk client's network settings, along with the server and relay addresses, to point clients at this server.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/rustdesk/rustdesk-server/issues).
