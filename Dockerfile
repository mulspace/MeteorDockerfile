FROM node:0.10

MAINTAINER Kevin Fu (mulspace@gmail.com)

ENV METEOR_VERSION latest
ENV USERNAME=meteor
ENV PASSWORD=meteor
ENV METEOR_ALLOW_SUPERUSER=true

RUN apt-get update
RUN apt-get install -y curl 

ENV DEBIAN_FRONTEND noninteractive
RUN useradd -ms /bin/bash -g users -d /home/$USERNAME  $USERNAME 
VOLUME /home/$USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd

RUN curl https://install.meteor.com/ | sh

WORKDIR /home/$USERNAME
# Try to create a meteor project to trigger downloading common modules
RUN meteor create test && rm -rf test

EXPOSE 3000

