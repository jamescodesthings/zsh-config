#!/usr/bin/env zsh

# Compatibility
alias rosetta='arch -x86_64'
alias rosetta-zsh='arch -x86_64 /usr/local/bin/zsh'
alias rosetta-shell='rosetta-zsh'
# alias brew='rosetta /usr/local/bin/brew'
alias weekly='open -a typora ~/Documents/weekly-update.md'
alias typora='open -a typora'

alias xcode='open /Applications/Xcode.app'
alias pc='pycharm'

# Aliases
alias zshconfig='subl ~/.custom'
alias zshconfig-ws='ws ~/.custom'
alias asch='alias | grep'

# Emulator/simulator
alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

alias emulator-list='emulator -list-avds'
alias emulator-start='emulator -avd'

# My Touchbar My Rules
alias tbconfig='subl ~/Library/Application\ Support/MTMR/'
alias tbopen='open ~/Library/Application\ Support/MTMR/'
alias tbcd='cd ~/Library/Application\ Support/MTMR/'

# Shell
alias rst='source ~/.zshrc'
# alias clear='/usr/bin/clear'
# alias tput='/usr/bin/tput'
alias cl='clear'
alias oh='open .'
alias flush-dns='sudo killall -HUP mDNSResponder'
alias count='ls -b1 | wc -l' # Count files in current directory
alias cx='chmod +x'
alias j='z'
alias ls='exa'
alias la='ls -la'
alias bat='bat --paging="never"'

# Openscad helpers
alias scad-libs='cd ~/Documents/OpenSCAD/libraries'
alias scad='open /Applications/OpenSCAD.app'
alias openscad='/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD'

alias chrome='open -a /Applications/Google\ Chrome.app'

# Simplify3D Helper
alias wipe-simplify='rm ~/Library/Preferences/com.Simplify3D.S3D-Software.plist && rm -rf ~/Library/Application\ Support/Simplify3D'

# Mac Mini SSH
alias mac-mini='sudo ssh administrator@92.207.254.162 -p8004 -L5900:127.0.0.1:5900'

# nvm reinstall
# alias nvmu='nvm install node --reinstall-packages-from=node'
# alias nvmi='nvm install --reinstall-packages-from=node'
# alias nvmu-lts='nvm install lts/* --reinstall-packages-from=node'

alias set-xcode-12='sudo xcode-select -s /Applications/Xcode_12.app'
alias set-xcode-13='sudo xcode-select -s /Applications/Xcode.app'

alias install-poetry='curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -'
alias install-poetry-new='curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -'
alias uninstall-poetry='curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_UNINSTALL=1 python -'
alias uninstall-poetry-new='curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | POETRY_UNINSTALL=1 python -'

# Bat with no pager
alias bat="bat --paging=never"

# For tiny python projects book only
alias tiny-new="/Users/jamesmacmillan/projects/learning/tiny-python/00-source/bin/new.py"

export PAGER='cat'

CHT="${HOME}/.custom/cht.sh"
if is file $CHT; then
  alias cht="${CHT}"
fi


if is available lazygit; then
  alias lg='lazygit'
fi

# AWS SQS Save
SQS_SAVE_SCRIPT="${HOME}/projects/python/sqs-save/sqs-save.zsh"
if is file ${SQS_SAVE_SCRIPT}; then
  alias sqs-save="${SQS_SAVE_SCRIPT}"
fi

# Node
alias npmst='npm start'
alias npmg='npm i -g'
alias npmL0g='npm list -g --depth=0 2>/dev/null'
alias npmL0='npm list --depth=0 2>/dev/null'
alias npmr='npm run'
alias npmD='npm i -D'
alias npmS='npm i -S'
alias npmSE='npm i -E'
alias npmDE='npm i -D -E'
alias npmIY='npm init -y'
alias npmU='npm uninstall -S -D'
alias npmUG='npm uninstall -g'
alias npm-check-update='npx npm-check -u -E'
alias ncu='npm-check-update'

# Git
if is available git; then
  if is available g; then
    # Unalias g from OMZ:git
    unalias g;
    unalias gcm;

    unalias gcd;
  fi;

  alias gcm='git commit -m'
  alias gbD='git branch -D'
  alias gtD='git tag -d'
  alias gm='git merge --no-ff'
  alias gt='git tag'
  alias rls='echo release_$(date -u +"%Y-%m-%d")'
  alias gtmapt='git tag $(rls)'
  alias git-skip='git update-index --skip-worktree'
  alias git-unskip='git update-index --no-skip-worktree'
  alias git-list-skipped='git ls-files -v . | grep ^S'
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

# AWS MFA
alias aws-mfa-sandbox='aws-mfa --device arn:aws:iam::246802837414:mfa/jamesm --profile sandbox && export AWS_PROFILE="sandbox"'
alias aws-mfa-dev='aws-mfa --device arn:aws:iam::879195206356:mfa/jamesm --profile dev && export AWS_PROFILE="dev"'
alias aws-mfa-staging='aws-mfa --device arn:aws:iam::447649200633:mfa/jamesm --profile staging && export AWS_PROFILE="staging"'
alias aws-mfa-prod='aws-mfa --device arn:aws:iam::575515639038:mfa/jamesm --profile prod && export AWS_PROFILE="prod"'

# Gron
if is available gron; then
  alias ungron="gron --ungron"
else
  clr_red 'Missing gron'
fi

# Install Google Fonts
# Install Google Fonts
alias install-google-fonts="curl https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/install.sh | bash"
alias uninstall-google-fonts="curl https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/uninstall.sh | bash"

alias plistbuddy="/usr/libexec/PlistBuddy"

eval $(thefuck --alias)
