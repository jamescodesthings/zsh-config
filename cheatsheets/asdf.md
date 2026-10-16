# asdf

> Runtime version manager (Node, Python, Java and more) through plugins.
> `update asdf` applies `configs/asdf/update-policy`; bun is managed here, never run `bun upgrade`.

# Plugins

- `asdf plugin add <name>`: add a plugin
- `asdf plugin add <name> <git-url>`: add from a git repo
- `asdf plugin list`: installed plugins
- `asdf plugin list all`: available plugins
- `asdf plugin update <name>`: update one plugin
- `asdf plugin update --all`: update every plugin
- `asdf plugin remove <name>`: remove a plugin and its versions

# Install

- `asdf install`: versions from `.tool-versions`
- `asdf install <name> <version>`: one version
- `asdf install <name> latest`: newest release
- `asdf install <name> latest:3`: newest matching a prefix

# Set

- `asdf set <name> <version>`: current directory's `.tool-versions`
- `asdf set -u <name> <version>`: user-level (`~/.tool-versions`)
- `asdf set -p <name> <version>`: parent directory

# Inspect

- `asdf current`: current versions of every tool
- `asdf current <name>`: one tool
- `asdf list <name>`: installed versions
- `asdf list all <name>`: available versions
- `asdf latest <name>`: newest version
- `asdf latest --all`: newest for every installed tool
- `asdf where <name> <version>`: install path
- `asdf info`: OS, shell and asdf debug info

# Maintain

- `asdf uninstall <name> <version>`: remove a version
- `asdf reshim <name> <version>`: rebuild shims

# zsh-config

- `update asdf`: install and upgrade the policy tools, set them globally, remove old versions that no project pins
- `asdf-cleanup`: remove every version that is not the global one, pinned or not
- Policies: `latest`, `stable` (python: skips a new series' `.0` and `.1`), `remove`
- `configs/asdf/update-policy` is the base; `update-policy.<hostname>` adds one machine's tools, a later line wins
- direnv is not under asdf (brew or apt); the policy removes it
- Add a tool for this machine, then run `update asdf`:

`echo "golang latest" >> ~/.custom/configs/asdf/update-policy.$(get-hostname)`

- Show what the updater would do:

`UPDATE_ASDF_DRY_RUN=1 ~/.custom/updaters/040-asdf`

# Related commands

- `tldr asdf`
