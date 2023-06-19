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
" Plug 'vim-scripts/csv.vim', {'for': 'csv'}
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'reedes/vim-colors-pencil'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'vim-syntastic/syntastic'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'arcticicestudio/nord-vim'
call plug#end()

so $SSHHOME/.sshrc.d/vim/settings.vim
