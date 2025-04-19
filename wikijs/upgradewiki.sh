#!/bin/bash

##########
# Filename: upgradewiki.sh
# Location: $HOME/docker/wikijs
# Date updated: April 19, 2025
#
# A script to upgrade Wiki.js. Primary way to upgrade this stack is to do it through Portainer.
##########

# Switch to where the Docker Compose file is located
cd ~/docker/wikijs

# Pull the latest Docker Image
docker compose pull wiki

# Recreate the Docker Containers
docker compose up --force-recreate -d
