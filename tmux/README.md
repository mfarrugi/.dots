## Default hotkeys -- cheatsheet from https://gist.github.com/MohamedAlaa/2961058

# Start new:    tmux    
# Start named:  tmux new -s [name]
# Attach:       tmux a [#]
#                    at
#                    attach
#                           -t [name]
# Sessions:     tmux ls
#   Kill:       tmux kill-session -t [name]
#
# <prefix>
#   New Session:            :new<CR>
#   List sessio:            s
#   name session:           $

#   Windows
#       New:                c
#       List:               w
#       Find:               f
#       Name:               ,
#       Kill:               &

#   Panes
#       Zoom:               z
#       Split-V:            %
#       Split-H:            "
#       Rotate Focus:       o
#       Rotate select L:    {
#       Rotate select R:    }
#       Show #'s:           q
#           Jump to #:      q -> #
#       Change Layout:      <space>
#       Kill:               x
#       Make window:        +
#           Revert^:        -
#       Multi-Pane:         :setw synchronize-panes
#
#  Renumber windows: movew -r
