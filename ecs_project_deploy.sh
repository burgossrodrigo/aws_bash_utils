./build.sh

SERVICE_NAME="service"
CLUSTER_NAME="cluster"

aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE_NAME  --force-new-deployment