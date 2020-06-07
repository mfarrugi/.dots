NIX_SHARE=$HOME/.nix-profile/share

source $NIX_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh
source $NIX_SHARE/zsh-bd/bd.plugin.zsh
source $NIX_SHARE/oh-my-zsh/plugins/extract/extract.plugin.zsh

# nb. This sets `bindkey -e`, and handles various compatibility details.
source $NIX_SHARE/oh-my-zsh/lib/key-bindings.zsh

source $NIX_SHARE/oh-my-zsh/lib/history.zsh
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=100000
SAVEHIST=100000

source $NIX_SHARE/zsh-powerlevel10k/powerlevel10k.zsh-theme
DEFAULT_USER=marco
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs) # vi_mode for zle
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)

source $NIX_SHARE/oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh
unalias fd

fpath=(
    $NIX_SHARE/zsh/site-functions/
    $NIX_SHARE/oh-my-zsh/plugins/extract/
    $fpath
)
autoload -Uz compinit
compinit -C -d $XDG_CACHE_HOME/zsh/zcompdump

# Must happen after compinit
source $NIX_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
