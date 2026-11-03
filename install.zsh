#!/usr/bin/env zsh
# Wrapped in braces so zsh parses the whole file before running it; see ./update.
{

source "${0:a:h}/installers/_stub"

autoload -Uz cheat-help
cheat-help install "$@" && exit 0

# -q, -v and --plain were read by cli-init in _stub; the installers it starts
# inherit them through the environment.
export CLI_PLAIN CLI_QUIET CLI_VERBOSE
set -- "${@:#(--plain|-q|--quiet|-v|--verbose)}"

# INSTALL_INSTALLERS_DIR points the run at another folder (tests/install)
dir="${INSTALL_INSTALLERS_DIR:-$INSTALLER_DIR}"

for script in "$dir"/*(N:t); do
  [[ "$script" == _* || "$script" == .DS_Store ]] && continue
  [[ -f "$dir/$script" ]] || continue
  say info "running installer $script"
  if is not executable "$dir/$script"; then
    say warn "$script is not executable, making it executable"
    chmod +x "$dir/$script"
  fi

  "$dir/$script"

  if is equal "$?" "0"; then
    say ok "ran $script"
  else
    say fail "$script failed"
    problem "$script failed"
    fix "$dir/$script" "rerun it alone"
  fi
  [[ -z "$CLI_QUIET" ]] && echo ""
done

problems || exit 1
}
