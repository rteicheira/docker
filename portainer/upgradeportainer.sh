#!/bin/bash

##########
# Filename: upgradeportainer.sh
# Location: $HOME/docker/portainer
# Date updated: May 08, 2025
#
# Upgrades the Portainer console and agent.
##########

# Pull the latest Portainer container
{ echo -e "Pulling the latest Portainer container...";}
docker pull portainer/portainer-ce:lts

# Stops the current Portainer container
{ echo -e "\nStopping the Portainer container...";}
docker kill portainer

# Removes the current Portainer container
{ echo -e "\nRemoving the Portainer container...";}
docker rm portainer

# Run Portainer
{ echo -e "\nStarting Portainer...";}
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts

{ echo -e "\nPortainer updated and running"; }
