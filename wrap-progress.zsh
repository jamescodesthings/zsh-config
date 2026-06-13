# wrap-progress.zsh

if ! is available progress; then
  return
fi

_progress_cmds=(cp mv dd tar rsync gzip gunzip bzip2 bunzip2 xz unxz zip unzip)

fpath=("$CUSTOM_DIR/wrappers" $fpath)

for _cmd in $_progress_cmds; do
  if is available "$_cmd"; then
    autoload -Uz "$_cmd"
    alias "${_cmd}o"="command $_cmd"
  fi
done

unset _progress_cmds _cmd
