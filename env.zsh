#!/usr/bin/env zsh

# Load Custom Functions and Completions
# fpath=(~/.custom/functions $fpath)

# Put Brew paths first
# export PATH="/usr/local/bin:${PATH}"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Put asdf before brew
# export PATH="/Users/jamesmacmillan/.asdf/shims:$PATH"

# Created by `pipx` on 2021-10-09 18:17:15
export PATH="$PATH:/Users/jamesmacmillan/.local/bin"

# Add .NET Core SDK tools
export PATH="$PATH:/Users/jamesmacmillan/.dotnet/tools"

# Add SQLite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Add stldim & stlplace
export PATH="$PATH:/Users/jamesmacmillan/projects/third-party/move-to-origin"

# Projects Directory
export PROJECTS="$HOME/projects"

# PIPENV: Use Local directory
export PIPENV_VENV_IN_PROJECT=1
export PIPX_DEFAULT_PYTHON=$(asdf which python)

# Github token
export GITHUB_USER='jamescodesthings'
export GITHUB_TOKEN='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'

# LinkedIn token
export LINKEDIN_USER='jamescodesthings@gmail.com'
export LINKEDIN_PASS='Z0mb!e10'
export LI_AT='AQEDAQw-AB4BNANaAAABfOFpgDAAAAF9BXYEMFYAFB2GATinb5CPM9miBPmS5mS_yLxyukNNNA9UDUyGXGjXkGLNgTLOi_Eq1_838h6Uf62mvcRm9ZHmX4FsJylkSERDXWOL9LxynWMEkm2CZvBK4vig'
export LI_JSESSIONID='"ajax:4471630407994023374"'

# Spaceship prompt theme root, for mackup portability
#export SPACESHIP_ROOT="$ZSH/custom/themes/spaceship-prompt"
# SPACESHIP_PROMPT_ORDER=(
#   time          # Time stampts section
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git_branch    # Git branch
#   git_status    # Git status
#   hg            # Mercurial section (hg_branch  + hg_status)
#   package       # Package version
#   node          # Node.js section
#   ruby          # Ruby section
#   elixir        # Elixir section
#   xcode         # Xcode section
#   swift         # Swift section
#   golang        # Go section
#   php           # PHP section
#   rust          # Rust section
#   haskell       # Haskell Stack section
#   julia         # Julia section
#   docker        # Docker section
#   aws           # Amazon Web Services section
#   azure         # Microsof Azure section
#   venv          # virtualenv section
#   conda         # conda virtualenv section
#   pyenv         # Pyenv section
#   dotnet        # .NET section
#   ember         # Ember.js section
#   kubecontext   # Kubectl context section
#   tox           # Tox section
#   exec_time     # Execution time
#   line_sep      # Line break
#   battery       # Battery level and status
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
# SPACESHIP_RPROMPT_ORDER=(
#   package
#   node
# )
export SPACESHIP_AWS_SYMBOL="☁️  "
export SPACESHIP_DIR_TRUNC=0 # Default is 3

if is-iterm; then
  export SPACESHIP_PROMPT_ADD_NEWLINE=false
  export SPACESHIP_CHAR_SYMBOL="> "
fi

# Set the editor to sublime
if is available subl; then
  export EDITOR='subl -w'
else
  echo 'Install sublime and command subl'
fi

# GO Home
export GOPATH="${HOME}/.go"
# If this ends up changing check it again with $(brew --prefix golang)
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# JENV and JAVA_HOME
eval "$(jenv init -)"

# Android Home for Android studio
# /Users/james/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/31.0.0-rc1

# MySQL Client from Brew (brew install mysql-client)
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# LLVM@8
# export PATH="/usr/local/opt/llvm@8/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm@8/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm@8/include"

# Postgres config for local testing in docker
export testDbUser=postgres
export testDbPass=testPassword
export testDbHost=localhost
export testDbName=postgres
export DB_NAME=testDb
export DB_USER=testName
export DB_PASSWORD=testPass
export DB_HOST=localhost

# Disable brew auto update
export HOMEBREW_NO_AUTO_UPDATE=1

# If SSH Agent is already running, do not run.
if [[ -z "$SSH_AGENT_PID" ]]
then
  # Do something knowing the pid exists, i.e. the process with $PID is running
  # SSH Agent
  eval "$(ssh-agent -s)" &>/dev/null
fi

# Python scripts / custom global scripts
# export PATH="$PROJECTS/path:${PATH}"
# export NVM_DIR="$HOME/.nvm"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if is existing $CUSTOM_DIR/.p10k.zsh; then
  source $CUSTOM_DIR/.p10k.zsh
fi

if is existing $HOME/.cargo/env; then
  source $HOME/.cargo/env
fi

export ASPNETCORE_ENVIRONMENT=development
# export ASPNETCORE_URLS="http://0.0.0.0:5000;https://0.0.0.0:5001"
export NODE_OPTIONS="--max_old_space_size=8000"

# Ensures partial word completion does not skip over folders/dashes
export WORDCHARS=${WORDCHARS/\/}
export WORDCHARS=${WORDCHARS/-/}

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Brew Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Touch Bar
# ENV variables to enable or disable git:

export TOUCHBAR_DIR_CHAR=📂
# export TOUCHBAR_DIR_CHAR=
export TOUCHBAR_GIT_ENABLED=false
# ENV variables for git icons:

# GIT_UNCOMMITTED="+"
# GIT_UNSTAGED="!"
# GIT_UNTRACKED="?"
# GIT_STASHED="$"
# GIT_UNPULLED="⇣"
# GIT_UNPUSHED="⇡"
# ENV variables to enable or disable yarn:

export TOUCHBAR_YARN_ENABLED=false

# allows you to use the `[up, down]` key on a partial command
# to search your bash history for similar commands
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
