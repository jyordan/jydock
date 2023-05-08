cd "$(dirname "$0")"
sh ./clearredis.sh
docker-compose stop $(docker-compose ps --services | grep web)
docker-compose up -d $1
if [ -z "$2" ]; then
  docker-compose exec $1 bash
fi