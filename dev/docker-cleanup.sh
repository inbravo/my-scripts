#!/usr/bin/env bash
# Remove stopped containers, dangling images, unused networks and volumes
docker container prune -f
docker image prune -f
docker network prune -f
docker volume prune -f
echo "Docker cleanup done."
