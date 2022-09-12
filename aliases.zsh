#!/usr/bin/env zsh

# Compatibility architecture mode (rosetta)
if is m1; then
  alias rosetta='arch -x86_64'
  alias rosetta-shell='arch -x86_64 /usr/local/bin/zsh'
fi

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
fi

# Linux Specific
if is linux; then
  alias open='xdg-open'
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
alias j='z'

if is available exa; then
  alias ls='exa'
fi

if is available subl; then
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

# Git
if is available git; then
  if is available g; then
    # Unalias g from OMZ:git
    unalias g;
    unalias gcm;
    unalias gcd;
  fi;

  alias gcm='git commit -m'
  alias gcmn='git commit --no-verify -m'
  alias gbD='git branch -D'
  alias gbDi='gbD $(gb | fzf)'
  alias gtD='git tag -d'
  alias gm='git merge --no-ff'
  alias gt='git tag'
  alias rls='echo release_$(date -u +"%Y-%m-%d")'
  alias gtmapt='git tag $(rls)'
  alias git-skip='git update-index --skip-worktree'
  alias git-unskip='git update-index --no-skip-worktree'
  alias git-list-skipped='git ls-files -v . | grep "^S"'
  alias git-delete-untracked-check='git clean -n';
  alias git-delete-untracked='git clean -f';
  alias git-update-from-upstream='git pull upstream $(current_branch)'
  alias git-update='git-update-from-upstream'
  alias grhho='git-i-really-fucked-up'

  # When I committed to the wrong branch, but didn't push yet (phew)
  alias git-i-fucked-up='git reset HEAD~1'
  alias gb='git --no-pager branch'
  alias gbr='git --no-pager branch --remote'

  # Git Cherry pick and edit message
  alias gcpe="git cherry-pick -e"
  alias gd="git --no-pager diff"
  alias gms="git merge --squash"
fi

# Node
if is existing "$ASDF_DIR/shims/npm"; then
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
  alias npmIY='npm init -y'
  alias npmU='npm uninstall -S -D'
  alias npmUG='npm uninstall -g'
  alias npm-check-update='npx npm-check -u -E'
  alias ncu='npm-check-update'
fi

if is existing "$ASDF_DIR/shims/yarn"; then

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
  alias yui="yarn upgrade-interactive"
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
