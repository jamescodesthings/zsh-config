# iTerm2 shell integration (prompt marks, the current folder, command status),
# loaded only on macOS inside iTerm2, so kitty, other terminals and Linux are
# untouched. zinit fetches iTerm2's official zsh script once and caches it;
# `zinit update` refreshes it. Nothing is written to ~/.zshrc.
if is osx && [[ "$TERM_PROGRAM" == iTerm.app ]]; then
  zinit snippet https://iterm2.com/shell_integration/zsh
fi
