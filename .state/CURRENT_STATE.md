# Current Session State & Handoff

- **Active Tool:** Claude Code CLI
- **Date/Time Stamp:** 2026-11-11 10:58 GMT
- **Current Task Status:** `key rm <name>` added (b5e9994): moves the key's files into `removed/<name>-<stamp>/` in the store, warns about live `.users` roots, never touches 1Password. Earlier: Blender startup scripts live in `configs/blender/scripts` and are linked into every version folder by `link-blender-scripts` (9d34b25); run for real on the MacBook: 7 links, 4.5 original kept as `center-search.py.bak`. Earlier: first `./install` no longer hits CHEATSHEET_DIR unset, and later installers find brew (14ebf2b): `installers/_stub` defaults the variable and sources `path.zsh`; stubbed tests only, no real clean-box run yet. Earlier: Hub CLI overhaul, zsh-config part, done (0426901..5b8d15c): `key` (per-project named keys, 1Password sync, import), wipcrypt owned here with `--key`, every CLI helper loads its own dependencies, progress wrappers call the binary, 950-projects runs `hub project update`. Then the CLI and cheat-sheet sweep, done (f749f35..3c4bd58): every tool on cli-init, say and problems, update quiet with a step counter and logs in ~/.custom/logs/update, $c[...] and zpm-zsh-colors retired. Earlier: CLI helper library done (agent-forge docs/cli-spec/helpers-interface.md): palette and col, say and problems, cheat-render replacing tlrc in cheat, logs, pick, progress, run-quiet, config, the Nerd Font step, and every sheet on the new cheatsheet-test rules (See also last, ` - ` rows, 35 lines). Earlier: cheat v4.

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
- [x] wipcrypt and the key store: zsh-config owns them (2026-11-03); agent-forge calls them
- [x] 900-agent-forge retired (415d1c2); 130-obsidian retired (vault gone)
- [x] apt keeps going past one broken source (02-apt-base, 000-debian), tested in docker
- [x] `hist move` and `j move` for folders that moved, with tests/hist-j-move
- [x] .hub/ ignored; Global workflow block re-synced to agent-forge changelog 2026-10-29
- [ ] Drop the CHEATSHEET_DIR shim in .zshenv once every machine has pulled and restarted (waits on the other-machines item)

## Reference Plan Links

- docs/superpowers/specs/2026-10-07-{shell-core,debian-tools,asdf-setup,terminal}-design.md (local only)

- [2026-11-03-cli-sweep-design.md](../docs/superpowers/specs/2026-11-03-cli-sweep-design.md) and [plan](../docs/superpowers/plans/2026-11-03-cli-sweep.md) (local only)
- [2026-11-03-key-and-wipcrypt-design.md](../docs/superpowers/specs/2026-11-03-key-and-wipcrypt-design.md) and [plan](../docs/superpowers/plans/2026-11-03-key-and-wipcrypt.md) (local only)
- [2026-10-06-cheatsheet-dir-design.md](../docs/superpowers/specs/2026-10-06-cheatsheet-dir-design.md) (local only)
- [2026-10-06-cheatsheet-dir.md](../docs/superpowers/plans/2026-10-06-cheatsheet-dir.md) (local only)

- [improvements-2026-09-19.md](../docs/improvements-2026-09-19.md) (local only)
- [macos-workflow-rnd-2026-09-19.md](../docs/macos-workflow-rnd-2026-09-19.md) (local only)
- [obsidian-alternatives-rnd-2026-09-19.md](../docs/obsidian-alternatives-rnd-2026-09-19.md) (local only)
- [cheatsheets/update.md](../cheatsheets/update.md)
- [cheatsheets/md-to-pdf.md](../cheatsheets/md-to-pdf.md)

## Next Steps

- 0bc04ee (2026-11-03 19:57): 035-xcode is `# update: interactive`; update gives it the terminal under `script -q` so the Apple 2FA prompt shows. James to confirm with one `update xcode` from a terminal; if the prompt still does not show, disable 035-xcode and use `xcodes install --latest` by hand.
- Open work from the hub, in this order (handover 2026-11-03 19:18):
  1. Finish branch `wip/2026-11-03` (32d55e2): CLI helpers safe under `set -u` (emulate -L zsh, `${VAR-}`), tests/set-u still failing. Rebase on main, finish, ff-merge, delete the branch.
  2. On that work too: cheatsheet-test skips `*-encrypted` and `.cipher` folders when walking a directory and refuses them as direct arguments (exit 1), with binary stand-in tests; run-quiet renames a failed child log to `*.failed.log` and pruning keeps the newest 50 ordinary and 50 failed separately, with a 1-fail-plus-120-ok test; cheatsheet-test autoloads is, cheat-render and cheat-help itself (tests/helpers-standalone case).
  3. Done 2026-11-08 (3fb5677): `key pull|push|import|export`, `key sync` refuses with fix lines.
  4. Report items 1 and 2 to the hub with leak and secrets results. Test rule: stub PATH, temp HOME and temp cwd before any tool runs.
- James: after pulling, `exec zsh`; the first real `update` run is the check of the new quiet runner (sudo prompt, step counter, `update --errors`).
- With the hub (not here): one manual push of a throwaway key (`key create zz-test`, `key sync zz-test --push` twice, `key sync zz-test`) to confirm `op item edit --template` edits only the field and `item create --vault` with a template works; tests use a stub op.

- Other machines: after pulling, open a new shell and run each project's installer, or `update`, to fill `~/cheatsheets`. A bare `link-cheatsheets` refuses to link while an old in-repo `CHEATSHEET_DIR` is in the environment; installers and updaters replace that value through `_stub`.

- Reading order given to the user for the research docs: improvements (ranked table, then sections 1 to 6), Obsidian alternatives (Recommendation only), macOS workflow (ranked table, then ranks 1 to 9). The user has said they will start on improvements.
- `xcodes uninstall <version>` with a same-numbered beta installed is untested; no beta is installed, so it cannot be tested here.
- Antigravity's settings.json relink belongs to agent-forge; passed to the hub 2026-10-29.

## Decisions 2026-10-29

- Obsidian: retired 130-obsidian (the vault folder is gone). Alternatives: keep it as a harmless skip, or move it into a project drop-in; neither has a vault to serve.
- Broken apt source: warn and carry on with the lists that did refresh. Alternatives: keep aborting (one stale PPA blocks every update), or disable the broken source automatically (edits system config without asking).
- Folder reorganise: zsh-config itself does not move (personal, not a fork, already at ~/projects/personal). What breaks on a move is history and z data keyed on paths, so `hist move` and `j move` were added. Alternatives: let `hist clean` and `j clean` drop them (loses history), or symlink old paths (clutters ~/projects).
- Hub v3: no zsh-config file names the old hub commands; `.hub/` ignored; `hub oh` calls zsh-config's `oh` unchanged.
- CHEATSHEET_DIR shim in .zshenv: kept until every machine has pulled. Alternative: drop it now, which breaks `link-cheatsheets` on a machine whose shells still carry the old value.
- wipcrypt and `key`: zsh-config owns them and the key store, so any project can use them. Alternative: leave wipcrypt in agent-forge, which leaves other projects and machines without it.

## Decisions 2026-11-03 (CLI sweep)

- `-q` and `-v` live in cli-init (CLI_QUIET, CLI_VERBOSE); say ok/info are silent under CLI_QUIET. Tools declare the three CLI_* variables local so a redirected call cannot leak plain mode into the shell. Alternative: each tool parsing the flags.
- Tiny shortcuts (gcod, gcom, dsp, git-branch, get-hostname, zshenv) get help, a sheet and a completion, not the full flag set. hist and dsp pass only --plain to cli-init, since -q and -v mean something else there.
- update runs updaters through run-quiet with progress after sudo, `-v` keeps live output, the error log is ~/.custom/logs/update, an updater reaches it with say warn or say fail; the spinner pauses for a lapsed sudo ticket. Unknown updater names exit 2.
- install.zsh keeps live output (installers may prompt) and ends with a problems block.
- zpm-zsh-colors and $c[...] are gone; nothing here or in other repos used them. test-color-names and test-color-codes went with them.
- key path NAME exits 1 when the key is missing or empty.

## Decisions 2026-11-03 (key and wipcrypt)

- Everything per key lives in the gitignored `config/keys/` (key, backups, conf, users). Alternatives: tracked `configs/keys/<name>.conf` (publishes 1Password vault and item names in a public repo), or one `keys/` folder with `*.key*` ignored (one glob mistake leaks a key).
- One `key` command with subcommands, matching `hub key create|cycle|sync`. Alternative: separate `key-create`, `key-cycle`, `key-sync`, against the noun-verb grammar.
- `key create` never replaces; replacing is `key cycle`, which keeps the old key. agent-forge's `create-key --force` existed only for its own cycle-key.
- wipcrypt gets `--key NAME` beside `--env`; without `--key` it behaves as agent-forge's copy, so its wrappers keep working. Alternative: replace `--env`, breaking every caller at once.
- Under `--key`, cycle-key reads `NAME.users` and, with `--env`, the legacy `.cache/key-users`, so agent-forge's registered roots stay in rotations during migration.
- Default vault is Personal (`KEY_OP_VAULT`), James's real vault; Private was a guess.
- 950-projects runs `hub project --update update` (project-manager's `projects` is archived). `update` never calls `hub update`; James runs `hub down`, `update`, then `hub`.
- CLI helpers each autoload what they call, so one helper autoloaded alone works under `zsh -f`. Alternative: callers autoload the whole library, which every repo would have to repeat.
- The progress wrappers call `command progress` and helpers run file commands through `command`, since the `progress` helper shadows the progress binary.

## Decisions 2026-10-30 (cheat v4)

- Fallback lives in cheat: flags dropped, longest existing sheet shown, note on stderr; tldr's exact page beats a local parent. Alternative: each tool resolving its own parent, which every repo would repeat.
- --help for zsh tools via `cheat-help <tool> "$@" && return 0`; `--help` anywhere or `-h` first, as James asked. Alternative: `--help` only as the first word, which misses `hub join --x --help`.
- Renderer: cheat passes its own tlrc config (configs/tlrc/cheat.toml: compact, bold headings) rather than changing the user's tlrc config or tldr's own pages. Headings are plain words, no icons. Alternative: emoji headings, which misalign in some terminals and every repo would have to match.
- Structure checks in cheatsheet-test are warnings unless --strict, so other repos can move over gradually; zsh-config's own sheets pass --strict. A sheet is a child when a `-` prefix of its name is a sheet beside it, which makes md-to-html a child of md (a name coincidence, harmless).
- `cheat update` now shows the update sheet; the tldr cache refresh became `cheat refresh`. Alternative: rename the update sheet, but `cheat update` is what CLAUDE.md and every other sheet already point at.
- Completions from other repos go in ~/.local/share/zsh/site-functions/, already on fpath before compinit; no per-tool change in zsh-config.

## Decisions 2026-11-01 (CLI helper library)

- col cannot see the caller's tty from inside $(...), so plain mode for a non-tty stdout comes from cli-init (CLI_PLAIN), and cheat sets a local CLI_PLAIN itself. Alternative: col testing stderr, which is wrong when only stdout is redirected.
- Icons live in cli-icon as UTF-8 byte escapes, since $'\U...' fails in a C locale (fresh machines, env -i). Alternative: \U escapes, which broke every test under env -i.
- The palette value is the first token after `=`; anything after is a comment, so `#rrggbb` needs no quoting. Rust and Swift parse the same way.
- cheat-render accepts both `: ` and ` - ` rows so other repos keep rendering; cheatsheet-test only warns on `: ` unless --strict.
- The 35-line top-sheet budget excludes the blank line every render now ends with (James's ask, 2026-11-01).
- config's schema is passed with --schema or linked as <tool>.schema.json. Alternative: link-only, which needs an install step in every tool.
- log accepts a bare number for ~N because zsh expands an unquoted ~1.

## Since 2026-11-01

- 404c7fb: agent-forge's six cheat-render/cheatsheet-test gaps (subcommands known from sheets, inline code without backticks, column width within the cap, `var` role, standard headings checked, multi-command rows).
- 8c9399c: CLICOLOR_FORCE keeps colour without a tty in cli-init and cheat; --plain and NO_COLOR still win.
- 0426901..5b8d15c (2026-11-03): key, wipcrypt ownership, helper autoloads, progress wrappers, 950-projects; see Decisions 2026-11-03.
- f4b208f (2026-11-03): cheatsheet-test skill-sheet mode (pushed by the hub).
- f749f35..3c4bd58 (2026-11-03): the CLI sweep; see Decisions 2026-11-03 (CLI sweep).
- Parked minors: an `export` line with two spaces or a tab is not matched by key; the key-users dedup is exact-string (`/a/b` and `/a/b/` are two roots).


## Next up

- [ ] User: read the improvements doc and choose ranks (carried forward from 2026-09-20-18-36-claude.md; may overlap the "choose which ranks" item above)
- [ ] Research release-download installer stubs (tlrc, asdf, others) (carried forward from 2026-10-06-11-15-claude.md; install-release now exists, so this may already be done)
- [ ] User: uConsole key files (carried forward verbatim from 2026-10-07-14-35-claude.md; may overlap "James: fill in uConsole keys" above)
- [ ] User: migrate other machines (pull, restart terminals, ./install) (carried forward verbatim from 2026-10-07-14-35-claude.md; may overlap "James: on each other machine" above)
- [ ] Merge branch `worktree-t322-asdf-github-token` into main and push (user, through the hub) (carried forward verbatim from 2026-10-16-11-15-claude.md; CURRENT_STATE records the merge as done and the push as not done, so only the push may be open)
- [/] t310 open until agent-forge's 5 sheets pass (hub, reminders, skills, trust, update-due) (carried forward from 2026-10-16-11-23-claude.md; CURRENT_STATE line 56 records t310 as [x] with agent-forge's 14 sheets passing, so this may be stale)
- [ ] t216 next (hub asked) (carried forward from 2026-10-16-11-23-claude.md; not in CURRENT_STATE; 2026-10-16-12-36 lists t216 among finished work, so it may be done)
