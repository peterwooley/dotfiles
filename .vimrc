" Set default tab handling
set ts=4
set sts=4
set sw=4
set noet
set ai

set t_Co=256

syntax on
colorscheme zenburn
let g:zenburn_high_Contrast = 1

set number
set hidden
set ruler

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

" Allow backspacing to work everywhere in insert mode
set backspace=indent,eol,start

" Remap leader to ,
let mapleader=","

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>


if has('gui_running')
		" Set gvim font
		set gfn=Consolas:h10

		" Remove gui toolbars
		set go-=m
		set go-=T
		set go-=r

		" Set encoding for all files
		set encoding=utf-8 

		" Use the same symbols as TextMate for tabstops and EOLs
		set listchars=tab:▸\ ,eol:¬
		
		" Control tabs more easily
		" I know, I know; Creating a tab overwrites taglist,
		" I'm lame and don't use taglist, yet.
		map <C-t> <ESC>:tabnew<CR>
		map <C-Tab> <ESC>:tabn<CR>
		map <C-S-Tab> <ESC>:tabp<CR>
		map <C-w> <ESC>:close<CR>
end

" Easily modify vimrc
nmap <leader>v :e $MYVIMRC<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
