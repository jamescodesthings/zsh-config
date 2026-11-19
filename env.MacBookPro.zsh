#!/usr/bin/env zsh

# export PATH="/usr/local/bin:${PATH}"

export PKG_CONFIG_PATH="/opt/homebrew/opt/pixman/lib/pkgconfig"
for i in /opt/homebrew/opt/*; do
  if [ -d $i/lib/pkgconfig ]; then
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$i/lib/pkgconfig"
  fi
  if [ -d $i/share/pkgconfig ]; then
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$i/share/pkgconfig"
  fi
done

export SDKROOT=$(xcrun --show-sdk-path)

# Created by `pipx` on 2021-10-09 18:17:15
export PATH="$PATH:$HOME/.local/bin"

# Add .NET Core SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"

# Add SQLite

# Add stldim & stlplace
export PATH="$PATH:$HOME/projects/third-party/move-to-origin"

# GO Home
# export GOPATH="${HOME}/.go"
# # If this ends up changing check it again with $(brew --prefix golang)
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# MySQL Client from Brew (brew install mysql-client)

# If SSH Agent is already running, do not run.
if [[ -z "$SSH_AGENT_PID" ]]; then
  # Do something knowing the pid exists, i.e. the process with $PID is running
  # SSH Agent
  eval "$(ssh-agent -s)" &>/dev/null
fi

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export ASPNETCORE_ENVIRONMENT=development
export NODE_OPTIONS="--max_old_space_size=8000"

export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8

export BUTANO_DIR="$HOME/projects/third-party/butano/butano"
export BUTANO_TEMPLATE_DIR="$HOME/projects/third-party/butano/template"

export PICO8="/Applications/PICO-8.app/Contents/MacOS/pico8"

export GPT_HAS_NO_INTERACTION=1


export PATH="$HOME/.kimi-code/bin:$PATH"


export NODE_BUILD_HTTP_CLIENT="curl"



if is not existing ~/.hushlogin; then
  touch ~/.hushlogin
fi
