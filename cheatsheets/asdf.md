# asdf

> Runtime version manager (Node, Python, Java and more) through plugins.
> `update asdf` applies `configs/asdf/update-policy`; bun is managed here, never run `bun upgrade`.

# Getting started

- `asdf plugin add <name>` - add a plugin
- `asdf install <name> latest` - install the newest release
- `asdf set -u <name> <version>` - make it your default (`~/.tool-versions`)

# Everyday

- `asdf install [<name> <version>]` - versions from `.tool-versions`, or one version; `latest:3` matches a prefix
- `asdf set [-p] <name> <version>` - this directory's `.tool-versions`; `-p` for the parent's
- `asdf [current|list [all]] [<name>]` - current versions, installed versions, or available
- `asdf latest <name>` - newest version; `asdf latest --all` for every installed tool
- `asdf where <name> <version>` - install path
- `asdf uninstall <name> <version>` - remove a version
- `asdf reshim <name> <version>` - rebuild shims
- `asdf plugin list [all]` - installed plugins, or available
- `asdf plugin [update|remove] <name>` - update (`--all` for every plugin), or remove with its versions

# zsh-config

- `update asdf` - install and upgrade the policy tools, remove old versions no project pins
- `asdf-cleanup` - remove every version that is not the global one
- `echo "golang latest" >> ~/.custom/configs/asdf/update-policy.$(get-hostname)` - add a tool for this machine (`latest`, `stable`, `remove`)

# See also

- `tldr asdf` - asdf itself; `asdf info` for debug info
- `cheat update` - update the whole machine
- `cheat zsh-config` - everything zsh-config gives you
