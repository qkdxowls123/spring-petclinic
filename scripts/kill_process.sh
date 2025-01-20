#! /bin/bash

echo "Remove existed container"
docker com[ose -f /home/ubuntu/deploy/scripts/docker-compose.yml down || true
