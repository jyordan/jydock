cd "$(dirname "$0")"

if [ -z "$1" ]; then
    echo "Parameter \$1 is empty. Exiting..."
    exit 1
fi

sh ./_clear-redis.sh
sh ./_stop.sh

docker-compose up -d $1

if [ -n "$2" ]; then
  sh ./_bash.sh $1
fi