FROM node:13.13.0-slim

ENV NPM_CONFIG_LOGLEVEL info

RUN apt-get update && apt-get install -qq -y --no-install-recommends yarn bzip2

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ADD . $INSTALL_PATH

RUN mv ./post-up.sh /usr/bin/setup

CMD setup
