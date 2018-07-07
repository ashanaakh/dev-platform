version: '3.6'

services:
  traefik:
    image: traefik
    restart: always
    ports:
      - 80:80
      - 443:443
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    labels:
      - "traefik.frontend.rule=Host:${domain}"
      - "traefik.port=8080"
    container_name: traefik
