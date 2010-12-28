" Set encoding for all files
set encoding=utf-8 

" Set default tab stop
set ts=4

set t_Co=256
let g:zenburn_high_Contrast = 1

syntax on
colorscheme zenburn

set number
set hidden
set autoindent

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Enable file-specific plugins, for Sparkup now
filetype plugin on

" Enable incremental search with highlighting
set incsearch
set hlsearch

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Set gvim font
set gfn=Consolas:h10

" Remove gui toolbars
set go-=m
set go-=T
set go-=r

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif


