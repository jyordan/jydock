cd "$(dirname "$0")"
docker-compose stop redis
rm -rf __volumes/redis/data/*
chown -R 1001:1001 "__volumes/redis/data/"