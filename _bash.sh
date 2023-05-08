cd "$(dirname "$0")"
sh ./clearredis.sh
docker-compose up -d $1
docker-compose exec $1 bash