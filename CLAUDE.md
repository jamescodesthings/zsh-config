# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal zsh configuration that installs itself as `~/.custom` via symlink, providing a portable shell environment across macOS and Linux machines.

## Stack

- **Shell**: zsh only
- **Plugin manager**: [zinit](https://github.com/zdharma-continuum/zinit) (loaded via `load_zinit.zsh`)
- **Prompt**: Powerlevel10k
- **Version manager**: asdf (for Node, Python, Java, etc.)
- **Key tools**: eza, fzf, direnv, micro, tmux, thefuck, glow, bat
- **Cheatsheet viewer**: `cheat` command — renders local markdown from `cheatsheets/` with glow, falls back to tldr

## Installation

```bash
# Install everything (runs all installers in order)
./install

# Install only the zsh config symlink
./installers/00-zshconfig
```

The installer symmlinks the repo to `~/.custom`, and `.zshrc`/`.zshenv` to `~` so changes to this repo are live immediately.

## Architecture

### Load order (`.zshrc`)

1. `zsh_options.zsh` — setopt flags
2. `custom_functions.zsh` — autoloads all files in `functions/` via `fpath`
3. `env.zsh` — PATH, EDITOR, ASDF, exports
4. `zpm-zsh-colors` — `$c[...]` color variables used everywhere
5. `load_zinit.zsh` — installs zinit if missing, then sources it
6. `p10k.prompt.zsh` / `p10k.zsh` — prompt config
7. `plugins.zsh` — zinit plugin declarations
8. `completions.zsh` — completion setup
9. `aliases.zsh` — conditional aliases (checks `is available <tool>` before defining)
10. `load-direnv.zsh`, `load-fzf.zsh`, `configs/ls_colors/ls-colors.sh`
11. `private.zsh` (optional, not committed)
12. `load_box_env.zsh` → sources `env.<hostname>.zsh` if present

### Per-machine env files

`env.<hostname>.zsh` files (e.g. `env.MacBookPro.zsh`, `env.ubuntu.zsh`) are sourced automatically by `load_box_env.zsh` based on `get-hostname`. Use these for machine-specific PATH entries or tool config.

### `functions/` directory

All files in `functions/` are autoloaded as zsh functions. Each file should define a function of the same name and call it with `"$@"` at the end (so it works both as autoloaded function and as a standalone script via `source`).

The `is` function (`functions/is`) is a foundational predicate used throughout — always use it for conditionals rather than raw `[[ ]]` tests:
```zsh
is available brew    # checks if command exists
is osx               # uname == Darwin
is m1                # Darwin arm64
is linux             # uname == Linux
is existing $path    # -e test
is not empty "$var"  # -z test (negated)
```

### `cheatsheets/` directory

Markdown files rendered by the `cheat` function using `glow -w 120` (falls back to `bat`, then `cat`). When no local sheet matches, `cheat` falls back to `tldr`. Filename convention: `git-commit.md` for multi-word commands (matches `cheat git commit`).

Standard format:
- `# Name` — title
- `## Usage` — examples with backtick code blocks
- `## Related commands` — links to related sheets via `` `cheat related-name` ``

### `installers/` directory

Each file is an independent install script. `_stub` must be sourced first — it sets `$INSTALLER_DIR`, `$REPO_DIR`, loads `is`, and loads `$c[...]` colors. The main `./install` script runs them in lexicographic order.

New installers should start with:
```zsh
#!/usr/bin/env zsh
source "${0:a:h}/_stub"
```

### `configs/gnome/` directory

GNOME-specific config and tools. Only installed on machines running GNOME on Wayland (`is gnome && is wayland`).

- `window-list@personal/` — GNOME Shell extension that exposes a D-Bus interface (`com.personal.WindowList`) for window listing, focusing, and closing without requiring `unsafe_mode`. Installed to `~/.local/share/gnome-shell/extensions/`.
- `bin/` — Window management scripts. Symlinked to `~/.local/bin/` by `installers/gnome`. Use `cheat gnome-bin` for reference.
- `quit-all-apps.desktop` — Desktop entry that surfaces `quit-all-apps` in the GNOME Activities/app search.

### Color system (`zpm-zsh-colors`)

`$c[...]` associative array provides semantic colors: `h1`, `h2`, `h3`, `lead`, `info`, `info-small`, `success`, `warn`, `error`, `flag`, `param`, `reset`. Use these for all user-facing output — never raw ANSI codes.

## Post-implementation checks

<!-- post-implementation-review skill reads this section and appends its checks to the standard ones -->
<!-- Add project-specific checks here. Examples: -->
<!-- - Verify symlink still valid: `ls -la ~/.custom` -->
<!-- - Source check: `zsh -n .zshrc` (syntax check without executing) -->
