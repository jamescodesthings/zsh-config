#!/usr/bin/env zsh

# Functions to make configuration less verbose
# zt() : First argument is a wait time and suffix, ie "0a". Anything that doesn't match will be passed as if it were an ice mod. Default ices depth'3' and lucid
zt(){ zinit depth'3' lucid ${1/#[0-9][a-c]/wait"${1}"} "${@:2}"; }

# Make it 1 to log the script output
export ZINIT_DEBUG=0

# Change zinit load method
export LOAD_METHOD='light'

# Powerlevel10k prompt
zinit ice depth=1
zload romkatv/powerlevel10k

# Saneopt:
zload willghatch/zsh-saneopt

# ASYNC: See example in $CUSTOM_DIR/async-demo.zsh
zload mafredri/zsh-async

# OMZ Libraries
zt 0a light-mode for \
        OMZL::history.zsh \
    atload'zstyle ":completion:*" special-dirs false' \
        OMZL::completion.zsh

# Colored Man pages with triggered load?
zload light-mode \
    trigger-load'!man' \
        ael-code/zsh-colored-man-pages

# Additional Zsh completions
zload 0a light-mode \
    as'completion' atpull'zinit cclear' blockf \
        zsh-users/zsh-completions
zload 0a light-mode \
    as'completion' nocompile mv'*.zsh -> _git' patch"${pchf}/%PLUGIN%.patch" reset \
        felipec/git-completion

# Suggestions during typing
zload 0a light-mode \
    ver'develop' atload'_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions

# History Improvements:
# Fuzzy Find (fzf) in history tab completion
# Tab/Shift Tab for next/previous with enter for select
zload 0b light-mode patch"${pchf}/%PLUGIN%.patch" reset nocompile'!' \
    atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(__fz_zsh_completion)' \
        changyuheng/fz

# # More LS Colors
# zinit 0b light-mode \
#   pack'no-dir-color-swap' atload"zstyle ':completion:*' list-colors \${(s.:.)LS_COLORS}" \
#         trapd00r/LS_COLORS

# Per Directory History
# swap between Global/Local history with Option+L
zload 0b light-mode \
    atload'add-zsh-hook chpwd @chwpd_dir-history-var;
    add-zsh-hook zshaddhistory @append_dir-history-var; @chwpd_dir-history-var' \
        kadaan/per-directory-history

# Per Directory History P10k
function prompt_my_per_dir_status() {
    if $_per_directory_history_is_global; then
        return
    else
        p10k segment -i ''
    fi
}

# AND history search
# Ctrl + R to search history with multiple words
# zload 0b light-mode \
#     compile'h*' \
#         zdharma-continuum/history-search-multi-word

# Cycle Directory Stack
# Ctrl + Shift + Left = backward through directory stack
zload 0b light-mode \
    trackbinds bindmap'\e[1\;6D -> ^[[1\;5B; \e[1\;6C -> ^[[1\;5A' \
        michaelxmcbride/zsh-dircycle

# FZF Tab completion
# Ctrl + Space Selects multiple results
# F1/F2 Switch Groups
# / Triggers continuous completion
zload 0b light-mode \
    blockf compile'lib/*f*~*.zwc' \
        Aloxaf/fzf-tab

# Many Dots -> Many ../../s
zload 0b light-mode \
    autoload'#manydots-magic' \
        knu/zsh-manydots-magic

# Reentry of deleted and recreated dirs
zload 0b light-mode \
        RobSis/zsh-reentry-hook

# Fast Syntax Highlighting
zload 0b light-mode \
    atinit'zicompinit_fast; zicdreplay' atload'FAST_HIGHLIGHT[chroma-man]=' \
    atclone'(){local f;cd -q →*;for f (*~*.zwc){zcompile -Uz -- ${f}};}' \
    compile'.*fast*~*.zwc' nocompletions atpull'%atclone' \
        zdharma-continuum/fast-syntax-highlighting

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
zload 0c zpm-zsh/colors

# Aliases
zload 0a djui/alias-tips

# Notify on command completion
zinit ice wait'0c' atload'source $CUSTOM_DIR/.auto-notify-ignore.zsh' lucid
zinit $LOAD_METHOD MichaelAquilina/zsh-auto-notify

# Better RM
zload MikeDacre/careful_rm
if is not file ${HOME}/.rm_recycle; then
  touch ${HOME}/.rm_recycle
fi

# Double escape = sudo [last command]
zload 0a hcgraf/zsh-sudo
# Colored Man Pages

# Aliased to J: Zsh autojump
zload 0a rupa/z

# Extra Git commands
zload 0c unixorn/git-extra-commands

# almost on top (clears previous output on new command)
zload 0b Valiev/almostontop

# ASDF w/Direnv support
zinit ice wait lucid
zinit load redxtech/zsh-asdf-direnv

# iTerm touchbar support
if has-touch-bar; then
  # zload iam4x/zsh-iterm-touchbar
  # zload jamescodesthings/zsh-iterm-touchbar
  zload %HOME/projects/personal/zsh-iterm-touchbar
fi
