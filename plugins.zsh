#!/usr/bin/env zsh

# Make it 1 to log the script output
export ZINIT_DEBUG=0

# Change zinit load method
export LOAD_METHOD='load'

# Powerlevel10k prompt
zinit ice depth=1
zload romkatv/powerlevel10k

# Saneopt:
zload willghatch/zsh-saneopt

# ASYNC: See example in $CUSTOM_DIR/async-demo.zsh
zload mafredri/zsh-async

# Autosuggestions, fast-syntax-highlighting and completion
if ! zisloaded zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)

  zload zdharma-continuum/history-search-multi-word

  # zload 0a atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions
  zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
    blockf \
      zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions
fi

# Ctrl+R = Better history search
zload zsh-users/zsh-history-substring-search

# Extended Zsh Colors
zload 0c zpm-zsh/colors

# Aliases
zload 0a djui/alias-tips
# zload 0b DarrinTisdale/zsh-aliases-exa

# zload 0b hlissner/zsh-autopair
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
zload snippet OMZP::colored-man-pages

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
