#! /bin/bash

#Load params file with all variables
source ./open-nti.params
echo "$(tput setaf 5)this script (docker.start.sh) is deprecated, it's been replaced with 'make start' $(tput sgr0)"

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" = "master" ]
then
  IMAGE_TAG='latest'
else
  IMAGE_TAG=$BRANCH
fi

if [ -f "$1" ]
then
  DOCKER_COMPOSE_FILE=$1
fi

echo "Use docker compose file : $DOCKER_COMPOSE_FILE"
IMAGE_TAG=$IMAGE_TAG docker-compose -f $DOCKER_COMPOSE_FILE up -d
