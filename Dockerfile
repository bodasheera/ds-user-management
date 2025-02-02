FROM node:12-alpine

RUN set -ex; apk add --no-cache --virtual .fetch-deps curl tar git ;

WORKDIR /app

COPY package.json /app

RUN npm install --production

COPY api /app/api

COPY app.js /app

COPY config /app/config

COPY util /app/util

ENV IMAGE_TAG=__image_tag__

EXPOSE 10004

RUN mkdir uploads

RUN mkdir downloads

RUN chmod 777 uploads

RUN chmod 777 downloads

CMD node app.js