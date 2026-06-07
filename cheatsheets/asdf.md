# asdf

Multiple runtime version manager. Manages Node, Python, Java, and more via plugins.

## Plugins

- Add a plugin:

`asdf plugin add <name>`

- Add a plugin from a custom git repo:

`asdf plugin add <name> <git-url>`

- List installed plugins:

`asdf plugin list`

- List all available plugins:

`asdf plugin list all`

- Update a plugin:

`asdf plugin update <name>`

- Update all plugins:

`asdf plugin update --all`

- Remove a plugin and all its versions:

`asdf plugin remove <name>`

## Installing versions

- Install version from `.tool-versions` in current directory:

`asdf install`

- Install a specific version:

`asdf install <name> <version>`

- Install latest stable version:

`asdf install <name> latest`

- Install latest version matching a prefix:

`asdf install <name> latest:3`

## Setting versions

- Set version in current directory's `.tool-versions`:

`asdf set <name> <version>`

- Set version globally (user-level):

`asdf set -u <name> <version>`

- Set version for parent directory:

`asdf set -p <name> <version>`

## Listing versions

- Show current version for all tools:

`asdf current`

- Show current version for a tool:

`asdf current <name>`

- List installed versions of a tool:

`asdf list <name>`

- List all available versions of a tool:

`asdf list all <name>`

- Show latest stable version:

`asdf latest <name>`

- Show latest for all installed tools:

`asdf latest --all`

## Maintenance

- Uninstall a specific version:

`asdf uninstall <name> <version>`

- Show install path for a version:

`asdf where <name> <version>`

- Recreate shims after manual plugin changes:

`asdf reshim <name> <version>`

- Show OS, shell, and asdf debug info:

`asdf info`

## Related commands

- Full asdf reference
`tldr asdf`
