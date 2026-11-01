# docker

> Aliases and helpers zsh-config adds over docker. Defined only when `docker` is available.

# Getting started

- `dcup` - `docker compose up -d`, start the stack in the background
- `dcdn` - `docker compose down -v`, stop it and remove its volumes

- Next: `dsa` when you want every container stopped.

# Clean up

- `dsa`, `docker-stop-all`: stop every running container
- `dsp [args]` - stop all, `docker system prune -f`, remove dangling volumes; args go to `docker system prune`
- Destructive: `dsp` removes stopped containers, unused images, networks and build cache

# See also

- `tldr docker` - docker itself
- `tldr docker-compose` - compose
- `cheat zsh-config` - everything zsh-config gives you
