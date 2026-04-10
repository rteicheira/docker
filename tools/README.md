# Tools README
I am going through and merging together some of my smaller stacks to help reduce my overhead. Original docker-compose.yaml files will be kept up to date.
- [CovertX docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/convertx/docker-compose.yaml)
- [Datetime.app docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/datetime/docker-compose.yaml)
- [IT-Tools docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/ittools/docker-compose.yaml)
- [OmniTools docker-compose.yaml](https://github.com/rteicheira/docker/blob/main/omnitools/docker-compose.yaml)

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/docker-compose.yaml). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.