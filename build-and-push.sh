#!/bin/bash

set -e

# 🧠 Config
DOCKER_USER="tribehyphenfan"
IMAGE_NAME="trading-card-marketplace"

# 🏷️ Git metadata
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD | sed 's/\//-/g')
GIT_COMMIT=$(git rev-parse --short HEAD)
TAG="${GIT_BRANCH}-${GIT_COMMIT}"

# 🛠️ Build
echo "🔨 Building image: $IMAGE_NAME:$TAG"
docker build -t $IMAGE_NAME:$TAG .

# 🏷️ Retag for Docker Hub
FULL_TAG="$DOCKER_USER/$IMAGE_NAME:$TAG"
docker tag $IMAGE_NAME:$TAG $FULL_TAG

# 🧪 Verify image exists
if docker image inspect $FULL_TAG > /dev/null 2>&1; then
  echo "✅ Image exists locally: $FULL_TAG"
else
  echo "❌ Image not found: $FULL_TAG"
  exit 1
fi

# 🚀 Push
echo "📤 Pushing image: $FULL_TAG"
docker push $FULL_TAG

# 🧼 Optionally tag as latest
if [ "$GIT_BRANCH" = "main" ]; then
  docker tag $FULL_TAG $DOCKER_USER/$IMAGE_NAME:latest
  docker push $DOCKER_USER/$IMAGE_NAME:latest
  echo "📤 Also pushed: latest"
fi
