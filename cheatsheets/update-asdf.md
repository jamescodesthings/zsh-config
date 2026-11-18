# update asdf

> The `040-asdf` updater installs and upgrades language tools from a policy file.
> It also covers the usual failures of `update`, such as the GitHub API limit.

# Options

- `configs/asdf/update-policy[.<hostname>]` - `<tool> latest`, `stable` or `remove` per line; the hostname file is that machine's extras
- `ASDF_PIN_ROOTS` - colon-separated folders searched for projects that pin a version
- `UPDATE_ASDF_DRY_RUN` - set to 1 to print what would change

# Examples

- `UPDATE_ASDF_DRY_RUN=1 ~/.custom/updaters/040-asdf` - print what the updater would do
- `ASDF_PIN_ROOTS="$HOME/projects:$HOME/work" update asdf` - also protect versions pinned under another folder
- `gh auth login` - log gh in, so the GitHub API limit stops biting
- `xcodes install --latest` - install Xcode by hand when its updater cannot
- `brew upgrade --cask <name>` - upgrade a cask that needs root, outside the update run

# See also

- `cheat update` - the update command
- `cheat zsh-config`
