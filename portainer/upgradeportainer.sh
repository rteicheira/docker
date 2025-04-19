#!/bin/bash

##########
# Filename: upgradeportainer.sh
# Location: $HOME/docker/portainer
# Date updated: April 19, 2025
#
# Upgrades the Portainer console and agent.
##########

# Stop the current container
sudo docker kill portainer

# Delete the current container
sudo docker rm portainer

# Download upgrade and run Portainer
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
