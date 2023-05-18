cd "$(dirname "$0")"
sh ./_clear-redis.sh

docker-compose up -d $1
docker-compose exec $1 bash