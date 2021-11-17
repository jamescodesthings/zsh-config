# ZSH Config

# Basic Features
- Uses `zinit` to load plugins and scripts quickly
- Has a `functions` directory with lazy loaded functions
- Bunch of useful things I've come up with over the years

# Install instructions
1) Clone it somewhere e.g. `git clone [repo] ~/projects/personal/zsh-config`
2) link it into the `$HOME` directory: `sudo ln -s ~/projects/personal/zsh-config ~/.custom`
  - If not linking to `~/.custom` update `CUSTOM_DIR` variable in `.zshrc`.
3) Link `.zshrc` to where it goes `sudo ln -s ~/.custom/.zshrc ~/.zshrc`
4) Restart the terminal

Or run `./install` (check it first to make sure it makes sense)
