cd "$(dirname "$0")"
docker-compose stop redis
rm -rf "__volumes/redis/data"