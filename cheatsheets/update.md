# update

> Update everything on this machine: zsh-config first, then every script in `updaters/`.
> Asks for sudo once at the start and never prompts after that.

# Usage

- Run every updater:

`update`

- Run only some updaters, by name or by number and name:

`update brew tldr`

- Show the updaters in the order they run:

`update --list`

- Show the error log from the last run that had one:

`update --errors`

# Order

> Big to little. Two scripts share a number when they never run on the same OS.

- `000` OS: `soft` (macOS), `debian` (apt)
- `010` package managers: `brew`, `snap`
- `020` app stores: `mas`, `flatpak`
- `030` app extensions: `vscode`
- `040` to `070` languages and their tools: `asdf`, `node`, `uv`, `bun`
- `080` to `090` shell frameworks: `zinit`, `tmux` (tpm plugins)
- `100` to `120` utilities: `micro`, `gh`, `tldr`
- `130` data: `obsidian` (git pull of the vault)
- `900` applications that depend on everything above: `agent-forge`

# Adding an updater

> Numbers go up in tens, so there are nine free slots between any two scripts.

- Create `updaters/NNN-name`, make it executable, and copy the shape of `updaters/120-tldr`:
  source `_stub`, skip with exit 0 when the tool is missing, exit 1 on failure.
- Keep the body inside the `{ ... exit 0 }` braces. zsh then parses the whole file before
  running it, so saving the file mid-run cannot break it.
- Pass the tool's own `--yes` style flag. stdin is closed, so a tool that still tries to
  ask a question gets end-of-file rather than hanging the run.

# Notes

> A failed updater does not stop the run. Failures are listed at the end and the exit code is 1.
> Every `error:` and `warning:` line, plus the last 30 lines of output from any updater that failed,
> goes in `.cache/logs/update/2026-09-21-10-29-19.error.log` (one file per run, named for its start time).
> The log is printed again at the end of the run. A clean run leaves no file, and the newest 20 are kept.
> `updaters/_self` pulls zsh-config, then `update` restarts itself so the run uses the new scripts.
> macOS updates that need a restart are listed as a warning and left for System Settings. They
> ask for the account password on Apple silicon, and the list can include a whole new macOS version.
> The vault path can be changed with `OBSIDIAN_VAULT_DIR`, the agent-forge path with `AI_CONFIG_DIR`.

# Related commands

- `cheat zshconfig`
- `cheat install`
