set -e
set -x


# Create a multi-platform builder
docker buildx create --use --platform linux/amd64,linux/arm64 --name my-builder

# Build and push the image
docker buildx build --platform linux/amd64,linux/arm64 --push --tag supersqa/jenkins-firefox .

# Remove the builder (optional)
docker buildx rm my-builder
