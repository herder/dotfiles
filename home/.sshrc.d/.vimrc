:set number relativenumber
:inoremap jk <esc>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * :PlugInstall --sync
endif

silent !mkdir -p ~/.vim_undo
set undodir=~/.vim_undo
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
call plug#end()
