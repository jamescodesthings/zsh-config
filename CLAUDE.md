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
3. `env.zsh` — PATH, EDITOR, ASDF, exports; its last line sources `load_box_env.zsh`, which sources `env.<hostname>.zsh` if present
4. `zpm-zsh-colors` — `$c[...]` color variables used everywhere
5. `load_zinit.zsh` — installs zinit if missing, then sources it
6. `p10k.prompt.zsh` / `p10k.zsh` — prompt config
7. `plugins.zsh` — zinit plugin declarations
8. `completions.zsh` — completion setup
9. `aliases.zsh` — conditional aliases (checks `is available <tool>` before defining)
10. `wrap-progress.zsh` — when `progress` is installed, autoloads the `wrappers/` versions of `cp`, `mv`, `tar` and similar, and aliases the originals as `cpo`, `mvo` and so on
11. `load-direnv.zsh`, `load-fzf.zsh`, `configs/ls_colors/ls-colors.sh`
12. `private.zsh` (optional, not committed)
13. `$AI_CONFIG_DIR/zsh/aliases.zsh` from the agent-forge checkout, if present
14. `$READERR_DIR/zsh/readerr.zsh`; prints an error on every shell start when readerr is not cloned at `~/projects/readerr`

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

A failure shows up as an error printed to the terminal during startup; there is no log file. Without a TTY (an agent's shell, CI) the load check always prints `setopt:7: can't change option: monitor`, `(eval):1: can't change option: zle` and `gitstatus failed to initialize`; all three are expected there, and the exit code is still 0. A `readerr: ... not found` line means readerr is not cloned on that machine, not that the change broke anything. Files in `functions/`, `installers/` and `updaters/` have no `.zsh` extension, so name them explicitly when syntax-checking.

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
