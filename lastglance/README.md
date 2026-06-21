# lastGLANCE README

## What is lastGLANCE?

[lastGLANCE](https://github.com/krelltunez/lastGLANCE) is a self-hosted "last done" tracker — a simple way to log when you last did something (took medication, changed a filter, called someone, etc.) and surface that info at a glance. It supports WebDAV sync for backup and cross-device access.

## Project source links

- [Website App](https://www.lastglance.app/)
- [Docker Container](https://ghcr.io/krelltunez/lastglance)
- [GitHub Project](https://github.com/krelltunez/lastGLANCE)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

No environment variables are required. All configuration is handled in-app.

## Network

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.

## In-app setup

I did have some issues getting the automated sync to work with my generic WebDAV (I run a Terra-Master NAS with TOS6). Though it came down to a weird permission issue on the WebDAV share.

The "Test Connection" button may report success even when sync is broken. The reliable indicator is the cloud icon on the main screen — if it's orange with a line through it, sync is not working regardless of what the test says.

> [!TIP]
> Check your browser's Developer Tools console for actual errors, as this will give you the real picture.

As a reminder, the WebDAV URL should only be the server and port, no share information. See the example below (screenshot from lastGLANCE v1.8.9).

![Sync setup with Generic WebDAV](assets/webdav-steup.png "Sync setup with Generic WebDAV")

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/krelltunez/lastGLANCE/issues).
