" Use jk instead of <esc> to exit insert mode.
inoremap jk <esc>

set hlsearch

" Use system clipboard.
set clipboard=unnamedplus

" ways to copy paste out of vim:
set mouse+=a

"-------------------------------------------------------------------------------
" Editing

set shiftwidth=4
set expandtab

"-------------------------------------------------------------------------------
" Rendering

syntax on
set tabstop=4

" Render tabs as >--- instead of whitespace.
set list
set listchars=tab:▶‒,extends:›,precedes:‹,nbsp:·,trail:·

" Show line numbers in the sidebar as 
"  2
"  1
" 35 Current line
"  1
"  2
set relativenumber
set number

"-------------------------------------------------------------------------------
" Plugins

" GitGutter
"
" Next Hunk = [c
" Prev Hunk = ]c
" Preview = <Leader>hp
" Stage / Add = <Leader>hs
" Undo / Revert = <Leader>hu
nmap <Leader>hr <Plug>GitGutterUndoHunk

" Rainbo Parentheses
let g:rainbow_active = 1
