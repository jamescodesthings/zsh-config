# docker

> Aliases and helpers zsh-config adds over docker. Defined only when `docker` is available.

# Commands

- `dsp`: stop all running containers, `docker system prune -f`, remove dangling volumes; destructive (stopped containers, unused images, networks, build cache); extra args go to `docker system prune`
- `dsa`, `docker-stop-all`: `docker stop $(docker ps -q)`
- `dcup`: `docker compose up -d`
- `dcdn`: `docker compose down -v`, removes volumes

# Related commands

- `tldr docker`
- `tldr docker-compose`
