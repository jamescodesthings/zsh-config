# docker

> Docker aliases and helpers.

# Container management

- Stop all running containers and prune system + dangling volumes:

`dsp`

- Stop all running containers (without pruning):

`docker-stop-all`

`dsa`

# Compose

- Start services in detached mode:

`dcup`

- Stop and remove containers and volumes:

`dcdn`

# Notes

> `dsp` is destructive: removes stopped containers, unused images, networks, and build cache.
> `dcup` = `docker compose up -d`
> `dcdn` = `docker compose down -v`
> All aliases only defined when `docker` is available.

# Related commands

- Full docker reference:
`tldr docker`

- Docker compose reference:
`tldr docker-compose`
