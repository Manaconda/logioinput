FROM ubuntu:20.10
RUN apt-get update && apt-get upgrade -y && apt autoremove -y
ENV NODE_VERSION=14.7.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
RUN npm install -g log.io-file-input
ENV LOGIO_FILE_INPUT_CONFIG_PATH=/config/file.json
VOLUME /config
ENTRYPOINT log.io-file-input



