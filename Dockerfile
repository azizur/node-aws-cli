FROM node:lts-alpine

RUN apk update && apk add --no-cache \
    python3 \
    py-pip \
    groff \
    less \
    && pip3 install --upgrade pip \
    && pip3 install awscli

# Set the user to use when running this image
USER node

# Install global npm dependencies in the non-root user directory.
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# Enable npm global bin without specifying path
ENV PATH=$PATH:/home/node/.npm-global/bin 

# Set WORKDIR to nvm directory
WORKDIR /home/node

# SHELL ["/bin/bash", "--login", "-c"]

# CMD [ "node" ]
ENTRYPOINT ["/bin/sh"]
