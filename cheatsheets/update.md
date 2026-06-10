# update

> Update the zsh-config by running the repo's update script.

# Usage

- Run the update script:

`update`

# Notes

> Runs `$CUSTOM_DIR/update` (the update script in the zsh-config repo).
> `$CUSTOM_DIR` is set to `~/.custom` by the installer (the symlink to this repo).
> Typically pulls the latest changes and re-runs setup steps.

# Environment

> `CUSTOM_DIR` — path to the zsh-config repo (set by `installers/00-zshconfig`)
