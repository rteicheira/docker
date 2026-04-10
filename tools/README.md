# Tools README
This is a collection of several tools into one stack.
- [My CovertX docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/convertx/docker-compose.yaml)
- [My Datetime.app docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/datetime/docker-compose.yaml)
- [My IT-Tools docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/ittools/docker-compose.yaml)
- [My OmniTools docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/omnitools/docker-compose.yaml)

## Project source links
| Project | Website | Container | GitHub Project |
| -- | -- | -- | -- |
| ConvertX | [Website](https://crazymax.dev/diun/) | [Container](https://ghcr.io/c4illin/convertx) | [GitHub Project](https://github.com/C4illin/ConvertX) |
| Datetime.app | [Website](https://datetime.app/) | [Container](https://ghcr.io/airyland/datetime.app) | [GitHub Project](https://github.com/airyland/datetime.app) |
| IT-Tools | [Website](https://it-tools.tech/) | [Container](https://hub.docker.com/r/corentinth/it-tools) | [GitHub Project](https://github.com/CorentinTh/it-tools) |
| OmniTools | [Website](https://omnitools.app/) | [Container](https://hub.docker.com/r/iib0011/omni-tools) | [GitHub Project](https://github.com/iib0011/omni-tools) |

## My environment variables overview
### ConvertX
A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. For a full list of all environment variables, refer to the [ConvertX Project README](https://github.com/C4illin/ConvertX/blob/main/README.md).

| Variable | Default Value | Comments |
| -- | -- | -- |
| JWT_SECRET | When unset it will use the value from randomUUID() | A long and secret string used to sign the JSON Web Token. |
| HTTP_ALLOWED | false | This determines if you are able to login and convert files through HTTP. Set to `true` to use with HTTP. |
| LOCALPATH | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

## Network
ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/docker-compose.yaml). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.