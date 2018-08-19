:set number relativenumber
set nocompatible


let mapleader=","

:inoremap jk <esc>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * :PlugInstall --sync
endif

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir -p ~/.vim_undo > /dev/null 2>&1
if has('persistent_undo') && isdirectory(expand('~').'/.vim_undo')
  set undodir=~/.vim_undo
  set undofile
endif

:let g:csv_delim_test = ',;|'

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-endwise' 
Plug 'tpope/vim-unimpaired'
Plug 'Lokaltog/vim-easymotion'
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
" Plug 'vim-scripts/csv.vim', {'for': 'csv'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
call plug#end()

so $SSHHOME/.sshrc.d/vim/settings.vim
