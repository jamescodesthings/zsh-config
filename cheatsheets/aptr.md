# aptr

> Remove an apt package and clean up orphaned dependencies.

## Usage

- Remove a package and autoremove orphans:

`aptr <package-name>`

## Examples

- Remove vim:

`aptr vim`

## Notes

- Runs `sudo apt remove -y <name>` then `sudo apt autoremove -y`
- Requires `apt` to be available (Linux only)

## Related commands

- Install a package:
`apti <package-name>`

- Search for a package:
`apts <query>`

- Update and upgrade all packages:
`aptu`
