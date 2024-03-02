NIX_SHARE=$DOTS_NIX_PROFILE/share

source $NIX_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh
source $NIX_SHARE/zsh-bd/bd.plugin.zsh
source $NIX_SHARE/oh-my-zsh/plugins/extract/extract.plugin.zsh

# nb. This sets `bindkey -e`, and handles various compatibility details.
source $NIX_SHARE/oh-my-zsh/lib/key-bindings.zsh

source $NIX_SHARE/oh-my-zsh/lib/history.zsh
export HISTFILE="${XDG_CACHE_HOME}/zsh/.zsh_history"
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=123456789
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE
mkdir -p $(dirname $HISTFILE)


source $NIX_SHARE/zsh-powerlevel10k/powerlevel10k.zsh-theme
source $DOTS/zsh/_p10k.zsh

source $NIX_SHARE/oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh
unalias duf 2>/dev/null

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

fpath=(
    $NIX_SHARE/zsh/site-functions/
    $NIX_SHARE/oh-my-zsh/plugins/extract/
    $fpath
)
autoload -Uz compinit
compinit -C -d $XDG_CACHE_HOME/zsh/zcompdump

# Must happen after compinit
source $NIX_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
