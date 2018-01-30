#!/bin/bash

echo "apps:" > /process.yml

domains=$(ls /srv/www/ | xargs -n1)  && \
for domain in $domains; do
  if [[ "$domain" == *bigbox.by* ]];
  then
    port=$(sed "s/^0*//" /srv/www/$domain/frontend.port)
    echo "  - script: /srv/www/$domain/builds/current/reactjs/server.js" >> /process.yml
    echo "    name: $domain" >> /process.yml
    echo "    env:" >> /process.yml
    echo "       PORT: $port" >> /process.yml
  fi
done

pm2 start --no-daemon /process.yml




