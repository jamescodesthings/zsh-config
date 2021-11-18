#!/usr/bin/env zsh

# Put Brew paths first
# export PATH="/usr/local/bin:${PATH}"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Created by `pipx` on 2021-10-09 18:17:15
export PATH="$PATH:/Users/jamesmacmillan/.local/bin"

# Add .NET Core SDK tools
export PATH="$PATH:/Users/jamesmacmillan/.dotnet/tools"

# Add SQLite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Add stldim & stlplace
export PATH="$PATH:/Users/jamesmacmillan/projects/third-party/move-to-origin"

# GO Home
export GOPATH="${HOME}/.go"
# If this ends up changing check it again with $(brew --prefix golang)
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

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

# If SSH Agent is already running, do not run.
if [[ -z "$SSH_AGENT_PID" ]]
then
  # Do something knowing the pid exists, i.e. the process with $PID is running
  # SSH Agent
  eval "$(ssh-agent -s)" &>/dev/null
fi

# Brew Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"


# Disable brew auto update
export HOMEBREW_NO_AUTO_UPDATE=1

export ASPNETCORE_ENVIRONMENT=development
export NODE_OPTIONS="--max_old_space_size=8000"

export TOUCHBAR_DIR_CHAR=📂
export TOUCHBAR_GIT_ENABLED=false
export TOUCHBAR_YARN_ENABLED=false


export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8

# TODO Move these out and BFG
# Github token
export GITHUB_USER='jamescodesthings'
export GITHUB_TOKEN='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'

# LinkedIn token
export LINKEDIN_USER='jamescodesthings@gmail.com'
export LINKEDIN_PASS='Z0mb!e10'
export LI_AT='AQEDAQw-AB4BNANaAAABfOFpgDAAAAF9BXYEMFYAFB2GATinb5CPM9miBPmS5mS_yLxyukNNNA9UDUyGXGjXkGLNgTLOi_Eq1_838h6Uf62mvcRm9ZHmX4FsJylkSERDXWOL9LxynWMEkm2CZvBK4vig'
export LI_JSESSIONID='"ajax:4471630407994023374"'

