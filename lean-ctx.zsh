

# lean-ctx shell hook — transparent CLI compression (90+ patterns)
_lean_ctx_cmds=(git npm pnpm yarn cargo docker docker-compose kubectl gh pip pip3 ruff go golangci-lint eslint prettier tsc ls find grep curl wget php composer)

_lc() {
    if [ -n "${LEAN_CTX_DISABLED:-}" ] || [ ! -t 1 ]; then
        command "$@"
        return
    fi
    '/opt/homebrew/bin/lean-ctx' -c "$@"
    local _lc_rc=$?
    if [ "$_lc_rc" -eq 127 ] || [ "$_lc_rc" -eq 126 ]; then
        command "$@"
    else
        return "$_lc_rc"
    fi
}

lean-ctx-on() {
  local SUPPRESS_ECHO=$1
  for _lc_cmd in "${_lean_ctx_cmds[@]}"; do
    if is alias "$_lc_cmd"; then
      ALIAS_CMD=$(alias "$_lc_cmd" | sed -E "s/$_lc_cmd='(.*)'/\1/")
      echo "alias $_lc_cmd already exists. Wrapping it with lean-ctx: $_lc_cmd -> _lc $ALIAS_CMD"
      alias "$_lc_cmd"="_lc $ALIAS_CMD"
    else
      alias "$_lc_cmd"="_lc $_lc_cmd"
    fi
  done
  alias k='_lc kubectl'
  export LEAN_CTX_ENABLED=1
  [ -z "$SUPPRESS_ECHO" ] && echo "lean-ctx: ON"
}

lean-ctx-off() {
  local SUPPRESS_ECHO=$1
  for _lc_cmd in "${_lean_ctx_cmds[@]}"; do
      unalias "$_lc_cmd" 2>/dev/null || true
  done
  unalias k 2>/dev/null || true
  unset LEAN_CTX_ENABLED
  [ -z "$SUPPRESS_ECHO" ] && echo "lean-ctx: OFF"
}

lean-ctx-raw() {
  LEAN_CTX_RAW=1 command "$@"
}

lean-ctx-status() {
  if [ -n "${LEAN_CTX_DISABLED:-}" ]; then
    echo "lean-ctx: DISABLED (LEAN_CTX_DISABLED is set)"
  elif [ -n "${LEAN_CTX_ENABLED:-}" ]; then
    echo "lean-ctx: ON"
  else
    echo "lean-ctx: OFF"
  fi
}

if [ -z "${LEAN_CTX_ACTIVE:-}" ] && [ -z "${LEAN_CTX_DISABLED:-}" ] && [ "${LEAN_CTX_ENABLED:-1}" != "0" ]; then
  command -v lean-ctx >/dev/null 2>&1 && lean-ctx-on 1
fi
# lean-ctx shell hook — end
