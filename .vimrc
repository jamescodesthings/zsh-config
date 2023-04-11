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

" Nerd Tree
Plug 'preservim/nerdtree'
" Nerd Tree Plugins
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Language Support
Plug 'sheerun/vim-polyglot'

" Comment Toggle
Plug 'preservim/nerdcommenter'

" powerline
Plug 'itchyny/lightline.vim'

call plug#end()

" Set theme
syntax enable
set background=dark
colorscheme solarized
set termguicolors

" disable Status & Ruler
" set laststatus=0
" set noruler

" clipboard to global clipboard
set clipboard=unnamedplus,unnamed

" nerdcommenter
let g:NERDCreateDefaultMappings = 1

" ARCH/linux: save clipboard on exit
if executable('xsel')
  autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel --input --clipboard")
endif

if has("unix")
  let s:uname = system("uname")
  if s:uname != "Darwin\n"
    " Map Nerdtree to Alt + 1
    nnoremap <Esc>1 :NERDTreeToggle<CR>
  endif
endif

" utf-8 for devicons
set encoding=UTF-8
