#!/usr/bin/env zsh



# Make it 1 to log the script output
export ZINIT_DEBUG=0

# Change zinit load method
export LOAD_METHOD='light'

if is windows; then
    # Powerlevel10k prompt
    zinit ice depth=1
    zinit $LOAD_METHOD romkatv/powerlevel10k

    zinit ice wait"0a" lucid
    zinit $LOAD_METHOD rupa/z

    # OMZ Libraries
    zinit ice wait"0a" light-mode for \
            OMZL::history.zsh \
        atload'zstyle ":completion:*" special-dirs false' \
            OMZL::completion.zsh

    # Additional Zsh completions
    zinit ice wait"0a" lucid light-mode as'completion' atpull'zinit cclear' blockf
    zinit $LOAD_METHOD zsh-users/zsh-completions

    # zinit ice wait"0a" lucid light-mode as'completion' nocompile mv'*.zsh -> _git' patch"${pchf}/%PLUGIN%.patch" reset
    # zinit $LOAD_METHOD felipec/git-completion
    unset '_comps[git]'

    return;
fi

# Powerlevel10k prompt
zinit ice depth=1
zinit $LOAD_METHOD romkatv/powerlevel10k

# Saneopt:
zinit $LOAD_METHOD willghatch/zsh-saneopt

# ASYNC: See example in $CUSTOM_DIR/async-demo.zsh
zinit $LOAD_METHOD mafredri/zsh-async

# OMZ Libraries
zinit ice wait"0a" light-mode for \
        OMZL::history.zsh \
    atload'zstyle ":completion:*" special-dirs false' \
        OMZL::completion.zsh

# OMZ Plugins
# zinit ice lucid
# zinit snippet OMZL::docker
# zinit ice lucid
# zinit snippet OMZP::docker
zinit ice lucid
zinit snippet OMZP::docker-compose

# zinit ice wait"0c" lucid
# zinit snippet OMZP::gcloud


# ASDF
# function __asdf_loaded_callback() {
#   GCLOUD_COMPLETIONS="/usr/share/google-cloud-sdk/completion.zsh.inc"
#   if [ -x "$(which direnv)" ]; then
#     eval "$(direnv hook zsh)"
#   fi
#   if [ -n "$(asdf which gcloud >& /dev/null)" ]; then
#     GCLOUD_COMPLETIONS=$(asdf where gcloud)
#     if [ -n "$GCLOUD_COMPLETIONS" ]; then
#       source "$GCLOUD_COMPLETIONS/completion.zsh.inc"
#     fi
#   fi
#  }

# zinit ice lucid atload'__asdf_loaded_callback'
# zinit $LOAD_METHOD asdf-vm/asdf
# zinit $LOAD_METHOD redxtech/zsh-asdf-direnv

  if [ -x "$(which direnv)" ]; then
    eval "$(direnv hook zsh)"
  fi

# Better RM
zinit ice wait"0c" lucid
zinit $LOAD_METHOD jamescodesthings/careful_rm
if is not file ${HOME}/.rm_recycle; then
  touch ${HOME}/.rm_recycle
fi

# 256 Colors
zinit ice wait"0a" lucid
zinit $LOAD_METHOD chrissicool/zsh-256color

# Colored Man pages
zinit ice wait"0a" lucid light-mode trigger-load'!man'
zinit $LOAD_METHOD ael-code/zsh-colored-man-pages

# Additional Zsh completions
zinit ice wait"0a" lucid light-mode as'completion' atpull'zinit cclear' blockf
zinit $LOAD_METHOD zsh-users/zsh-completions

zinit ice wait"0a" lucid light-mode as'completion' nocompile mv'*.zsh -> _git' patch"${pchf}/%PLUGIN%.patch" reset
zinit $LOAD_METHOD felipec/git-completion

# Suggestions during typing
zinit ice wait"0a" light-mode ver'develop' atload'_zsh_autosuggest_start' lucid
zinit $LOAD_METHOD zsh-users/zsh-autosuggestions

# History Improvements:
# CTRL + R to search history
# Fuzzy Find (fzf) in history tab completion
# Tab/Shift Tab for next/previous with enter for select
zinit ice wait"0b" lucid light-mode patch"${pchf}/%PLUGIN%.patch" reset nocompile'!' \
    atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(__fz_zsh_completion)'
zinit $LOAD_METHOD changyuheng/fz

if is equal "$(lightweight --status)" "off"; then
    export TEST_PASS=yep
    # Per Directory History
    # swap between Global/Local history with Option+L
    # Also sets local as the default
    _per_directory_history_is_global=false
    zinit ice wait"0b" light-mode atload'_per_directory_history_is_global=false' lucid
    zinit light kadaan/per-directory-history
fi

# FZF Tab completion
# Ctrl + Space Selects multiple results
# F1/F2 Switch Groups
# / Triggers continuous completion
zinit ice wait"0b" light-mode\
    blockf compile'lib/*f*~*.zwc' lucid
zinit light Aloxaf/fzf-tab

# Many Dots -> Many ../../s
zinit ice wait"0b" light-mode autoload'#manydots-magic' lucid
zinit light knu/zsh-manydots-magic

# Reentry of deleted and recreated dirs
# zinit ice wait"0b" light-mode lucid
# zinit light RobSis/zsh-reentry-hook

# Fast Syntax Highlighting
# zinit ice light lucid \
#     atinit'zicompinit_fast; zicdreplay' atload'FAST_HIGHLIGHT[chroma-man]=' \
#     atclone'(){local f;cd -q →*;for f (*~*.zwc){zcompile -Uz -- ${f}};}' \
#     compile'.*fast*~*.zwc' nocompletions atpull'%atclone'

# zinit $LOAD_METHOD zdharma-continuum/fast-syntax-highlighting

zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# # Binds up/down to history substring search
zinit wait"0b" lucid light-mode for \
    atload'bindkey "\e[A" history-substring-search-up; bindkey "\e[B" history-substring-search-down' \
    zsh-users/zsh-history-substring-search

# Extended Zsh Colors
zinit ice wait"0a" lucid atload'source $CUSTOM_DIR/color_scheme.zsh'
zinit $LOAD_METHOD zpm-zsh/colors

# Aliases
# zinit ice wait"0a" lucid
# zinit $LOAD_METHOD djui/alias-tips

# Notify on command completion
# zinit ice wait"0a" atload'source $CUSTOM_DIR/.auto-notify-ignore.zsh' lucid
# zinit $LOAD_METHOD MichaelAquilina/zsh-auto-notify

# Double escape = sudo [last command]
zinit ice wait"0a" lucid
zinit $LOAD_METHOD hcgraf/zsh-sudo
# Colored Man Pages

# Aliased to J: Zsh autojump
zinit ice wait"0a" lucid
zinit $LOAD_METHOD changyuheng/fz
zinit ice wait"0b" lucid
zinit $LOAD_METHOD rupa/z

# Extra Git commands
zinit ice wait"0c" lucid
zinit $LOAD_METHOD unixorn/git-extra-commands

zinit ice wait"0c" lucid
zinit $LOAD_METHOD torifat/npms
# zinit $LOAD_METHOD lukechilds/zsh-better-npm-completion

# almost on top (clears previous output on new command)
# zinit ice wait"0b" lucid
# zinit $LOAD_METHOD Valiev/almostontop

# git flow completion:
# zinit ice wait"0c" lucid
# zinit $LOAD_METHOD bobthecow/git-flow-completion

# Auto Activate conda env from environment.yml
# zinit ice wait"0c" lucid
# zinit $LOAD_METHOD jamescodesthings/zsh-activate-py-environment

# zinit ice wait"0c" lucid
# zinit $LOAD_METHOD esc/conda-zsh-completion

# Use zhooks to check out zsh hooks
zinit ice wait"0c" lucid
zinit $LOAD_METHOD agkozak/zhooks

# iTerm touchbar support
# if has-touch-bar; then
#   # zload iam4x/zsh-iterm-touchbar
#   # zload jamescodesthings/zsh-iterm-touchbar
#   zinit $LOAD_METHOD %HOME/projects/personal/zsh-iterm-touchbar
# fi
