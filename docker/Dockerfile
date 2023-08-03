FROM ubuntu:22.04
WORKDIR /app
COPY . .
COPY . /app

# perm vim user
ARG USER=david-engelmann
ENV USER $USER
RUN useradd -m -s /bin/bash $USER
RUN echo $USER "ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN cat /etc/sudoers

RUN pwd && ls -la && sleep 15
RUN bash docker/scripts/docker_install.sh
