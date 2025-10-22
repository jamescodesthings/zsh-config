#!/usr/bin/env zsh

# Make it 1 to log the script output
export ZINIT_DEBUG=0

# Change zinit load method
load=light

# Prompt
## Asynchronous prompt
zinit $load mafredri/zsh-async

## Powerlevel10k Prompt
zinit $load romkatv/powerlevel10k

## Pure Prompt
# zinit $load sindresorhus/pure

# Prompt Enhancements
## Sane options for zsh
zinit $load willghatch/zsh-saneopt

zinit ice wait"0" light-mode
zinit $load chrissicool/zsh-256color

## LS_COLORS
if is existing $CUSTOM_DIR/ls_colors/ls-colors.sh; then
    source $CUSTOM_DIR/ls_colors/ls-colors.sh
else
  zinit ice nocompile:! pick:c.zsh atpull:%atclone atclone:'dircolors -b LS_COLORS > c.zsh'
  zinit $load trapd00r/LS_COLORS
fi


## almost on top (clears previous output on new command)
zinit ice wait"0" light-mode
zinit $load Valiev/almostontop

# Tools
## Cd to git root using "root" alias
zinit ice wait"1" light-mode
zinit $load mollifier/cd-gitroot

## J/Z navigation
zinit ice wait"0" light-mode
zinit $load rupa/z

## Git LS (using k or l alias)
zinit ice wait"1" light-mode
zinit $load supercrabtree/k

## ASDF and Direnv integration
zinit ice wait"0" light-mode
zinit $load redxtech/zsh-asdf-direnv

## Safe rm - move to recycle bin instead of deleting
if is not file ${HOME}/.rm_recycle; then
  touch ${HOME}/.rm_recycle
fi
zinit ice wait"1" light-mode
zinit $load jamescodesthings/careful_rm

## Many Dots -> Many ../../s
zinit ice wait"1" light-mode light-mode autoload'#manydots-magic'
zinit $load knu/zsh-manydots-magic

## Reentry of deleted and recreated dirs
zinit ice wait"1" light-mode
zinit $load RobSis/zsh-reentry-hook

# Per Directory History
_per_directory_history_is_global=false
zinit ice wait"0" light-mode atload'_per_directory_history_is_global=false'
zinit $load kadaan/per-directory-history

## Alias Tips
zinit ice wait"1" light-mode
zinit $load djui/alias-tips

## Double escape = sudo last command
zinit ice wait"1" light-mode
zinit $load hcgraf/zsh-sudo

# Completions
zinit ice wait"1" light-mode
zinit $load felipec/git-completion

## Suggestions during typing
zinit ice wait"0" light-mode ver'develop' atload'_zsh_autosuggest_start' lucid
zinit $load zsh-users/zsh-autosuggestions

## Fast Syntax Highlighting: comes last to avoid conflicts
zinit ice wait"0" light-mode atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit $load zdharma/fast-syntax-highlighting

# FZF Everything
## FZF History Completion
zinit ice wait"1" light-mode
zinit $load changyuheng/fz

## FZF Tab completion
zinit ice wait"1" light-mode
zinit $load Aloxaf/fzf-tab