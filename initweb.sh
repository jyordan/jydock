docker-compose stop $(docker-compose ps --services | grep web)
docker-compose up -d $1