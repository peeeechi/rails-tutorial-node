FROM node:16.15.0

ARG USER=node
ARG GROUP=${USER}
ARG UID=1000
ARG GID=1000
ARG PASSWORD=${USER}

ENV USER=${USER}
ENV GROUP=${GROUP}
ENV UID=${UID}
ENV GID=${GID}

RUN    apt-get update \
    && apt-get install -y \
       git \
    && rm -rf /var/lib/apt/lists/*
    
RUN    userdel node \
    && groupadd -g ${GID} ${GROUP} \
    && useradd -m -s /bin/bash -u ${UID} -g ${GID} ${USER} \
    && echo "${USER}:${PASSWORD}" | chpasswd \
    && mkdir -p /home/${USER}/workspace

RUN npm install -g @nestjs/cli

USER ${USER}
WORKDIR /home/${USER}/workspace
