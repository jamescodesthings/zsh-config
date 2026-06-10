# apt

> apt package management aliases.

# Aliases

- Install a package:

`apti <package-name>`

- Search for a package:

`apts <query>`

- Update package lists and upgrade all installed packages:

`aptu`

- Remove a package and autoremove orphaned dependencies:

`aptr <package-name>`

# Notes

> `aptr` runs `sudo apt remove -y <name>` then `sudo apt autoremove -y`.
> `aptu` runs `sudo apt update && sudo apt upgrade -y`.
> All aliases are only defined when `apt` is available.

# Related commands

- Full apt reference:
`tldr apt`
