#!/usr/bin/env zsh

# Make it 1 to log the script output
export ZINIT_DEBUG=0

# Change zinit load method
export LOAD_METHOD='light'

# Powerlevel10k prompt
zinit ice depth=1
zinit $LOAD_METHOD romkatv/powerlevel10k

# Saneopt:
zinit $LOAD_METHOD willghatch/zsh-saneopt

# ASYNC: See example in $CUSTOM_DIR/async-demo.zsh
zinit $LOAD_METHOD mafredri/zsh-async

# OMZ Libraries
zt 0a light-mode for \
        OMZL::history.zsh \
    atload'zstyle ":completion:*" special-dirs false' \
        OMZL::completion.zsh

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
# Fuzzy Find (fzf) in history tab completion
# Tab/Shift Tab for next/previous with enter for select
zinit ice wait"0b" lucid light-mode patch"${pchf}/%PLUGIN%.patch" reset nocompile'!' \
    atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(__fz_zsh_completion)' \
zinit $LOAD_METHOD changyuheng/fz

# Per Directory History
# swap between Global/Local history with Option+L
zinit ice wait"0b" light-mode aatload'add-zsh-hook chpwd @chwpd_dir-history-var; add-zsh-hook zshaddhistory @append_dir-history-var; @chwpd_dir-history-var' lucid
zinit light kadaan/per-directory-history

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
zinit ice wait"0b" light-mode lucid
zinit light RobSis/zsh-reentry-hook

# Fast Syntax Highlighting
zinit ice light lucid \
    atinit'zicompinit_fast; zicdreplay' atload'FAST_HIGHLIGHT[chroma-man]=' \
    atclone'(){local f;cd -q →*;for f (*~*.zwc){zcompile -Uz -- ${f}};}' \
    compile'.*fast*~*.zwc' nocompletions atpull'%atclone'

zinit $LOAD_METHOD zdharma-continuum/fast-syntax-highlighting

# # Binds up/down to history substring search
# zt 0c light-mode \
#     atload'bindkey "\e[A" history-substring-search-up;
#     bindkey "\e[B" history-substring-search-down' \
#         zsh-users/zsh-history-substring-search

zt 0b light-mode for \
        atload'bindkey "\e[A" history-substring-search-up;
    bindkey "\e[B" history-substring-search-down' \
        zsh-users/zsh-history-substring-search

# Autosuggestions, fast-syntax-highlighting and completion
# if ! zisloaded zsh-autosuggestions; then
#   ZSH_AUTOSUGGEST_USE_ASYNC=1
#   ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#   zload zdharma-continuum/history-search-multi-word

#   # zload 0a atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions
#   zinit wait lucid for \
#     atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#       zdharma-continuum/fast-syntax-highlighting \
#     blockf \
#       zsh-users/zsh-completions \
#     atload"!_zsh_autosuggest_start" \
#       zsh-users/zsh-autosuggestions
# fi

# Extended Zsh Colors
zinit ice wait"0a"
zinit zpm-zsh/colors

# Aliases
zinit ice wait"0a"
zinit djui/alias-tips

# Notify on command completion
zinit ice wait'0c' atload'source $CUSTOM_DIR/.auto-notify-ignore.zsh' lucid
zinit $LOAD_METHOD MichaelAquilina/zsh-auto-notify

# Better RM
zinit $LOAD_METHOD MikeDacre/careful_rm
if is not file ${HOME}/.rm_recycle; then
  touch ${HOME}/.rm_recycle
fi

# Double escape = sudo [last command]
zinit ice wait"0a" lucid
zinit light hcgraf/zsh-sudo
# Colored Man Pages

# Aliased to J: Zsh autojump
zinit ice wait"0a" lucid
zinit light rupa/z

# Extra Git commands
zinit ice wait"0c" lucid
zinit light unixorn/git-extra-commands

# almost on top (clears previous output on new command)
zinit ice wait"0b" lucid
zinit light Valiev/almostontop

# ASDF w/Direnv support
zinit ice wait lucid
zinit load redxtech/zsh-asdf-direnv

# iTerm touchbar support
if has-touch-bar; then
  # zload iam4x/zsh-iterm-touchbar
  # zload jamescodesthings/zsh-iterm-touchbar
  zinit $LOAD_METHOD %HOME/projects/personal/zsh-iterm-touchbar
fi
