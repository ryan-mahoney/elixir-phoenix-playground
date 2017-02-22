#!/usr/bin/env bash

# determine this files directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker stop phoenix-server &> /dev/null
docker rm phoenix-server &> /dev/null

mkdir -p "$DIR/../log"

docker run \
    --name phoenix-server \
    -p 80:80 \
    -v "$DIR/..":/app \
    -d mbta/phoenix
