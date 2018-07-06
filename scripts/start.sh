#!/bin/bash

# Tutorial used to write this script.
# https://docs.traefik.io/user-guide/docker-and-lets-encrypt/

TRAEFIK_PATH=/opt/traefik

install_docker() {
  curl https://get.docker.com | sh
}

install_docker_compose() {
  CMPS_TYPE="docker-compose-$(uname -s)-$(uname -m)"
  CMPS_VERSION="1.21.1"
  CMPS_PATH="/usr/local/bin/docker-compose"

  sudo curl -L https://github.com/docker/compose/releases/download/${CMPS_VERSION}/${CMPS_TYPE} -o ${CMPS_PATH}
  chmod +x ${CMPS_PATH}
}

prepare() {
  # Set up stuff for traefik.
  mkdir -p ${TRAEFIK_PATH}
  touch ${TRAEFIK_PATH}/acme.json && chmod 600 ${TRAEFIK_PATH}/acme.json

  mv /tmp/{docker-compose.yml,traefik.toml} ${TRAEFIK_PATH}
}

# Install docker.
install_docker

# Install docker-compose.
install_docker_compose

# Prepare strcuture.
prepare

# Create docker network.
docker network create devnet
