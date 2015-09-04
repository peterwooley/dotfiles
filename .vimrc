set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set rtp+=/Users/peterwooley/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set rtp+=~/.fzf

" Let's start infecting things with Pathogen
call pathogen#infect()

"set shell=zsh\ -i

" Set default tab handling
set ts=2
set sts=2
set sw=2
set ai

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Just make things better
set cursorline
set ttyfast
set hidden
set ruler
set laststatus=2
set noshowmode
set history=1000
set number
set t_Co=256

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

syntax on
colorscheme jellybeans 

" Make up/down work with line wrapping
nnoremap j gj
nnoremap k gk

" Habit breaking
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

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

" Indent JavaScript no more than 1 shiftwidth
let g:SimpleJsIndenter_BriefMode = 1

" Enable file-specific plugins
filetype plugin on
filetype indent on

" For regular expressions turn magic on
set magic

" Enable incremental search with highlighting
set incsearch
set hlsearch
set ignorecase
set smartcase

" How many tenths of a second to blink when matching brackets
set showmatch
set mat=2

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Make global substitutions the default
set gdefault

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Make bracket jumping easier
nmap <tab> %
vmap <tab> %

" Disable F1, so I don't open help when I mean <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Remap leader to ,
let mapleader=","

" Clear out search highlights
nnoremap <leader><space> :noh<cr>

" Sort CSS Properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Abbreviate all lengthy messages, hide Attention screen
" and hide the intro screen (I've already donated!)
set shm=aAItT

if has('gui_running')
    " Set gvim font
    if has("mac")
        set gfn=Source\ Code\ Pro\ for\ Powerline:h14
    else
        set gfn=Consolas:h10
    end

    " Remove gui toolbars
    set go-=m
    set go-=T
    set go-=r
    set go-=L

    " Set encoding for all files
    set encoding=utf-8 
end

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

function! HtmlEscape()
    silent s/&/\&amp;/e
    silent s/</\&lt;/e
    silent s/>/\&gt;/e
endfunction

function! HtmlUnEscape()
    silent s/&lt;/</e
    silent s/&gt;/>/e
    silent s/&amp;/\&/e
endfunction

function! PresentMode()
    colorscheme vylight
    :call SetFontSize(20)
endfunction

function! CodeMode()
    colorscheme jellybeans
    if has("mac")
      :call SetFontSize(13)
    else
      :call SetFontSize(10)
    end
endfunction

let s:pattern = '\(\.*\):h\([1-9][0-9]*\)$'
function! SetFontSize(amount)
  if has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = a:amount
    let newfont = fontname . ':h' . newsize
    let &guifont = newfont
  endif
endfunction

map <silent> <Leader>p :call PresentMode()<CR>
map <silent> <Leader>c :call CodeMode()<CR>

map <silent> <Leader>h :call HtmlEscape()<CR>
map <silent> <Leader>u :call HtmlUnEscape()<CR>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>P :set paste<CR>"*p:set nopaste<CR>

" Make your cursor stay in the middle
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Quickly select text you just pasted
noremap gV `[v`]

" Stop that stupid window from popping up
map q: :q

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Easily modify vimrc
nmap <leader>v :e $MYVIMRC<CR>

" Easily source .vimrc
nmap <leader>r :source $MYVIMRC

if has("autocmd")
  if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    " Source the vimrc file after saving it
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    " Remember info about open buffers on close
    set viminfo^=%
    
    " Delete trailing white space on save, useful for Python and CoffeeScript ;)
    "func! DeleteTrailingWS()
      "exe "normal mz"
      "%s/\s\+$//ge
      "exe "normal `z"
    "endfunc
    "autocmd BufWrite *.py :call DeleteTrailingWS()
    "autocmd BufWrite *.coffee :call DeleteTrailingWS()

  endif
endif

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
