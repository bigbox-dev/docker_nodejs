#!/bin/bash

domains=$(ls /app/www/ | xargs -n1)  && \
echo "domains=$domains"  && \
start=$(for domain in $domains; do
  echo "domain=$domain"
  port=$(sed "s/^0*//" /app/www/$domain/current_build/frontend/frontend.port)
  echo "$port"
  PORT=$port cd /app/www/$domain/current_build/frontend && pm2 start server.js  --name "$domain"

done)

echo "$start"

bash
echo "6"
exec bash
echo "7"
while true; do
sleep 3
echo "sleep"
done
