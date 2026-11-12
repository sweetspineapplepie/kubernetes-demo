set -e

NAME="kubernetes-demo-api"
USERNAME="sweetspineapplepie"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pod ..."
kubectl get pods

echo "Getting service ..."
kubectl get service

echo "Fetching the main service ..."
kubectl get service $NAME-service