ZONE="us-east-1"
REGISTRY_ID="123456789012"
CONTAINER_NAME="container"
ECR_REGISTRY="$REGISTRY_ID.dkr.ecr.$ZONE.amazonaws.com"

# Login to ECR
aws ecr get-login-password --region $ZONE | docker login --username AWS --password-stdin $ECR_REGISTRY

# Build the Docker image
docker build -t $CONTAINER_NAME .

# Tag the Docker image
docker tag $CONTAINER_NAME:latest $ECR_REGISTRY/$CONTAINER_NAME:latest

# Push the Docker image to ECR
docker push $ECR_REGISTRY/$CONTAINER_NAME:latest