# Current Session State & Handoff

- **Active Tool:** Claude Code CLI
- **Date/Time Stamp:** 2026-10-07 14:40 BST
- **Current Task Status:** Bootstrap rework done in 4 parts (shell core and project drop-ins, Debian release installs, asdf first setup, kitty and micro per-machine keys). Debian end-to-end passed in docker on arm64 and amd64. tmux and thefuck removed.

## Milestone & Phase Progress

- [x] Project init against agent-forge (baseline: changelog entry 2026-09-07)
- [x] VS Code: ShellCheck off for Bash IDE, `ctrl+alt+z` runs `zsh -n` on the current file
- [x] `.cache/` ignored
- [x] `900-agent-forge` updater (git pull, `make install`, fails on non-zero exit or a `[warn]` line)
- [x] No-prompt audit of every updater and of agent-forge's `make install` path
- [x] sudo authenticated once at the start of `update`, with a keepalive
- [x] Updaters renumbered big to little, wrapped in braces, nine new ones added
- [x] Research doc written and its top claim (duplicate `compinit`) checked
- [x] Consistency check over readme, cheatsheets and agent instructions (44b89b2)
- [x] Per-run error log for `update`, reprinted at the end, newest 20 kept (840846b)
- [x] macOS dev workflow R&D: `docs/macos-workflow-rnd-2026-09-19.md`, 21 ranked items
- [x] Obsidian alternatives R&D: `docs/obsidian-alternatives-rnd-2026-09-19.md` (top pick Things 3 plus Apple Notes, runner-up Logseq, or stay on Obsidian with three changes)
- [ ] User to choose a route from the Obsidian doc
- [ ] User to choose items from the macOS workflow doc
- [ ] User to choose which ranks from the improvements doc to apply (done: rank 6 `oh`, and ranks 2 to 5 and 7 for kitty were covered or declined)
- [x] First full `update` runs with real sudo (2026-09-20 11:10 and 15:17)
- [x] Fixes from those runs: brew sudo reset isolated, agent-forge benign warn no longer a failure, mas Spotlight warnings folded, bun's `.zshrc` edit made portable (3cb50b4)
- [x] User confirmed the sudo isolation (`survived`) and a clean full run with one sudo prompt
- [x] `update --errors` answers for the last run; `020-mas` indexes unindexed apps with `mdimport` (6917761)

- [x] Brewfile base stack, `035-xcode`, policy-driven `040-asdf`, uv and bun stubs (339ae96, 0c59c90)
- [x] Real `040-asdf` run on the MacBook: python 3.14.7, direnv 2.37.1, ruby 4.0.7, rust 1.98.1, golang 1.27.1, terraform 1.16.3, dotnet 10.0.400, lua 5.5.1; deno and the bogus `node` line removed; dotnet 5.0.408 and lua 5.1 kept as pinned
- [ ] User: run `update` so `035-xcode` and the Brewfile step run with real sudo (removes Xcode 26.2 and 26.6, selects 27.0, installs `tcl-tk`)

- [x] `md-to-html` and `md-to-pdf`: functions, stylesheet, Brewfile entries, cheatsheets, docs
- [x] Follow-up: a pandoc crash is now reported
- [x] Follow-up: a missing folder is reported as missing
- [x] Follow-up: an interrupt during the version check returns 130 before pandoc runs (no terminal-free test reproduces it)
- [x] PDF tables and code blocks split across pages; header row repeats
- [x] `oh` is a function that opens the current folder (was an alias frozen at shell start)
- [ ] User: try `oh` in a few folders; the QSpace launch itself was only tested with a fake `open`

- [x] kitty: per-OS key files, cmd+left/right line start and end, zoom, cmd+[ ], ctrl+arrows panes, copy on select to clipboard, close-others kitten; user tested all but cmd+shift+w
- [x] cmd+shift+w confirmed working by the user; the earlier whole-window close was most likely kitty reloading kitty.conf before os.macos.conf was saved (kitty watches only kitty.conf)
- [x] kitty back on the grid layout (cmd+enter fills a grid) and the inactive tab colour template fixed (71cb10c)
- [x] md-to-html and md-to-pdf accept several files and globs; md-to-html's output moved to -o (b434d0c)

- [x] `zshc` alias for `zshconfig` (e59049a)
- [x] Cheatsheets in `~/cheatsheets`: `link-cheatsheets` (71b2ec4), zsh-config switched (85bc7ce, 6644a82), stale `CHEATSHEET_DIR` guards (fa6bb46, ba24494); agent-forge 6814447, pkms 4c4aa1a, readerr d234315; this machine migrated, 51 links
- [x] tmux removed (7811cae); pkms todo line fixed (pkms 5d49f61)
- [x] Part 1 shell core: .zshenv/path.zsh/.zprofile, projects/ drop-ins, OS gate, bash handover, startup cleanup (1245a21..d5a9af8, b006674); agent-forge and readerr write stubs
- [x] Part 2 Debian tools: install-release + configs/releases, apt base list, install wrapper bootstraps zsh, 115-releases (01788ec..9e0b064, 602975d, 00eec15)
- [x] Part 3 asdf: policy plus update-policy.<host>, installer runs 040-asdf, bun and uv under asdf, direnv via brew/apt (8f07e43, e4d217c, 8e37784)
- [x] Part 4 terminal: kitty ssh alias inside kitty, uConsole kitty/micro overrides (b5d4e56)
- [x] Final fix wave for existing machines (37af1be); this Mac migrated (bun, uv, direnv)
- [ ] User: fill in uConsole keys in configs/kitty/overrides.uconsole.conf and configs/micro/bindings.uconsole.json
- [ ] User: on each other machine, pull, restart terminals, run ./install (or update)
- [ ] Follow-ups: move functions/wipcrypt to agent-forge; 900-agent-forge and 130-obsidian updaters as project drop-ins; drop the CHEATSHEET_DIR shim in .zshenv once every machine has restarted; 02-apt-base aborts on any broken third-party apt source; agent-forge skills suite has 43 failing cases (not from this work)

## Reference Plan Links

- docs/superpowers/specs/2026-10-07-{shell-core,debian-tools,asdf-setup,terminal}-design.md (local only)

- [2026-10-06-cheatsheet-dir-design.md](../docs/superpowers/specs/2026-10-06-cheatsheet-dir-design.md) (local only)
- [2026-10-06-cheatsheet-dir.md](../docs/superpowers/plans/2026-10-06-cheatsheet-dir.md) (local only)

- [improvements-2026-09-19.md](../docs/improvements-2026-09-19.md) (local only)
- [macos-workflow-rnd-2026-09-19.md](../docs/macos-workflow-rnd-2026-09-19.md) (local only)
- [obsidian-alternatives-rnd-2026-09-19.md](../docs/obsidian-alternatives-rnd-2026-09-19.md) (local only)
- [cheatsheets/update.md](../cheatsheets/update.md)
- [cheatsheets/md-to-pdf.md](../cheatsheets/md-to-pdf.md)

## Next Steps

- Other machines: after pulling, open a new shell (or restart tmux) and run each project's installer, or `update`, to fill `~/cheatsheets`. `link-cheatsheets` refuses to link while an old in-repo `CHEATSHEET_DIR` is in the environment.

- python 3.14.7 was built before `tcl-tk` was installed, so it has no tkinter. Fix if wanted: `asdf uninstall python 3.14.7`, then `update brew asdf`.
- Reading order given to the user for the research docs: improvements (ranked table, then sections 1 to 6), Obsidian alternatives (Recommendation only), macOS workflow (ranked table, then ranks 1 to 9). The user has said they will start on improvements.
- `xcodes uninstall <version>` with a same-numbered beta installed is untested; with stdin closed it should fail with a warning, not hang.
- agent-forge backs up and relinks Antigravity's `settings.json` on every install. That belongs in the agent-forge repo.
