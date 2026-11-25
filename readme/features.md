# Features

Everything here is real and lives in this repository. Each tool has a sheet, so `cheat <name>` shows its short reference.

## Cheat sheets

`cheat <tool>` shows a markdown sheet from `~/cheatsheets`. When no local sheet matches, it falls back to the tldr page.

- `cheat-render` is the renderer. It is pure zsh and uses the shared palette. Output is plain when stdout is not a terminal or `NO_COLOR` is set.
- Words join with a dash, so `cheat git commit` shows `git-commit.md`. A word with no sheet of its own falls back to the nearest parent sheet.
- `cheat new <name>` makes a sheet from a template and links it. `cheat edit`, `cheat raw`, `cheat search` and `cheat refresh` do what they say.
- `cheat help` shows the index of your own sheets. `cheat changes` is the changelog of what you will notice. `cheat aliases` lists every alias.
- `cheatsheet-test --strict` checks that sheets follow the shared format and render. The format is in `cheatsheets/cheat-format.md` and shown by `cheat cheat format`.
- Any zsh tool here shows its sheet when given `--help`.
- `link-cheatsheets` links a repository's sheets into `~/cheatsheets`, so other projects can ship their own.

## Shell functions

Every file in `functions/` is autoloaded as a zsh function of the same name.

- `j` is a z directory jumper. `j alias add|show|rename|rm|list` keeps fixed bookmarks.
- `hist` searches, lists, moves and cleans shell history.
- `md-to-html` and `md-to-pdf` convert markdown with pandoc and WeasyPrint, using one stylesheet. `md-to-pdf -r <dir> --combine` joins a folder of notes into one pdf.
- `key` keeps named keys in a local store and syncs them with 1Password. `wipcrypt` encrypts and decrypts a plaintext tree with such a key. Neither puts a key in argv, a log or the screen.
- `is` is a predicate used throughout: `is available brew`, `is osx`, `is linux`.
- Smaller tools cover compressing images and pdfs, git clean-ups, installing from GitHub releases and linking config files.

## The command line helper library

One look for every tool, loaded from `functions/` with no sourcing.

- `configs/palette/palette.conf` is the one palette: a background, 15 hues and named roles such as `ok`, `warn`, `err` and `cmd`. A per-user file overrides single keys.
- `col` prints a colour escape, using truecolor where available and 256 colours otherwise. It prints nothing under `NO_COLOR` or `CLI_PLAIN=1`.
- `cli-init` is a tool's first line. It handles `--plain`, `-q`, `-v` and a stdout that is not a terminal.
- `say ok|info|warn|fail <text>` prints one status line with an icon. `problem` and `fix` collect failures as a tool runs, and `problems` prints them at the end.
- `progress` draws a spinner and a `step X/Y` line on stderr. `run-quiet` runs a command into a log and records a problem when it fails.
- `pick` asks for a missing argument with fzf. New interactive menus, confirms and inputs use gum, with a plain fallback when gum is missing or there is no terminal.
- `log` and `config` keep run logs and per-tool settings in the gitignored `logs/` and `config/` folders.
- Tests such as `tests/cli-leak` and `tests/helpers-standalone` keep the helpers from leaking state or depending on each other. `cheat cli` is the reference.

## Installers and update

- `./install` is a POSIX sh bootstrap. It installs zsh with apt on Debian if needed, then runs `install.zsh`, which runs `installers/` in name order. A failed installer does not stop the run. Each failure is collected and printed with a fix at the end.
- On macOS tools come from a Brewfile. On Debian, apt covers the base list, and tools that apt packages badly come from their latest GitHub release.
- `update` pulls this repository, asks for sudo once, then runs every `updaters/NNN-name` script in number order. It covers the OS, package managers, language versions through asdf, plugins and fonts, and finishes by updating other projects.
- Each updater runs quietly under a step counter. A failed one is listed at the end with the command to open its log. Every run keeps an error log, and `update --errors` shows the last one.
- `040-asdf` follows a policy file, so language versions are installed, upgraded and pruned the same way on every machine. Versions pinned by a project are kept.

## The prompt and shell options

Powerlevel10k draws the prompt, with instant prompt when its cache exists. `zsh_options.zsh`, `aliases.zsh` and `plugins.zsh` hold options, conditional aliases and the zinit plugin list. Aliases are only defined when the tool exists. Per-machine files (`env.osx.zsh`, `env.linux.zsh`, `env.<hostname>.zsh`) add machine-specific settings without touching tracked files.

## Terminals

- iTerm2 on macOS is configured through a Dynamic Profile, a few `defaults` settings, menu key equivalents, Actions and Snippets. It has a status bar fed by user variables the shell sets without starting a process. `iterm2-settings` brings settings changed in the window under management.
- kitty on Linux has a shared `kitty.conf` with an OS layer and a per-machine layer.
- A GNOME extension and window scripts are installed only on GNOME under Wayland.

## Project drop-ins

Other projects hook into the shell by writing stubs into `projects/`, so nobody edits `.zshrc`. `<name>.env.zsh` holds variables and `PATH` and is read by every zsh. `<name>.zsh` holds aliases and functions and is read by interactive shells. The folder is gitignored, and the project that wrote a stub owns it. [hub](hub.md) works this way.

## Guard rails

- `hooks/pre-commit` runs `hooks/cli-colour-lint` on staged shell files. Output must go through the palette helpers, with no raw colour escapes.
- `hooks/changes-reminder` prints a warning, never a block, when a commit stages a user-facing file with no new row in `cheat changes`.
- `tests/` has one script per tool. They stub external commands and never run a real installer or destructive command.
