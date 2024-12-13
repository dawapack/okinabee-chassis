#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# go to parent directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR/../environment/testing"

IMAGE="cezarvant/okinabee-code-quality"
VERSION=1.0.0

### nothing to change after this line
# get existing image id
OLD_ID=$(docker images | grep "$IMAGE" | grep "$VERSION" | head -n 1 | awk '{print $3}')

# build image :latest
docker build -t "$IMAGE:latest" . --no-cache
ID=$(docker images | grep "$IMAGE" | head -n 1 | awk '{print $3}')

# create both tags - latest & version
docker tag "$ID" "$IMAGE:latest"
docker tag "$ID" "$IMAGE:$VERSION"

# clean-up old image id
if [ -n "$OLD_ID" ]; then
  docker rmi "$OLD_ID" || true
fi

## clean-up builder cache
echo "y" | docker builder prune --all