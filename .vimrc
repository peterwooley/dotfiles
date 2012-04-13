" Let's start infecting things with Pathogen
call pathogen#infect()

" Set default tab handling
set ts=4
set sts=4
set sw=4
set et
set ai

" Just make things better
set cursorline
set ttyfast
set relativenumber
set hidden
set ruler
set laststatus=2

set t_Co=256

syntax on
colorscheme jellybeans 

" Enter command mode quickly
noremap ; :

" Allow undos through file close/opens
set undofile

" Tame the mean-file-creating beast that is Vim.
if has("win32")
	set undodir=~/vimfiles/tmp/undo//     " undo files
	set backupdir=~/vimfiles/tmp/backup// " backups
	set directory=~/vimfiles/tmp/swap//   " swap files
else
	set undodir=~/.vim/tmp/undo//     " undo files
	set backupdir=~/.vim/tmp/backup// " backups
	set directory=~/.vim/tmp/swap//   " swap files
end

" Enable backups, It's 2012, Vim.
set backup
set noswapfile

" Set EasyMotion's leader key
let g:EasyMotion_leader_key = '<Leader>e'


" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Enable file-specific plugins
filetype plugin on

" Use sensible regex for substitution
nnoremap / /\v
vnoremap / /\v

" Enable incremental search with highlighting
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

" Make global substitutions the default
set gdefault

" Make bracket jumping easier
nnoremap <tab> %
vnoremap <tab> %

" Disable F1, so I don't open help when I mean <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Allow backspacing to work everywhere in insert mode
set backspace=indent,eol,start

" Remap leader to ,
let mapleader=","

" Clear out search highlights
nnoremap <leader><space> :noh<cr>

" Sort CSS Properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Abbreviate all lengthy messages, hide Attention screen
" and hide the intro screen (I've already donated!)
set shm=aAItT

if has('gui_running')
    " Set gvim font
    if has("mac")
        set gfn=Menlo:h13
    else
        set gfn=Consolas:h10
    end

    " Set cygwin as shell on Widows
    if has("win32")
        set shell=C:/cygwin/bin/bash
        set shellcmdflag=--login\ -c
        set shellxquote=\"
    end

    " Remove gui toolbars
    set go-=m
    set go-=T
    set go-=r
    set go-=L

    " Set encoding for all files
    set encoding=utf-8 

    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬
    
    " Control tabs more easily
    " I know, I know; Creating a tab overwrites taglist,
    " I'm lame and don't use taglist, yet.
    map <C-Tab> <ESC>:tabn<CR>
    map <C-S-Tab> <ESC>:tabp<CR>
end

silent! nmap <unique> <silent> <Leader>r :CommandT<CR>

function! HtmlEscape()
    silent s/&/\&amp;/eg
    silent s/</\&lt;/eg
    silent s/>/\&gt;/eg
endfunction

function! HtmlUnEscape()
    silent s/&lt;/</eg
    silent s/&gt;/>/eg
    silent s/&amp;/\&/eg
endfunction

map <silent> <Leader>h :call HtmlEscape()<CR>
map <silent> <Leader>u :call HtmlUnEscape()<CR>

" Easily modify vimrc
nmap <leader>v :e $MYVIMRC<CR>

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
