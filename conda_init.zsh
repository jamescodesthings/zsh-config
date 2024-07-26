#!/usr/bin/env zsh

export CONDA_AUTO_ACTIVATE_BASE=false

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/james/.asdf/installs/python/miniforge3-latest/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/james/.asdf/installs/python/miniforge3-latest/etc/profile.d/conda.sh" ]; then
        . "/home/james/.asdf/installs/python/miniforge3-latest/etc/profile.d/conda.sh"
    else
        export PATH="/home/james/.asdf/installs/python/miniforge3-latest/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
