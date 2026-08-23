# Homebox README

## What is Homebox?

[Homebox](https://github.com/sysadminsmedia/homebox) is a self-hosted home inventory and organization system. It lets me catalog belongings into categories, locations, and tags, with support for image uploads, document attachments, and maintenance scheduling.

## Project source links

- [Website](https://homebox.software/en)
- [Docker Container](https://ghcr.io/sysadminsmedia/homebox)
- [GitHub Project](https://github.com/sysadminsmedia/homebox)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [Homebox documentation](https://homebox.software/en/quick-start/install/) for a full list.

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

### Homebox Specific

| Variable | Default Value | Comments |
| -- | -- | -- |
| `HBOX_LOG_LEVEL` | `info` | Logging verbosity for the container. |
| `HBOX_LOG_FORMAT` | `text` | Format for log output. |
| `HBOX_WEB_MAX_FILE_UPLOAD` | unset | Maximum file upload size, in MB. |
| `HBOX_AUTH_API_KEY_PEPPER` | unset | A random secret (32+ characters) used to protect issued API keys. Generate with `openssl rand -base64 48`. Rotating this value invalidates all existing API keys. |
| `HBOX_OPTIONS_ALLOW_ANALYTICS` | `true` | Sends basic, non-personal usage analytics to help the developers improve Homebox. Set to `false` to opt out. |

## Network

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/sysadminsmedia/homebox/issues).
