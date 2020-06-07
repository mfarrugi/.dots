# Meta, add an alias to the end of this file.
adda() { echo "alias $1='$2'" >> $DOTS/zsh/_aliases.zsh && source ~/.zshrc; }

alias top='htop'
alias mv='mv -iv'
alias x='exit'
alias trw='tmux rename-window '
alias du='du -h --max-depth=1'
alias g='git'

alias df="df -h"

# exa replaces `ls` and `tree`
alias ls='exa'
alias la='exa -la' # Override omzsh common-aliases because exa doesn't take the same flags.
alias tree='exa --tree'

journal() { vim "$HOME/notes/journal/$(date +%Y-%m-%d).md" }

alias e='nvim'

alias rg="rg --type-add 'bazel:*.bzl' --type-add 'bazel:*BUILD*'" 

alias -g P='| fpp'
alias -g F='| fzf'
