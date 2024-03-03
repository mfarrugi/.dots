# Prevents global env from calling compinit an extra time (on certain distros?).
skip_global_compinit=1

local __FILE__=$(realpath $(print -P %N))
export DOTS=$(dirname $(dirname $__FILE__))
export DOTS_NIX_PROFILE=$(dirname $DOTS)/.nix-profile

# Explicitly set the XDG directories to the defaults.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/data
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
# XDG_CONFIG_DIRS
# XDG_DATA_DIRS
# XDG_RUNTIME_DIR

path=(
    $DOTS/scripts
    $DOTS_NIX_PROFILE/bin
    $path
)
