# Design: j wrapper, cheat template expansion, cheatsheet consolidation

Date: 2026-06-10

## Overview

Three related improvements:

1. **`functions/j`** — rich wrapper around rupa/z (`_Z_CMD=j` is already set in `env.zsh`), adding subcommands for listing, searching, adding, deleting, bumping, reordering, cleaning, and inspecting the z data file. Unknown args forward to `_z` for navigation.
2. **Cheat template expansion** — `cheat` pre-processes cheatsheet files before rendering, expanding `$VAR`/`${VAR}` in non-code text where the variable is set in the current environment.
3. **Cheatsheet consolidation** — merge several single-function sheets into broader topic sheets; rename `pico-8.md` to `pico-8-lang.md`; create new grouped sheets.

---

## 1. `j` wrapper function

### File

`functions/j` (new)

`_Z_CMD="j"` in `env.zsh` causes rupa/z to register `j` as an alias to `_z`. The new `functions/j` autoloaded function shadows that with a richer dispatcher. All navigation behaviour is preserved by forwarding to `_z "$@"`.

### Environment variables

| Var | Default | Purpose |
|---|---|---|
| `$_Z_DATA` | `$HOME/.z` | z data file path |
| `$EDITOR` | `micro` | editor for `reorder` and `edit` |

### Data file format

One entry per line: `path|rank|timestamp`

- `rank` — float; higher = higher priority (frecency score)
- `timestamp` — unix epoch of last visit

### Dependencies

`awk`, `sed`, `sort`, `wc`, `confirm` (internal), `is` (internal). `micro`/`$EDITOR` required only for `reorder` and `edit`.

### Subcommands

| Subcommand | Behaviour |
|---|---|
| `j list` | All entries sorted by rank descending. Format: `  path score` with score in `$c[info]`. |
| `j search <query>` | Filter entries by regex match on path, sorted by rank desc, same format. No query → forward to `_z`. |
| `j add <path>` | Resolve to absolute path (`$path:A`). Path does not need to exist on disk. If not in data file: append `path\|1\|now`. If already present: increment rank by 1. No path → forward to `_z`. |
| `j delete <query>` | Show matching entries (regex on path) → confirm → remove from data file. No query → forward to `_z`. |
| `j bump <query>` | Find entries matching query. If exactly one match: set rank to `max_rank + 1`. If multiple matches: list them and error asking for more specific query. No query → forward to `_z`. |
| `j reorder [--count N]` | Top N entries by rank (default 10) written to temp file as paths only (one per line). Open in `${EDITOR:-micro}`. On save+close: read new order, redistribute original N ranks (sorted descending) into new positions. Write updated ranks back to data file. |
| `j clean` | List entries whose path does not exist on disk → confirm → delete those entries from data file. |
| `j stats` | Entry count, top 5 by rank, oldest and newest entry by timestamp. |
| `j edit` | Open `$_Z_DATA` in `${EDITOR:-micro}` directly. |
| `j help` / `-h` / `--help` | Usage block. |
| `j <anything else>` | Forward to `_z "$@"`. Return same exit code. |

### Output format (`list`, `search`)

```
  /home/james/projects/7digital/ingestion-notifications 111
  /home/james/projects/personal/zsh-config 42
  /home/james/.claude/plugins 2
```

Path left-aligned with two-space indent, rank in `$c[info]` colour, single space separator. No column alignment (avoids tab-width issues).

### `j reorder` rank redistribution

1. Extract top N entries sorted by rank descending. Store their rank values as `original_ranks[]`.
2. Write paths only to `$TMPDIR/j-reorder-$$`.
3. Open in editor; wait for close.
4. Read back the reordered paths. Validate each path still exists in data file.
5. Validate the reordered file: only accept paths that were in the original N. Ignore any additions or deletions the user made — treat the file as a reorder of the original set only.
6. Sort `original_ranks[]` descending. Assign: new position 1 gets `original_ranks[1]`, position 2 gets `original_ranks[2]`, etc.
7. Update each path's rank in the data file. Leave all other entries (beyond top N) unchanged.

### `j delete` regex handling

Same pattern as `hist delete`:
- Validate regex upfront: `printf '' | grep -qE -- "$query" 2>/dev/null; if (( $? == 2 ))` → error
- Show matching entries before confirm
- Escape `/` in query for sed: `${query//\//\\/}`
- Delete with `LC_ALL=C sed -i -E "/$query_escaped/d" "$data_file"`

### Private helpers

| Helper | Purpose |
|---|---|
| `_j_data_file` | Echo `${_Z_DATA:-$HOME/.z}`; error if not readable |
| `_j_read_entries` | Read data file, output sorted by rank desc as `rank\|path\|timestamp` |
| `_j_print_entries` | Format and print entries: `  path rank` with colour |
| `_j_max_rank` | Echo the highest rank value in data file |

---

## 2. Cheat template expansion

### When it applies

Template expansion runs when `cheat` renders a sheet (any subcommand that calls the renderer: direct name lookup, `list` does NOT expand since no file is read). The `raw` subcommand shows the original file unexpanded.

### Expansion rules

- **Fenced code blocks** (lines matching ` ``` ` opening to ` ``` ` closing): passed through unchanged.
- **Inline backtick spans** (`` `...` `` within a line): content inside backticks is preserved literally.
- **All other text**: `$VARNAME` and `${VARNAME}` patterns are expanded if the variable is set in the current shell environment. If the variable is unset or empty, the original token is kept literally.

### Implementation

A helper function `_cheat_expand_vars <file>` emits the processed content to stdout. Called in `cheat` before the renderer, writing to a temp file:

```zsh
local tmp; tmp=$(mktemp)
_cheat_expand_vars "$sheet_file" > "$tmp"
$render_cmd "${render_args[@]}" "$tmp"
rm -f "$tmp"
```

`_cheat_expand_vars` uses awk:
- Track `fence` state on ` ``` ` lines
- For non-fenced lines: split on backtick pairs; expand vars (via `ENVIRON[name]`) in even-indexed segments (outside backticks); reassemble

```awk
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
  # Split on backtick pairs; expand outside, preserve inside
  line = $0; out = ""
  n = split(line, parts, "`")
  for (i = 1; i <= n; i++) {
    # Outside backtick pair (odd index), or last part when backticks are unclosed (n even)
    if (i % 2 == 1 || (i == n && n % 2 == 0)) {
      out = out expand_vars(parts[i])
    } else {
      out = out "`" parts[i] "`"
    }
  }
  print out
}
```

---

## 3. Cheatsheet consolidation

### Renames and deletions

| File | Action |
|---|---|
| `cheatsheets/pico-8.md` | Rename → `cheatsheets/pico-8-lang.md` |
| `cheatsheets/picoh.md` | Delete |
| `cheatsheets/aptr.md` | Delete |
| `cheatsheets/dsp.md` | Delete |
| `cheatsheets/npm-update-latest.md` | Delete |
| `cheatsheets/asdf-cleanup.md` | Delete |
| `cheatsheets/gcod.md` | Delete |
| `cheatsheets/gcom.md` | Delete |
| `cheatsheets/git-branch.md` | Delete |
| `cheatsheets/zshenv.md` | Delete |

### New / updated cheatsheets

| File | Contents |
|---|---|
| `cheatsheets/pico-8.md` (new) | Shell helpers: `picoh`, `pico`/`pico-8`/`pico8` aliases, `$PICO8` env var (uses template expansion to show current value), per-hostname params note |
| `cheatsheets/apt.md` (new) | `apti`, `apts`, `aptu`, `aptr` — full apt workflow with descriptions |
| `cheatsheets/docker.md` (new) | `dsp`, `docker-stop-all`/`dsa`, `dcup`, `dcdn` — full docker workflow |
| `cheatsheets/npm.md` (new) | `npm-update-latest` + all npm aliases: `npmst`, `npmg`, `npmL0`, `npmL0g`, `npmr`, `npmD`, `npmS`, `npmSE`, `npmDE`, `npmiy`, `npmU`, `ncu` etc. |
| `cheatsheets/asdf.md` (update) | Add `## Custom helpers` section with `asdf-cleanup` |
| `cheatsheets/git.md` (update) | Add entries for `gcod`, `gcom`, `git-branch` to existing custom helpers section |
| `cheatsheets/zshconfig.md` (update) | Add `## Per-machine env file` section covering `zshenv` command and `env.<hostname>.zsh` |
| `cheatsheets/j.md` (new) | Covers: what z does, all `j` subcommands, what navigates via `_z` directly (e.g. `j projects` → cd), z's own flags (`--add`, `--del`, `-l`, `-r`, `-t`, `-e`) |

---

## Implementation order

1. `functions/j` + `cheatsheets/j.md`
2. Cheat template expansion (`functions/cheat` update + `_cheat_expand_vars` helper)
3. Cheatsheet consolidation (renames, deletes, new/updated sheets)
4. Commit
