#!/bin/bash

domains=$(ls /srv/www/ | xargs -n1)  && \
echo "domains=$domains"  && \
start=$(for domain in $domains; do
  echo "domain=$domain"
  port=$(sed "s/^0*//" /srv/www/$domain/frontend.port)
  echo "$port"
  cd /srv/www/$domain/builds/current/reactjs
  PORT=$port pm2 start server.js  --name "$domain"
done)

echo "$start"

while true; do
sleep 10
done
