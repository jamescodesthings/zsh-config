# iTerm2 shell integration (prompt marks, the current folder, command status),
# loaded only on macOS inside iTerm2, so kitty, other terminals and Linux are
# untouched. zinit fetches iTerm2's official zsh script once and caches it;
# `zinit update` refreshes it. Nothing is written to ~/.zshrc.
#
# It also feeds three user variables to the status bar, set before each
# prompt with no process started:
#   gitBranch  the branch from .git/HEAD, read without running git, so it is
#              instant even in a huge repo, and without dirty counts
#   lastCmd    the last command's exit code and time taken: "exit 3 · 12s",
#              "12s" or "exit 1"; empty when it succeeded in under 5 s, or
#              when the prompt came back with no command run
#   sshHost    this machine's short name when the shell is reached over SSH
#              (SSH_CONNECTION set), empty otherwise
if is osx && [[ "$TERM_PROGRAM" == iTerm.app ]]; then
  zinit snippet https://iterm2.com/shell_integration/zsh
  zmodload zsh/datetime 2>/dev/null

  typeset -g _iterm2_cmd_start="" _iterm2_last_status=0
  # preexec: a command is about to run
  function _iterm2_preexec() { _iterm2_cmd_start=$EPOCHREALTIME }
  # first precmd hook: keep the command's status before any hook changes $?
  function _iterm2_capture() { _iterm2_last_status=$? }

  function _iterm2_status_vars() {
    (( $+functions[iterm2_set_user_var] )) || return 0
    # The branch, walking up from here; no git process
    local dir="$PWD" head="" branch=""
    while [[ -n "$dir" ]]; do
      if [[ -e "$dir/.git" ]]; then
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

    # The last command: its code when it failed, its time when it was long
    local last=""
    if [[ -n "$_iterm2_cmd_start" ]]; then
      local -i secs=$(( EPOCHREALTIME - _iterm2_cmd_start ))
      local took=""
      if (( secs >= 3600 )); then
        took="$(( secs / 3600 ))h$(( secs % 3600 / 60 ))m"
      elif (( secs >= 60 )); then
        took="$(( secs / 60 ))m${(l:2::0:)$(( secs % 60 ))}s"
      elif (( secs >= 5 )); then
        took="${secs}s"
      fi
      (( _iterm2_last_status )) && last="exit $_iterm2_last_status"
      [[ -n "$took" ]] && last="${last:+$last · }$took"
    fi
    _iterm2_cmd_start=""
    iterm2_set_user_var lastCmd "$last"

    iterm2_set_user_var sshHost "${SSH_CONNECTION:+${HOST%%.*}}"
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook preexec _iterm2_preexec
  precmd_functions=(_iterm2_capture ${precmd_functions:#_iterm2_capture})
  add-zsh-hook precmd _iterm2_status_vars
  # Set them once now too, so the bar never shows [undef] before a prompt
  _iterm2_status_vars
fi
