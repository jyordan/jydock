cd "$(dirname "$0")"
sh ./_clear-redis.sh

docker-compose stop $(docker-compose ps --services | grep web)

if [ -n "$2" ]; then
  sh ./_bash.sh $1
fi