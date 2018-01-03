set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch

" Render tabs as >--- instead of whitespace.
set list
" set listchars=tab:>-
set listchars=tab:▶‒,extends:›,precedes:‹,nbsp:·,trail:·

" Need to fix nvim binary pointing to unavailable syntax.vim...
syntax on


" Use jk instead of <esc> to exit insert mode.
inoremap jk <esc>

" Getting Shift-Space to work as a key-binding is tricky because of weird terminal shit I don't care to delve into right now.
" inoremap <S-space> <Esc>


" Show line numbers in the sidebar as 
"  2
"  1
" 35 Current line
"  1
"  2
"  When both are set at the same time
set relativenumber
set number
