#!/usr/bin/env zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Modified hook to remind to nvm use
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      clr_magenta 'remember to nvm install'
      # nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      clr_magenta 'remember to nvm use'
      # nvm use >/dev/null
    fi
  # elif [ "$node_version" != "$(nvm version default)" ]; then
  #   # echo "Reverting to nvm default version"
  #   clr_magenta 'remember to nvm use default'
  #   # nvm use default >/dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

alias nvm-save="node -v > .nvmrc"

###-tns-completion-start-###
if [ -f /Users/jamesmacmillan/.tnsrc ]; then
    source /Users/jamesmacmillan/.tnsrc
fi
###-tns-completion-end-###
