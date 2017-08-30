FROM keymetrics/pm2:latest

# Bundle APP files

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn


# Show current folder structure in logs
RUN ls -al -R
CMD ["npm", "install", "--production"]
CMD [ "pm2-docker", "start", "pm2.json" ]
