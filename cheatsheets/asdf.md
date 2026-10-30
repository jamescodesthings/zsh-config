# asdf

> Runtime version manager (Node, Python, Java and more) through plugins.
> `update asdf` applies `configs/asdf/update-policy`; bun is managed here, never run `bun upgrade`.

# Getting started

- `asdf plugin add <name>`: add a plugin
- `asdf install <name> latest`: install the newest release
- `asdf set -u <name> <version>`: make it your default (`~/.tool-versions`)

- Next: `asdf current` shows what is active.

# Install and set

- `asdf install`: versions from `.tool-versions`
- `asdf install <name> <version>`: one version; `latest:3` is the newest matching a prefix
- `asdf set <name> <version>`: this directory's `.tool-versions`
- `asdf set -p <name> <version>`: the parent directory's

# Inspect

- `asdf current [name]`: current versions
- `asdf list [name]`: installed versions; `asdf list all <name>` for available
- `asdf latest <name>`: newest version; `asdf latest --all` for every installed tool
- `asdf where <name> <version>`: install path
- `asdf info`: OS, shell and asdf debug info

# Plugins and maintain

- `asdf plugin list [all]`: installed, or available
- `asdf plugin update <name>`: update one; `--all` for every plugin
- `asdf plugin remove <name>`: remove a plugin and its versions
- `asdf uninstall <name> <version>`: remove a version
- `asdf reshim <name> <version>`: rebuild shims

# zsh-config

- `update asdf`: install and upgrade the policy tools, set them globally, remove old versions no project pins
- `asdf-cleanup`: remove every version that is not the global one, pinned or not
- Policies in `configs/asdf/update-policy`: `latest`, `stable`, `remove`; `update-policy.<hostname>` adds one machine's tools
- Add a tool for this machine, then run `update asdf`:

`echo "golang latest" >> ~/.custom/configs/asdf/update-policy.$(get-hostname)`

# More

- `tldr asdf`: asdf itself
- `cheat update`: update the whole machine
- `cheat zsh-config`: everything zsh-config gives you
