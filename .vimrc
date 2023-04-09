" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup vim-plug
call plug#begin()

" Sensible default vim config
Plug 'tpope/vim-sensible'

" Color Scheme
Plug 'ericbn/vim-solarized'

call plug#end()

" Set theme
syntax enable
set background=dark
colorscheme solarized
set termguicolors

" disable status
" set laststatus=0

" disble ruler
" set noruler

" clipboard
set clipboard=unnamedplus,unnamed

" save clipboard on exit
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel --input --clipboard")
