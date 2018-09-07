
FROM node:8

ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "$SSH_PASSWD" | chpasswd


# Install Node process manager, allows for auto restart of the node process on crash,
# and log management, aggregates log data from all of your applications and writes it to a single source for viewing
RUN npm install -g pm2
ENV PM2HOME /pm2home

ENV PORT 8080
EXPOSE 8080 2222

WORKDIR /home/nodejs/app
COPY . .

ENTRYPOINT ["/home/nodejs/app/init_container.sh"]
