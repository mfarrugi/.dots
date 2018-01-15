export DOTS=$HOME/.dots/zsh

# Unique fpath entries. Prevents unecessary compinit reloading(?).
typeset -U fpath

# Autocomplete include hidden files (How is this not set somewhere else?)
setopt globdots

# Colors for less.
export LESS=-r  

# Explicitly set the XDG defaults.
export XDG_CONFIG_HOME=$HOME/.config  
export XDG_CACHE_HOME=$HOME/.cache

# Terminal text encoding, prevents broken colors and similar.
export LANG=en_US.UTF-8

# Don't set TERM, let tmux and the like do it.
export HOME=`cd $HOME; pwd -P`  # Change $HOME to physical $HOME for tmux.

export EDITOR='nvim'

# Source work-only config.
[[ -e $DOTS/ts/zshrc ]] && source $DOTS/ts/zshrc  

source $DOTS/_zsh_plugins.zsh

# Load our own aliases after plugins for potential overrides.
source $DOTS/_aliases  

# @TODO How does .nix-profile end up getting setup?

# Make sure our ~/.bin is first thing on the path.
path=(
    $HOME/.bin
    $path
)

export PYTHONSTARTUP=$DOTS/../python/_PYTHONSTARTUP.py
