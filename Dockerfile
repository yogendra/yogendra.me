FROM node:7
VOLUME /src
WORKDIR /src

RUN yarn install && \
  yarn build
