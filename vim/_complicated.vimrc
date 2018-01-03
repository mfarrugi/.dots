" vim: foldmethod=marker:foldlevelstart=0


"" Mostly from http://dougblack.io/words/a good-vimrc.html
" General {{{
syntax enable       " enable syntax processing

set tabstop=4       " number of visual spaces per TAB

set expandtab       " tabs are spaces
set number          " show line numbers

set showcmd             " show command in bottom bar

set cursorline          " highlight current line

filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
" }}}

" Searching  {{{

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
" }}}
" Folding {{{
set modeline
set modelines=5

set foldenable          " enable folding
set foldlevelstart=1   " open most folds by default
set foldnestmax=10      " 10 nested fold max

"" space open/closes folds
nnoremap <space> za
"set foldmethod=indent   " fold based on indent level
" }}}

"" Movement {{{

" jk is escape
inoremap jk <esc>
" S-Space toggles too.
nnoremap <S-space> i
imap <S-space> <Esc>
" }}}

" Aesthetic {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" }}}
" vim:foldmethod=marker:foldlevel=0
