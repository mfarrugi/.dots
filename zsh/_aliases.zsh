# Meta, add an alias to the end of this file.
adda() { echo "alias $1='$2'" >> $DOTS/zsh/_aliases.zsh && source ~/.zshrc; }

alias h="history -i"
alias mv='mv -iv'
alias trw='tmux rename-window '

# exa replaces `ls` and `tree`
alias ls='exa --sort=type --time-style=long-iso --group --icons'
alias la='ls -la' # Override omzsh common-aliases because exa doesn't take the same flags.
alias tree='ls --tree'

journal() { vim "$HOME/notes/journal/$(date +%Y-%m-%d).md" }

alias e='nvim'

alias rg="rg --type-add 'bazel:*.bzl' --type-add 'bazel:*BUILD*'" 
alias rgf='rg --files'

alias -g P='| fpp'
alias -g F='| fzf'
alias black='black -S -l120'
alias ef='e $(fzf)'
alias kurl='curl -u: --negotiate'
