echo "Starting Dev Environment"
echo "------------------------"
echo "Process 1: Stop all the containers"
docker stop $(docker ps -q)

docker-compose -f ./.docker/docker-compose.yml up --build --no-deps --force-recreate