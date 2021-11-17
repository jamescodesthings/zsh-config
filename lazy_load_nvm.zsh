#!/usr/bin/env zsh

export NODE_GLOBALS=(
  node
  npm
  npx
  yarn
)

for global in $NODE_GLOBALS; do
  alias $global="nvm $global"
done

alias nvm-save="nvm node -v > .nvmrc"

# Known NPX commands
alias create-react-app='npx create-react-app'
alias create-ink-app='npx create-ink-app'
