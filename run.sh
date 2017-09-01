#!/bin/bash

domains=$(ls | column -t)
for domain in $domains; do
  port=$(sed "s/^0*//" $domain/html/frontend/frontend.port)
  sh -c "PORT=$port pm2 start $domain/html/frontend/server.js  --name "$domain"
done
