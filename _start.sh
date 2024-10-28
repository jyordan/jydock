cd "$(dirname "$0")"
# sh ./_clear-redis.sh

docker-compose stop $1
docker-compose up -d $1 --remove-orphans

if [ -n "$2" ]; then
  sh ./_bash.sh $1
fi