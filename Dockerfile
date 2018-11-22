FROM node:0.10

MAINTAINER Kevin Fu (mulspace@gmail.com)

ENV METEOR_VERSION 1.8
ENV METEOR_ALLOW_SUPERUSER=true

RUN apt-get update
RUN apt-get install -y curl 

RUN curl https://install.meteor.com/?release=$METEOR_VERSION | sh

VOLUME /app
WORKDIR /app
# Try to create a meteor project to trigger downloading common modules
RUN meteor create test && rm -rf test

EXPOSE 3000

