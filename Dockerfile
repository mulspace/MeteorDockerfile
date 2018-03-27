FROM node:0.10

MAINTAINER Kevin Fu (mulspace@gmail.com)

ENV METEOR_VERSION latest
ENV USERNAME=meteor
ENV PASSWORD=meteor
ENV METEOR_ALLOW_SUPERUSER=true

RUN apt-get update
RUN apt-get install -y curl 

ENV DEBIAN_FRONTEND noninteractive
RUN useradd -ms /bin/bash -g root -d /home/$USERNAME  $USERNAME 
RUN echo "$USERNAME:$PASSWORD" | chpasswd

USER $USERNAME
WORKDIR /home/$USERNAME
RUN curl https://install.meteor.com/ | sh
ENV PATH="/home/$USERNAME/.meteor:${PATH}"

# Try to create a meteor project to trigger downloading common modules
RUN meteor create test && rm -rf test

VOLUME /app
EXPOSE 3000

