# j wrapper, cheat template expansion, cheatsheet consolidation — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add `j` (z wrapper with subcommands), cheat template expansion, and consolidate cheatsheets into grouped topic files.

**Architecture:** Three independent subsystems — new `functions/j` autoloaded function shadows `_Z_CMD=j` alias; `_cheat_expand_vars` awk helper added to `functions/cheat` for var expansion on render; cheatsheet consolidation is pure file create/update/delete with no code changes.

**Tech Stack:** zsh, awk, sed, sort, wc, rupa/z plugin, glow/bat/cat renderer

**Spec:** `docs/superpowers/specs/2026-06-10-j-cheat-template-design.md`

---

### Task 1: Create `functions/j`

**Files:**
- Create: `functions/j`

The `_Z_CMD=j` in `env.zsh` causes rupa/z to register `j` as an alias to `_z`. This autoloaded function shadows that with a richer dispatcher. Unknown args still forward to `_z`.

- [ ] **Step 1: Create `functions/j` with all helpers and subcommands**

```zsh
#!/usr/bin/env zsh

function _j_data_file() {
  local f="${_Z_DATA:-$HOME/.z}"
  if [[ ! -f "$f" ]]; then
    touch "$f" 2>/dev/null || {
      echo "${c[error]}error:${c[reset]} cannot create z data file: $f" >&2
      return 1
    }
  fi
  echo "$f"
}

function _j_read_entries() {
  local data_file
  data_file=$(_j_data_file) || return 1
  sort -t'|' -k2 -rn "$data_file"
}

function _j_print_entries() {
  while IFS='|' read -r path rank _; do
    printf '  %s %s%s%s\n' "$path" "${c[info]}" "$rank" "${c[reset]}"
  done
}

function _j_max_rank() {
  local data_file
  data_file=$(_j_data_file) || { echo "0"; return 0; }
  awk -F'|' 'BEGIN{m=0} {if ($2+0 > m) m=$2+0} END{print m}' "$data_file"
}

function _j_validate_regex() {
  local query="$1"
  printf '' | grep -qE -- "$query" 2>/dev/null
  if (( $? == 2 )); then
    echo "${c[error]}error:${c[reset]} invalid regex: $query"
    return 1
  fi
}

function j() {
  if (( ! $+functions[_z] )); then
    echo "${c[error]}error:${c[reset]} z plugin not loaded (rupa/z required)"
    return 1
  fi
  local DEPS=(awk sed sort)
  if ! deps "${DEPS[@]}"; then
    return 1
  fi

  if [[ $# -eq 0 ]]; then
    _z
    return $?
  fi

  local subcmd="$1"
  shift

  case "$subcmd" in

    -h|--help|help)
      echo "${c[h1]}j${c[reset]}"
      echo ""
      echo "${c[lead]}Wrapper around rupa/z with subcommands for managing directory frecency history.${c[reset]}"
      echo "${c[lead]}Unknown subcommands are forwarded directly to \`_z\` for navigation.${c[reset]}"
      echo ""
      echo "${c[h2]}Navigation (forwarded to z):${c[reset]}"
      echo "  j ${c[param]}<query>${c[reset]}              cd to highest-ranked directory matching query"
      echo ""
      echo "${c[h2]}Subcommands:${c[reset]}"
      echo "  ${c[flag]}list${c[reset]}                   list all entries sorted by rank"
      echo "  ${c[flag]}search${c[reset]} ${c[param]}[query]${c[reset]}       filter entries by regex (no query → navigate)"
      echo "  ${c[flag]}add${c[reset]} ${c[param]}[path]${c[reset]}           add or increment a path (no path → navigate)"
      echo "  ${c[flag]}delete${c[reset]} ${c[param]}[query]${c[reset]}       show matches, confirm, remove (no query → navigate)"
      echo "  ${c[flag]}bump${c[reset]} ${c[param]}[query]${c[reset]}         set matching entry to max rank + 1"
      echo "  ${c[flag]}reorder${c[reset]} ${c[flag]}[--count N]${c[reset]}   edit top N entries in \$EDITOR to reorder"
      echo "  ${c[flag]}clean${c[reset]}                  remove entries for non-existent directories"
      echo "  ${c[flag]}stats${c[reset]}                  show entry count, top 5, oldest/newest"
      echo "  ${c[flag]}edit${c[reset]}                   open z data file in \$EDITOR"
      echo "  ${c[flag]}help${c[reset]}, ${c[flag]}-h${c[reset]}, ${c[flag]}--help${c[reset]}     show this help"
      echo ""
      echo "${c[h2]}Environment:${c[reset]}"
      echo "  ${c[param]}_Z_DATA${c[reset]}   ${c[sub]}${_Z_DATA:-$HOME/.z}${c[reset]}"
      echo "  ${c[param]}EDITOR${c[reset]}    ${c[sub]}${EDITOR:-micro}${c[reset]}"
      ;;

    list)
      _j_read_entries | _j_print_entries
      ;;

    search)
      if [[ -z "$1" ]]; then _z; return $?; fi
      local query="$1"
      _j_validate_regex "$query" || return 1
      local found=0
      while IFS='|' read -r path rank _; do
        if printf '%s\n' "$path" | grep -qE -- "$query" 2>/dev/null; then
          printf '  %s %s%s%s\n' "$path" "${c[info]}" "$rank" "${c[reset]}"
          (( found++ ))
        fi
      done < <(_j_read_entries)
      (( found == 0 )) && echo "${c[warn]}no matches for \"$query\"${c[reset]}"
      ;;

    add)
      if [[ -z "$1" ]]; then _z; return $?; fi
      local data_file; data_file=$(_j_data_file) || return 1
      local abs_path="${1:A}"
      local now; now=$(date +%s)
      if awk -F'|' -v p="$abs_path" '$1==p{found=1} END{exit !found}' "$data_file" 2>/dev/null; then
        local tmp; tmp=$(mktemp)
        awk -F'|' -v p="$abs_path" 'BEGIN{OFS="|"} $1==p{$2=$2+1} {print}' "$data_file" > "$tmp" && mv "$tmp" "$data_file"
        echo "${c[success]}incremented:${c[reset]} $abs_path"
      else
        printf '%s|1|%s\n' "$abs_path" "$now" >> "$data_file"
        echo "${c[success]}added:${c[reset]} $abs_path"
      fi
      ;;

    delete)
      if [[ -z "$1" ]]; then _z; return $?; fi
      local query="$1"
      _j_validate_regex "$query" || return 1
      local data_file; data_file=$(_j_data_file) || return 1
      local -a matches=()
      while IFS='|' read -r path _ _; do
        printf '%s\n' "$path" | grep -qE -- "$query" 2>/dev/null && matches+=("$path")
      done < "$data_file"
      if (( ${#matches[@]} == 0 )); then
        echo "${c[info]}no matches found${c[reset]}"; return 0
      fi
      echo "${c[h2]}Matches for '${query}':${c[reset]}"
      for p in "${matches[@]}"; do echo "  $p"; done
      echo ""
      if confirm "${c[warn]}Delete ${#matches[@]} entries?${c[reset]}"; then
        local query_escaped="${query//\//\\/}"
        LC_ALL=C sed -i -E "/$query_escaped/d" "$data_file"
        echo "${c[success]}deleted ${#matches[@]} entries${c[reset]}"
      else
        echo "${c[warn]}cancelled${c[reset]}"
      fi
      ;;

    bump)
      if [[ -z "$1" ]]; then _z; return $?; fi
      local query="$1"
      _j_validate_regex "$query" || return 1
      local data_file; data_file=$(_j_data_file) || return 1
      local -a matches=()
      while IFS='|' read -r path _ _; do
        printf '%s\n' "$path" | grep -qE -- "$query" 2>/dev/null && matches+=("$path")
      done < "$data_file"
      if (( ${#matches[@]} == 0 )); then
        echo "${c[warn]}no matches for \"$query\"${c[reset]}"; return 1
      fi
      if (( ${#matches[@]} > 1 )); then
        echo "${c[error]}error:${c[reset]} multiple matches — be more specific:"
        for p in "${matches[@]}"; do echo "  $p"; done
        return 1
      fi
      local target="${matches[1]}"
      local max_rank new_rank
      max_rank=$(_j_max_rank)
      new_rank=$(awk -v m="$max_rank" 'BEGIN{print m+1}')
      local tmp; tmp=$(mktemp)
      awk -F'|' -v p="$target" -v r="$new_rank" 'BEGIN{OFS="|"} $1==p{$2=r} {print}' "$data_file" > "$tmp" && mv "$tmp" "$data_file"
      echo "${c[success]}bumped:${c[reset]} $target ${c[info]}(rank → $new_rank)${c[reset]}"
      ;;

    reorder)
      local count=10
      [[ "$1" == "--count" && -n "$2" ]] && count="$2"
      local data_file; data_file=$(_j_data_file) || return 1
      local -a top_paths=() top_ranks=()
      local i=0
      while IFS='|' read -r path rank _; do
        if (( i >= count )); then break; fi
        top_paths+=("$path"); top_ranks+=("$rank")
        i=$(( i + 1 ))
      done < <(_j_read_entries)
      if (( ${#top_paths[@]} == 0 )); then
        echo "${c[warn]}no entries in z history${c[reset]}"; return 0
      fi
      local tmp; tmp=$(mktemp)
      printf '%s\n' "${top_paths[@]}" > "$tmp"
      ${EDITOR:-micro} "$tmp"
      local -a new_paths=()
      while IFS= read -r p; do [[ -n "$p" ]] && new_paths+=("$p"); done < "$tmp"
      rm -f "$tmp"
      local -a valid_paths=()
      for p in "${new_paths[@]}"; do
        (( ${top_paths[(Ie)$p]} )) && valid_paths+=("$p")
      done
      if (( ${#valid_paths[@]} == 0 )); then
        echo "${c[error]}error:${c[reset]} no valid paths in reordered file"; return 1
      fi
      local -a sorted_ranks=("${(On)top_ranks[@]}")
      local -A new_rank_map=()
      for (( i=1; i<=${#valid_paths[@]}; i++ )); do
        new_rank_map["${valid_paths[$i]}"]="${sorted_ranks[$i]:-1}"
      done
      local tmp2; tmp2=$(mktemp)
      while IFS='|' read -r path rank ts; do
        if [[ -n "${new_rank_map[$path]}" ]]; then
          printf '%s|%s|%s\n' "$path" "${new_rank_map[$path]}" "$ts"
        else
          printf '%s|%s|%s\n' "$path" "$rank" "$ts"
        fi
      done < "$data_file" > "$tmp2"
      mv "$tmp2" "$data_file"
      echo "${c[success]}reordered ${#valid_paths[@]} entries${c[reset]}"
      ;;

    clean)
      local data_file; data_file=$(_j_data_file) || return 1
      local -a stale=()
      while IFS='|' read -r path _ _; do
        is not existing "$path" && stale+=("$path")
      done < "$data_file"
      if (( ${#stale[@]} == 0 )); then
        echo "${c[success]}no stale entries${c[reset]}"; return 0
      fi
      echo "${c[h2]}Stale entries (directory no longer exists):${c[reset]}"
      for p in "${stale[@]}"; do echo "  ${c[warn]}${p}${c[reset]}"; done
      echo ""
      if confirm "Delete ${#stale[@]} stale entries?"; then
        local tmp; tmp=$(mktemp)
        while IFS='|' read -r path rank ts; do
          is existing "$path" && printf '%s|%s|%s\n' "$path" "$rank" "$ts"
        done < "$data_file" > "$tmp"
        mv "$tmp" "$data_file"
        echo "${c[success]}cleaned ${#stale[@]} entries${c[reset]}"
      else
        echo "${c[warn]}cancelled${c[reset]}"
      fi
      ;;

    stats)
      local data_file; data_file=$(_j_data_file) || return 1
      local total; total=$(wc -l < "$data_file" | tr -d ' ')
      echo "${c[h1]}j stats:${c[reset]}"
      echo "  ${c[info]}${total}${c[reset]} total entries"
      echo ""
      echo "${c[h2]}Top 5 by rank:${c[reset]}"
      _j_read_entries | head -5 | _j_print_entries
      echo ""
      echo "${c[h2]}Oldest entry:${c[reset]}"
      sort -t'|' -k3 -n "$data_file" | head -1 | while IFS='|' read -r path rank ts; do
        local d; d=$(date -d "@$ts" 2>/dev/null || date -r "$ts" 2>/dev/null || echo "ts:$ts")
        printf '  %s %s%s%s (%s)\n' "$path" "${c[info]}" "$rank" "${c[reset]}" "$d"
      done
      echo ""
      echo "${c[h2]}Newest entry:${c[reset]}"
      sort -t'|' -k3 -rn "$data_file" | head -1 | while IFS='|' read -r path rank ts; do
        local d; d=$(date -d "@$ts" 2>/dev/null || date -r "$ts" 2>/dev/null || echo "ts:$ts")
        printf '  %s %s%s%s (%s)\n' "$path" "${c[info]}" "$rank" "${c[reset]}" "$d"
      done
      ;;

    edit)
      local data_file; data_file=$(_j_data_file) || return 1
      ${EDITOR:-micro} "$data_file"
      ;;

    *)
      _z "$subcmd" "$@"
      return $?
      ;;
  esac
}

j "$@"
```

- [ ] **Step 2: Verify the file is executable and loads cleanly**

```bash
chmod +x functions/j
zsh -c 'source functions/j; echo "loaded ok"'
```
Expected: `loaded ok`

- [ ] **Step 3: Commit**

```bash
git add functions/j
git commit -m "add j wrapper around rupa/z with subcommands"
```

---

### Task 2: Create `cheatsheets/j.md`

**Files:**
- Create: `cheatsheets/j.md`

- [ ] **Step 1: Create `cheatsheets/j.md`**

```markdown
# j

> Wrapper around rupa/z (directory frecency). Subcommands manage z history; unrecognised args navigate.

## Navigation

- Jump to highest-ranked directory matching query:

`j <query>`

- Jump to highest-ranked directory matching multiple terms:

`j projects zsh`

## Subcommands

- List all tracked directories sorted by rank:

`j list`

- Search entries by regex:

`j search <regex>`

- Add a path to history (increments rank if already present):

`j add <path>`

- Delete entries matching a regex (shows matches, confirms):

`j delete <regex>`

- Set a single matching entry to max rank + 1 (bring to top):

`j bump <regex>`

- Reorder top 10 entries in $EDITOR (opens paths-only file):

`j reorder`

- Reorder top N entries:

`j reorder --count <n>`

- Remove entries for directories that no longer exist:

`j clean`

- Show stats: total, top 5, oldest/newest:

`j stats`

- Open z data file directly in $EDITOR:

`j edit`

## How frecency works

> z tracks directories you visit and scores them by frequency + recency.
> Higher score = higher priority when jumping. `j bump` promotes an entry above all others.

## Environment

- `_Z_DATA` — path to z data file (default: `~/.z`)
- `EDITOR` — editor for `reorder` and `edit` (default: `micro`)

## Related commands

- Show all tracked directories:
`j list`

- Full z reference (upstream):
`tldr z`
```

- [ ] **Step 2: Verify renders cleanly**

```bash
source functions/cheat; cheat j
```
Expected: renders without error.

- [ ] **Step 3: Commit**

```bash
git add cheatsheets/j.md
git commit -m "add j cheatsheet"
```

---

### Task 3: Add `_cheat_expand_vars` to `functions/cheat` and update render call

**Files:**
- Modify: `functions/cheat` (add helper before `cheat()`, change line 196)

`functions/cheat` line 195-196 currently:
```zsh
        if is file "$CHEATSHEET_DIR/$sheet_name.md"; then
          $render_cmd "${render_args[@]}" "$CHEATSHEET_DIR/$sheet_name.md"
```

- [ ] **Step 1: Add `_cheat_expand_vars` function before `function cheat() {`**

Insert this block at the very beginning of `functions/cheat`, after the shebang line (`#!/usr/bin/env zsh`), before `function cheat() {`:

```zsh
function _cheat_expand_vars() {
  local file="$1"
  awk '
    function expand_vars(s,    result, rest, tok, name, val) {
      result = ""
      rest = s
      while (match(rest, /\$\{?[A-Za-z_][A-Za-z0-9_]*\}?/)) {
        result = result substr(rest, 1, RSTART-1)
        tok  = substr(rest, RSTART, RLENGTH)
        rest = substr(rest, RSTART+RLENGTH)
        name = tok; gsub(/[${}]/, "", name)
        val  = ENVIRON[name]
        result = result (val != "" ? val : tok)
      }
      return result rest
    }
    /^```/ { fence = !fence; print; next }
    fence  { print; next }
    {
      line = $0; out = ""
      n = split(line, parts, "`")
      for (i = 1; i <= n; i++) {
        if (i % 2 == 1 || (i == n && n % 2 == 0)) {
          out = out expand_vars(parts[i])
        } else {
          out = out "`" parts[i] "`"
        }
      }
      print out
    }
  ' "$file"
}

```

- [ ] **Step 2: Update the render call in the `*)` case (non-raw local sheet)**

Change (line 195-196):
```zsh
        if is file "$CHEATSHEET_DIR/$sheet_name.md"; then
          $render_cmd "${render_args[@]}" "$CHEATSHEET_DIR/$sheet_name.md"
```

To:
```zsh
        if is file "$CHEATSHEET_DIR/$sheet_name.md"; then
          local _cheat_tmp; _cheat_tmp=$(mktemp)
          _cheat_expand_vars "$CHEATSHEET_DIR/$sheet_name.md" > "$_cheat_tmp"
          $render_cmd "${render_args[@]}" "$_cheat_tmp"
          rm -f "$_cheat_tmp"
```

- [ ] **Step 3: Verify the change loads and raw subcommand is unaffected**

```bash
zsh -c 'source functions/cheat; echo "loaded ok"'
```
Expected: `loaded ok`

If `PICO8` is set in current shell, test expansion: `source functions/cheat; cheat j` should render `j.md` without error. The `raw` subcommand (`cheat raw j`) should still use `cat` directly (no change in that branch).

- [ ] **Step 4: Commit**

```bash
git add functions/cheat
git commit -m "add cheat template expansion for env vars in cheatsheets"
```

---

### Task 4: Rename `pico-8.md` → `pico-8-lang.md`; create new `pico-8.md`; delete `picoh.md`

**Files:**
- Rename: `cheatsheets/pico-8.md` → `cheatsheets/pico-8-lang.md`
- Create: `cheatsheets/pico-8.md`
- Delete: `cheatsheets/picoh.md`

- [ ] **Step 1: Rename pico-8.md to pico-8-lang.md**

```bash
git mv cheatsheets/pico-8.md cheatsheets/pico-8-lang.md
```

- [ ] **Step 2: Create new `cheatsheets/pico-8.md`**

```markdown
# pico-8

> PICO-8 zsh helpers. Requires `$PICO8` set to binary path (in per-host env file).

## Usage

- Launch PICO-8 with current directory as cart root (background):

`picoh`

- Launch PICO-8 without a specific cart root:

`pico`

## Environment

- `PICO8` — path to the PICO-8 binary (set in `env.$HOSTNAME.zsh`, e.g. `env.MacBookPro.zsh`)

## Notes

> On machines other than `zerocalc`, `picoh` passes `-width 512 -height 512 -window_x 0 -window_y 0`.
> `pico`, `pico-8`, and `pico8` are aliases — all launch the same binary.
> Current binary: `$PICO8`

## Related commands

- Edit the per-host env file:
`cheat zshconfig`

- PICO-8 language/API reference:
`cheat pico-8-lang`
```

- [ ] **Step 3: Delete picoh.md**

```bash
git rm cheatsheets/picoh.md
```

- [ ] **Step 4: Commit**

```bash
git add cheatsheets/pico-8.md
git commit -m "consolidate pico-8 cheatsheets: rename lang ref to pico-8-lang, create shell helper sheet"
```

---

### Task 5: Create `apt.md`; delete `aptr.md`

**Files:**
- Create: `cheatsheets/apt.md`
- Delete: `cheatsheets/aptr.md`

- [ ] **Step 1: Create `cheatsheets/apt.md`**

```markdown
# apt

> apt package management aliases.

## Aliases

- Install a package:

`apti <package-name>`

- Search for a package:

`apts <query>`

- Update package lists and upgrade all installed packages:

`aptu`

- Remove a package and autoremove orphaned dependencies:

`aptr <package-name>`

## Notes

> `aptr` runs `sudo apt remove -y <name>` then `sudo apt autoremove -y`.
> `aptu` runs `sudo apt update && sudo apt upgrade -y`.
> All aliases are only defined when `apt` is available.

## Related commands

- Full apt reference:
`tldr apt`
```

- [ ] **Step 2: Delete aptr.md**

```bash
git rm cheatsheets/aptr.md
```

- [ ] **Step 3: Commit**

```bash
git add cheatsheets/apt.md
git commit -m "consolidate apt cheatsheets into apt.md"
```

---

### Task 6: Create `docker.md`; delete `dsp.md`

**Files:**
- Create: `cheatsheets/docker.md`
- Delete: `cheatsheets/dsp.md`

- [ ] **Step 1: Create `cheatsheets/docker.md`**

```markdown
# docker

> Docker aliases and helpers.

## Container management

- Stop all running containers and prune system + dangling volumes:

`dsp`

- Stop all running containers (without pruning):

`docker-stop-all`

`dsa`

## Compose

- Start services in detached mode:

`dcup`

- Stop and remove containers and volumes:

`dcdn`

## Notes

> `dsp` is destructive: removes stopped containers, unused images, networks, and build cache.
> `dcup` = `docker compose up -d`
> `dcdn` = `docker compose down -v`
> All aliases only defined when `docker` is available.

## Related commands

- Full docker reference:
`tldr docker`

- Docker compose reference:
`tldr docker-compose`
```

- [ ] **Step 2: Delete dsp.md**

```bash
git rm cheatsheets/dsp.md
```

- [ ] **Step 3: Commit**

```bash
git add cheatsheets/docker.md
git commit -m "consolidate docker cheatsheets into docker.md"
```

---

### Task 7: Create `npm.md`; delete `npm-update-latest.md`

**Files:**
- Create: `cheatsheets/npm.md`
- Delete: `cheatsheets/npm-update-latest.md`

- [ ] **Step 1: Create `cheatsheets/npm.md`**

```markdown
# npm

> npm aliases and helpers.

## Running

- Start the project:

`npmst`

- Run a script:

`npmr <script>`

## Installing

- Install a dependency (save to dependencies):

`npmS <pkg>`

- Install a dev dependency:

`npmD <pkg>`

- Install exact version (no semver range):

`npmSE <pkg>`

- Install exact dev dependency:

`npmDE <pkg>`

- Install with legacy peer deps:

`npmil`

- Install exact with legacy peer deps:

`npmSEl <pkg>`

- Install exact dev with legacy peer deps:

`npmDEl <pkg>`

- Install globally:

`npmg <pkg>`

- Init new project (skip prompts):

`npmiy`

## Uninstalling

- Uninstall a package:

`npmU <pkg>`

- Uninstall with legacy peer deps:

`npmUl <pkg>`

- Uninstall global package:

`npmUG <pkg>`

## Listing

- List installed packages (local):

`npmL0`

- List installed packages (global):

`npmL0g`

## Updating

- Interactively update outdated packages to latest, one at a time:

`npm-update-latest`

`ncu`

## Notes

> `npm-update-latest` runs `npm outdated --json`, prompts `[y/n]` for each outdated package,
> then runs `npm install <pkg>@latest --save` for confirmed updates.
> All aliases only defined when `npm` is available.

## Related commands

- Full npm reference:
`tldr npm`
```

- [ ] **Step 2: Delete npm-update-latest.md**

```bash
git rm cheatsheets/npm-update-latest.md
```

- [ ] **Step 3: Commit**

```bash
git add cheatsheets/npm.md
git commit -m "consolidate npm cheatsheets into npm.md"
```

---

### Task 8: Update `asdf.md`; delete `asdf-cleanup.md`

**Files:**
- Modify: `cheatsheets/asdf.md`
- Delete: `cheatsheets/asdf-cleanup.md`

Current `asdf.md` ends with `# Related commands` section. Add a `# Custom helpers` section before it.

- [ ] **Step 1: Add `## Custom helpers` section to `asdf.md`**

The `# Related commands` section at the bottom of `asdf.md` currently reads:
```markdown
# Related commands

- Full asdf reference
`tldr asdf`
```

Insert before that block:
```markdown
# Custom helpers

- Remove all non-current versions of every installed plugin:

`asdf-cleanup`

```

So the file ends with:
```markdown
# Custom helpers

- Remove all non-current versions of every installed plugin:

`asdf-cleanup`

# Related commands

- Full asdf reference
`tldr asdf`
```

- [ ] **Step 2: Delete asdf-cleanup.md**

```bash
git rm cheatsheets/asdf-cleanup.md
```

- [ ] **Step 3: Commit**

```bash
git add cheatsheets/asdf.md
git commit -m "merge asdf-cleanup into asdf cheatsheet"
```

---

### Task 9: Update `git.md`; delete `gcod.md`, `gcom.md`, `git-branch.md`

**Files:**
- Modify: `cheatsheets/git.md`
- Delete: `cheatsheets/gcod.md`, `cheatsheets/gcom.md`, `cheatsheets/git-branch.md`

Current `git.md` `# Aliases` section lists gcm, gap, grbi, gcom, gcod, root — but without detail on what gcom/gcod read from config, or git-branch. Add a `## Gitflow` subsection and a `## Utilities` subsection before `# Related commands`.

- [ ] **Step 1: Append sections to `git.md` before `# Related commands`**

Current `git.md` ends with:
```markdown
- CD to git root of current repo:

`root`

# Related commands
```

Insert before `# Related commands`:
```markdown
## Gitflow

- Check out the main branch (reads `git config gitflow.branch.main`, defaults to `main`):

`gcom`

- Check out the develop branch (reads `git config gitflow.branch.develop`):

`gcod`

## Utilities

- Print the current branch name:

`git-branch`

```

So the `# Aliases` section gains two new subsections, and the file reads:
```markdown
# Aliases

- Commit with message:

`gcm "message"`

- Stage hunks interactively:

`gap`

- Interactive rebase on last N commits:

`grbi HEAD~<n>`

- Checkout main/master branch:

`gcom`

- Checkout develop branch:

`gcod`

- CD to git root of current repo:

`root`

## Gitflow

- Check out the main branch (reads `git config gitflow.branch.main`, defaults to `main`):

`gcom`

- Check out the develop branch (reads `git config gitflow.branch.develop`):

`gcod`

## Utilities

- Print the current branch name:

`git-branch`

# Related commands
...
```

- [ ] **Step 2: Delete the three individual cheatsheets**

```bash
git rm cheatsheets/gcod.md cheatsheets/gcom.md cheatsheets/git-branch.md
```

- [ ] **Step 3: Commit**

```bash
git add cheatsheets/git.md
git commit -m "merge gcod/gcom/git-branch cheatsheets into git.md"
```

---

### Task 10: Update `zshconfig.md`; delete `zshenv.md`

**Files:**
- Modify: `cheatsheets/zshconfig.md`
- Delete: `cheatsheets/zshenv.md`

Current `zshconfig.md` already mentions `zshenv` in the `# Notes` section: `> Use zshenv to edit this machine's env file (env.<hostname>.zsh).`

Add a `# Per-machine env file` section before `# Related commands` with full detail.

- [ ] **Step 1: Add `# Per-machine env file` section to `zshconfig.md`**

Current `zshconfig.md` ends with:
```markdown
# Notes

> Use zshenv to edit this machine's env file (env.<hostname>.zsh).
> After editing, run reload <function> or reload all to apply changes.

# Related commands
```

Insert before `# Related commands`:
```markdown
# Per-machine env file

- Open the env file for the current hostname in `micro`:

`zshenv`

## Notes

> Opens `$CUSTOM_DIR/env.<hostname>.zsh` — sourced automatically by `load_box_env.zsh` on shell start.
> Use for machine-specific PATH entries, tool config, and env vars like `$PICO8`.
> Hostname comes from `get-hostname` (strips domain from `uname -n`).

```

- [ ] **Step 2: Delete zshenv.md**

```bash
git rm cheatsheets/zshenv.md
```

- [ ] **Step 3: Commit**

```bash
git add cheatsheets/zshconfig.md
git commit -m "merge zshenv into zshconfig cheatsheet"
```
