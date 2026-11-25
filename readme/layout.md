# Layout

## Folders

```text
.zshenv, .zprofile, .zshrc   startup files, linked into ~
path.zsh, env.zsh, ...       options, aliases, plugins, prompt, loaders
functions/                   one autoloaded zsh function per file
completions/                 zsh completions
installers/                  independent install scripts, run in name order
updaters/                    update scripts, run in number order
configs/                     per-tool config: palette, brew, asdf, iterm2, kitty, micro, md
cheatsheets/                 this repository's own cheat sheets
hooks/                       pre-commit, colour lint, changes reminder
tests/                       one script per tool
projects/                    drop-in stubs written by other projects (gitignored)
config/, logs/               local settings and run logs (gitignored)
install, install.zsh, update the sh bootstrap, the installer and the update runner
```

## Load order

`.zshenv` runs for every zsh and prints nothing. It sets `CUSTOM_DIR`, puts `functions/` on `fpath`, builds `PATH`, sets editors, then reads `private.zsh` and every `projects/*.env.zsh`.

`.zshrc` runs for interactive shells. In order: the p10k instant prompt, options, interactive environment, zinit, the prompt, plugins, completions (the one `compinit`), aliases, wrappers, direnv, fzf and the terminal hooks, then every `projects/*.zsh`.

## Changing it with an agent

If you ask an agent to change this repository, point it at `CLAUDE.md` and this README first. `CLAUDE.md` is the source of truth. The parts an agent must pick up:

- **Functions.** A file in `functions/` defines a function of the same name and calls it with `"$@"` at the end. Use `is` for conditions rather than raw `[[ ]]`.
- **Installers.** Start with `source "${0:a:h}/_stub"`, report with `say`, use `problem` and `fix` for failures, and make the file executable.
- **Updaters.** Name them `NNN-name`, source `_stub`, never prompt, skip with `exit 0` when the tool is missing, keep the body inside `{ ... exit 0 }`, call brew only through `brew-isolated`, and leave the repository clean.
- **Output.** Print through `say`, `col`, `problems` and `progress`. Never write raw colour escapes. The pre-commit colour lint enforces this.
- **Sheets.** Follow `cheat cheat format` and run `cheatsheet-test --strict` on each changed sheet. Add a row to `cheat changes` for anything a user will notice.
- **Tests.** Add or extend a script in `tests/`. Stub every external command first, use an empty temporary `HOME` and working folder, and never run a real installer.
- **Checks.** Run `zsh -n` on each changed file, `zsh -i -c exit`, and the relevant tests.
- **Scope.** Do not edit files outside the task. Report anything else that needs fixing.

Files in `projects/` belong to other projects. Do not edit or commit a generated stub.
