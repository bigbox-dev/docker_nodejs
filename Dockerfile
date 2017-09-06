FROM node:alpine
LABEL maintainer="Keymetrics <contact@keymetrics.io>"

ENV NPM_CONFIG_LOGLEVEL warn

RUN npm install pm2 -g
RUN apk add -U bash

VOLUME ["/app"]

# Expose ports
EXPOSE 3000-3200

WORKDIR /app

COPY run.sh /run.sh
# Show current folder structure in logs
CMD ["/run.sh"]
