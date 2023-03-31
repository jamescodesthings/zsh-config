# ZSH Config

This repo started because I didn't like using omz after a few plugins (performance).

Updated to port between OSX, Arch, & Ubuntu.

Open sourced because some parts of it might be useful to someone one day.

# Features
- Uses `zinit` to load plugins and scripts quickly
- Has a `functions` directory with lazy loaded functions
- Uses a decent async prompt.
- Is quick and easy to modify.

# Install
## Prerequisites
- `zsh`
- `zinit`
  - This should automatically install once the terminal has restarted.
  - If not, up to date install instructions can be found here: https://github.com/zdharma-continuum/zinit
- A Nerd font: https://www.nerdfonts.com/
- A good terminal emulator (iterm2, terminator).

## Automatic

1) Open and check `./install` makes sense.
2) Run `./install`
3) Restart the terminal

## Manual
1) Clone it somewhere e.g. `git clone [repo] ~/projects/personal/zsh-config`
2) link it into the `$HOME` directory: `sudo ln -s ~/projects/personal/zsh-config ~/.custom`
  - If not linking to `~/.custom` update `CUSTOM_DIR` variable in `.zshrc`.
3) Link `.zshrc` to where it goes `sudo ln -s ~/.custom/.zshrc ~/.zshrc`
4) Restart the terminal

# Todo
- [ ] Clean up the structure, the root is a bit messy.
- [ ] Deprecate old/unused parts.
