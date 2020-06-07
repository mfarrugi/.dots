export DOTS=$HOME/.dots

# Load third-party plugins first thing so our configs take precedence.
source $DOTS/zsh/_plugins.zsh
source $DOTS/zsh/_keybinds.zsh
source $DOTS/zsh/_aliases.zsh

# Autocomplete include hidden files
setopt globdots

# Explicitly set the XDG directories to the defaults.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Terminal text encoding, prevents broken colors and text rendering.
export LANG="en_US.UTF-8"
# Don't set TERM, let tmux and the like do it.

export HOME=`cd $HOME; pwd -P`  # Change $HOME to physical $HOME for tmux.
export EDITOR='nvim'

path=(
    $DOTS/scripts/_bin
    $path
)

# Change shell cursor to | instead of box or underscore.
# nb. vim clobbers the shell cursor, so update it before every prompt.
__ensure_cursor() {
    echo -ne "\e[5 q"
}
precmd_functions+=__ensure_cursor

# less - propagate colors
export LESS=-r

# python
export PYTHONSTARTUP=$DOTS/python/_PYTHONSTARTUP.py

# rust
export CARGO_TARGET_DIR=$XDG_CACHE_HOME/cargo

# intellij
JETBRAINS_PROPERTIES=$DOTS/intellij/_idea.properties
export IDEA_PROPERTIES=$JETBRAINS_PROPERTIES
export CLION_PROPERTIES=$JETBRAINS_PROPERTIES
export PYCHARM_PROPERTIES=$JETBRAINS_PROPERTIES

# Append work-only config.
[[ -e $DOTS/work-specific/_zshrc ]] && source $DOTS/work-specific/_zshrc
