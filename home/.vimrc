" Use Vim settings, rather than Vi settings (much better!).

" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number relativenumber      " Line numbers are good
set backspace=indent,eol,start " Allow backspace in insert mode
set history=1000               " Store lots of :cmdline history
set showcmd                    " Show incomplete cmds down the bottom
set showmode                   " Show current mode down the bottom
set gcr=a:blinkon0             " Disable cursor blink
set visualbell                 " No sounds
set autoread                   " Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/plugins.vim
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

au BufNewFile,BufRead *.plug set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" Automatically jump to last position in file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
silent !mkdir -p ~/.vim_undo > /dev/null 2>&1
if has('persistent_undo') && isdirectory(expand('~').'/.vim_undo')
  set undodir=~/.vim_undo
  set undofile
endif


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points
set nolist

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch  " Find the next match as we type the search
set hlsearch   " Highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

" ================ Custom Settings ========================
source ~/.vim/settings.vim

inoremap jk <esc>
set shell=zsh\ -l
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

set wildignore+=*/.git/*,*/tmp/*,*.swp

"fix for yankring and neovim
" see https://github.com/neovim/neovim/issues/2642#issuecomment-218232937
" let g:yankring_clipboard_monitor=0
nnoremap Q @@

set timeoutlen=500
set ttimeoutlen=5
