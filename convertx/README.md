# ConvertX README
## Project source links
- [ConvertX Website](https://crazymax.dev/diun/)
- [ConvertX Container](https://ghcr.io/c4illin/convertx)
- [ConvertX GitHub Project](https://github.com/C4illin/ConvertX)

## My environment variables overview
A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. For a full list of all environment variables, refer to the [ConvertX Project README](https://github.com/C4illin/ConvertX/blob/main/README.md).

| Variable | Default Value | Comments |
| -- | -- | -- |
| JWT_SECRET | When unset it will use the value from randomUUID() | A long and secret string used to sign the JSON Web Token. |
| HTTP_ALLOWED | false | This determines if you are able to login and convert files through HTTP. Set to `true` to use with HTTP. |
| LOCALPATH | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

## Network
ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/docker-compose.yaml). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.