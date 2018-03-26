FROM node:0.10

MAINTAINER Kevin Fu (mulspace@gmail.com)

ENV METEOR_VERSION 1.6.1
ENV USERNAME=meteor
ENV PASSWORD=meteor


RUN apt-get update
RUN apt-get install -y curl python git

ENV DEBIAN_FRONTEND noninteractive
RUN useradd -ms /bin/bash -g root -d /home/$USERNAME  $USERNAME && adduser $USERNAME sudo
VOLUME /home/$USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd

ENV USER=$USERNAME
RUN curl https://install.meteor.com/?release=$METEOR_VERSION | sh

ADD entrypoint.sh /entrypoint.sh

WORKDIR /home/$USERNAME

EXPOSE 3000

