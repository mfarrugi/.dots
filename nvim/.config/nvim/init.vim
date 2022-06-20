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

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"-------------------------------------------------------------------------------
" Appearance

colorscheme desert
syntax on
set tabstop=4

" Render tabs as >--- instead of whitespace.
set list
set listchars=tab:▶‒,extends:›,precedes:‹,nbsp:·,trail:·

" Show line numbers in the sidebar.
set number

"-------------------------------------------------------------------------------
" Plugins

"...............................................................................
" GitGutter
"
" Next Hunk = [c
" Prev Hunk = ]c
" Preview = <Leader>hp
" Stage / Add = <Leader>hs
" Undo / Revert = <Leader>hu
nmap <Leader>hr <Plug>(GitGutterUndoHunk)

"...............................................................................
" Rainbow Parentheses
let g:rainbow_active = 1

"...............................................................................
" vim-indent-guides
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=238
