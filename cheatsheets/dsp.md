# dsp

> Docker stop + prune. Stops all running containers, prunes the system, and removes dangling volumes.

## Usage

- Stop all containers, prune system, and remove dangling volumes:

`dsp`

## Notes

- Destructive: removes stopped containers, unused images, networks, and build cache
- Runs `docker stop $(docker ps -q)` then `docker system prune -f`
- Dangling volumes are removed if any exist

## Related commands

- Stop all containers without pruning:
`docker-stop-all`

- Bring up compose services:
`dcup`

- Tear down compose services and volumes:
`dcdn`
