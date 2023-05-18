cd "$(dirname "$0")"

if [ -z "$1" ]; then
  docker-compose stop $1
else
  docker-compose stop
fi