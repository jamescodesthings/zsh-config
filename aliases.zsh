#!/usr/bin/env zsh

alias asch='alias | grep'
alias cl='clear'
alias oh='open .'
alias cx='chmod +x'

alias lla='ls -la'
alias la='ls -a'
alias l1='ls -1'
alias l1a='ls -1a'
alias la1='l1a'
alias l='k -h'

if is alias md; then
  unalias md
fi

if is available eza; then
  alias ls='eza --group-directories-first'
fi

if is available git; then
  if is available g; then
    # Unalias omz:git commands
    unalias g
    unalias gcm
    unalias gcd
    unalias grbi
    unalias gsu
    unalias gap
  fi

  alias root='cd-gitroot'

  alias grbi='git rebase -i --ignore-date'
  alias gcm='git commit -m'
  alias gbD='git branch -D'
  alias gm='git merge'
  alias gmff='git merge --ff-only'

  alias git-i-fucked-up='git reset HEAD~1'

  alias gap='git add -p'

  alias gsu='git submodule update --init --recursive'
  alias gsa='git submodule add'
fi

if is available npm; then
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

if is available python; then
  alias pip='python -m pip'
fi

if is available thefuck; then
  eval $(thefuck --alias)
fi

if is available http; then
  alias http="http --verify=no"
  alias https="https --verify=no"
fi

if is available batcat && is not available bat; then
  alias bat='batcat'
fi

if is available docker; then
  alias docker-stop-all='docker stop $(docker ps -q)'
  alias dsa="docker-stop-all"
  if is alias dsp; then
    unalias dsp
  fi
  function dsp() {
    echo "Stopping all containers"
    docker-stop-all
    echo "Pruning system"
    docker system prune -f "$@"
    VOLUMES=$(docker volume ls -qf dangling=true)
    if [ -n "$VOLUMES" ]; then
      echo "Removing dangling volumes"
      docker volume rm $VOLUMES
    else
      echo "No dangling volumes to remove"
    fi
  }
  if is alias dcdn; then
    unalias dcdn
  fi
  alias dcdn='docker compose down -v'
fi

if is available apt; then
  alias apts='apt search -n'
  alias apti='sudo apt install -y'
  alias aptu='sudo apt update && sudo apt upgrade -y'
  function aptr() {
    if [ -z "$1" ]; then
      echo "Usage: aptr <package-name>"
      return 1
    fi
    sudo apt remove -y "$1" && sudo apt autoremove -y
  }
fi

if is available snap; then
  alias snapi="sudo snap install"
  alias snaps="snap find"
  alias snapr="sudo snap remove"
fi

if is not empty "$PICO8"; then
  EXTRA_PARAMS=""
  BACKGROUND=1

  if is equal "$(get-hostname)" "zerocalc"; then
    BACKGROUND=0
  else
    EXTRA_PARAMS="-width 512 -height 512 -window_x 0 -window_y 0"
  fi

  if [ $BACKGROUND -eq 1 ]; then
    alias pico="nohup $PICO8 $EXTRA_PARAMS &"
  else
    alias pico="$PICO8 $EXTRA_PARAMS"
  fi
  alias pico-8="pico"
  alias pico8="pico"

  function picoh() {
    pico -root_path "$(pwd)" &
  }
fi

if is osx; then
  alias xcode='open /Applications/Xcode.app'
  alias copy="pbcopy"
  alias paste="pbpaste"
fi

if is m1; then
  alias rosetta='arch -x86_64'
  alias rosetta-shell='arch -x86_64 $(which zsh)'

  alias unquarantine='sudo xattr -rd com.apple.quarantine'
fi

if is linux; then
  if is available xdg-open; then
    alias open='xdg-open'
  fi
  if is available xclip; then
    alias copy='xclip -sel clipboard'
    alias paste='xclip -sel clipboard -o'
  fi
fi

if is available zev; then
  alias gpt="zev"
fi

if is available claude; then
  alias cld="claude --dangerously-skip-permissions --remote-control"
  alias cldr="cld --resume"
  alias cldm="claude-monitor"
fi
