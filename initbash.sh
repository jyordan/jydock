cd "$(dirname "$0")"
docker-compose up -d $1
docker-compose exec $1 bash