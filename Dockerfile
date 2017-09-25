FROM node:alpine
LABEL maintainer="Keymetrics <contact@keymetrics.io>"

ENV NPM_CONFIG_LOGLEVEL warn

RUN npm install pm2 -g
RUN apk add -U bash

VOLUME ["/srv"]

# Expose ports
EXPOSE 3000-3200

WORKDIR /srv

COPY run.sh /run.sh
# Show current folder structure in logs
CMD ["/run.sh"]
