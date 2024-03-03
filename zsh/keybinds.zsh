zmodload zsh/terminfo

bindkey "$terminfo[kcuu1]" history-beginning-search-backward
bindkey "$terminfo[kcud1]" history-beginning-search-forward

ALT="^["
CTRL="^"
bindkey "${ALT}k" history-beginning-search-backward
bindkey "${ALT}j" history-beginning-search-forward
