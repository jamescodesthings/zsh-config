# Current Session State & Handoff

- **Active Tool:** Claude Code CLI
- **Date/Time Stamp:** 2026-10-30 00:12 GMT
- **Current Task Status:** Cheat v4 (hub brief 2026-10-29-cheat-v4) done for zsh-config: parent fallback and --help convention (232f452), shared sheet structure, cheatsheet-test --strict, cheat zsh-config overview, `cheat refresh` (e2972a3). Earlier: the 2026-10-29 burn-down.

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
- [x] Obsidian route: closed as stale 2026-10-29; notes went to Raven and tasks to Anytype, and 130-obsidian is retired
- [ ] James: choose items from the macOS workflow doc (held in Anytype)
- [ ] James: choose which ranks from the improvements doc to apply (held in Anytype) (done: rank 6 `oh`, and ranks 2 to 5 and 7 for kitty were covered or declined)
- [x] First full `update` runs with real sudo (2026-09-20 11:10 and 15:17)
- [x] Fixes from those runs: brew sudo reset isolated, agent-forge benign warn no longer a failure, mas Spotlight warnings folded, bun's `.zshrc` edit made portable (3cb50b4)
- [x] User confirmed the sudo isolation (`survived`) and a clean full run with one sudo prompt
- [x] `update --errors` answers for the last run; `020-mas` indexes unindexed apps with `mdimport` (6917761)

- [x] Brewfile base stack, `035-xcode`, policy-driven `040-asdf`, uv and bun stubs (339ae96, 0c59c90)
- [x] Real `040-asdf` run on the MacBook: python 3.14.7, direnv 2.37.1, ruby 4.0.7, rust 1.98.1, golang 1.27.1, terraform 1.16.3, dotnet 10.0.400, lua 5.5.1; deno and the bogus `node` line removed; dotnet 5.0.408 and lua 5.1 kept as pinned
- [x] `update` ran with real sudo: only Xcode 27.1 is installed and selected, and python 3.15.2 has tkinter (checked 2026-10-29)

- [x] `md-to-html` and `md-to-pdf`: functions, stylesheet, Brewfile entries, cheatsheets, docs
- [x] Follow-up: a pandoc crash is now reported
- [x] Follow-up: a missing folder is reported as missing
- [x] Follow-up: an interrupt during the version check returns 130 before pandoc runs (no terminal-free test reproduces it)
- [x] PDF tables and code blocks split across pages; header row repeats
- [x] `oh` is a function that opens the current folder (was an alias frozen at shell start)
- [ ] James: try `oh` in a few folders (held in Anytype); the QSpace launch itself was only tested with a fake `open`

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
- [x] t322: GitHub token for asdf plugin version lookups (3daa74f, branch `worktree-t322-asdf-github-token`)
- [x] t322 merged into main (not pushed)
- [x] t310: `cheatsheet-test`, sheet fixes; agent-forge's 14 sheets pass too (agent-forge f7b9eee)
- [x] t324: kitty cmd+enter returns to the grid before splitting (57505c0); the grid already gave the asked-for order
- [x] t311 (agent-forge's task): every sheet swept to a minimal list, 21 new subcommand sheets for cheat, j and hist; cheatsheet-test fixed for folders under hostile glob options, with tests/cheatsheet-test (5a743f0)
- [x] kitty opt+left / opt+right move a word (user asked 2026-10-16)
- [x] rust `stable` is gone; only 1.99.1 is installed (checked 2026-10-29)
- [ ] James: fill in uConsole keys (held in Anytype) in configs/kitty/overrides.uconsole.conf and configs/micro/bindings.uconsole.json
- [ ] James: on each other machine, pull, restart terminals, run ./install (or update) (held in Anytype)
- [x] wipcrypt: agent-forge owns it and `make sync-wipcrypt` keeps this copy current
- [x] 900-agent-forge retired (415d1c2); 130-obsidian retired (vault gone)
- [x] apt keeps going past one broken source (02-apt-base, 000-debian), tested in docker
- [x] `hist move` and `j move` for folders that moved, with tests/hist-j-move
- [x] .hub/ ignored; Global workflow block re-synced to agent-forge changelog 2026-10-29
- [ ] Drop the CHEATSHEET_DIR shim in .zshenv once every machine has pulled and restarted (waits on the other-machines item)

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

- Other machines: after pulling, open a new shell and run each project's installer, or `update`, to fill `~/cheatsheets`. `link-cheatsheets` refuses to link while an old in-repo `CHEATSHEET_DIR` is in the environment.

- Reading order given to the user for the research docs: improvements (ranked table, then sections 1 to 6), Obsidian alternatives (Recommendation only), macOS workflow (ranked table, then ranks 1 to 9). The user has said they will start on improvements.
- `xcodes uninstall <version>` with a same-numbered beta installed is untested; no beta is installed, so it cannot be tested here.
- Antigravity's settings.json relink belongs to agent-forge; passed to the hub 2026-10-29.

## Decisions 2026-10-29

- Obsidian: retired 130-obsidian (the vault folder is gone). Alternatives: keep it as a harmless skip, or move it into a project drop-in; neither has a vault to serve.
- Broken apt source: warn and carry on with the lists that did refresh. Alternatives: keep aborting (one stale PPA blocks every update), or disable the broken source automatically (edits system config without asking).
- Folder reorganise: zsh-config itself does not move (personal, not a fork, already at ~/projects/personal). What breaks on a move is history and z data keyed on paths, so `hist move` and `j move` were added. Alternatives: let `hist clean` and `j clean` drop them (loses history), or symlink old paths (clutters ~/projects).
- Hub v3: no zsh-config file names the old hub commands; `.hub/` ignored; `hub oh` calls zsh-config's `oh` unchanged.
- CHEATSHEET_DIR shim in .zshenv: kept until every machine has pulled. Alternative: drop it now, which breaks `link-cheatsheets` on a machine whose shells still carry the old value.
- wipcrypt: keep the synced copy. Alternative: drop it and rely on agent-forge's PATH, which leaves machines without agent-forge without it.

## Decisions 2026-10-30 (cheat v4)

- Fallback lives in cheat: flags dropped, longest existing sheet shown, note on stderr; tldr's exact page beats a local parent. Alternative: each tool resolving its own parent, which every repo would repeat.
- --help for zsh tools via `cheat-help <tool> "$@" && return 0`; `--help` anywhere or `-h` first, as James asked. Alternative: `--help` only as the first word, which misses `hub join --x --help`.
- Renderer: cheat passes its own tlrc config (configs/tlrc/cheat.toml: compact, bold headings) rather than changing the user's tlrc config or tldr's own pages. Headings are plain words, no icons. Alternative: emoji headings, which misalign in some terminals and every repo would have to match.
- Structure checks in cheatsheet-test are warnings unless --strict, so other repos can move over gradually; zsh-config's own sheets pass --strict. A sheet is a child when a `-` prefix of its name is a sheet beside it, which makes md-to-html a child of md (a name coincidence, harmless).
- `cheat update` now shows the update sheet; the tldr cache refresh became `cheat refresh`. Alternative: rename the update sheet, but `cheat update` is what CLAUDE.md and every other sheet already point at.
- Completions from other repos go in ~/.local/share/zsh/site-functions/, already on fpath before compinit; no per-tool change in zsh-config.
