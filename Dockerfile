FROM keymetrics/pm2:latest

# Bundle APP files

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn

COPY run.sh /run.sh
# Show current folder structure in logs
RUN apk add -U bash
#CMD ["npm", "install", "--production"]
#CMD [ "pm2-docker", "start", "pm2.json" ]
CMD ["/run.sh"]
