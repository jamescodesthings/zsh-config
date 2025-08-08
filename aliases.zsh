#!/usr/bin/env zsh

alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'

# Compatibility architecture mode (rosetta)
if is m1; then
  alias rosetta='arch -x86_64'
  alias rosetta-shell='arch -x86_64 $(which zsh)'

  alias unquarantine='sudo xattr -rd com.apple.quarantine'
fi

alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'

# OSX Development
if is osx; then
  alias xcode='open /Applications/Xcode.app'
  # # Emulator/simulator

  # if is available xcodes; then
  #   local SELECTED=$(xcodes select -p)
  #   alias simulator="open $SELECTED/Applications/Simulator.app"
  # else
  #   alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
  # fi
  # OSX Flush DNS command
  alias flush-dns='sudo killall -HUP mDNSResponder'

  # Engineius: Mac Mini SSH
  # alias mac-mini='sudo ssh administrator@92.207.254.162 -p8004 -L5900:127.0.0.1:5900'
  alias mac-mini='sudo ssh administrator@37.191.100.181 -p8003 -L5900:127.0.0.1:5900'
  alias set-xcode-12='sudo xcode-select -s /Applications/Xcode_12.app'
  alias set-xcode-13='sudo xcode-select -s /Applications/Xcode.app'

  alias plistbuddy="/usr/libexec/PlistBuddy"
  alias copy="pbcopy"
  alias paste="pbpaste"
fi

# Linux Specific
if is linux; then
  alias open='xdg-open'
  alias copy='xclip -sel clipboard'
  alias paste='xclip -sel clipboard'
  alias ls='ls --color -h --group-directories-first'
fi

# Shell related
alias asch='alias | grep'
alias rst='source ~/.zshrc'
alias cl='clear'
alias oh='open .'
alias count='ls -b1 | wc -l' # Count files in current directory
alias cx='chmod +x'
alias lla='ls -la'
alias la='ls -a'
alias l1='ls -1'
alias l1a='ls -1a'
alias la1='l1a'

# https://github.com/rupa/z
alias j='z'
alias jx='z -x .'
alias jl='z -l'

if is available exa; then
  alias ls='exa'
fi

if is available terraform; then
  alias tf='terraform'
fi

if is available batcat; then
  alias bat='batcat'
fi

if is available yank-cli; then
  alias yank='yank-cli'
fi

if is available code; then
  alias zshconfig='code ~/.custom'
elif is available subl; then
  alias zshconfig='subl ~/.custom'
elif is available nano; then
  alias zshconfig='nano ~/.zshrc'
else
  alias zshconfig='open ~/.custom'
fi

# Programs/Application specific
# Android Emulators
if is available emulator; then
  alias emulator-list='emulator -list-avds'
  alias emulator-start='emulator -avd'
fi

# Shorthand for pycharm
if is available pycharm; then
  alias pc='pycharm'
fi

# Openscad helpers
if is osx && is existing /Applications/OpenSCAD.app; then
  alias scad='open /Applications/OpenSCAD.app'
  alias scad-libs='cd ~/Documents/OpenSCAD/libraries'
  alias openscad='/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD'
fi

if is osx && is existing /Applications/Google\ Chrome.app; then
  alias chrome='open -a /Applications/Google\ Chrome.app'
fi

# Simplify3D Helper
if is osx && is existing /Applications/Simplify3D-4.1.2/Simplify3D.app; then
  alias wipe-simplify='rm ~/Library/Preferences/com.Simplify3D.S3D-Software.plist && rm -rf ~/Library/Application\ Support/Simplify3D'
fi

if is available navi; then
  zle -N _navi_widget
  bindkey '^a' _navi_widget

  export NAVI_INTEGRATED=true

  alias navi='navi --print'
  alias navic='navi --cheatsh'
  alias navit='navi --tldr'
  alias naviq='navi --query'
else
  export NAVI_INTEGRATED=false
fi

# Git
if is available git; then
  if is available g; then
    # Unalias g from OMZ:git
    unalias g
    unalias gcm
    unalias gcd
    unalias grbi
  fi

  alias grbi='git rebase -i --ignore-date'
  alias gcm='git commit -m'
  alias gcmn='git commit --no-verify -m'
  alias gbD='git branch -D'
  alias gm='git merge'
  alias gmff='git merge --ff-only'
  alias gms="git merge --squash"

  alias gt='git tag'
  alias git-skip='git update-index --skip-worktree'
  alias git-unskip='git update-index --no-skip-worktree'
  alias git-list-skipped='git ls-files -v . | grep "^S"'

  # When you fuck up a commit, but don't push
  alias git-i-fucked-up='git reset HEAD~1'
  # When you fuck up local so bad it looks unfixable
  alias grhho='git-i-really-fucked-up'

  # For easier programmatic use
  alias gb='git --no-pager branch'
  alias gbr='git --no-pager branch --remote'
  alias gd="git --no-pager diff"

  # Git Cherry pick and edit message
  alias gcpe="git cherry-pick -e"

  unalias gap
  alias gap='git add -p'
fi

# Node
if is existing "$ASDF_DATA_DIR/shims/npm"; then
  alias npmst='npm start'
  alias npmg='npm i -g'
  alias npmL0g='npm list -g --depth=0 2>/dev/null'
  alias npmL0='npm list --depth=0 2>/dev/null'
  alias npmr='npm run'
  # alias npmi='npm i'
  alias npmil='npm i --legacy-peer-deps'
  alias npmD='npm i -D'
  alias npmS='npm i -S'
  alias npmSE='npm i -E'
  alias npmDE='npm i -D -E'
  alias npmSEl='npm i -E --legacy-peer-deps'
  alias npmDEl='npm i -D -E --legacy-peer-deps'
  alias npmiy='npm init -y'
  alias npmU='npm uninstall -S -D'
  alias npmUl='npm uninstall -S -D --legacy-peer-deps'
  alias npmUG='npm uninstall -g'
  alias npm-check-update='npx npm-check -u -E'
  alias ncu='npm-check-update'
fi

if is existing "$ASDF_DATA_DIR/shims/yarn"; then

  alias y="yarn"
  alias yr="yarn run"
  alias yst="yarn start"
  alias yt="yarn test"

  alias yinit="yarn init"
  alias yi="yarn install"
  alias ySE="yarn add --exact"
  alias yDE="yarn add --dev --exact"
  alias yrm="yarn remove"
  alias yout="yarn outdated"
  alias yui="yarn upgrade-interactive --latest"
  alias yG="yarn global add"
  alias yGu="yarn global upgrade --exact"
  alias yGrm="yarn global remove"
  alias yL0g="yarn global list"
  alias yL0="yarn list --depth=0"
  alias ycc="yarn cache clean"
  alias yuc="yarn global upgrade && yarn cache clean"
fi

# Python
if is available python; then
  alias pip='python -m pip'
  alias sudo-python='sudo $(asdf which python)'
  alias sudo-pip='sudo $(asdf which python) -m pip'
fi

# Gron
if is available gron; then
  alias ungron="gron --ungron"
fi

# TheFuck (type fuck to fix it)
if is available thefuck; then
  eval $(thefuck --alias)
fi

if is available conda; then
  alias conda-save='conda env export > environment.yml'
fi

if is alias fd; then
  unalias fd
fi

# Replaced by fn md
if is alias md; then
  unalias md
fi

if is available webstorm; then
  alias ws="webstorm"
fi

if is available http; then
  alias http="http --verify=no"
  alias https="https --verify=no"
fi

if is ubuntu; then
  alias bigfiles="sudo du -ahd1 | sort -rh | head"
fi

if is available docker; then
  alias docker-stop-all='docker stop $(docker ps -q)'
  alias dsa="docker-stop-all"
  if is alias dsp; then
    unalias dsp
  fi
  alias dsp='docker system prune -f && docker volume rm $(docker volume ls -qf dangling=true)'
  if is alias dcdn; then
    unalias dcdn
  fi
  alias dcdn='docker compose down -v'
  alias browsh="docker run -it --rm browsh/browsh"
fi

export PATH="$PATH:/home/james/.dotnet/tools"

if is available upgrade-assistant; then
  export ORIGINAL_UPGRADE_ASSISTANT=$(which upgrade-assistant)
  alias upgrade-assistant='DOTNET_ROOT=$(asdf where dotnet) $ORIGINAL_UPGRADE_ASSISTANT'
fi

if is available gh; then
  alias ghc='gh copilot'
  alias ghcs='gh copilot suggest'
  alias ghce='gh copilot explain'
  alias copilot='gh copilot suggest'
fi

if is available apt; then
  alias apts='apt search -n'
  alias apti='sudo apt install -y'
  alias aptu='sudo apt update && sudo apt upgrade -y'
fi

if is available snap; then
  alias snapi="sudo snap install"
  alias snaps="snap find"
  alias snapr="sudo snap remove"
fi

alias random_line="shuf -n 1"
alias random_lines="shuf -n"

# alias fuck='sudo $(fc -ln -1)'
if is available thefuck; then
  eval $(thefuck --alias)
fi

alias gpt="zev"

# if is available sgpt; then
#   if is equal "$GPT_HAS_NO_INTERACTION" "1"; then
#     alias gpts="sgpt --shell"
#     alias gptss="sgpt --shell --no-interaction"
#   else
#     alias gpts="sgpt --shell"
#   fi

#   alias gpt="sgpt"
#   alias gptc="sgpt --code"
#   alias gptd="sgpt -d"
#   alias gptcc="git diff --cached | gpts 'generate a short, casual commit message based on the following changes:'"
#   alias gpt-commit="git diff --cached | gptc 'generate a short, casual commit message based on the following changes:' > /tmp/sgpt_commit_msg && git commit -F /tmp/sgpt_commit_msg && rm /tmp/sgpt_commit_msg"
#   alias git-fuckit='gpt-commit'
# fi

alias sw="start-workstation"
alias clock="watch -n 1 date +%H:%M:%S"
alias cqe="cq-editor . &>/dev/null &"
alias crc="crc32"
if is arch; then
  alias pacman="sudo dkp-pacman"
fi
alias new-love="new --lang love --name"

alias localai='local-ai'
