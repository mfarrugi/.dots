# TODO: Reconsider 'starship' at some point.

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context
    dir
    dir_writable
    direnv
    vcs
    aws
    nix_shell
    kubecontext
    newline
    prompt_char
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    root_indicator
    background_jobs
    history
    time
)

# .............................................................................
# context

DEFAULT_USER="${DEFAULT_USER:-marco}"

COLOR16_BLACK=0
COLOR16_PURPLE=5
COLOR16_RED=9

if [[ "$USER" = "$DEFAULT_USER" ]]; then
    typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='@%m'
else
    typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='🔥 %n@%m'
    typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=$COLOR16_BLACK
    typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=$COLOR16_RED
fi

# .............................................................................
# nix_shell

typeset -g POWERLEVEL9K_NIX_SHELL_BACKGROUND=$COLOR16_PURPLE

# .............................................................................
# vcs

typeset -g POWERLEVEL9K_VCS_BRANCH_ICON="🌱 "

# .............................................................................
# prompt_char

typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯❯'
