# Bootstrap zsh plugin manager.

export ZPLUG_HOME=$XDG_CACHE_HOME/zplug
[[ -e $ZPLUG_HOME ]] || git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# Default to shallow clones for plugins.
zstyle ":zplug:tag" depth 1

# Use parts of oh-my-zsh, and set parameters.
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# nb. This sets `bindkey -e`, and handles various compatibility details.
zplug lib/key-bindings, from:oh-my-zsh
zplug lib/history, from:oh-my-zsh
HIST_STAMPS="yyyy-mm-dd"

# plugins = ( mercurial common-aliases lib/history )
# Might want to use ... ( extract dirhistory jump per-directory-history vi-mode z )

zplug plugins/mercurial, from:oh-my-zsh
zplug plugins/extract, from:oh-my-zsh

# Zsh hack for this.. no recollection of what this does nor what this fixes.
autoload -Uz is-at-least
zplug plugins/common-aliases, from:oh-my-zsh, defer:1 # Lots of fancy useful aliases, I use G and L a huge amount.
alias -s rs=$EDITOR
alias -s md=$EDITOR
# end oh-my-zsh

# @TODO What does this do over the builtin???
zplug zsh-users/zsh-history-substring-search

zplug Tarrasch/zsh-bd
zplug zsh-users/zsh-completions, use:src
zplug zsh-users/zsh-syntax-highlighting, defer:2 # Must happen after compinit
# Theme
zplug bhilburn/powerlevel9k, as:theme
    DEFAULT_USER=marco
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs) # vi_mode for zle
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)

zplug check || zplug install
zplug load 

# Override plugin settings

## zsh-history-substring-search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-beginning-search-backward
bindkey "$terminfo[kcud1]" history-beginning-search-forward
bindkey "^[k" history-beginning-search-backward
bindkey "^[j" history-beginning-search-forward


## history
HISTSIZE=100000
SAVEHIST=100000
