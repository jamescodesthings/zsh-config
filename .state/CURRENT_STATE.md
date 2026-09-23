# Current Session State & Handoff

- **Active Tool:** Claude Code CLI
- **Date/Time Stamp:** 2026-09-23 10:04 BST
- **Current Task Status:** md follow-ups fixed, PDF tables now split across pages instead of jumping, and `oh` opens the current folder (bc69d27, pushed). Research docs still on hold by the user.

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
- [ ] User to choose which ranks from the improvements doc to apply (rank 6, `oh`, is now done)
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

## Reference Plan Links

- [improvements-2026-09-19.md](../docs/improvements-2026-09-19.md) (local only)
- [macos-workflow-rnd-2026-09-19.md](../docs/macos-workflow-rnd-2026-09-19.md) (local only)
- [obsidian-alternatives-rnd-2026-09-19.md](../docs/obsidian-alternatives-rnd-2026-09-19.md) (local only)
- [cheatsheets/update.md](../cheatsheets/update.md)
- [cheatsheets/md-to-pdf.md](../cheatsheets/md-to-pdf.md)

## Next Steps

- python 3.14.7 was built before `tcl-tk` was installed, so it has no tkinter. Fix if wanted: `asdf uninstall python 3.14.7`, then `update brew asdf`.
- Reading order given to the user for the research docs: improvements (ranked table, then sections 1 to 6), Obsidian alternatives (Recommendation only), macOS workflow (ranked table, then ranks 1 to 9). The user has said they will start on improvements.
- `xcodes uninstall <version>` with a same-numbered beta installed is untested; with stdin closed it should fail with a warning, not hang.
- agent-forge backs up and relinks Antigravity's `settings.json` on every install. That belongs in the agent-forge repo.
