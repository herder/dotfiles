:set number relativenumber
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
Plug 'https://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'vim-scripts/csv.vim', {'for': 'csv'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
call plug#end()
