# ZSH Config

My personal ZSH configuration. I use it on all my machines, and it is designed to be quick and easy to modify.

# Features
- Uses `zinit` to load plugins and scripts quickly
- Has a `functions` directory with lazy loaded functions
- Uses a decent async prompt.
- Is quick and easy to modify.
- `update` keeps the whole machine current: OS, package managers, languages, shell plugins, tools and more, in a fixed order, asking for sudo once and never prompting again (`cheat update`)
- `md-to-html` and `md-to-pdf` turn markdown files (one, several, or a glob) into styled pages or A4 pdfs beside them (`cheat md-to-pdf`)
- `cheat <name>` — personal cheatsheet viewer with glow rendering and tldr fallback (`cheat -h` for usage)

# Installation
1. Clone it somewhere
1. Run `./install`. On a fresh Debian it installs zsh with apt first; it refuses on any other OS besides macOS.
1. It links the repo to `~/.custom`, then runs the installers in name order: Homebrew and the Brewfile on macOS, the apt base packages on Debian, then the per-tool ones (asdf, kitty, micro and so on). A failed installer is listed at the end and does not stop the rest.
1. Run `update` afterwards to keep everything current.
1. Other projects hook into the shell by writing stubs into `projects/` (see `cheat zshconfig`).
