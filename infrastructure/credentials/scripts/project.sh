# Export cloud computer shell environment
eval "$(yarn --cwd ../cloud-computer environment)"

# Point shell context to the local docker host
export DOCKER_HOST=localhost

# Extract cloud provider project from credentials
yarn --cwd ../docker docker run \
  --rm \
  --volume CLOUD_COMPUTER_CREDENTIALS:$CLOUD_COMPUTER_CREDENTIALS \
  $CLOUD_COMPUTER_IMAGE \
  cat $CLOUD_COMPUTER_CREDENTIALS/cloud-provider.json | grep project_id | cut -b 18- | tr -d \\\",
