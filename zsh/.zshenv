# Prevents global env from calling compinit an extra time (on certain distros?).
skip_global_compinit=1

local __FILE__=$(realpath $(print -P %N))
export DOTS=$(dirname $(dirname $__FILE__))
export DOTS_NIX_PROFILE=$(dirname $DOTS)/.nix-profile

path=(
    $DOTS/scripts
    $DOTS_NIX_PROFILE/bin
    $path
)
