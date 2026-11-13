# iTerm2 shell integration (prompt marks, the current folder, command status),
# loaded only on macOS inside iTerm2, so kitty, other terminals and Linux are
# untouched. zinit fetches iTerm2's official zsh script once and caches it;
# `zinit update` refreshes it. Nothing is written to ~/.zshrc.
#
# It also feeds two user variables to the status bar, set before each prompt:
# gitBranch (the branch from .git/HEAD, read without running git, so it is
# instant even in a huge repo, and without dirty counts) and tasks (this
# repo's held hub tasks from the hub's task-counts cache, re-read only when
# that file changes). Neither ever blocks the prompt.
if is osx && [[ "$TERM_PROGRAM" == iTerm.app ]]; then
  zinit snippet https://iterm2.com/shell_integration/zsh

  typeset -g _iterm2_counts_file="${XDG_STATE_HOME:-$HOME/.local/state}/hub/task-counts.json"
  typeset -g _iterm2_counts_mtime="" _iterm2_counts=""
  function _iterm2_status_vars() {
    (( $+functions[iterm2_set_user_var] )) || return 0
    # The repo root and branch, walking up from here; no git process
    local dir="$PWD" head="" branch="" repo=""
    while [[ -n "$dir" ]]; do
      if [[ -e "$dir/.git" ]]; then
        repo="${dir:t}"
        if [[ -f "$dir/.git/HEAD" ]]; then
          head="$(<"$dir/.git/HEAD")"
        elif [[ -f "$dir/.git" ]]; then
          local gitdir="$(<"$dir/.git")"; gitdir="${gitdir#gitdir: }"
          [[ "$gitdir" != /* ]] && gitdir="$dir/$gitdir"
          [[ -f "$gitdir/HEAD" ]] && head="$(<"$gitdir/HEAD")"
        fi
        break
      fi
      [[ "$dir" == / ]] && break
      dir="${dir:h}"
    done
    if [[ "$head" == "ref: refs/heads/"* ]]; then
      branch="${head#ref: refs/heads/}"
    elif [[ -n "$head" ]]; then
      branch="${head[1,8]}"
    fi
    iterm2_set_user_var gitBranch "$branch"

    # Held tasks for this repo: "P3 M2" for priority and manual counts. The
    # repo's object is matched strictly, and each count only when it is
    # digits, so any other shape (no repos, another repo, not JSON) is "".
    local tasks="" block="" pri="" man=""
    if [[ -n "$repo" && -f "$_iterm2_counts_file" ]]; then
      zmodload -F zsh/stat b:zstat 2>/dev/null
      local -a mt; zstat -A mt +mtime -- "$_iterm2_counts_file" 2>/dev/null
      if [[ "${mt[1]}" != "$_iterm2_counts_mtime" ]]; then
        _iterm2_counts_mtime="${mt[1]}"
        _iterm2_counts="$(<"$_iterm2_counts_file")"
      fi
      local -a match mbegin mend
      if [[ "$_iterm2_counts" =~ "\"${repo}\":[[:space:]]*\{([^}]*)\}" ]]; then
        block="${match[1]}"
        [[ "$block" =~ '"priority":[[:space:]]*([0-9]+)' ]] && pri="${match[1]}"
        [[ "$block" =~ '"manual":[[:space:]]*([0-9]+)' ]] && man="${match[1]}"
      fi
      [[ "$pri" == <-> ]] && (( pri > 0 )) && tasks+="P$pri "
      [[ "$man" == <-> ]] && (( man > 0 )) && tasks+="M$man"
    fi
    iterm2_set_user_var tasks "${tasks% }"
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd _iterm2_status_vars
  # Set both at once too, so the bar never shows [undef] before a prompt
  _iterm2_status_vars
fi
