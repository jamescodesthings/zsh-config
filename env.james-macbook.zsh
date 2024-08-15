#!/usr/bin/env zsh

# Put Brew paths first
# export PATH="/usr/local/bin:${PATH}"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Devkit arm
export DEVKITARM="/opt/devkitpro/devkitARM"
export PATH="$DEVKITARM/bin:/opt/devkitpro/tools/bin:$PATH"

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

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

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
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
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