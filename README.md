My dot files.

Uses nix, stow, and zplug to set everything up.

# TODO:
- Have tmux colour background differently if ssh'ing to particular hosts.
http://www.drinchev.com/blog/ssh-and-terminal-background/
- Use nix instead of zplug for zsh "plugins" (not sure if this is easy, but it is hardly much cleaner)
- Give sudo the same configuration.
- Get rid of wasted whitespace between right-prompt and right-border... (powerlevel9k)

- Intellij Colorscheme(s) are a bit off.
    * Rust missing green enums, and some black text.
    * Most intellij config files are superfluous.  
- Collate work diffs.

## Keeb
- Invert shift on number keys (symbols by default)
- mod + hjkl === arrow keys


# Choices
## Meta
nix is a good package manager
stow is simple (could use homeshick or nix)
- Stow will take a bit of finagling if the # of packages becomes too many.

## Shell
Zsh
- No recollection. Started with oh-my-zsh, but then slimmed it down a bit.

## Terminal
Konsole
- easiest config. Everything runs tmux about the same.
- urxvt: More elaborate config; need to manage x settings db. Powerline font rendering issues.
- gnome-terminal: More elaborate config; need to manage settings registry.
