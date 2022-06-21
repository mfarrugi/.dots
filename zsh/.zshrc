if [[ ! -v DOTS ]]; then
    local __FILE__=$(realpath $(print -P %N))
    source $(dirname $__FILE__)/.zshenv
fi

# Load third-party plugins first so that our configs take precedence.
source $DOTS/zsh/_plugins.zsh
source $DOTS/zsh/_keybinds.zsh
source $DOTS/zsh/_aliases.zsh

# nb. vim clobbers the shell cursor, so update it before every prompt.
__ensure_cursor() {
    # Change shell cursor to | instead of box or underscore.
    echo -ne "\e[5 q"
}
precmd_functions+=__ensure_cursor

# Autocomplete include hidden files
setopt globdots

# Explicitly set the XDG directories to the defaults.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Terminal text encoding, prevents broken colors and text rendering.
export LANG="en_US.UTF-8"

export EDITOR="nvim"

# TODO: What did this fix?
# export HOME=`cd $HOME; pwd -P`  # Change $HOME to physical $HOME for tmux.

#-------------------------------------------------------------------------------
# Program Specific

# bat
export BAT_THEME="base16"

# fzf
export FZF_DEFAULT_COMMAND='rg --files'

# less - propagate colors
export LESS=-r

# python
export PYTHONSTARTUP=$DOTS/python/_PYTHONSTARTUP.py

# rust
export CARGO_TARGET_DIR=$XDG_CACHE_HOME/cargo

# intellij
source $DOTS/intellij/_shell.sh
JETBRAINS_PROPERTIES=$DOTS/intellij/_idea.properties
export IDEA_PROPERTIES=$JETBRAINS_PROPERTIES
export CLION_PROPERTIES=$JETBRAINS_PROPERTIES
export PYCHARM_PROPERTIES=$JETBRAINS_PROPERTIES

# Append work-only config.
[[ -e $DOTS/work-specific/_zshrc ]] && source $DOTS/work-specific/_zshrc
