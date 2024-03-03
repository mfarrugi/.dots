# if [[ ! -v DOTS ]]; then
#     local __FILE__=$(realpath $(print -P %N))
#     source $(dirname $__FILE__)/.zshenv
# fi

export TERMINFO=~/.nix-profile/share/terminfo

# Load third-party plugins first so that our configs take precedence.
source $DOTS/zsh/plugins.zsh
source $DOTS/zsh/keybinds.zsh
source $DOTS/zsh/aliases.zsh

# nb. vim clobbers the shell cursor, so update it before every prompt.
__ensure_cursor() {
    # Change shell cursor to | instead of box or underscore.
    echo -ne "\e[5 q"
}
precmd_functions+=__ensure_cursor

# Autocomplete include hidden files
setopt globdots



# Terminal text encoding, prevents broken colors and text rendering.
export LANG="en_US.UTF-8"

export EDITOR="nvim"

# TODO: What did this fix?
# export HOME=`cd $HOME; pwd -P`  # Change $HOME to physical $HOME for tmux.


# "Fix" for nix perl warning spam like:
# perl: warning: Setting locale failed.
export LOCALE_ARCHIVE=/lib/locale/locale-archive

#-------------------------------------------------------------------------------
# Program Specific

source $DOTS/python/env.sh
source $DOTS/ubuntu-gnome/env.sh

# bat
export BAT_THEME="base16"

# fzf
export FZF_DEFAULT_COMMAND='rg --files'

# less - propagate colors
export LESS=-r

# rust
export CARGO_TARGET_DIR=$XDG_CACHE_HOME/cargo

# intellij
source $DOTS/intellij/env.sh

# Append work-only config.
[[ -e $DOTS/work-specific/_zshrc ]] && source $DOTS/work-specific/_zshrc
