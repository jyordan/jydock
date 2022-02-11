cd "$(dirname "$0")"
docker-compose stop redis
sudo chown -R 1001:1001 "__volumes/redis/data/"
rm -rf "__volumes/redis/data/*"