FROM ubuntu:22.04
WORKDIR /app
COPY . .

# perm vim user
ARG USER=david-engelmann
ENV USER $USER
RUN useradd -m -s /bin/bash $USER
RUN echo $USER "ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN cat /etc/sudoers

#USER ${USER:-david-engelmann}

RUN pwd && ls -la && sleep 15
#COPY scripts/docker_install.sh .
#RUN chmod +x docker/scripts/docker_install.sh
RUN bash docker/scripts/docker_install.sh
