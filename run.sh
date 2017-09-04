#!/bin/bash

domains=$(ls /app/www/ | xargs -n1)  && \
echo "domains=$domains"  && \
start=$(for domain in $domains; do
  echo "domain=$domain"
  port=$(sed "s/^0*//" /app/www/$domain/current_build/frontend/frontend.port)
  echo "$port"
  cd /app/www/$domain/current_build/frontend
  PORT=$port pm2 start server.js  --name "$domain"
done)

echo "$start"

while true; do
sleep 10
done
