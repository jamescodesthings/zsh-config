#!/usr/bin/env zsh



# Make it 1 to log the script output
export ZINIT_DEBUG=0

# Change zinit load method
load=light
export ice_async="ice wait'0' light-mode"
export ice_async_norush="ice wait'1' light-mode"

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

## LS_COLORS
zinit ice nocompile:! pick:c.zsh atpull:%atclone atclone:'dircolors -b LS_COLORS > c.zsh'
zinit $load trapd00r/LS_COLORS

## almost on top (clears previous output on new command)
zinit $ice_async
zinit $load Valiev/almostontop

# Tools
## Cd to git root using "root" alias
zinit $ice_async_norush
zinit $load mollifier/cd-gitroot

## J/Z navigation
zinit $ice_async
zinit $load rupa/z

## Git LS (using k or l alias)
zinit $ice_async_norush
zinit $load supercrabtree/k

## ASDF and Direnv integration
zinit $ice_async
zinit $load redxtech/zsh-asdf-direnv

## Safe rm - move to recycle bin instead of deleting
if is not file ${HOME}/.rm_recycle; then
  touch ${HOME}/.rm_recycle
fi
zinit $ice_async_norush
zinit $load jamescodesthings/careful_rm

## Many Dots -> Many ../../s
zinit $ice_async_norush light-mode autoload'#manydots-magic'
zinit $load knu/zsh-manydots-magic

## Reentry of deleted and recreated dirs
zinit $ice_async_norush
zinit $load RobSis/zsh-reentry-hook

# Per Directory History
_per_directory_history_is_global=false
zinit $ice_async atload'_per_directory_history_is_global=false'
zinit $load kadaan/per-directory-history

## Alias Tips
zinit $ice_async_norush
zinit $load djui/alias-tips

## Double escape = sudo last command
zinit $ice_async_norush
zinit $load hcgraf/zsh-sudo

# Completions
zinit $ice_async_norush
zinit $load felipec/git-completion

## Suggestions during typing
zinit $ice_async ver'develop' atload'_zsh_autosuggest_start' lucid
zinit $load zsh-users/zsh-autosuggestions

## Fast Syntax Highlighting: comes last to avoid conflicts
zinit $ice_async atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit $load zdharma/fast-syntax-highlighting

# FZF Everything
## FZF History Completion
zinit $ice_async_norush
zinit $load changyuheng/fz

## FZF Tab completion
zinit $ice_async_norush
zinit $load Aloxaf/fzf-tab