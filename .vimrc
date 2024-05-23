"*** CONFIG ***
set incsearch	"incremental search
set hlsearch	"highlight the search
set nu		"show line number
set relativenumber 

syntax enable
filetype plugin indent on

colorscheme evening 

"install vim.plug, place it before plug#begin()
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'

call plug#end()

" MAPPINGS
"set Leader to be º
let mapleader ="º"

"map fzf to Ctrl-f
nnoremap <silent> <C-f> :Files<CR>
"map ripgrep to \+f
nnoremap <silent> <Leader>f :Rg<CR>

