export DOTS=$HOME/.dots/zsh

# Unique fpath entries. Prevents unecessary compinit reloading(maybe?).
typeset -U fpath

# Autocomplete include hidden files (How is this not set somewhere else?)
setopt globdots

# Colors for less.
export LESS=-r

# Explicitly set the XDG directories to the defaults.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Terminal text encoding, prevents broken colors and text rendering.
export LANG=en_US.UTF-8
# Don't set TERM, let tmux and the like do it.

# Change shell cursor to | instead of box or underscore.
# nb. vim clobbers the shell cursor, so update it before every prompt.
__ensure_cursor() { 
    echo -ne "\e[5 q" 
} 
precmd_functions+=__ensure_cursor

export HOME=`cd $HOME; pwd -P`  # Change $HOME to physical $HOME for tmux.

export EDITOR='nvim'
source $DOTS/_zsh_plugins.zsh
# @TODO Figure out how to have nix manage all the plugins, then give us one script to source.
# Maybe figure out home-manager for this bit.
source $HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load our own aliases after plugins for potential overrides.
source $DOTS/_aliases

path=(
    $HOME/.bin
    $path
)

export PYTHONSTARTUP=$DOTS/../python/_PYTHONSTARTUP.py

export CARGO_TARGET_DIR=$XDG_CACHE_HOME/cargo

# Append work-only config.
[[ -e $DOTS/../twosigma-specific/_zshrc ]] && source $DOTS/../twosigma-specific/_zshrc

[[ ! -z $TMUX ]] || tmux attach -t main || tmux new -s main
