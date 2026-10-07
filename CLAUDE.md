# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal zsh configuration that installs itself as `~/.custom` via symlink, providing a portable shell environment across macOS and Linux machines.

## Stack

- **Shell**: zsh only
- **Plugin manager**: [zinit](https://github.com/zdharma-continuum/zinit) (loaded via `load_zinit.zsh`)
- **Prompt**: Powerlevel10k
- **Version manager**: asdf (for Node, Python, Java, etc.)
- **Key tools**: eza, fzf, direnv, micro, glow, bat
- **Cheatsheet viewer**: `cheat` command — renders local markdown from `~/cheatsheets` with glow, falls back to tldr

## Installation

```bash
# Install everything (runs all installers in order)
./install

# Install only the zsh config symlink
./installers/00-zshconfig
```

`./install` is a POSIX sh bootstrap, because a fresh Debian may not have zsh. When zsh is missing it installs it with apt on Debian and refuses on anything else, then `exec`s `install.zsh`, which holds the real installer. Installers run in name order: `00-zshconfig`, `01-homebrew`, `02-apt-base`, then the per-tool ones. A failed installer does not stop the run; failures are listed at the end and the exit code is 1.

The installer symmlinks the repo to `~/.custom`, and `.zshrc`/`.zshenv` to `~` so changes to this repo are live immediately.

## Architecture

### Shell core

The config runs on macOS and Debian family systems only. `is supported` is the gate: `.zshenv` prints a warning to stderr in an interactive shell elsewhere, and `installers/_stub` refuses to run. Bash is not supported; `configs/bash/bashrc` and `bash_profile` (linked into `~` by `installers/00-zshconfig`) are POSIX sh. They put `~/.local/bin` and `~/.bin` on `PATH`, then `exec zsh` from an interactive terminal session. `NO_ZSH=1` keeps bash, which then gets a minimal prompt and safe defaults.

#### `.zshenv` (every zsh, silent)

Runs for every zsh, interactive or not, so it prints nothing except the unsupported-system warning and runs no slow commands. In order:

1. `CUSTOM_DIR`, as `${CUSTOM_DIR:-$HOME/.custom}` so a caller can override it, then `CHEATSHEET_DIR` (default `~/cheatsheets`; a value pointing inside this repo is replaced) and `FN_DIR`
2. `custom_functions.zsh`, which puts `functions/` on `fpath` and autoloads it
3. the `is supported` warning
4. `PROJECTS`, `ASDF_DATA_DIR`, `ASDF_DIR`, then `path.zsh`
5. `EDITOR` and `VISUAL` (micro, when installed), `BAT_THEME`, `MICRO_TRUECOLOR`, `HOMEBREW_NO_AUTO_UPDATE`
6. `private.zsh` (optional, not committed)
7. every `projects/*.env.zsh`

#### `path.zsh` and `.zprofile`

`path.zsh` builds `PATH` with only `[[ -d ]]` tests, no forks: `~/.local/bin` (created if missing), `~/.bin`, asdf shims, then the first Homebrew prefix found (`/opt/homebrew`, `/usr/local` on macOS only, `/home/linuxbrew/.linuxbrew`), which also sets the `HOMEBREW_*`, `MANPATH` and `INFOPATH` variables that `brew shellenv` would. JetBrains Toolbox scripts go last. It is idempotent (`typeset -U path`) because it runs more than once.

macOS `/etc/zprofile` runs `path_helper` after `.zshenv` and pushes the system paths to the front of a login shell's `PATH`. `.zprofile` sources `path.zsh` again to put ours back.

### Load order (`.zshrc`, interactive shells)

`.zshenv` has already run, so `CUSTOM_DIR`, `PATH`, `private.zsh` and the `projects/*.env.zsh` drop-ins are in place.

1. p10k instant prompt, when its cache exists
2. `zsh_options.zsh` — setopt flags
3. `env.zsh` — interactive exports; its last line sources `load_box_env.zsh` (see below)
4. `zpm-zsh-colors` — `$c[...]` color variables used everywhere
5. `load_zinit.zsh` — installs zinit if missing, then sources it
6. `p10k.prompt.zsh` / `p10k.zsh` — prompt config
7. `plugins.zsh` — zinit plugin declarations
8. `completions.zsh` — adds `completions/` and asdf's completions to `fpath` and runs the one `compinit`, which nothing else may call
9. `aliases.zsh` — conditional aliases (checks `is available <tool>` before defining)
10. `wrap-progress.zsh` — when `progress` is installed, autoloads the `wrappers/` versions of `cp`, `mv`, `tar` and similar, and aliases the originals as `cpo`, `mvo` and so on
11. `load-direnv.zsh`, `load-fzf.zsh`, `configs/ls_colors/ls-colors.sh`
12. `load-projects.zsh` — sources every `projects/*.zsh` except `*.env.zsh`

### Project drop-ins (`projects/`)

Other projects hook into the shell by writing stubs into `$CUSTOM_DIR/projects/`, so nobody edits `.zshrc` (which `~/.zshrc` symlinks to) or any other tracked file. There are two kinds:

- `<name>.env.zsh` — variables and `PATH` only, silent. `.zshenv` sources it in every zsh.
- `<name>.zsh` — aliases, functions, anything interactive. `load-projects.zsh` sources it in interactive shells.

The directory's contents are gitignored (`projects/*`, except `projects/.gitkeep`). The stubs belong to the other project: its installer writes them and rewrites them on every run, and its uninstaller removes them. agent-forge's `shared/tools/install-shell-stubs` writes `agent-forge.env.zsh` and `agent-forge.zsh` this way. Do not hand-edit a generated stub, and do not commit one.

### Per-machine env files

`load_box_env.zsh`, sourced last by `env.zsh`, loads three files in order, each only if present: `env.osx.zsh` on macOS or `env.linux.zsh` elsewhere (settings shared by every machine of that OS), then `env.<hostname>.zsh` (e.g. `env.MacBookPro.zsh`, `env.ubuntu.zsh`) for that machine, using `${HOST%%.*}` rather than forking `get-hostname`. Use the host file for machine-specific PATH entries or tool config. They load in interactive shells only, since `env.zsh` is a `.zshrc` file.

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

`md-to-html` and `md-to-pdf` convert markdown with pandoc and WeasyPrint, styled by `configs/md/md.css`. Both take any number of files and convert each through a per-file helper (`_md-to-html-one`, `_md-to-pdf-one`), carrying on past a failure and stopping on an interrupt. `md-to-html -o <out.html>` names the output for a single file. `md-to-pdf` calls `md-to-html -o <tmp>.html -- <input>` with the dynamically scoped `MD_CALLER=md-to-pdf`, which makes `md-to-html` label its errors as `md-to-pdf` and skip its own success line.

### `cheatsheets/` directory

The sheets here are this repo's own. `link-cheatsheets` links each one into `$CHEATSHEET_DIR` (`~/cheatsheets`, set in `.zshenv`), which is where `cheat` reads; `installers/00-zshconfig` and `updaters/_self` call it, and other projects call it from their own installers for their sheets. A name already taken in `~/cheatsheets` by a real file or another project's link is a clash: it is never overwritten, `link-cheatsheets` prints a `warning:` line and returns 1. `cheat new` creates sheets here and links them.

Markdown files rendered by the `cheat` function using `glow -w 120` (falls back to `bat`, then `cat`). When no local sheet matches, `cheat` falls back to `tldr`. Filename convention: `git-commit.md` for multi-word commands (matches `cheat git commit`).

Standard format, tldr style with every section at heading level one:
- `# name` — title, followed by a `>` line saying what it does
- `# Usage` — `- description:` lines, each followed by the command in backticks
- `# Related commands` — links to related sheets via `` `cheat related-name` ``

### `installers/` directory

Each file is an independent install script. `_stub` must be sourced first — it sets `$INSTALLER_DIR`, `$REPO_DIR`, loads `is`, and loads `$c[...]` colors. `install.zsh` (started by `./install`) runs them in lexicographic order, so the numbered ones come first: `01-homebrew` (macOS) and `02-apt-base` (Debian). The apt list is `configs/apt/base`, one package per line with `#` comments (curl, git, tar, unzip, zsh, micro, httpie, progress, direnv, build-essential); `02-apt-base` and `updaters/000-debian` both install it, so a package added there reaches existing machines through `update`.

On Debian, tools that apt packages badly come from their latest GitHub release through `install-release <binary>` (`functions/install-release`). `configs/releases` has one row per tool (tlrc as `tldr`, glow, eza, delta, bat, asdf): repo, asset pattern, per-arch tokens and paths inside the archive. It installs to `~/.local/bin`, completions to `~/.local/share/zsh/site-functions`, and records the tag under `~/.local/share/zsh-config/releases`. macOS uses brew for all of them.

New installers should start with:
```zsh
#!/usr/bin/env zsh
source "${0:a:h}/_stub"
```

### `updaters/` directory

`./update` (also the `update` function) keeps the whole machine current. It pulls this repo through `updaters/_self`, restarts itself so the run uses the scripts it just pulled, authenticates sudo once with a keepalive, then runs every `updaters/NNN-name` script in number order with stdin closed. A failed updater is reported at the end and does not stop the run. `update --list` shows the order, and `update brew tldr` runs only the named ones.

Each run keeps an error log at `.cache/logs/update/<YYYY-MM-DD-HH-MM-SS>.error.log`: every line an updater starts with `error:` or `warning:`, plus the last 30 lines of output from any updater that failed, each tagged `[NNN-name]` (`[zsh-config]` for the self-update) and stored without colour codes. An interrupted run removes its log if it is still empty. The runner prints the log again, coloured, when the run ends. A run with nothing to report deletes its log, and only the newest 20 are kept. Every finished run also writes its start time and `clean` or `logged` to `.cache/logs/update/last-run`, so `update --errors` can say that the last run was clean instead of showing an older run's log; `update --errors --previous` shows the newest log whichever run wrote it. An updater gets a message into the log by starting the line with `error:` or `warning:`, which the house `$c[error]error:$c[reset]` and `$c[warn]warning:$c[reset]` tags already do.

Rules for an updater:

- Name it `NNN-name`. Numbers rise in tens and run big to little: `000` OS, `010` package managers, `020` app stores, `030` app extensions, `035` Xcode, `040` to `070` languages, `080` to `090` shell frameworks, `100` to `120` utilities (`115-releases` refreshes the Debian release tools), `130` data, `900` applications that depend on the rest. Two scripts may share a number when they never run on the same OS (`000-soft` and `000-debian`).
- Source `_stub` from the same directory; it loads `is` and the colours, and exports the non-interactive environment (`NONINTERACTIVE`, `DEBIAN_FRONTEND`, `GIT_TERMINAL_PROMPT=0`).
- Skip with `exit 0` when the tool is missing, `exit 1` on failure.
- Never prompt. Pass the tool's own `--yes` style flag; sudo drops the environment, so pass variables on the sudo command line.
- Keep the body inside `{ ... exit 0 }`. zsh reads a script as it runs, so a file saved or pulled mid-run otherwise fails with a bogus parse error such as `unmatched "`. `update` itself is wrapped the same way.
- Shell functions such as `zinit` do not exist inside a script; source what defines them (see `080-zinit`).
- Never call `brew` directly from an updater; use `brew-isolated` from `updaters/_stub`. Every `brew` command runs `sudo --reset-timestamp`, which ends the sudo session `update` opened and makes the next `sudo` prompt. `brew-isolated` runs brew inside `script -q /dev/null`, because sudo keeps one session per terminal and the reset then only hits the throwaway one. A cask that needs root fails in there rather than prompting, and shows up in the error log.
- An updater must not leave the repo dirty. Never run `bun upgrade`: asdf owns bun, and `bun upgrade` also appends a completions line to `.zshrc`.

What a clean machine needs:

- `configs/brew/Brewfile` is the base stack: the tools the updaters drive (`git`, `gh`, `mas`, `asdf`, `tlrc`, `xcodes`, `aria2`), the shell tools (`glow`, `eza`, `git-delta`, `bat`, `micro`, `httpie`, `progress`, `direnv`), the libraries python-build and ruby-build compile against, and `pandoc`, `weasyprint`, `exiftool` and `qpdf` for `md-to-html` and `md-to-pdf`. `010-brew` installs homebrew through `installers/01-homebrew` when it is missing, then runs `brew bundle install --no-upgrade` against the Brewfile before upgrading, so everything later in the run finds its tool. It is not an inventory of the machine. On a Debian family machine `040-asdf` installs the equivalent build packages with apt.
- uv is an asdf tool (`configs/asdf/update-policy`), so `040-asdf` installs and upgrades it. `060-uv` skips when uv is missing, never runs `uv self update`, runs `uv tool upgrade --all`, and once `asdf which uv` works does a one-off cleanup of the old copies: `~/.local/bin/uv`, `~/.local/bin/uvx`, `~/.config/uv/uv-receipt.json`, and on macOS the brew uv (`brew-isolated uninstall uv`, a failure is only a warning). `040-asdf` does the same for bun (`~/.bun/bin/bun`, `bunx`, `~/.bun/_bun`, the brew bun) once the asdf bun works; `path.zsh` puts `~/.bun/bin` after the asdf shims.
- `installers/01-homebrew` runs `brew bundle install --no-upgrade` against the Brewfile after installing brew, or when brew already exists, so `installers/asdf` finds the build libraries; a failure exits 1. It checks `xcode-select -p` and runs `xcode-select --install` when the Xcode command line tools are missing, then exits 1 asking for a rerun; an existing brew does not prove they are there.
- direnv comes from brew (Brewfile) or apt (`02-apt-base`), not asdf; the policy removes any asdf copy.
- Updaters whose tool needs something only a person can supply keep skipping: the Obsidian vault and agent-forge need a clone and keys, `mas` needs an App Store sign-in, and `snap` and `flatpak` are optional.

`035-xcode` drives the `xcodes` command line tool (the Xcodes app has no CLI of its own). It installs the newest release with `--no-superuser`, selects it with `xcode-select`, accepts the licence and runs the first-launch setup with sudo, then uninstalls every other release; betas are left alone. When the newest release is already installed it needs no Apple ID. A real download does, and an expired session wants a 2FA code, which it cannot ask for: the updater fails, and `xcodes install --latest` by hand signs in again.

`040-asdf` is driven by `configs/asdf/update-policy`, the base for every machine, plus an optional `configs/asdf/update-policy.<hostname>` (short hostname) for one machine's extra tools; both are `tool policy` pairs, one per line, and a later line for the same tool wins. `installers/asdf` installs asdf (brew, or `install-release` on Debian), creates `~/.tool-versions` and runs `updaters/040-asdf`, so the first install and `update` share one code path. `latest` installs the newest plain release; `stable` (python) is the newest release unless it is the `.0` or `.1` of a new series, then the newest of the series before; `remove` uninstalls the tool, its plugin and its `~/.tool-versions` line; a tool that is not listed is never touched. direnv is `remove` because it comes from brew or apt. bun is `latest` under asdf: never run `bun upgrade`, and `040-asdf` writes bun's zsh completion to `~/.local/share/zsh/site-functions/_bun` (mktemp, `chmod 644`, then `mv`). Versions are taken from `asdf list all` filtered to plain numbers, because `asdf latest python` returns the free-threaded `3.14.7t`. Every tool gets `asdf set -u` whether or not anything was installed, older versions are then uninstalled unless a project under `~/projects` pins them (`.tool-versions`, `.nvmrc`, `.node-version`, `.python-version`; other roots through `ASDF_PIN_ROOTS`; a shortened pin such as `22` protects every installed `22.x`), lines in `~/.tool-versions` for tools with no plugin are dropped, and `asdf reshim` runs last. `UPDATE_ASDF_DRY_RUN=1 updaters/040-asdf` prints what it would do. `050-node` only looks after npm and the global packages.

Use `cheat update` for the user-facing reference.

### `configs/kitty/` directory

`kitty.conf` holds what is the same on every OS and ends with `include os.${KITTY_OS}.conf` (kitty sets `KITTY_OS` to `macos`, `linux` or `bsd` for include lines), then `include overrides.conf`. Key maps and OS-only settings go in `os.macos.conf` (cmd keys, no ctrl except pane focus and moving) or `os.linux.conf` (ctrl keys); nothing in `kitty.conf` should be OS specific. `overrides.conf` is the per-machine layer, linked by `install-box-config` from `overrides.<hostname>.conf` or `overrides.<os>.conf`; a host file replaces the OS overrides file, so a host that wants the OS overrides too must repeat them, but key maps may live in a host file (`overrides.uconsole.conf` does, and wins because it is included last). `installers/micro` links `settings.json` and `bindings.json` through `install-box-config` as well, so `bindings.<hostname>.json` or `bindings.<os>.json` replaces the default; micro's JSON has no include, so a host file is a full copy. Use `cheat kitty` for the keys.

### `configs/gnome/` directory

GNOME-specific config and tools. Only installed on machines running GNOME on Wayland (`is gnome && is wayland`).

- `window-list@personal/` — GNOME Shell extension that exposes a D-Bus interface (`com.personal.WindowList`) for window listing, focusing, and closing without requiring `unsafe_mode`. Installed to `~/.local/share/gnome-shell/extensions/`.
- `bin/` — Window management scripts. Symlinked to `~/.local/bin/` by `installers/gnome`. Use `cheat gnome-bin` for reference.
- `quit-all-apps.desktop` — Desktop entry that surfaces `quit-all-apps` in the GNOME Activities/app search.

### Color system (`zpm-zsh-colors`)

`$c[...]` associative array provides semantic colors: `h1`, `h2`, `h3`, `lead`, `info`, `info-small`, `success`, `warn`, `error`, `flag`, `param`, `reset`. Use these for all user-facing output — never raw ANSI codes.

## Required tooling

- `zsh`, which every script in this repo targets; there is no bash or POSIX sh fallback
- `git`, for zinit plugin installs and the updaters
- The `post-implementation-review` skill, which reads the checks section below
- No build step, package manifest or dependency lockfile exists; tools such as glow, eza and fzf are optional at runtime and guarded by `is available <tool>`

## Testing/Running

There is no automated test suite. Verify a change by syntax-checking the files it touched and then loading the config in a fresh shell:

```zsh
# Syntax check without executing (prints nothing on success)
zsh -n .zshrc
zsh -n path/to/changed-file

# Load the full config in a new interactive shell and exit
zsh -i -c exit
```

A failure shows up as an error printed to the terminal during startup; there is no log file. Without a TTY (an agent's shell, CI) the load check always prints `setopt:7: can't change option: monitor`, `(eval):1: can't change option: zle` and `gitstatus failed to initialize`; all three are expected there, and the exit code is still 0. Files in `functions/`, `installers/` and `updaters/` have no `.zsh` extension, so name them explicitly when syntax-checking.

In VS Code, `ctrl+alt+z` runs the `zsh: syntax check current file` task (`configs/vscode/tasks.json`), which puts `zsh -n` errors in the Problems panel. ShellCheck does not support zsh, so Bash IDE's ShellCheck integration is switched off in `configs/vscode/settings.osx.json`.

## Post-implementation checks

- Syntax-check every changed zsh file: `zsh -n <file>`
- Confirm the config still loads cleanly: `zsh -i -c exit`
- Verify the install symlink is still valid: `ls -la ~/.custom`
- New files in `installers/` and `updaters/` must be executable: `chmod +x <file>`

# Global workflow

Synced from agent-forge (`claude/config/CLAUDE.md`, portable sections only) by following `PROJECT_INIT.md`. Edit these sections upstream and re-sync; do not edit them here.

## Default workflow

Every task that creates, edits, or deletes a file follows this chain; a question answered from existing context does not. Move through each step without pausing for confirmation.

1. `superpowers:brainstorming` skill
2. `superpowers:writing-plans` skill
3. `superpowers:using-git-worktrees` if async isolation is needed
4. `superpowers:subagent-driven-development` skill
   - Use `superpowers:dispatching-parallel-agents` when 2+ tasks are independent with no shared state
5. `post-implementation-review` skill after **any work that creates or modifies files**: subagent or orchestrator, code or docs/markdown
6. `/run after-task` (session state handoff and snapshot pruning)
7. Done: no PRs, no `finishing-a-development-branch`, no human review gate

## No-confirmation rule

**Never pause between workflow steps.** This overrides any skill's explicit review gate: brainstorming's "user reviews spec", writing-plans' "user approves plan", writing-plans' "which execution approach", or any other checkpoint. Keep moving.

Specific overrides:
- `writing-plans` execution handoff → always invoke `superpowers:subagent-driven-development` directly. Never present the "subagent-driven vs inline" choice.

Only stop for:
- A genuine blocker that cannot be resolved autonomously (merge conflict, missing credential, ambiguous requirement that changes scope)
- A destructive or irreversible action about to be taken

User can interrupt at any time. That is their job, not yours to prompt for.

## Skill priority

Check for applicable skills before **every** action. 1% chance it applies = invoke it. Process skills before implementation skills. Never skip because a task "seems simple."

Key triggers:
- Any bug or test failure → `superpowers:systematic-debugging` before proposing a fix
- Review feedback received → `superpowers:receiving-code-review`: verify correctness first, do not blindly implement
- Picking up a written plan in a new session → `superpowers:executing-plans`
- 2+ independent tasks with no shared state → `superpowers:dispatching-parallel-agents`
- Any feature or bugfix in prod/existing-test code → `superpowers:test-driven-development`
- Before claiming any implementation task complete → `superpowers:verification-before-completion` skill
- Before committing or staging files with credentials/tokens → `/run before-commit` (which runs `secrets-check`)

## Post-implementation review

After any work that creates or modifies files, subagent or orchestrator, code or docs/markdown, invoke **`post-implementation-review`** skill.

## Git strategy

Trunk-based development. Single chain in `main`. Use branches only when async isolation is required.

**When branching:**
1. Create short-lived branch from `main`
2. Do work with task-level commits
3. `git rebase main` before merging; never use a merge commit
4. Merge back to `main`
5. Delete branch, then run `commit-commands:clean_gone`

Escalate only if: rebase conflict that cannot be resolved autonomously.

**Commit style:**
- Short imperative subject: `add user auth`, `fix token expiry`, `update readme`
- No conventional commit prefixes (`feat:`, `fix:`, `chore:`, etc.)
- Add body when change is complex or non-obvious
- Always flag dependency changes explicitly in commit body

## Model selection

Default to Sonnet. Deviate when task complexity or cost warrants it.

| Task | Model |
|---|---|
| Architecture decisions, novel debugging, complex multi-step planning | Opus |
| Default: implementation, review, most coding work | Sonnet |
| Routing, triage, file validation, simple extraction/classification | Haiku |

Subagents: specify `model:` in agent frontmatter. Read-only validators and triage agents → Haiku. Implementation agents → Sonnet. Only escalate to Opus explicitly when a task demands it.

## TDD

| Context | TDD required? |
|---|---|
| Prod feature / user-facing code | Yes: `superpowers:test-driven-development` before writing implementation |
| Project with existing tests | Yes |
| Config, scripts, throwaway / one-off | No |
| Unclear scope or scale | Ask during `superpowers:brainstorming`, before writing a plan |

## Scope creep guard

Agents must not touch files outside their assigned task scope. If a fix requires out-of-scope changes, surface it to the orchestrator; do not silently expand scope.

Bad: an agent fixing a broken import in `foo.py` also reformats `bar.py` because it noticed inconsistent quotes while it was in the file.
Good: the agent fixes the import in `foo.py`, notices `bar.py`'s formatting is inconsistent, and reports it to the orchestrator instead of touching it.

## Dependency changes

When a dep is added, removed, or upgraded:
- Flag explicitly in commit body. Good: "Bumps `openssl` from 3.1 to 3.3 (security fix for CVE-2026-XXXX). No API changes." Bad: a commit that changes `package-lock.json` with no mention of the dependency change at all.
- Run the project's own dependency audit and licence check (for example `npm audit`, `cargo audit`, `pip-audit`) and report the result; `post-implementation-review` does not run these for you

## Flaky tests

If a test fails: retry once. If it fails again, escalate; do not loop or skip.

## Auto-memory

At the end of each session, save to the project memory directory:
- Key decisions made
- Non-obvious constraints discovered
- Feedback received (corrections and confirmations that weren't obvious)
- Architecture or convention changes

Use memory types: `project`, `feedback`, `user`, `reference`.

## Project initialization

Initializing a new project (`claude init`, first run in a directory, or on request) requires a specific `CLAUDE.md` structure and a seeded project memory directory. Use the `project-init` skill; it is public, at `shared/skills/project-init/` in the agent-forge repo, and installed as `~/.claude/skills/project-init`. If it doesn't trigger, follow `PROJECT_INIT.md` in the agent-forge repo directly.
