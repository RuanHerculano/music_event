#!/bin/bash

CURRENT_DIR=$(pwd)

DOMAINS=(
     "api.music.event"
     "client.music.event"
)
DOMAINS_LENGTH=${#DOMAINS[@]}

addToHosts() {
  echo "############################"
  echo "Adding entries to /etc/hosts"
  echo "############################"

  for (( i=1; i< DOMAINS_LENGTH + 1; i++));
  do
    DOMAIN=$(sudo cat /etc/hosts | grep "${DOMAINS[$i-1]}")
    if [[ -n "$DOMAIN" ]]; then
      echo "Domain ${DOMAINS[$i-1]} already in /etc/hosts"
    else
      echo "Adding ${DOMAINS[$i-1]} to /etc/hosts"
      sudo -- sh -c -e "echo '127.0.0.1 ${DOMAINS[$i-1]}' >> /etc/hosts";
    fi
  done
}


buildImages() {
  echo "############################"
  echo "Building images"
  echo "############################"

  docker-compose build
  docker-compose up -d
}

addToHosts
buildImages
